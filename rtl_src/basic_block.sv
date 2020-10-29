`timescale 1ns/1ps

// Author: Daniele Parravicini
// This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// Furthermore no-copy is allowed without explicit permission of the authors.                                                                                                     

module basic_block #(
    parameter  PC_WIDTH            = 8 ,
    parameter  LATENCY_COUNT_WIDTH = 8 ,
    parameter  FIFO_COUNT_WIDTH    = 6 ,
    parameter  CHARACTER_WIDTH     = 8 ,
    parameter  MEMORY_WIDTH        = 16,
    parameter  MEMORY_ADDR_WIDTH   = 11,
    parameter  CACHE_WIDTH_BITS    = 0, 
    parameter  CACHE_BLOCK_WIDTH_BITS = 2 ,
    parameter  PIPELINED           = 0,
    parameter  CONSIDER_PIPELINE_FIFO = 0
)(
    input   wire                            clk,
    input   wire                            reset, 
    output  logic                           accepts,
    output  logic                           running,
    input   logic                           go,
    input   logic                           cur_is_even_character,
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
    input   logic                           output_pc_ready,
    input   logic[LATENCY_COUNT_WIDTH-1:0]  output_pc_latency

);
    localparam I_WIDTH = 16;
    localparam OFFSET_I= $clog2(MEMORY_WIDTH/I_WIDTH);
    localparam CPU_MEMORY_ADDR_WIDTH = MEMORY_ADDR_WIDTH+OFFSET_I;

    wire [LATENCY_COUNT_WIDTH-1:0] output_pc_latency_unused;
    assign output_pc_latency_unused = output_pc_latency;

    logic [PC_WIDTH-1:0]        output_pc, input_pc;
    logic                       input_pc_is_directed_to_current, output_pc_is_directed_to_current;

    logic regex_cpu_running                                ;
    logic regex_cpu_input_pc_ready,regex_cpu_input_pc_valid;
    localparam                      REGEX_CPU_FIFO_WIDTH_POWER_OF_2 = 2;
    logic [REGEX_CPU_FIFO_WIDTH_POWER_OF_2:0] regex_cpu_latency;

    wire                        regex_cpu_memory_ready      ;
    wire [CPU_MEMORY_ADDR_WIDTH-1:0]regex_cpu_memory_addr       ;
    wire [I_WIDTH-1     :0]     regex_cpu_memory_data       ;
    wire                        regex_cpu_memory_valid      ;

    logic                       fifo_even_data_in_ready     ;
    logic                       fifo_even_data_in_not_ready ;
    logic [PC_WIDTH-1:0]        fifo_even_data_in           ;
    logic                       fifo_even_data_in_valid     ;
    logic                       fifo_even_data_out_ready    ;
    logic [PC_WIDTH-1:0]        fifo_even_data_out          ;
    logic                       fifo_even_data_out_valid    ;
    logic                       fifo_even_data_out_not_valid;
    logic [FIFO_COUNT_WIDTH-1:0]fifo_even_data_count        ;

    logic                       fifo_odd_data_in_ready      ;
    logic                       fifo_odd_data_in_not_ready  ;
    logic [PC_WIDTH-1:0]        fifo_odd_data_in            ;
    logic                       fifo_odd_data_in_valid      ;
    logic                       fifo_odd_data_out_ready     ;
    logic [PC_WIDTH-1:0]        fifo_odd_data_out           ;
    logic                       fifo_odd_data_out_valid     ;
    logic                       fifo_odd_data_out_not_valid ;
    logic [FIFO_COUNT_WIDTH-1:0]fifo_odd_data_count         ;

    logic                       fifo_cur_char_data_in_ready  ;
    logic [PC_WIDTH-1:0]        fifo_cur_char_data_in        ;
    logic                       fifo_cur_char_data_in_valid  ;
    logic                       fifo_cur_char_data_out_ready ;
    logic [PC_WIDTH-1:0]        fifo_cur_char_data_out       ;
    logic                       fifo_cur_char_data_out_valid ;
    logic [FIFO_COUNT_WIDTH-1:0]fifo_cur_char_data_count     ;

    logic                       fifo_next_char_data_in_ready ;
    logic [PC_WIDTH-1:0]        fifo_next_char_data_in       ;
    logic                       fifo_next_char_data_in_valid ;
    logic                       fifo_next_char_data_out_ready;
    logic [PC_WIDTH-1:0]        fifo_next_char_data_out      ;
    logic                       fifo_next_char_data_out_valid;
    logic [FIFO_COUNT_WIDTH-1:0]fifo_next_char_data_count    ;


    fifo #(
        .DWIDTH(PC_WIDTH),
        .COUNT_WIDTH(FIFO_COUNT_WIDTH)
    )fifo_even(
        .clk         (clk                         ), 
        .reset       (reset                       ), 
        .full        (fifo_even_data_in_not_ready ), 
        .din         (fifo_even_data_in           ),  
        .wr_en       (fifo_even_data_in_valid     ), 
        .rd_en       (fifo_even_data_out_ready    ), 
        .dout        (fifo_even_data_out          ), 
        .empty       (fifo_even_data_out_not_valid), 
        .data_count  (fifo_even_data_count        )
    );
    assign fifo_even_data_in_ready  = ~ fifo_even_data_in_not_ready ;
    assign fifo_even_data_out_valid = ~ fifo_even_data_out_not_valid;


    fifo #(
        .DWIDTH(PC_WIDTH),
        .COUNT_WIDTH(FIFO_COUNT_WIDTH)
    )fifo_odd(
        .clk         (clk                        ), 
        .reset       (reset                      ), 
        .full        (fifo_odd_data_in_not_ready ), 
        .din         (fifo_odd_data_in           ),  
        .wr_en       (fifo_odd_data_in_valid     ), 
        .rd_en       (fifo_odd_data_out_ready    ), 
        .dout        (fifo_odd_data_out          ), 
        .data_count  (fifo_odd_data_count        ),
        .empty       (fifo_odd_data_out_not_valid)
    );
    assign fifo_odd_data_in_ready  = ~ fifo_odd_data_in_not_ready ;
    assign fifo_odd_data_out_valid = ~ fifo_odd_data_out_not_valid;

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


    assign fifo_next_char_data_out_ready = 1'b0;

    assign output_pc_and_current = {output_pc, output_pc_is_directed_to_current};

    assign input_pc_is_directed_to_current = input_pc_and_current[0];
    assign input_pc                        = input_pc_and_current[1+:PC_WIDTH] ;

    assign input_pc_ready         = fifo_cur_char_data_in_ready && fifo_next_char_data_in_ready;
    always_comb begin : demux_for_pc_in 
        fifo_cur_char_data_in  = { PC_WIDTH{1'b0} };
        fifo_next_char_data_in = { PC_WIDTH{1'b0} };
        
        if(input_pc_is_directed_to_current)
        begin
            fifo_cur_char_data_in       = input_pc ;
            fifo_cur_char_data_in_valid = input_pc_valid && input_pc_ready;

            fifo_next_char_data_in_valid= 1'b0;
        end
        else
        begin
            fifo_next_char_data_in       = input_pc ;
            fifo_next_char_data_in_valid = input_pc_valid && input_pc_ready; 

            fifo_cur_char_data_in_valid  = 1'b0;
        end
    end

   

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

    

    always_comb begin : running_definition
        running = fifo_cur_char_data_out_valid || regex_cpu_running;
    end



    assign fifo_cur_char_data_out_ready = go && regex_cpu_input_pc_ready    ; 
    assign regex_cpu_input_pc_valid     = go && fifo_cur_char_data_out_valid;
    
        
    regex_cpu_pipelined #(
        .PC_WIDTH                           (PC_WIDTH                           ),
        .CHARACTER_WIDTH                    (CHARACTER_WIDTH                    ),
        .MEMORY_WIDTH                       (I_WIDTH                       ),
        .MEMORY_ADDR_WIDTH                  (CPU_MEMORY_ADDR_WIDTH              ),
        .FIFO_WIDTH_POWER_OF_2              (REGEX_CPU_FIFO_WIDTH_POWER_OF_2    )
    ) aregex_cpu (
        .clk                                (clk                                ),
        .reset                              (reset                              ), 
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


 
    cache_block_directly_mapped #(          
        .DWIDTH             (I_WIDTH                ),
        .CACHE_WIDTH_BITS   (CACHE_WIDTH_BITS       ),
        .BLOCK_WIDTH_BITS   (CACHE_BLOCK_WIDTH_BITS ),
        .ADDR_IN_WIDTH      (CPU_MEMORY_ADDR_WIDTH  )
    ) a_cache (
        .clk                (clk                    ),
        .reset              (reset                  ),
        .addr_in_valid      (regex_cpu_memory_valid ),
        .addr_in            (regex_cpu_memory_addr  ),
        .addr_in_ready      (regex_cpu_memory_ready ),
        .data_out           (regex_cpu_memory_data  ),
        .addr_out_valid     (memory_valid           ),
        .addr_out           (memory_addr            ),
        .addr_out_ready     (memory_ready           ),
        .data_in            (memory_data            )
    );


    
endmodule