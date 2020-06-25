`timescale 1ns/1ps
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
    output  logic[LATENCY_COUNT_WIDTH-1:0]  output_pc_latency

);

    /////////////////////////////////////////////////////////////////////////////
    // Computing part of the basic block
    /////////////////////////////////////////////////////////////////////////////

    logic [PC_WIDTH-1:0] input_pc;
    logic [PC_WIDTH-1:0] output_pc;

    regex_cpu #(
        .PC_WIDTH                           (PC_WIDTH                           ),
        .CHARACTER_WIDTH                    (CHARACTER_WIDTH                    ),
        .MEMORY_WIDTH                       (MEMORY_WIDTH                       ),
        .MEMORY_ADDR_WIDTH                  (MEMORY_ADDR_WIDTH                  )
    ) aregex_cpu (
        .clk                                (clk                                ),
        .reset                              (reset                              ), 
        .current_character                  (current_character                  ),
        .input_pc_ready                     (fifo_cur_char_data_out_ready                     ), 
        .input_pc                           (fifo_cur_char_data_out                           ), 
        .input_pc_valid                     (fifo_cur_char_data_out_valid                     ),
        .memory_ready                       (memory_ready                       ),
        .memory_addr                        (memory_addr                        ),
        .memory_data                        (memory_data                        ),   
        .memory_valid                       (memory_valid                       ),
        .output_pc_is_directed_to_current   (output_pc_is_directed_to_current   ),
        .output_pc_ready                    (output_pc_ready                    ),
        .output_pc                          (output_pc                          ),
        .output_pc_valid                    (output_pc_valid                    ),
        .accepts                            (accept                             )
    );

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
    assign fifo_even_data_in_ready  = ~ fifo_even_data_in_not_ready ;
    assign fifo_even_data_out_valid = ~ fifo_even_data_out_not_valid;
    
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
        .data_count  (fifo_even_data_count        ),
        .empty       (fifo_even_data_out_not_valid) //equivalent to not data_out_valid
    );
    //FIFO odd instantiation 
    assign fifo_odd_data_in_ready  = ~ fifo_odd_data_in_not_ready ;
    assign fifo_odd_data_out_valid = ~ fifo_odd_data_out_not_valid;
    
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

    //select fifo current and fifo next according to cur_is_even_character signal
    always_comb begin : selector_fifo_current_fifo_next
        
        if ( cur_is_even_character == 1'b1  )
        begin
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
        begin
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

    // make so that pc referring to next char are not consumed. 
    assign fifo_next_char_data_out_ready = 1'b0;

    //ouput pc is redirected toward output after having concatenated 
    assign output_pc_and_current = {output_pc, output_pc_is_directed_to_current};
    //input pc and current is splitted in input_pc and input_pc_is_directed_to_current
    assign input_pc_is_directed_to_current = input_pc_and_current[0];
    assign input_pc                        = input_pc_and_current[1+:PC_WIDTH] ;

    //demux 
    always_comb begin : demux_for_pc_in 
        fifo_cur_char_data_in  = { PC_WIDTH{1'b0} };
        fifo_next_char_data_in = { PC_WIDTH{1'b0} };
        //to avoid a combinational loop 
        input_pc_ready         = fifo_cur_char_data_in_ready && fifo_next_char_data_in_ready;
        if(input_pc_is_directed_to_current)
        begin
            fifo_cur_char_data_in       = input_pc ;
            fifo_cur_char_data_in_valid = input_pc_valid ;

            fifo_next_char_data_in_valid= 1'b0;
        end
        else
        begin
            fifo_next_char_data_in       = input_pc ;
            fifo_next_char_data_in_valid = input_pc_valid ;

            fifo_cur_char_data_in_valid  = 1'b0;
        end
    end

    //compute the approximate latency seen outside
    always_comb begin : latency_computation
        if( fifo_odd_data_count > fifo_even_data_count)  input_pc_latency = fifo_odd_data_count  + 1; 
        else                                             input_pc_latency = fifo_even_data_count + 1;      
    end

    //running if regex_cpu has taken some instruction and the data_out_ready=0
    //        or some instructions are saved in curr character fifo
    always_comb begin : running
        running = fifo_cur_char_data_out_valid || ~fifo_cur_char_data_out_ready;
    end
    

endmodule