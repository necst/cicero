`timescale 1ns/1ps

import AXI_package::*;

// Author: Daniele Parravicini
// This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// Furthermore no-copy is allowed without explicit permission of the authors.

module AXI_top(
    input  logic                 clk,
    input  logic                 reset,
    input  logic [REG_WIDTH-1:0] data_in_register,
    input  logic [REG_WIDTH-1:0] address_register,
    input  logic [REG_WIDTH-1:0] start_cc_pointer_register,
    input  logic [REG_WIDTH-1:0] cmd_register,
    output logic [REG_WIDTH-1:0] status_register,
    output logic [REG_WIDTH-1:0] data_o_register
);
logic reset_master;
///// AXI
logic [REG_WIDTH-1:0]   status_register_next;

///// BRAM
parameter BRAM_READ_WIDTH            = 64;
parameter BRAM_READ_ADDR_WIDTH       = 9;
parameter BRAM_WRITE_WIDTH           = 32;
parameter BRAM_WRITE_ADDR_WIDTH      = 10;
parameter BRAM_WE_WIDTH              =  BRAM_WRITE_WIDTH/8;

localparam BYTE_ADDR_OFFSET_IN_REG   =  $clog2(BRAM_READ_WIDTH/REG_WIDTH);

logic     [ BRAM_READ_WIDTH       -1:0 ] bram_r;
logic     [ BRAM_READ_ADDR_WIDTH  -1:0 ] bram_r_addr;
logic                                    bram_r_valid;
logic     [ BRAM_WRITE_ADDR_WIDTH -1:0 ] bram_w_addr;
logic     [ BRAM_WRITE_WIDTH      -1:0 ] bram_w;
logic     [ BRAM_WE_WIDTH         -1:0 ] bram_w_valid;

///// Coprocessor
localparam BB_N                      = 16;
localparam FIFO_COUNT_WIDTH          = 5;
localparam CHANNEL_COUNT_WIDTH       = 4;
localparam LATENCY_COUNT_WIDTH       = 7;
localparam CACHE_WIDTH_BITS          = 4;
localparam CACHE_BLOCK_WIDTH_BITS    = 2;
localparam BASIC_BLOCK_PIPELINED     = 1;
localparam PC_WIDTH                  = 8;
localparam CHARACTER_WIDTH           = 8;


logic                                   memory_addr_from_coprocessor_ready;
logic     [ BRAM_READ_ADDR_WIDTH-1:0]   memory_addr_from_coprocessor;
logic                                   memory_addr_from_coprocessor_valid;
logic                                   start_valid, finish, accept, error;
logic                                   start_ready;

logic     [REG_WIDTH-1:0]               elapsed_cc, elapsed_cc_next;        


assign reset_master = reset || (cmd_register==CMD_RESET);

always_ff @(posedge clk) 
begin 
    if(reset_master == 1'b1)
    begin
        status_register <= STATUS_IDLE;
        elapsed_cc      <= {(REG_WIDTH){1'b0}};
    end
    else
    begin
        status_register <= status_register_next;
        elapsed_cc      <= elapsed_cc_next;
    end
end


always_comb 
begin
    status_register_next               = status_register;

    elapsed_cc_next                    = elapsed_cc;

    data_o_register                    = {(REG_WIDTH        ){1'b0} };

    bram_r_addr                        = { (BRAM_READ_ADDR_WIDTH)  {1'b0} };
    bram_r_valid                       = 1'b0;
    bram_w_addr                        = { (BRAM_WRITE_ADDR_WIDTH) {1'b0} };
    bram_w                             = { (BRAM_WRITE_WIDTH){1'b0} };
    bram_w_valid                       = { (BRAM_WE_WIDTH){1'b0}};

    memory_addr_from_coprocessor_ready = 1'b0;
    
    start_ready                        = 1'b0;

    case(status_register)
    STATUS_IDLE:
    begin   
        if(cmd_register == CMD_WRITE) 
        begin      
            
            bram_w_addr         = address_register[0+:BRAM_WRITE_ADDR_WIDTH];
            bram_w_valid        = { (BRAM_WE_WIDTH) {1'b1} };
            bram_w              = data_in_register[0+:BRAM_WRITE_WIDTH];
        end
        else if(cmd_register == CMD_READ)
        begin      
            bram_r_addr         = address_register[BYTE_ADDR_OFFSET_IN_REG+:BRAM_READ_ADDR_WIDTH]; //use low
            bram_r_valid        = 1'b1;
            memory_addr_from_coprocessor_ready = 1'b0;
            data_o_register     = bram_r[address_register[0+:BYTE_ADDR_OFFSET_IN_REG]*REG_WIDTH+:REG_WIDTH];
        end
        else if(cmd_register == CMD_START)
        begin
            start_ready         = 1'b1;
            bram_r_addr         = memory_addr_from_coprocessor;
            bram_r_valid        = memory_addr_from_coprocessor_valid;
            memory_addr_from_coprocessor_ready = 1'b1;
            elapsed_cc_next     = {(REG_WIDTH){1'b0}};

            if( start_valid )
            begin
                status_register_next = STATUS_RUNNING;
            end
        end
        else if(cmd_register == CMD_READ_ELAPSED_CLOCK)
        begin
            data_o_register     = elapsed_cc;
        end
        
    end
    STATUS_ACCEPTED, STATUS_REJECTED, STATUS_ERROR:
    begin   
        if(cmd_register == CMD_WRITE) 
        begin      // addr_1, data_1, ..., cmd_nop.
            
            bram_w_addr         = address_register[0+:BRAM_WRITE_ADDR_WIDTH]; //use low
            bram_w_valid        = { (BRAM_WE_WIDTH) {1'b1} };
            bram_w              = data_in_register[0+:BRAM_WRITE_WIDTH];
        end
        else if(cmd_register == CMD_READ)
        begin      
            bram_r_addr         = address_register[BYTE_ADDR_OFFSET_IN_REG+:BRAM_READ_ADDR_WIDTH]; //use low
            bram_r_valid        = 1'b1;
            memory_addr_from_coprocessor_ready = 1'b0;
            data_o_register     = bram_r[address_register[0+:BYTE_ADDR_OFFSET_IN_REG]*REG_WIDTH+:REG_WIDTH];
        end
        else if(cmd_register == CMD_RESTART)
        begin
            status_register_next = STATUS_IDLE;
        end
        else if(cmd_register == CMD_READ_ELAPSED_CLOCK)
        begin
            data_o_register     = elapsed_cc;
        end
        
    end
    STATUS_RUNNING:
    begin 
        bram_r_addr          = memory_addr_from_coprocessor;
        bram_r_valid         = memory_addr_from_coprocessor_valid;
        memory_addr_from_coprocessor_ready = 1'b1;
        if(error)
        begin
            status_register_next = STATUS_ERROR;
        end
        else if( finish )
        begin
            if(accept)  status_register_next = STATUS_ACCEPTED;
            else        status_register_next = STATUS_REJECTED;
        end
        

        if (&elapsed_cc == 1'b0)   
        begin 
            elapsed_cc_next = elapsed_cc + 1;
        end                             
    end
    endcase

end

//////////////////////////
//   Module instances   //
//////////////////////////

bram #(
    .READ_WIDTH      ( BRAM_READ_WIDTH      ),            
    .READ_ADDR_WIDTH ( BRAM_READ_ADDR_WIDTH ),            
    .WRITE_WIDTH     ( BRAM_WRITE_WIDTH     ),       
    .WRITE_ADDR_WIDTH( BRAM_WRITE_ADDR_WIDTH),    
    .WE_WIDTH        ( BRAM_WE_WIDTH        )           
) abram (
    .clk             (     clk               ),
    .reset           (     reset_master      ),
    .r_addr          (     bram_r_addr       ),
    .r_data          (     bram_r            ),
    .r_valid         (     bram_r_valid      ),
    .w_addr          (     bram_w_addr       ),
    .w_data          (     bram_w            ),
    .w_valid         (     bram_w_valid      )
);



    
    regex_coprocessor_n_bb#(
        .PC_WIDTH               (PC_WIDTH                               ),
        .CHARACTER_WIDTH        (CHARACTER_WIDTH                        ),
        .MEMORY_WIDTH           (BRAM_READ_WIDTH                        ),
        .MEMORY_ADDR_WIDTH      (BRAM_READ_ADDR_WIDTH                   ), 
        .LATENCY_COUNT_WIDTH    (LATENCY_COUNT_WIDTH                    ),
        .FIFO_COUNT_WIDTH       (FIFO_COUNT_WIDTH                       ),
        .CHANNEL_COUNT_WIDTH    (CHANNEL_COUNT_WIDTH                    ),
        .BB_N                   (BB_N                                   ),
        .CACHE_BLOCK_WIDTH_BITS (CACHE_BLOCK_WIDTH_BITS                 ),      
        .CACHE_WIDTH_BITS       (CACHE_WIDTH_BITS                       ),
        .BASIC_BLOCK_PIPELINED  (BASIC_BLOCK_PIPELINED                  ),
        .REG_WIDTH              (REG_WIDTH                              )
    )a_regex_coprocessor (
        .clk                    (clk                                    ),
        .reset                  (reset_master                           ),
        .memory_ready           (memory_addr_from_coprocessor_ready     ),
        .memory_addr            (memory_addr_from_coprocessor           ),
        .memory_data            (bram_r                                 ),
        .memory_valid           (memory_addr_from_coprocessor_valid     ),
        .start_ready            (start_ready                            ),
        .start_cc_pointer       (start_cc_pointer_register              ),
        .start_valid            (start_valid                            ),
        .finish                 (finish                                 ),
        .accept                 (accept                                 ),
        .error                  (error                                  )
    );

endmodule
