`timescale 1ns/1ps

import AXI_package::*;

module AXI_top(
    input  logic                               clk,
    input  logic                             reset, //reset has to be implemented using cmd_register?
    input  logic [REG_WIDTH-1:0]  data_in_register,
    input  logic [REG_WIDTH-1:0]  address_register,
    input  logic [REG_WIDTH-1:0]      cmd_register,
    output logic [REG_WIDTH-1:0]   status_register,
    output logic [REG_WIDTH-1:0]   data_o_register
);
///// AXI
logic [REG_WIDTH-1:0]   status_register_next;

///// BRAM
parameter BRAM_READ_WIDTH            = 18;
parameter BRAM_WRITE_WIDTH           = 36;
parameter BRAM_ADDR_WIDTH            = 11;
parameter BRAM_WE_WIDTH              =  4;

logic     [ BRAM_READ_WIDTH-1:0] bram_out;
logic     [BRAM_WRITE_WIDTH-1:0] bram_in;
logic     [ BRAM_ADDR_WIDTH-1:0] bram_addr;
logic     [   BRAM_WE_WIDTH-1:0] bram_we;
logic                            bram_valid_in;

assign data_o_register = { {(32-BRAM_READ_WIDTH-2){1'b0}},bram_out[15+1:8+1],bram_out[7:0]};
/////

///// Sequential logic 
always_ff @(posedge clk) 
begin 
    if(reset)
    begin
        status_register <= STATUS_IDLE;
        
    end
    else
    begin
        status_register <= status_register_next;
        
    end
end

//// Combinational logic
always_comb 
begin
    status_register_next = status_register;
    bram_addr            = { (BRAM_ADDR_WIDTH) {1'b0} };
    bram_in              = { (BRAM_WRITE_WIDTH){1'b0} };
    bram_valid_in        = 1'b0;
    bram_we              = { (BRAM_WE_WIDTH){1'b0}};

    case(cmd_register)
    CMD_WRITE: // to write the content of memory write in seuqence addr_0, cmd_write, data_0, 
    begin      // addr_1, data_1, ..., cmd_nop.
        
        bram_addr     = address_register[0+:BRAM_ADDR_WIDTH]; //use low
        bram_in       = { ^(data_in_register[31:24]),data_in_register[31:24], ^(data_in_register[23:16]), data_in_register[23:16], ^(data_in_register[15:8]), data_in_register[15:8],  ^(data_in_register[7:0]), data_in_register[7:0] };
        bram_valid_in = 1'b1;
        bram_we       = { (BRAM_WE_WIDTH){1'b1}};
    end
    CMD_READ:
    begin      
        bram_addr     = address_register[0+:BRAM_ADDR_WIDTH]; //use low
        bram_valid_in = 1'b1;
       
    end
    endcase

end

//////////////////////////
//   Module instances   //
//////////////////////////

bram #(
    .READ_WIDTH ( BRAM_READ_WIDTH ),            
    .WRITE_WIDTH( BRAM_WRITE_WIDTH),          
    .ADDR_WIDTH ( BRAM_ADDR_WIDTH ),            
    .WE_WIDTH   ( BRAM_WE_WIDTH   )           
) abram (
    .clk(     clk           ),
    .reset(   reset         ),
    .addr_i(  bram_addr     ),
    .data_i(  bram_in       ),
    .we(      bram_we       ),
    .valid_i( bram_valid_in ),
    .data_o(  bram_out      )
);


endmodule
