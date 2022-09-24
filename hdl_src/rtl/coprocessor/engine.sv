//wraps 
//1.a regex_cpu and 
//2.two fifos to save instructions in the form of their program counters 
//  for current and next character.
//                                                                                                    
//                                                                            /-<memory_data          
//                                                                          /--->memory_addr          
//                                   +------------------------------------------>memory_valid         
//+----------------------------------|------------------------+             \---<memory_ready         
//|                     Basic block  |                        |                                       
//|                          +- - - - - - - +                 | 
//|                            cache                          | 
//|                          | (optional)   |                 | 
//|                                                           | 
//|                          +- - - - - - - +                 |                                       
//|                                  |                        |                                       
//|                          +-------|------+                 |                                       
//|                          | Regex_cpu    |                 |             /--->output_pc_valid      
//|                  +-----> |              ------>----------------------------->output_pc_and current
//|                  |       |              |                 |             \---<output_pc_ready      
//|                  |       +--------------+                 |                                       
//|                  |                             input_pc_and_current[0]                            
//|                  |   +------------------+ 1   +-----+     |                                       
//|                  +----  curr_char_fifo  <--+--+--+  |     |                                       
//|                      +------------------+  |demux|  |     |             /---<input_pc_valid       
//|                      +------------------+  |     <--+-----------------------<input_pc_and_current 
//| 0 --data_out_ready-->|  next_char_fifo  <--+-----+  +----------------------->input_pc_ready       
//|                      +------------------+ 0         |     |                                       
//|                                                     |     |                                       
//|                            even_in_ready            |     |                                       
//|                            and ---------------------+     |                                       
//|                            odd_in_ready                   |                                       
//|                                                           |                                       
//+-----------------------------------------------------------+                                       
//note that:                                                                                                    
//- curr_char_fifo and next_char_fifo are implemented by 2 fifos(called odd/even)
//  in which inputs/outputs are muxed/demuxed via cur_is_even_character (input)                                                                                                      
//  not represented for sake of drawing simplicity                                                                                                  
                                                                                                                                                             

module engine #(
    parameter  PC_WIDTH            = 8 ,
    parameter  LATENCY_COUNT_WIDTH = 8 ,
    parameter  FIFO_COUNT_WIDTH    = 6 ,
    parameter  CHARACTER_WIDTH     = 8 ,
    parameter  MEMORY_WIDTH        = 16,
    parameter  MEMORY_ADDR_WIDTH   = 11,
    parameter  CACHE_WIDTH_BITS    = 0, 
    parameter  CACHE_BLOCK_WIDTH_BITS   = 2 ,
    parameter  PIPELINED                = 0,
    parameter  CONSIDER_PIPELINE_FIFO   = 0,
    parameter  CONSIDER_BOTH_FIFOS      = 1,
    parameter  CC_ID_BITS               = 2
)(
    input   wire                            clk,
    input   wire                            rst, 
    output  logic                           accepts,
    output  logic                           running,
    output  logic                           full, 
    output wire [(2**CC_ID_BITS)-1:0]                     elaborating_chars      ,
    input  wire [(2**CC_ID_BITS)-1:0]                     cur_window_end_of_s    ,
    input  wire [(2**CC_ID_BITS)-1:0]                     cur_window_enable      ,
    input  wire [(2**CC_ID_BITS)*CHARACTER_WIDTH-1  :0]   cur_window             ,
    input  wire                             new_char,

    input   logic                           memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]    memory_data,
    output  logic                           memory_valid,
    input   logic[MEMORY_ADDR_WIDTH-1:0]    memory_broadcast_addr,
    input   logic                           memory_broadcast_valid,

    input   logic                           input_pc_valid,
    input   logic[PC_WIDTH+CC_ID_BITS-1:0]  input_pc_and_cc_id, 
    output  logic                           input_pc_ready,
    output  logic[LATENCY_COUNT_WIDTH-1:0]  input_pc_latency,

    output  logic                           output_pc_valid,
    output  logic[PC_WIDTH+CC_ID_BITS-1:0]  output_pc_and_cc_id,
    input   logic                           output_pc_ready/*,
    //input   logic[LATENCY_COUNT_WIDTH-1:0]  output_pc_latency
*/
);
    localparam I_WIDTH               = 16;
    localparam OFFSET_I              = $clog2(MEMORY_WIDTH/I_WIDTH);
    localparam CPU_MEMORY_ADDR_WIDTH = MEMORY_ADDR_WIDTH+OFFSET_I;
    localparam C_WINDOW_SIZE_IN_CHARS= 2**CC_ID_BITS ;
    //output latency is unused by basic block.
    //wire [LATENCY_COUNT_WIDTH-1:0]  output_pc_latency_unused;
    //assign output_pc_latency_unused = output_pc_latency;
    //sub signals of input_pc_and_current, output_pc_and_current
    logic [PC_WIDTH-1:0]                output_pc   , input_pc;
    logic [CC_ID_BITS-1:0]              input_cc_id , output_cc_id;

    //signals for regex_cpu
    logic                               regex_cpu_running ,regex_cpu_input_pc_ready, regex_cpu_input_pc_valid;
    logic [PC_WIDTH+CC_ID_BITS-1:0]     regex_cpu_input_pc_and_cc_id;
    logic [PC_WIDTH-1:0]                regex_cpu_input_pc;
    logic [CC_ID_BITS-1:0]              regex_cpu_input_cc_id;
    logic [C_WINDOW_SIZE_IN_CHARS-1:0]  regex_cpu_elaborating_chars;

    localparam                          REGEX_CPU_FIFO_WIDTH_POWER_OF_2 = 2;
    //storage part of the basic block
    //cache wires
    wire                                regex_cpu_memory_ready      ;
    wire [CPU_MEMORY_ADDR_WIDTH-1:0]    regex_cpu_memory_addr       ;
    logic[CPU_MEMORY_ADDR_WIDTH-1:0]    regex_cpu_memory_addr_saved ;
    logic[I_WIDTH-1     :0]             regex_cpu_memory_data       ;
    wire                                regex_cpu_memory_valid      ;
    
    //FIFO signals
    logic [C_WINDOW_SIZE_IN_CHARS-1:0]  fifo_data_in_ready           ;
    logic [C_WINDOW_SIZE_IN_CHARS-1:0]  fifo_data_in_not_ready      ;
    logic [PC_WIDTH+CC_ID_BITS-1:0]     fifo_data_in                [C_WINDOW_SIZE_IN_CHARS-1:0] ;
    logic                               fifo_data_in_valid          [C_WINDOW_SIZE_IN_CHARS-1:0] ;
    logic                               fifo_data_out_ready         [C_WINDOW_SIZE_IN_CHARS-1:0] ;
    logic [PC_WIDTH+CC_ID_BITS-1:0]     fifo_data_out               [C_WINDOW_SIZE_IN_CHARS-1:0] ;
    logic [C_WINDOW_SIZE_IN_CHARS-1:0]  fifo_data_out_valid          ;
    logic                               fifo_data_out_not_valid     [C_WINDOW_SIZE_IN_CHARS-1:0] ;
    logic [FIFO_COUNT_WIDTH-1:0]        fifo_data_count             [C_WINDOW_SIZE_IN_CHARS-1:0] ;
    logic                               fifo_data_out_valid_masked  [C_WINDOW_SIZE_IN_CHARS-1:0] ;
    logic [C_WINDOW_SIZE_IN_CHARS-1:0]  fifo_data_out_valid_masked_packed   ;
    

    //latency signals
    logic [LATENCY_COUNT_WIDTH-1:0]     input_pc_latency_next;


    //order -> input to output 
    //DEMUX  INPUT FIFOs

    //input_pc_and_cc_id is splitted in input_pc and input_cc_id
    assign input_cc_id                     = input_pc_and_cc_id [0+:CC_ID_BITS];
    assign input_pc                        = input_pc_and_cc_id [CC_ID_BITS+:PC_WIDTH] ;

    genvar i;
    //input is broadcasted to all fifos
	 generate
    for (i=0; i < C_WINDOW_SIZE_IN_CHARS; ++i) begin : get_fifo_data
       assign fifo_data_in[i] = input_pc_and_cc_id;
    end
	 endgenerate

    //but only the correct fifo will have valid signal raised
    always_comb begin
        for (int j=0; j < C_WINDOW_SIZE_IN_CHARS; ++j) begin
            fifo_data_in_valid [j]        = 1'b0;
        end
        if ( input_pc_valid )
        begin
            fifo_data_in_valid[input_cc_id]   = 1'b1;        
        end
        input_pc_ready                    = &fifo_data_in_ready;
    end

    //FIFOs
	 generate
    for ( i=0; i < C_WINDOW_SIZE_IN_CHARS; ++i) 
    begin : gen_fifo
        //todo: cc_id can be avoided 
        fifo #(
            .DWIDTH(PC_WIDTH+CC_ID_BITS),
            .COUNT_WIDTH(FIFO_COUNT_WIDTH)
        )fifo_cc_id(
            .clk         (clk                         ), 
            .rst         (rst                         ), 
            .full        (fifo_data_in_not_ready [i]  ), //equivalent to not data_in_ready
            .din         (fifo_data_in           [i]  ),  
            .wr_en       (fifo_data_in_valid     [i]  ), //equivalent to data_in_valid
            .rd_en       (fifo_data_out_ready    [i]  ), //equivalent to data_out_ready
            .dout        (fifo_data_out          [i]  ), 
            .empty       (fifo_data_out_not_valid[i]  ), //equivalent to not data_out_valid
            .data_count  (fifo_data_count        [i]  )
        );
        //conclusion of FIFO instatiation:
        // convert negated not_ready/not_valid signals to "standard" ready/valid interface.
        assign fifo_data_in_ready  [i] = ~ fifo_data_in_not_ready  [i];
        assign fifo_data_out_valid [i] = ~ fifo_data_out_not_valid [i]; 
        //mask valid fifo output with cur_window_enable
        assign fifo_data_out_valid_masked[i] = fifo_data_out_valid [i] && cur_window_enable[i];
        assign fifo_data_out_valid_masked_packed [i] = fifo_data_out_valid_masked[i];
    end
	 endgenerate

    //MUX FIFOs
    arbiter_fixed_shiftable #(
        .DWIDTH              (PC_WIDTH+CC_ID_BITS       ),
        .N                   (C_WINDOW_SIZE_IN_CHARS    ),
        .INIT_LOWEST_PRIO    (C_WINDOW_SIZE_IN_CHARS-1  )
    ) mux_fifos (
        .clk                 (clk                       ),
        .rst                 (rst                       ),
        .in_valid            (fifo_data_out_valid_masked),
        .in_data             (fifo_data_out             ),
        .in_ready            (fifo_data_out_ready       ),
        .shift               (new_char                  ),
        .out_valid           (regex_cpu_input_pc_valid  ),
        .out_data            (regex_cpu_input_pc_and_cc_id),
        .out_ready           (regex_cpu_input_pc_ready  )
    );
    assign regex_cpu_input_cc_id = regex_cpu_input_pc_and_cc_id[0+:CC_ID_BITS];
    assign regex_cpu_input_pc    = regex_cpu_input_pc_and_cc_id[CC_ID_BITS+:PC_WIDTH];
    
    //simplification: engine is full if is not ready to receive any instruction 
    assign full                  = |(fifo_data_in_not_ready);
    //running if regex_cpu has taken some instruction and hence the data_out_valid=0 or cpu running
    assign running               = |(fifo_data_out_valid_masked_packed) || regex_cpu_running;
    assign elaborating_chars     = fifo_data_out_valid | regex_cpu_elaborating_chars;

    //compute the approximate latency seen outside the sum of all fifo counts or count entering/exiting.
    //always_comb begin : latency_computation
    //    if( fifo_odd_data_count > fifo_even_data_count)  input_pc_latency = fifo_odd_data_count  + 1; 
    //    else                                             input_pc_latency = fifo_even_data_count + 1;      
    //end
    
    always_ff @(posedge clk) begin
        if (rst)    input_pc_latency <= {{(LATENCY_COUNT_WIDTH-1){1'b0}},1'b1};
        else        input_pc_latency <= input_pc_latency_next;
    end

    always_comb begin
        case ({input_pc_valid && input_pc_ready, regex_cpu_input_pc_valid && regex_cpu_input_pc_ready})
        2'b11, 2'b00:
        begin
            input_pc_latency_next = input_pc_latency;
        end
        2'b10       :
        begin
            input_pc_latency_next = input_pc_latency + 1;
        end
        2'b01       :
        begin
            input_pc_latency_next = input_pc_latency - 1;
        end 
        endcase
    end

    /////////////////////////////////////////////////////////////////////////////
    // Computing part of the basic block
    /////////////////////////////////////////////////////////////////////////////
    generate
	 if(PIPELINED)
    begin : g
        
        regex_cpu_pipelined #(
            .PC_WIDTH                           (PC_WIDTH                           ),
            .CHARACTER_WIDTH                    (CHARACTER_WIDTH                    ),
            .MEMORY_WIDTH                       (I_WIDTH                       		),
            .MEMORY_ADDR_WIDTH                  (CPU_MEMORY_ADDR_WIDTH              ),
            .FIFO_WIDTH_POWER_OF_2              (REGEX_CPU_FIFO_WIDTH_POWER_OF_2    ),
			.CC_ID_BITS                         (CC_ID_BITS                         )
        ) a_regex_cpu  (
            .clk                                (clk                                ),
            .rst                                (rst                                ), 
            .current_characters                 (cur_window                         ),
            .end_of_string                      (cur_window_end_of_s                ),
            .input_pc_ready                     (regex_cpu_input_pc_ready           ),
            .input_cc_id                        (regex_cpu_input_cc_id              ), 
            .input_pc                           (regex_cpu_input_pc                 ), 
            .input_pc_valid                     (regex_cpu_input_pc_valid           ),
            .memory_ready                       (regex_cpu_memory_ready             ),
            .memory_addr                        (regex_cpu_memory_addr              ),
            .memory_data                        (regex_cpu_memory_data              ),   
            .memory_valid                       (regex_cpu_memory_valid             ),
            .output_pc_ready                    (output_pc_ready                    ),
            .output_pc                          (output_pc                          ),
            .output_cc_id                       (output_cc_id                       ),
            .output_pc_valid                    (output_pc_valid                    ),
            .accepts                            (accepts                            ),
            .running                            (regex_cpu_running                  ),
            .elaborating_chars                  (regex_cpu_elaborating_chars        )
        );
    end
    else
    begin : g 
        regex_cpu #(
            .PC_WIDTH                           (PC_WIDTH                           ),
            .CHARACTER_WIDTH                    (CHARACTER_WIDTH                    ),
            .MEMORY_WIDTH                       (I_WIDTH                            ),
            .MEMORY_ADDR_WIDTH                  (CPU_MEMORY_ADDR_WIDTH              ),
            .CC_ID_BITS                         (CC_ID_BITS                         )
        ) a_regex_cpu (
            .clk                                (clk                                ),
            .rst                                (rst                                ), 
            .current_characters                 (cur_window                         ),
            .end_of_string                      (cur_window_end_of_s                ),
            .input_pc_ready                     (regex_cpu_input_pc_ready           ),
            .input_cc_id                        (regex_cpu_input_cc_id              ), 
            .input_pc                           (regex_cpu_input_pc                 ), 
            .input_pc_valid                     (regex_cpu_input_pc_valid           ),
            .memory_ready                       (regex_cpu_memory_ready             ),
            .memory_addr                        (regex_cpu_memory_addr              ),
            .memory_data                        (regex_cpu_memory_data              ),   
            .memory_valid                       (regex_cpu_memory_valid             ),
            .output_pc_ready                    (output_pc_ready                    ),
            .output_pc                          (output_pc                          ),
            .output_cc_id                       (output_cc_id                       ),
            .output_pc_valid                    (output_pc_valid                    ),
            .accepts                            (accepts                            ),
            .running                            (regex_cpu_running                  ),
            .elaborating_chars                  (regex_cpu_elaborating_chars        )
        );
    end
	 endgenerate


    //MEMORY CONNECTION
    //depending on CACHE_WIDTH_BITS
	 generate
    if (CACHE_WIDTH_BITS <= 0)
    begin

        //adapt memory bus to Instruction width based on previous cycle request
        always_comb
        begin
            regex_cpu_memory_data       = memory_data[regex_cpu_memory_addr_saved[0+:OFFSET_I]*I_WIDTH+:I_WIDTH];
        end

        always_ff @( posedge clk ) 
		begin 
            regex_cpu_memory_addr_saved <= regex_cpu_memory_addr;
        end

        assign memory_addr              = regex_cpu_memory_addr [OFFSET_I +: MEMORY_ADDR_WIDTH ];
        assign memory_valid             = regex_cpu_memory_valid;  
        assign regex_cpu_memory_ready   = memory_ready          || (memory_broadcast_valid && regex_cpu_memory_addr [OFFSET_I +: MEMORY_ADDR_WIDTH ]== memory_broadcast_addr[OFFSET_I +: MEMORY_ADDR_WIDTH ] );
        //assign regex_cpu_memory_data    = memory_data           ;   
    end
    else
    begin
        cache_block_directly_mapped_broadcast #(          
            .DWIDTH             (I_WIDTH                ),
            .CACHE_WIDTH_BITS   (CACHE_WIDTH_BITS       ),
            .BLOCK_WIDTH_BITS   (CACHE_BLOCK_WIDTH_BITS ),
            .ADDR_IN_WIDTH      (CPU_MEMORY_ADDR_WIDTH  )
        ) a_cache (
            .clk                (clk                    ),
            .rst                (rst                  ),
            .addr_in_valid      (regex_cpu_memory_valid ),
            .addr_in            (regex_cpu_memory_addr  ),
            .addr_in_ready      (regex_cpu_memory_ready ),
            .data_out           (regex_cpu_memory_data  ),
            .addr_out_valid     (memory_valid           ),
            .addr_out           (memory_addr            ),
            .addr_out_ready     (memory_ready           ),
            .data_in            (memory_data            ),
            .addr_broadcast_valid(memory_broadcast_valid),
            .addr_broadcast      (memory_broadcast_addr )
        );
    end
	 endgenerate


    //output_pc is redirected toward output after having concatenated with output_cc_id
    assign output_pc_and_cc_id             = {output_pc, output_cc_id};
    
endmodule