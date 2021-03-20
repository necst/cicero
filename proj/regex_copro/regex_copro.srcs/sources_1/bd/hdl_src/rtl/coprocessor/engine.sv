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
    parameter  CONSIDER_PIPELINE_FIFO   = 0
)(
    input   wire                            clk,
    input   wire                            rst, 
    output  logic                           accepts,
    output  logic                           running,
    input   logic                           enable,
    output  logic                           full,
    input   wire                            cur_is_even_character,
    input   logic[CHARACTER_WIDTH-1:0]      current_character,

    input   logic                           memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]    memory_data,
    output  logic                           memory_valid,

    input   logic                           input_pc_valid,
    input   logic[PC_WIDTH-1+1:0]           input_pc_and_current, 
    output  logic                           input_pc_ready,
    output  logic[LATENCY_COUNT_WIDTH-1:0]  input_pc_latency,

    output  logic                           output_pc_valid,
    output  logic[PC_WIDTH-1+1:0]           output_pc_and_current,
    input   logic                           output_pc_ready/*,
    //input   logic[LATENCY_COUNT_WIDTH-1:0]  output_pc_latency
*/
);
    localparam I_WIDTH = 16;
    localparam OFFSET_I= $clog2(MEMORY_WIDTH/I_WIDTH);
    localparam CPU_MEMORY_ADDR_WIDTH = MEMORY_ADDR_WIDTH+OFFSET_I;
    //output latency is unused by basic block.
    //wire [LATENCY_COUNT_WIDTH-1:0]  output_pc_latency_unused;
    //assign output_pc_latency_unused = output_pc_latency;
    //sub signals of input_pc_and_current, output_pc_and_current
    logic [PC_WIDTH-1:0]            output_pc, input_pc;
    logic                           input_pc_is_directed_to_current, output_pc_is_directed_to_current;
    //signals for regex_cpu
    logic                           regex_cpu_running ,regex_cpu_input_pc_ready, regex_cpu_input_pc_valid;
    localparam                      REGEX_CPU_FIFO_WIDTH_POWER_OF_2 = 2;
    logic [REGEX_CPU_FIFO_WIDTH_POWER_OF_2:0] regex_cpu_latency;
    //storage part of the basic block
    //cache wires
    wire                                regex_cpu_memory_ready      ;
    wire [CPU_MEMORY_ADDR_WIDTH-1:0]    regex_cpu_memory_addr             ;
    logic[CPU_MEMORY_ADDR_WIDTH-1:0]    regex_cpu_memory_addr_saved       ;
    logic[I_WIDTH-1     :0]             regex_cpu_memory_data       ;
    wire                                regex_cpu_memory_valid      ;
    
    //FIFO cur_char signal
    logic                           fifo_cur_char_data_in_ready  ;
    logic [PC_WIDTH-1:0]            fifo_cur_char_data_in        ;
    logic                           fifo_cur_char_data_in_valid  ;
    logic                           fifo_cur_char_data_out_ready ;
    logic [PC_WIDTH-1:0]            fifo_cur_char_data_out       ;
    logic                           fifo_cur_char_data_out_valid ;
    logic [FIFO_COUNT_WIDTH-1:0]    fifo_cur_char_data_count     ;
    //FIFO next_char signal
    logic                           fifo_next_char_data_in_ready ;
    logic [PC_WIDTH-1:0]            fifo_next_char_data_in       ;
    logic                           fifo_next_char_data_in_valid ;
    logic                           fifo_next_char_data_out_ready;
    logic [PC_WIDTH-1:0]            fifo_next_char_data_out      ;
    logic                           fifo_next_char_data_out_valid;
    logic [FIFO_COUNT_WIDTH-1:0]    fifo_next_char_data_count    ;

    ping_pong_buffer #(
        .DATA_WIDTH(PC_WIDTH),
        .COUNT_WIDTH(FIFO_COUNT_WIDTH)
    ) buffer ( 
        .clk                            (clk                            ),
        .rst                            (rst                            ),
        .cur_is_even_character          (cur_is_even_character          ),            
        .fifo_cur_char_data_in_ready    (fifo_cur_char_data_in_ready    ),       
        .fifo_cur_char_data_in          (fifo_cur_char_data_in          ),           
        .fifo_cur_char_data_in_valid    (fifo_cur_char_data_in_valid    ),   
        .fifo_cur_char_data_out_ready   (fifo_cur_char_data_out_ready   ),       
        .fifo_cur_char_data_out         (fifo_cur_char_data_out         ),       
        .fifo_cur_char_data_out_valid   (fifo_cur_char_data_out_valid   ),   
        .fifo_cur_char_data_count       (fifo_cur_char_data_count       ),       
        .fifo_next_char_data_in_ready   (fifo_next_char_data_in_ready   ),           
        .fifo_next_char_data_in         (fifo_next_char_data_in         ),                 
        .fifo_next_char_data_in_valid   (fifo_next_char_data_in_valid   ),   
        .fifo_next_char_data_out_ready  (fifo_next_char_data_out_ready  ),       
        .fifo_next_char_data_out        (fifo_next_char_data_out        ),   
        .fifo_next_char_data_out_valid  (fifo_next_char_data_out_valid  ),      
        .fifo_next_char_data_count      (fifo_next_char_data_count      )            
    );
    // make so that content of fifo_next_char is not consumed. 
    assign fifo_next_char_data_out_ready = 1'b0;

    //output_pc is redirected toward output after having concatenated with output_pc_is_directed_to_current
    assign output_pc_and_current = {output_pc, output_pc_is_directed_to_current};
    //input_pc_and_current is splitted in input_pc and input_pc_is_directed_to_current
    assign input_pc_is_directed_to_current = input_pc_and_current[0];
    assign input_pc                        = input_pc_and_current[1+:PC_WIDTH] ;

    //demux to drive input_pc_and_current toward correct fifo.
    //to avoid a combinational loop (switches can decide to move data toward one or the other output port depending on output ready, but in principle output ready depends also on targeted fifo which is specified in data). 
    //conservative(certain instruction which in principle could have been stored are refused) but correct
    assign input_pc_ready         = fifo_cur_char_data_in_ready && fifo_next_char_data_in_ready;
    always_comb begin : demux_for_pc_in 
        fifo_cur_char_data_in  = { PC_WIDTH{1'b0} };
        fifo_next_char_data_in = { PC_WIDTH{1'b0} };
        
        if(input_pc_is_directed_to_current)
        begin
            fifo_cur_char_data_in       = input_pc ;
            fifo_cur_char_data_in_valid = input_pc_valid && input_pc_ready; //since for outside bb input is ready if both fifo_cur_char and fifo_next_char are ready, their valid has to take into account that to avoid that fifo_latches it  

            fifo_next_char_data_in_valid= 1'b0;
        end
        else
        begin
            fifo_next_char_data_in       = input_pc ;
            fifo_next_char_data_in_valid = input_pc_valid && input_pc_ready; //since for outside bb input is ready if both fifo_cur_char and fifo_next_char are ready, their valid has to take into account that to avoid that fifo_latches it  

            fifo_cur_char_data_in_valid  = 1'b0;
        end
    end
    //simplification: engine is full if is not ready to receive an instruction either 
    assign full              = !fifo_cur_char_data_in_ready || !fifo_next_char_data_in_ready;

    //compute the approximate latency seen outside thought of max between odd and even but lead to high fanout-> setup violation
    //opted for a simpler computation: consider only fifo_cur_char length.
    //always_comb begin : latency_computation
    //    if( fifo_odd_data_count > fifo_even_data_count)  input_pc_latency = fifo_odd_data_count  + 1; 
    //    else                                             input_pc_latency = fifo_even_data_count + 1;      
    //end
    if( CONSIDER_PIPELINE_FIFO == 1)
    begin
        always_comb
        begin
            if( &fifo_cur_char_data_count == 1'b1) input_pc_latency = fifo_cur_char_data_count + regex_cpu_latency ;
            else                                   input_pc_latency = fifo_cur_char_data_count + regex_cpu_latency + 1 ;
        end
    end
    else
    begin
        always_comb
        begin
            if( &fifo_cur_char_data_count == 1'b1) input_pc_latency = fifo_cur_char_data_count ;
            else                                   input_pc_latency = fifo_cur_char_data_count + 1 ;
        end
    end

    
    //running if regex_cpu has taken some instruction and hence the data_out_ready=0
    //        or some instructions are saved in cur character fifo and hence fifo_cur_char_data_out_valid=1
    always_comb begin : running_definition
        running = fifo_cur_char_data_out_valid || regex_cpu_running;
    end


    /////////////////////////////////////////////////////////////////////////////
    // Computing part of the basic block
    /////////////////////////////////////////////////////////////////////////////
    // enable signal permits dequeue process from fifo_cur_char and plays the role of an enabler regex_cpu 
    assign fifo_cur_char_data_out_ready = enable && regex_cpu_input_pc_ready    ; 
    assign regex_cpu_input_pc_valid     = enable && fifo_cur_char_data_out_valid;
    if(PIPELINED)
    begin : g
        
        regex_cpu_pipelined #(
            .PC_WIDTH                           (PC_WIDTH                           ),
            .CHARACTER_WIDTH                    (CHARACTER_WIDTH                    ),
            .MEMORY_WIDTH                       (I_WIDTH                       ),
            .MEMORY_ADDR_WIDTH                  (CPU_MEMORY_ADDR_WIDTH              ),
            .FIFO_WIDTH_POWER_OF_2              (REGEX_CPU_FIFO_WIDTH_POWER_OF_2    )
        ) aregex_cpu (
            .clk                                (clk                                ),
            .rst                                (rst                                ), 
            .current_character                  (current_character                  ),
            .input_pc_ready                     (regex_cpu_input_pc_ready           ), 
            .input_pc                           (fifo_cur_char_data_out             ), 
            .input_pc_valid                     (regex_cpu_input_pc_valid           ),
            .memory_ready                       (regex_cpu_memory_ready             ),
            .memory_addr                        (regex_cpu_memory_addr              ),
            .memory_data                        (regex_cpu_memory_data              ),   
            .memory_valid                       (regex_cpu_memory_valid             ),
            .output_pc_is_directed_to_current   (output_pc_is_directed_to_current   ),
            .output_pc_ready                    (output_pc_ready                    ),
            .output_pc                          (output_pc                          ),
            .output_pc_valid                    (output_pc_valid                    ),
            .accepts                            (accepts                            ),
            .running                            (regex_cpu_running                  ),
            .latency                            (regex_cpu_latency                  )
        );
    end
    else
    begin : g 
        regex_cpu #(
            .PC_WIDTH                           (PC_WIDTH                           ),
            .CHARACTER_WIDTH                    (CHARACTER_WIDTH                    ),
            .MEMORY_WIDTH                       (I_WIDTH                       ),
            .MEMORY_ADDR_WIDTH                  (CPU_MEMORY_ADDR_WIDTH              )
        ) aregex_cpu (
            .clk                                (clk                                ),
            .rst                                (rst                              ), 
            .current_character                  (current_character                  ),
            .input_pc_ready                     (regex_cpu_input_pc_ready           ), 
            .input_pc                           (fifo_cur_char_data_out             ), 
            .input_pc_valid                     (regex_cpu_input_pc_valid           ),
            .memory_ready                       (regex_cpu_memory_ready             ),
            .memory_addr                        (regex_cpu_memory_addr              ),
            .memory_data                        (regex_cpu_memory_data              ),   
            .memory_valid                       (regex_cpu_memory_valid             ),
            .output_pc_is_directed_to_current   (output_pc_is_directed_to_current   ),
            .output_pc_ready                    (output_pc_ready                    ),
            .output_pc                          (output_pc                          ),
            .output_pc_valid                    (output_pc_valid                    ),
            .accepts                            (accepts                            )
        );
        assign regex_cpu_latency = 0;
        assign regex_cpu_running =  ~fifo_cur_char_data_out_ready ;
    end

    //depending on CACHE_WIDTH_BITS
    if (CACHE_WIDTH_BITS <= 0)
    begin

        //adapt memory bus to Instruction width based on previous cycle request
        always_comb
        begin
            regex_cpu_memory_data       = memory_data[I_WIDTH*regex_cpu_memory_addr_saved[0+:OFFSET_I]+:I_WIDTH];
        end

        always_ff @( posedge clk ) begin 
            regex_cpu_memory_addr_saved <= regex_cpu_memory_addr;
        end

        assign memory_addr              = regex_cpu_memory_addr [OFFSET_I +: MEMORY_ADDR_WIDTH ];;
        assign memory_valid             = regex_cpu_memory_valid;  
        assign regex_cpu_memory_ready   = memory_ready          ;
        //assign regex_cpu_memory_data    = memory_data           ;   
    end
    else
    begin
        cache_block_directly_mapped #(          
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
            .data_in            (memory_data            )
        );
    end

    
endmodule