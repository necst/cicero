`timescale 1ns / 10ps

import AXI_package::*;

module AXI_top_tb_from_file();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    logic                               clk;
    logic                             reset; 
    logic [REG_WIDTH-1:0]  data_in_register;
    logic [REG_WIDTH-1:0]  address_register;
    //logic [REG_WIDTH-1:0]  start_pc_register;
    logic [REG_WIDTH-1:0]  start_cc_pointer_register;
    logic [REG_WIDTH-1:0]      cmd_register;
    logic [REG_WIDTH-1:0]   status_register;
    logic [REG_WIDTH-1:0]   data_o_register;

    AXI_top dut(
    .clk(                           clk),
    .reset(                        reset),
    .data_in_register( data_in_register ),
    .address_register( address_register ),
    //.start_pc_register( start_pc_register),
    .start_cc_pointer_register(start_cc_pointer_register),
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
                     input  reg [REG_WIDTH-1:0] start_address ,
                     output reg [REG_WIDTH-1:0] address);
    begin
        int c;
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

    task write_string_file( int fp,
                     input  reg [REG_WIDTH-1:0] start_address ,
                     output reg [REG_WIDTH-1:0] address);
    begin
        reg [REG_WIDTH-1:0] address;
        int bytes_read;
        reg [7:0]           c [3:0];
        reg [REG_WIDTH:0]   data;
        reg                 flag;
        flag    = 1'b1;  
        address = start_address;
        
        while (! $feof(fp)) 
        begin
            for(int i = 0; i < 4 ; i++)
            begin
                if( ! $feof(fp))
                begin
                    bytes_read = $fscanf(fp,"%d\n", c[i]);
                   
                    if(bytes_read == -1)begin
                        c[i] = {8{1'b0}};
                    end
                end
                else
                begin
                    c[i]       = {8{1'b0}};
                end
            end
                
            $display("%d,%d,%d,%d",c[3], c[2], c[1], c[0]);
            data                = {c[3], c[2], c[1], c[0]};
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
                    input  reg [REG_WIDTH-1:0] start_address);
    begin
        reg [REG_WIDTH-1:0] address;
        int c;
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

     task read_and_compare_with_string_file( int fp,
                    input  reg [REG_WIDTH-1:0] start_address);
    begin
        reg [REG_WIDTH-1:0] address;
        int bytes_read;
        reg [7:0]           c [1:0];
        reg [REG_WIDTH:0]   data;
        reg                 flag;
        flag    = 1'b1;  
        address = start_address;
        
        while (! $feof(fp)) 
        begin
            for(int i = 0; i < 2 ; i++)
            begin
                if( ! $feof(fp))
                    bytes_read = $fscanf(fp,"%d\n", c[i]);
                else
                    c[i]       = {8{1'b0}};
            end
                
            $display("%d,%d", c[1], c[0]);
            data          = { c[1], c[0]};
            
            address_register  <= address;
            @(posedge clk);
            if(flag)
            begin
                
                cmd_register  <= CMD_READ;
                flag           = 1'b0;
                @(posedge clk);
            end
            
           
            @(posedge clk);
            if ( data_o_register  !== { {16{1'b0}}, c[1], c[0] })
            begin
                $display("%d: obtained %d, %d !==  expected %d %d",address, data_o_register[15:8], data_o_register[7:0]  , c[1], c[0]);
                $stop;
            end

            address += 1;
        end
        @(posedge clk);
        cmd_register  <= CMD_NOP;
    end
    endtask

    task start( //input reg [REG_WIDTH-1:0] start_code_address, 
                input reg [REG_WIDTH-1:0] start_string_address 
    );
    begin
        //@(posedge clk);
        //start_pc_register         <= start_code_address;
        @(posedge clk);
        start_cc_pointer_register <= start_string_address;
        @(posedge clk);
        cmd_register              <= CMD_START;
        while( status_register !== STATUS_RUNNING )
        begin
            @(posedge clk);
        end
        cmd_register              <= CMD_NOP;
    end
    endtask;

    task wait_result(output logic accept);
    begin
        while( status_register == STATUS_RUNNING)
        begin
            @(posedge clk);
        end
        if( status_register !== STATUS_ACCEPTED && status_register !== STATUS_REJECTED)
        begin
            $display("KO: neither rejected or accepted");
            $stop();
        end
        if( status_register == STATUS_ACCEPTED) accept = 1'b1;
        else                                    accept = 1'b0;
    end
    endtask

    initial
    begin
        int fp_code , fp_string;
        int ok;
        reg [REG_WIDTH-1:0] start_code  ,   end_code;
        reg [REG_WIDTH-1:0] start_string,   end_string;
        reg                 res;

        clk          = 1'b0;
        reset       <= 1'b0;
        cmd_register<= CMD_NOP;
        $display("Starting test for accepting");
        @(posedge clk);
        reset       <= 1'b1;
        @(posedge clk);
        reset       <= 1'b0;
        repeat(30)
            @(posedge clk);
        
        //1.write code
        fp_code= $fopen("C:\\Users\\danie\\Desktop\\regex_coprocessor\\sim\\a(bORc)start.csv","r");
        if (fp_code==0)
        begin
            $display("Could not open file '%s' for reading","code.csv");
            $stop;     
        end
        start_code = 32'h0000_0000;
        //write string
        $display("writing code from %h",start_code);
        write_file(fp_code, start_code , end_code );
        
        //2, write string
        fp_string= $fopen("C:\\Users\\danie\\Desktop\\regex_coprocessor\\sim\\string_ok.csv","r");
        if (fp_string==0)
        begin
            $display("Could not open file '%s' for reading","string_ok.csv");
            $stop;     
        end
        
        //when writing 32bits in a bram that support 16bit reading, address has to be aligned at 2 bytes.
        if (end_code %2 == 0)  start_string = end_code + 2;
        else                   start_string = end_code + 1;
        //write string
        $display("writing string from %h",start_string);
        write_string_file(fp_string, start_string, end_string  );
        $display("wrote string and code");
        $display("verify phase");
        ok = $rewind(fp_code);
        ok = $rewind(fp_string);
        read_and_compare_with_file(fp_code, start_code);
        $display("code : OK");
        read_and_compare_with_string_file(fp_string, start_string);
        $display("string : OK");
        $fclose(fp_code);
        $fclose(fp_string);

        start(/*start_code,*/ start_string);
        wait_result(res);
        if( res == 1)
        begin
            $display("OK: string accepted");
        end
        else
        begin
            $display("NOK: string rejected");
        end 

        //test with a different string
        $display("Starting test for rejecting");
        @(posedge clk);
        reset       <= 1'b1;
        @(posedge clk);
        reset       <= 1'b0;
        repeat(30)
            @(posedge clk);

        //1.write code
        fp_code= $fopen("C:\\Users\\danie\\Desktop\\regex_coprocessor\\sim\\a(bORc)start.csv","r");
        if (fp_code==0)
        begin
            $display("Could not open file '%s' for reading","code.csv");
            $stop;     
        end
        start_code = 32'h0000_0000;
        //write string
        $display("writing code from %h",start_code);
        write_file(fp_code, start_code , end_code );
        
        //2, write string
        fp_string= $fopen("C:\\Users\\danie\\Desktop\\regex_coprocessor\\sim\\string_nok.csv","r");
        if (fp_string==0)
        begin
            $display("Could not open file '%s' for reading","string_nok.csv");
            $stop;     
        end
        
        //when writing 32bits in a bram that support 16bit reading, address has to be aligned at 2 bytes.
        if (end_code %2 == 0)  start_string = end_code + 2;
        else                   start_string = end_code + 1;
        //write string
        $display("writing string from %h",start_string);
        write_string_file(fp_string, start_string, end_string  );
        $display("wrote string and code");
        $display("verify phase");
        ok = $rewind(fp_code);
        ok = $rewind(fp_string);
        read_and_compare_with_file(fp_code, start_code);
        $display("code : OK");
        read_and_compare_with_string_file(fp_string, start_string);
        $display("string : OK");
        $fclose(fp_code);
        $fclose(fp_string);

        start(/*start_code,*/ start_string);
        wait_result(res);
        if( res == 1)
        begin
            $display("NOK: string accepted");
        end
        else
        begin
            $display("OK: string rejected");
        end
        
        $finish(0);
    end

endmodule