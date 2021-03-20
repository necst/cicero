`timescale 1ns / 100ps

import AXI_package::*;

module AXI_top_tb();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    logic                               clk;
    logic                             rst; 
    logic [REG_WIDTH-1:0]  data_in_register;
    logic [REG_WIDTH-1:0]  address_register;
    logic [REG_WIDTH-1:0]      cmd_register;
    logic [REG_WIDTH-1:0]   status_register;
    logic [REG_WIDTH-1:0]   data_o_register;

    AXI_top dut(
    .clk(                           clk),
    .rst(                        rst),
    .data_in_register( data_in_register ),
    .address_register( address_register ),
    .cmd_register(     cmd_register     ),
    .status_register(  status_register  ),
    .data_o_register(  data_o_register  )
    );

    // clock generator  
    always begin
        #CLOCK_SEMI_PERIOD clk = ~ clk;
    end

    task write(  input reg[REG_WIDTH-1:0] address, 
                 input reg[REG_WIDTH-1:0] value);
    begin
        @(posedge clk);
        address_register  <= address;
        @(posedge clk);
        data_in_register  <= value;
        @(posedge clk);
        cmd_register      <= CMD_WRITE;
        @(posedge clk);
        cmd_register      <= CMD_NOP;
    end
    endtask

    task read(  input reg[REG_WIDTH-1:0] address, 
                input reg[REG_WIDTH-1:0] expected_data);
    begin
        @(posedge clk);
        address_register  <= address;
        @(posedge clk);
        cmd_register      <= CMD_READ;
        @(posedge clk);
        cmd_register      <= CMD_NOP;
        @(posedge clk);

        if( data_o_register !== expected_data)
        begin
            $display("mismatch obtained %d != expected %d ", data_o_register, expected_data);
            $finish(1);
        end 
        
    end
    endtask

    initial
    begin
        clk          = 1'b0;
        rst       <= 1'b0;
        cmd_register<= CMD_NOP;
        @(posedge clk);
        rst       <= 1'b1;
        @(posedge clk);
        rst       <= 1'b0;
        repeat(5)
            @(posedge clk);
        write(32'h0000_0000, 32'hDEAD_BEEF);
        @(posedge clk);
        read(32'h0000_0000,  32'h0000_BEEF);
        $display("OK");
        $finish(0);
    end

endmodule