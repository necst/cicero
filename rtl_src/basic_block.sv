`timescale 1ns/1ps
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
//|                                  |                        |                                       
//|                                  |                        |                                       
//|                          +-------|------+                 |                                       
//|                          | Regex_cpu    |                 |             /--->output_pc_valid      
//|                  +-----> |              ------>----------------------------->output_pc_and current
//|                  |       |              |                 |             \---<output_pc_ready      
//|                  |       +--------------+                 |                                       
//|                  |                             input_pc_and_current[0]                            
//|                  |   +------------------+     +-----+     |                                       
//|                  +----  curr_char_fifo  <-----|--+  |     |                                       
//|                      +------------------+  |demux|  |     |             /---<input_pc_valid       
//|                      +------------------+  |     <--------------------------<input_pc_and_current 
//| 0<--data_out_ready---|  next_char_fifo  <--------+  +----------------------->input_pc_ready       
//|                      +------------------+           |     |                                       
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
                                                                                                                                                             

module basic_block #(
    parameter  PC_WIDTH            = 8 ,
    parameter  LATENCY_COUNT_WIDTH = 8 ,
    parameter  FIFO_COUNT_WIDTH    = 6 ,
    parameter  CHARACTER_WIDTH     = 8 ,
    parameter  MEMORY_WIDTH        = 16,
    parameter  MEMORY_ADDR_WIDTH   = 11
)(
    input   wire                            clk,
    input   wire                            reset, 
    output  logic                           running,
    input   logic                           cur_is_even_character,
    input   logic[CHARACTER_WIDTH-1:0]      current_character,
    output  logic                           accepts,

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
    input   logic                           output_pc_ready,
    input   logic[LATENCY_COUNT_WIDTH-1:0]  output_pc_latency

);
    //output latency is unused by basic block.
    wire [LATENCY_COUNT_WIDTH-1:0] output_pc_latency_unused;
    assign output_pc_latency_unused = output_pc_latency;
    //sub signals of input_pc_and_current, output_pc_and_current
    logic [PC_WIDTH-1:0]        output_pc, input_pc;
    logic                       input_pc_is_directed_to_current, output_pc_is_directed_to_current;

    //storage part of the basic block
    //FIFO even signal 
    logic                       fifo_even_data_in_ready     ;
    logic                       fifo_even_data_in_not_ready ;
    logic [PC_WIDTH-1:0]        fifo_even_data_in           ;
    logic                       fifo_even_data_in_valid     ;
    logic                       fifo_even_data_out_ready    ;
    logic [PC_WIDTH-1:0]        fifo_even_data_out          ;
    logic                       fifo_even_data_out_valid    ;
    logic                       fifo_even_data_out_not_valid;
    logic [FIFO_COUNT_WIDTH-1:0]fifo_even_data_count        ;
    //FIFO odd signal
    logic                       fifo_odd_data_in_ready      ;
    logic                       fifo_odd_data_in_not_ready  ;
    logic [PC_WIDTH-1:0]        fifo_odd_data_in            ;
    logic                       fifo_odd_data_in_valid      ;
    logic                       fifo_odd_data_out_ready     ;
    logic [PC_WIDTH-1:0]        fifo_odd_data_out           ;
    logic                       fifo_odd_data_out_valid     ;
    logic                       fifo_odd_data_out_not_valid ;
    logic [FIFO_COUNT_WIDTH-1:0]fifo_odd_data_count         ;
    //FIFO cur_char signal
    logic                       fifo_cur_char_data_in_ready  ;
    logic [PC_WIDTH-1:0]        fifo_cur_char_data_in        ;
    logic                       fifo_cur_char_data_in_valid  ;
    logic                       fifo_cur_char_data_out_ready ;
    logic [PC_WIDTH-1:0]        fifo_cur_char_data_out       ;
    logic                       fifo_cur_char_data_out_valid ;
    logic [FIFO_COUNT_WIDTH-1:0]fifo_cur_char_data_count     ;
    //FIFO next_char signal
    logic                       fifo_next_char_data_in_ready ;
    logic [PC_WIDTH-1:0]        fifo_next_char_data_in       ;
    logic                       fifo_next_char_data_in_valid ;
    logic                       fifo_next_char_data_out_ready;
    logic [PC_WIDTH-1:0]        fifo_next_char_data_out      ;
    logic                       fifo_next_char_data_out_valid;
    logic [FIFO_COUNT_WIDTH-1:0]fifo_next_char_data_count    ;

    //FIFO even instantiation 
    fifo #(
        .DWIDTH(PC_WIDTH),
        .COUNT_WIDTH(FIFO_COUNT_WIDTH)
    )fifo_even(
        .clk         (clk                         ), 
        .reset       (reset                       ), 
        .full        (fifo_even_data_in_not_ready ), //equivalent to not data_in_ready
        .din         (fifo_even_data_in           ),  
        .wr_en       (fifo_even_data_in_valid     ), //equivalent to data_in_valid
        .rd_en       (fifo_even_data_out_ready    ), //equivalent to data_out_ready
        .dout        (fifo_even_data_out          ), 
        .empty       (fifo_even_data_out_not_valid), //equivalent to not data_out_valid
        .data_count  (fifo_even_data_count        )
    );
    //conclusion fifo even instatiation convert negated not_ready/not_valid signals to "standard" ready/valid interface.
    assign fifo_even_data_in_ready  = ~ fifo_even_data_in_not_ready ;
    assign fifo_even_data_out_valid = ~ fifo_even_data_out_not_valid;

    //FIFO odd instantiation 
    fifo #(
        .DWIDTH(PC_WIDTH),
        .COUNT_WIDTH(FIFO_COUNT_WIDTH)
    )fifo_odd(
        .clk         (clk                        ), 
        .reset       (reset                      ), 
        .full        (fifo_odd_data_in_not_ready ), //equivalent to not data_in_ready
        .din         (fifo_odd_data_in           ),  
        .wr_en       (fifo_odd_data_in_valid     ), //equivalent to data_in_valid
        .rd_en       (fifo_odd_data_out_ready    ), //equivalent to data_out_ready
        .dout        (fifo_odd_data_out          ), 
        .data_count  (fifo_odd_data_count        ),
        .empty       (fifo_odd_data_out_not_valid) //equivalent to not data_out_valid
    );
    //conclusion fifo odd instatiation convert negated not_ready/not_valid signals to "standard" ready/valid interface.
    assign fifo_odd_data_in_ready  = ~ fifo_odd_data_in_not_ready ;
    assign fifo_odd_data_out_valid = ~ fifo_odd_data_out_not_valid;

    //select fifo current and fifo next according to cur_is_even_character signal
    always_comb begin : selector_fifo_current_fifo_next
        
        if ( cur_is_even_character == 1'b1  )
        begin //even is current and odd is next_char
            fifo_cur_char_data_in_ready   =  fifo_even_data_in_ready      ;
            fifo_even_data_in             =  fifo_cur_char_data_in        ;
            fifo_even_data_in_valid       =  fifo_cur_char_data_in_valid  ; 
            fifo_even_data_out_ready      =  fifo_cur_char_data_out_ready ;
            fifo_cur_char_data_out        =  fifo_even_data_out           ;
            fifo_cur_char_data_out_valid  =  fifo_even_data_out_valid     ;
            fifo_cur_char_data_count      =  fifo_even_data_count         ;

            fifo_next_char_data_in_ready  =  fifo_odd_data_in_ready       ;
            fifo_odd_data_in              =  fifo_next_char_data_in       ;
            fifo_odd_data_in_valid        =  fifo_next_char_data_in_valid ; 
            fifo_odd_data_out_ready       =  fifo_next_char_data_out_ready;
            fifo_next_char_data_out       =  fifo_odd_data_out            ;
            fifo_next_char_data_out_valid =  fifo_odd_data_out_valid      ;
            fifo_next_char_data_count     =  fifo_odd_data_count          ;
        end
        else
        begin //odd is current and even is next_char
            fifo_cur_char_data_in_ready   =  fifo_odd_data_in_ready       ;
            fifo_odd_data_in              =  fifo_cur_char_data_in        ;
            fifo_odd_data_in_valid        =  fifo_cur_char_data_in_valid  ; 
            fifo_odd_data_out_ready       =  fifo_cur_char_data_out_ready ;
            fifo_cur_char_data_out        =  fifo_odd_data_out            ;
            fifo_cur_char_data_out_valid  =  fifo_odd_data_out_valid      ;
            fifo_cur_char_data_count      =  fifo_odd_data_count          ;

            fifo_next_char_data_in_ready  =  fifo_even_data_in_ready      ;
            fifo_even_data_in             =  fifo_next_char_data_in       ;
            fifo_even_data_in_valid       =  fifo_next_char_data_in_valid ; 
            fifo_even_data_out_ready      =  fifo_next_char_data_out_ready;
            fifo_next_char_data_out       =  fifo_even_data_out           ;
            fifo_next_char_data_out_valid =  fifo_even_data_out_valid     ;
            fifo_next_char_data_count     =  fifo_even_data_count         ;
        end                        
    end

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

    //compute the approximate latency seen outside thought of max between odd and even but lead to high fanout-> setup violation
    //opted for a simpler computation: consider only fifo_cur_char length.
    //always_comb begin : latency_computation
    //    if( fifo_odd_data_count > fifo_even_data_count)  input_pc_latency = fifo_odd_data_count  + 1; 
    //    else                                             input_pc_latency = fifo_even_data_count + 1;      
    //end
    assign input_pc_latency = fifo_cur_char_data_count + 1 ;
    
    
    //running if regex_cpu has taken some instruction and hence the data_out_ready=0
    //        or some instructions are saved in curr character fifo and hence fifo_cur_char_data_out_valid=1
    always_comb begin : running_definition
        running = fifo_cur_char_data_out_valid || ~fifo_cur_char_data_out_ready;
    end


    /////////////////////////////////////////////////////////////////////////////
    // Computing part of the basic block
    /////////////////////////////////////////////////////////////////////////////

    regex_cpu #(
        .PC_WIDTH                           (PC_WIDTH                           ),
        .CHARACTER_WIDTH                    (CHARACTER_WIDTH                    ),
        .MEMORY_WIDTH                       (MEMORY_WIDTH                       ),
        .MEMORY_ADDR_WIDTH                  (MEMORY_ADDR_WIDTH                  )
    ) aregex_cpu (
        .clk                                (clk                                ),
        .reset                              (reset                              ), 
        .current_character                  (current_character                  ),
        .input_pc_ready                     (fifo_cur_char_data_out_ready       ), 
        .input_pc                           (fifo_cur_char_data_out             ), 
        .input_pc_valid                     (fifo_cur_char_data_out_valid       ),
        .memory_ready                       (memory_ready                       ),
        .memory_addr                        (memory_addr                        ),
        .memory_data                        (memory_data                        ),   
        .memory_valid                       (memory_valid                       ),
        .output_pc_is_directed_to_current   (output_pc_is_directed_to_current   ),
        .output_pc_ready                    (output_pc_ready                    ),
        .output_pc                          (output_pc                          ),
        .output_pc_valid                    (output_pc_valid                    ),
        .accepts                            (accepts                            )
    );
endmodule