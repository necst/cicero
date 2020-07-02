`timescale 1ns/1ps

import AXI_package::*;

//component intended to decouple the regex_coprocessor and the AXI interface.
//It contains the memory of the regex_coprocessor so that is possible to show outside the contetn of the memory
//It implements some commands that are intended to drive the regex_coprocessor and other component from software. 

module AXI_top(
    input  logic                               clk,
    input  logic                             reset,
    input  logic [REG_WIDTH-1:0]  data_in_register,
    input  logic [REG_WIDTH-1:0]  address_register,
//  input  logic [REG_WIDTH-1:0] start_pc_register,
    input  logic [REG_WIDTH-1:0] start_cc_pointer_register,
    input  logic [REG_WIDTH-1:0]      cmd_register,
    output logic [REG_WIDTH-1:0]   status_register,
    output logic [REG_WIDTH-1:0]   data_o_register
);
logic reset_master;
///// AXI
logic [REG_WIDTH-1:0]   status_register_next;

///// BRAM
parameter BRAM_READ_WIDTH            = 18;
parameter BRAM_WRITE_WIDTH           = 36;
parameter BRAM_READ_WIDTH_PARITY     =  2;
parameter BRAM_ADDR_WIDTH            = 11;
parameter BRAM_WE_WIDTH              =  4;

logic     [ BRAM_READ_WIDTH-1:0] bram_out;
logic     [ BRAM_READ_WIDTH-3:0] bram_payload;
logic     [BRAM_WRITE_WIDTH-1:0] bram_in;
logic     [ BRAM_ADDR_WIDTH-1:0] bram_addr;
logic     [   BRAM_WE_WIDTH-1:0] bram_we;
logic                            bram_valid_in;

assign bram_payload     = {bram_out[15+1:8+1],bram_out[7:0]};
logic     [       REG_WIDTH-1:0] bram_o_register;
assign bram_o_register  = { {(REG_WIDTH-BRAM_READ_WIDTH-BRAM_READ_WIDTH_PARITY){1'b0}},bram_payload};
///// Coprocessor
localparam PC_WIDTH                  = 8;
localparam CHARACTER_WIDTH           = 8;

logic                            memory_addr_from_coprocessor_ready;
logic     [ BRAM_ADDR_WIDTH-1:0] memory_addr_from_coprocessor;
logic                            memory_addr_from_coprocessor_valid;
logic                            start_valid, finish, accept, error;
//logic             [PC_WIDTH-1:0] start_pc; 
logic     [ BRAM_ADDR_WIDTH-1:0] start_cc_pointer;
logic                            start_ready;

/////performace counter
logic     [REG_WIDTH-1:0]        elapsed_cc, elapsed_cc_next;        


assign reset_master = reset || (cmd_register==CMD_RESET);

///// Sequential logic 
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

//// Combinational logic

always_comb 
begin
    status_register_next               = status_register;

    elapsed_cc_next                    = elapsed_cc;

    data_o_register                    = {(REG_WIDTH        ){1'b0} };

    bram_addr                          = { (BRAM_ADDR_WIDTH) {1'b0} };
    bram_in                            = { (BRAM_WRITE_WIDTH){1'b0} };
    bram_valid_in                      = 1'b0;
    bram_we                            = { (BRAM_WE_WIDTH){1'b0}};

    memory_addr_from_coprocessor_ready = 1'b0;
    
    start_ready                        = 1'b0;
    start_cc_pointer                   = { (BRAM_ADDR_WIDTH){1'b0} }; 

    case(status_register)
    STATUS_IDLE:
    begin   
        if(cmd_register == CMD_WRITE) // to write the content of memory write in seuqence addr_0, cmd_write, data_0, 
        begin      // addr_1, data_1, ..., cmd_nop.
            
            bram_addr           = address_register[0+:BRAM_ADDR_WIDTH]; //use low
            bram_in             = { ^(data_in_register[31:24]),data_in_register[31:24], ^(data_in_register[23:16]), data_in_register[23:16], ^(data_in_register[15:8]), data_in_register[15:8],  ^(data_in_register[7:0]), data_in_register[7:0] };
            bram_valid_in       = 1'b1;
            bram_we             = { (BRAM_WE_WIDTH) {1'b1} };
            data_o_register     = bram_o_register;
        end
        else if(cmd_register == CMD_READ)
        begin      
            bram_addr           = address_register[0+:BRAM_ADDR_WIDTH]; //use low
            bram_valid_in       = 1'b1;
            memory_addr_from_coprocessor_ready = 1'b0;
            data_o_register     = bram_o_register;
        end
        else if(cmd_register == CMD_START)
        begin
            start_cc_pointer    = start_cc_pointer_register[0+:BRAM_ADDR_WIDTH];
            //start_pc            = start_pc_register[0+:PC_WIDTH];
            start_ready         = 1'b1;
            bram_addr           = memory_addr_from_coprocessor;
            bram_valid_in       = memory_addr_from_coprocessor_valid;
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
        if(cmd_register == CMD_WRITE) // to write the content of memory write in seuqence addr_0, cmd_write, data_0, 
        begin      // addr_1, data_1, ..., cmd_nop.
            
            bram_addr           = address_register[0+:BRAM_ADDR_WIDTH]; //use low
            bram_in             = { ^(data_in_register[31:24]),data_in_register[31:24], ^(data_in_register[23:16]), data_in_register[23:16], ^(data_in_register[15:8]), data_in_register[15:8],  ^(data_in_register[7:0]), data_in_register[7:0] };
            bram_valid_in       = 1'b1;
            bram_we             = { (BRAM_WE_WIDTH) {1'b1} };
            data_o_register     = bram_o_register;
        end
        else if(cmd_register == CMD_READ)
        begin      
            bram_addr           = address_register[0+:BRAM_ADDR_WIDTH]; //use low
            bram_valid_in       = 1'b1;
            memory_addr_from_coprocessor_ready = 1'b0;
            data_o_register     = bram_o_register;
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
        // leave memory control to coprocessor
        bram_addr            = memory_addr_from_coprocessor;
        bram_valid_in        = memory_addr_from_coprocessor_valid;
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
        begin //if counter has not saturated
            elapsed_cc_next = elapsed_cc + 1;
        end                             
    end
    endcase

end

//////////////////////////
//   Module instances   //
//////////////////////////

bram #(
    .READ_WIDTH ( BRAM_READ_WIDTH   ),            
    .WRITE_WIDTH( BRAM_WRITE_WIDTH  ),          
    .ADDR_WIDTH ( BRAM_ADDR_WIDTH   ),            
    .WE_WIDTH   ( BRAM_WE_WIDTH     )           
) abram (
    .clk(         clk               ),
    .reset(       reset_master      ),
    .addr_i(      bram_addr         ),
    .data_i(      bram_in           ),
    .we(          bram_we           ),
    .valid_i(     bram_valid_in     ),
    .data_o(      bram_out          )
);

localparam BB_N             = 4;
localparam FIFO_COUNT_WIDTH = 7;
localparam CACHE_WIDTH_BITS = 5;
localparam BASIC_BLOCK_PIPELINED     = 1;
if (BB_N == 1)
begin
    regex_coprocessor_single_bb #(
        .PC_WIDTH               (PC_WIDTH                              ),
        .CHARACTER_WIDTH        (CHARACTER_WIDTH                       ),
        .MEMORY_WIDTH           (BRAM_READ_WIDTH-BRAM_READ_WIDTH_PARITY),
        .MEMORY_ADDR_WIDTH      (BRAM_ADDR_WIDTH                       ),
        .FIFO_COUNT_WIDTH       (FIFO_COUNT_WIDTH                      ),
        .BASIC_BLOCK_PIPELINED  (BASIC_BLOCK_PIPELINED                 )
    ) a_regex_coprocessor (
        .clk                (clk),
        .reset              (reset_master),
        .memory_ready       (memory_addr_from_coprocessor_ready ),
        .memory_addr        (memory_addr_from_coprocessor       ),
        .memory_data        (bram_payload),
        .memory_valid       (memory_addr_from_coprocessor_valid ),
        .start_ready        (start_ready),
        .start_cc_pointer   (start_cc_pointer),
        .start_valid        (start_valid),
        .finish             (finish),
        .accept             (accept),
        .error              (error)
    );
end
else
begin
    regex_coprocessor_n_bb #(
        .PC_WIDTH               (PC_WIDTH                              ),
        .CHARACTER_WIDTH        (CHARACTER_WIDTH                       ),
        .MEMORY_WIDTH           (BRAM_READ_WIDTH-BRAM_READ_WIDTH_PARITY),
        .MEMORY_ADDR_WIDTH      (BRAM_ADDR_WIDTH                       ), 
        .LATENCY_COUNT_WIDTH    (7                                     ),
        .FIFO_COUNT_WIDTH       (FIFO_COUNT_WIDTH                      ),
        .BB_N                   (BB_N                                  ),
        .CACHE_WIDTH_BITS       (CACHE_WIDTH_BITS                      ),
        .BASIC_BLOCK_PIPELINED  (BASIC_BLOCK_PIPELINED                 )
    )a_regex_coprocessor (
        .clk                (clk),
        .reset              (reset_master),
        .memory_ready       (memory_addr_from_coprocessor_ready ),
        .memory_addr        (memory_addr_from_coprocessor       ),
        .memory_data        (bram_payload),
        .memory_valid       (memory_addr_from_coprocessor_valid ),
        .start_ready        (start_ready),
        .start_cc_pointer   (start_cc_pointer),
        .start_valid        (start_valid),
        .finish             (finish),
        .accept             (accept),
        .error              (error)
    );
end
endmodule
