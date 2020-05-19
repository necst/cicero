`timescale 1ns / 10ps

import AXI_package::*;

module AXI_top_tb_from_file();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    logic                               clk;
    logic                             reset; 
    logic [REG_WIDTH-1:0]  data_in_register;
    logic [REG_WIDTH-1:0]  address_register;
    logic [REG_WIDTH-1:0]      cmd_register;
    logic [REG_WIDTH-1:0]   status_register;
    logic [REG_WIDTH-1:0]   data_o_register;

    AXI_top dut(
    .clk(                           clk),
    .reset(                        reset),
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

    task write_file( int fp,
                     input reg [REG_WIDTH-1:0] start_address );
    begin
        int c;
        reg [REG_WIDTH-1:0] address;
        reg [7:0]           itype0, idata0, itype1,idata1;
        reg [REG_WIDTH:0]   data;
        reg                 flag;
        flag    = 1'b1;  
        address = start_address;
        
        while (! $feof(fp)) 
        begin
            c = $fscanf(fp,"%d ; %d\n", itype0, idata0);
            if( ! $feof(fp) )
            begin
                c = $fscanf(fp,"%d ; %d\n", itype1, idata1);
            end
            else
            begin
                itype1         = {8{1'b0}};
                idata1         = {8{1'b0}};
            end
            $display("%d,%d,%d,%d",itype1, idata1, itype0, idata0);
            data               = {itype1, idata1, itype0, idata0};
            @(posedge clk);
            address_register  <= address;
            @(posedge clk);
            data_in_register  <= data;
            if(flag)
            begin
                @(posedge clk);
                cmd_register  <= CMD_WRITE;
                flag           = 1'b0;
            end
            address += 2;
        end
        @(posedge clk);
        cmd_register  <= CMD_NOP;
    end
    endtask

    task read_and_compare_with_file( int fp,
                    input reg [REG_WIDTH-1:0] start_address );
    begin
        int c;
        reg [REG_WIDTH-1:0] address;
        reg [7:0]           itype0, idata0;
        reg [REG_WIDTH:0]   data;
        reg                 flag;
        flag    = 1'b1;  
        address = start_address;
        
        while (! $feof(fp)) 
        begin
            c = $fscanf(fp,"%d ; %d\n", itype0, idata0);
            $display("%d,%d",itype0, idata0);
            
            address_register  <= address;
            @(posedge clk);
            if(flag)
            begin
                
                cmd_register  <= CMD_READ;
                flag           = 1'b0;
                @(posedge clk);
            end
            
           
            @(posedge clk);
            if ( data_o_register  !== { {16{1'b0}}, itype0, idata0})
            begin
                $display("%d: obtained %d, %d !==  expected %d %d",address, data_o_register[15:8], data_o_register[7:0]  , itype0, idata0);
                $stop;
            end

            address += 1;
        end
        @(posedge clk);
        cmd_register  <= CMD_NOP;
    end
    endtask

    initial
    begin
        int fin_pointer;
        int ok;

        clk          = 1'b0;
        reset       <= 1'b0;
        cmd_register<= CMD_NOP;
        @(posedge clk);
        reset       <= 1'b1;
        @(posedge clk);
        reset       <= 1'b0;
        repeat(30)
            @(posedge clk);

        fin_pointer= $fopen("C:\\Users\\danie\\Desktop\\regex_coprocessor\\RegexParser\\code.csv","r");
        if (fin_pointer==0)
        begin
            $display("Could not open file '%s' for reading","code.csv");
            $stop;     
        end
        

        write_file(fin_pointer, 32'h0000_0000 );
        ok = $rewind(fin_pointer);
        read_and_compare_with_file(fin_pointer, 32'h0000_0000);
        
        $fclose(fin_pointer);
       
        $display("OK");
        $finish(0);
    end

endmodule