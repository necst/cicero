`timescale 1ns / 100ps

import AXI_package::*;

module AXI_top_tb_from_compiled();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    logic                               clk;
    logic                             rst; 
    logic [REG_WIDTH-1:0]  data_in_register;
    logic [REG_WIDTH-1:0]  address_register;
    //logic [REG_WIDTH-1:0]  start_pc_register;
    logic [REG_WIDTH-1:0]  start_cc_pointer_register;
    logic [REG_WIDTH-1:0]  end_cc_pointer_register;
    logic [REG_WIDTH-1:0]      cmd_register;
    logic [REG_WIDTH-1:0]   status_register;
    logic [REG_WIDTH-1:0]   data_o_register;

    AXI_top dut(
    .clk                        ( clk                       ),
    .rst                        ( rst                       ),
    .data_in_register           ( data_in_register          ),
    .address_register           ( address_register          ),
    //.start_pc_register        ( start_pc_register         ),
    .start_cc_pointer_register  ( start_cc_pointer_register ),
    .end_cc_pointer_register    ( end_cc_pointer_register   ),
    .cmd_register               ( cmd_register              ),
    .status_register            ( status_register           ),
    .data_o_register            ( data_o_register           )
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
        reg [REG_WIDTH-1:0] data;
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
            address += 1;
        end
        @(posedge clk);
        cmd_register  <= CMD_NOP;
    end
    endtask

    task write_string_file( int fp,
                     input  reg [REG_WIDTH-1:0] start_address ,
                     output reg [REG_WIDTH-1:0] address);
    begin
        int bytes_read;
        reg [7:0]           c [3:0];
        reg [REG_WIDTH-1:0]   data;
        reg                   flag;
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
            address += 1;
        end
        @(posedge clk);
        cmd_register  <= CMD_NOP;
        
    end
    endtask

    task read_and_compare_with_file( int fp,
                    input  reg [REG_WIDTH-1:0] start_address);
    begin
        reg [REG_WIDTH :0]  address;
        int c;
        reg [7:0]           itype0, idata0;
        reg [REG_WIDTH-1:0] data;
        reg                 flag;
        flag    = 1'b1;  
        address = {start_address, 1'b0};
        
        while (! $feof(fp)) 
        begin
            c = $fscanf(fp,"%d ; %d\n", itype0, idata0);
            $display("%d,%d",itype0, idata0);
            
            address_register  <= address[1+:REG_WIDTH];
            @(posedge clk);
            if(flag)
            begin
                
                cmd_register  <= CMD_READ;
                flag           = 1'b0;
                @(posedge clk);
            end
            
           
            @(posedge clk);
            if ( data_o_register[(address % 2)*16+:16]  !== { itype0, idata0})
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
        reg [REG_WIDTH:0] address;
        int bytes_read;
        reg [7:0]           c [1:0];
        reg [REG_WIDTH-1:0]   data;
        reg                 flag;
        flag    = 1'b1;  
        address = {start_address, 1'b0};
        
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
            
            address_register  <= address[1+:REG_WIDTH];
            @(posedge clk);
            if(flag)
            begin
                
                cmd_register  <= CMD_READ;
                flag           = 1'b0;
                @(posedge clk);
            end
            
           
            @(posedge clk);
            if ( data_o_register[(address % 2)*16+:16]  !== { c[1], c[0] })
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
                input reg [REG_WIDTH-1:0] start_string_address, 
                input reg [REG_WIDTH-1:0] end_string_address 
    );
    begin
        //@(posedge clk);
        //start_pc_register         <= start_code_address;
        @(posedge clk);
        start_cc_pointer_register <= start_string_address;
        @(posedge clk);
        end_cc_pointer_register   <= end_string_address;
        @(posedge clk);
        cmd_register              <= CMD_START;
        
        repeat(2)
            @(posedge clk);
        
        if( status_register !== STATUS_RUNNING )
        begin
            $display("status_register not running");
            $stop;
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

    task get_cc_elapsed(output logic[REG_WIDTH-1:0] cc);
    begin
        cmd_register              <= CMD_READ_ELAPSED_CLOCK;
        @(posedge clk);
        cc                        = data_o_register;
        @(posedge clk);
        cmd_register              <= CMD_NOP;
    end
    endtask

    localparam BB_N = 16;
    int  bb_cc_active [BB_N-1:0] ;

    task display_utilization(input logic [REG_WIDTH-1:0] cc_taken);
    begin
        int i;
        real u;
        $write("BB utilization ");
        for (i = 0 ; i< BB_N ; i+=1) 
        begin
            u = $itor(bb_cc_active[i])/$itor(cc_taken);
            $write("\t %f",u);
        end
        $write("\n");
    end
    endtask
    localparam UTILIZATON_ENABLED = 1'b0;

    genvar i;
    generate

        if(UTILIZATON_ENABLED)
        begin
            for(i = 0; i<BB_N; i+=1)begin
                always @( posedge clk)
                begin
                   
                    if (rst)
                    begin
                            bb_cc_active[i] <= 32'd0;
                    end
                    else if(dut.g1.a_regex_coprocessor.bbs_go == 1'b0)
                    begin
                            if(i==0)
                            begin
                                int j, tot;
                                real u;
                                tot=0;
                                for (j = 0 ; j< BB_N ; j+=1) 
                                begin
                                    tot += (bb_cc_active[j]);
                                end
                                if(tot !== 0)begin
                                    $write("BB utilization this iteration");
                                    for (j = 0 ; j< BB_N ; j+=1) 
                                    begin
                                        u = $itor(bb_cc_active[j])/$itor(tot);
                                        $write("\t %f",u);
                                    end
                                    $write("\n");
                                    bb_cc_active[i] <= 32'd0;
                                end
                                
                            end
                            
                    end
                    else
                    begin
                        if(BB_N > 1)
                        begin
                            
                            if( dut.g1.a_regex_coprocessor.g[i].abb.g.aregex_cpu.running)
                            begin
                                bb_cc_active[i] <= bb_cc_active[i]+1;
                            end
                        end
                        //else
                        //begin
                        //    if( dut.g1.a_regex_coprocessor.g.abb.g.aregex_cpu.running)
                        //    begin
                        //        bb_cc_active[i] <= bb_cc_active[i]+1;
                        //    end
                        //end
                    end
                    
                end
            end
        end
    endgenerate 
    /*always @( posedge clk)
    begin
        int i;
        
        if (rst)
        begin
            for (i = 0 ; i< BB_N ; i+=1) begin
                bb_cc_active[i] <= 32'd0;
            end
        end
        else 
        begin
            if(BB_N > 1)
            begin
                //for 1bb
                //if( dut.g1.a_regex_coprocessor.g.abb.g.aregex_cpu.running)
                //begin
                //    bb_cc_active[0] <= bb_cc_active[0]+1;
                //end
                if( dut.g1.a_regex_coprocessor.g[0].abb.g.aregex_cpu.running)
                begin
                    bb_cc_active[0] <= bb_cc_active[0]+1;
                end
                if( dut.g1.a_regex_coprocessor.g[1].abb.g.aregex_cpu.running)
                begin
                    bb_cc_active[1] <= bb_cc_active[1]+1;
                end
                if( dut.g1.a_regex_coprocessor.g[2].abb.g.aregex_cpu.running)
                begin
                    bb_cc_active[2] <= bb_cc_active[2]+1;
                end
                if( dut.g1.a_regex_coprocessor.g[3].abb.g.aregex_cpu.running)
                begin
                    bb_cc_active[3] <= bb_cc_active[3]+1;
                end
            end
            //else
            //begin
            //    if( dut.g1.a_regex_coprocessor.g.abb.g.aregex_cpu.running)
            //    begin
            //        bb_cc_active[i] <= bb_cc_active[i]+1;
            //    end
            //end
        end
        
    end*/

    initial
    begin
        int fp_code , fp_string;
        int ok;
        reg [REG_WIDTH-1:0] start_code  ,   end_code;
        reg [REG_WIDTH-1:0] start_string,   end_string;
        reg [REG_WIDTH-1:0] cc_taken;
        reg                 res;

        clk          = 1'b0;
        rst       <= 1'b0;
        cmd_register<= CMD_NOP;

        $display("Starting test for accepting");
        @(posedge clk);
        rst       <= 1'b1;
        @(posedge clk);
        rst       <= 1'b0;
        repeat(30)
            @(posedge clk);
        
        //1.write code
        fp_code= $fopen("C:\\Users\\danie\\Documents\\GitHub\\regex_coprocessor_safe\\scripts\\sim\\protomata_1.out","r");
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
        fp_string= $fopen("C:\\Users\\danie\\Documents\\GitHub\\regex_coprocessor_safe\\scripts\\sim\\protomata_1.csv","r");
        if (fp_string==0)
        begin
            $display("Could not open file '%s' for reading","string_ok.csv");
            $stop;     
        end
        
        //when writing 32bits in a bram that support 16bit reading, address has to be aligned at 2 bytes.
        start_string = end_code;
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

        repeat(10)
            @(posedge clk);
        start_string = start_string << 2;
        start(/*start_code,*/ start_string, end_string<<2);
        
        wait_result(res);
        get_cc_elapsed(cc_taken);
        $display("cc taken: %d", cc_taken);
        display_utilization(cc_taken);
        if( res == 1)
        begin
            $display("string accepted");
        end
        else
        begin
            $display(" string rejected");

        end 

        $finish(0);
    end

    

endmodule