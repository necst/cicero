`timescale 1ns / 10ps

import instruction_package::*;

module regex_cpu_pipelined_split_tb();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    parameter  PC_WIDTH          = 9;
	parameter  CC_ID_BITS        = 2;
    parameter  CHARACTER_WIDTH   = 8;
    parameter  MEMORY_WIDTH      = 16;
    parameter  MEMORY_ADDR_WIDTH = 11;

    logic                             clk                               ;
    logic                             rst                               ; 
    logic[(2**CC_ID_BITS)*CHARACTER_WIDTH-1:0]        current_characters;
    logic[(2**CC_ID_BITS)-1:0]                        end_of_string     ;
    logic                             input_pc_valid                    ;
	logic[CC_ID_BITS-1:0]             input_cc_id                       ;
    logic[PC_WIDTH-1:0]               input_pc                          ;
    logic                             input_pc_ready                    ;
    logic                             memory_ready                      ;
    logic[MEMORY_ADDR_WIDTH-1:0]      memory_addr                       ;
    logic[MEMORY_WIDTH-1     :0]      memory_data                       ;
    logic                             memory_valid                      ;
	logic[CC_ID_BITS-1:0]             output_cc_id                      ;
    logic                             output_pc_valid                   ;
    logic[PC_WIDTH-1:0]               output_pc                         ;
    logic                             output_pc_ready                   ;
    logic                             accepts                           ;
	logic 							  running;
	logic[(2**CC_ID_BITS)-1:0]        elaborating_chars     ;

    regex_cpu_pipelined #(
        .PC_WIDTH             	(PC_WIDTH             	),
        .CHARACTER_WIDTH      	(CHARACTER_WIDTH      	),
        .MEMORY_WIDTH         	(MEMORY_WIDTH         	),
        .MEMORY_ADDR_WIDTH    	(MEMORY_ADDR_WIDTH    	),
        .FIFO_WIDTH_POWER_OF_2	(2                    	),
		.CC_ID_BITS        	  	(CC_ID_BITS        		)   
    )a_cpu_under_test(
        .clk           	                    ( clk                               ),
        .rst                             	( rst                             	), 
        .current_characters                 ( current_characters                ),
        .end_of_string                      ( end_of_string                     ),
        .input_pc_valid                    	( input_pc_valid                    ),
		.input_cc_id                     	( input_cc_id                       ),
        .input_pc                          	( input_pc                          ), 
        .input_pc_ready                    	( input_pc_ready                    ),
        .memory_ready                      	( memory_ready                      ),
        .memory_addr                       	( memory_addr                       ),
        .memory_data                       	( memory_data                       ),
        .memory_valid                      	( memory_valid                      ),
        .output_pc_valid                   	( output_pc_valid                   ),
        .output_cc_id                   	( output_cc_id                      ),
        .output_pc                         	( output_pc                         ),
        .output_pc_ready                   	( output_pc_ready                   ),
        .accepts                           	( accepts                           ),
        .elaborating_chars                  ( elaborating_chars                 ),
		.running							( running)
	);

    // clock generator  
    always begin
        #CLOCK_SEMI_PERIOD clk = ~ clk;
    end

   task load_pc_and_supply_memory(  input reg[PC_WIDTH-1    :0] pc,
                                    input reg[MEMORY_WIDTH-1:0] value,
									input reg[CC_ID_BITS-1  :0] a_cc_id
                                    );
    begin
        
        input_pc_valid <= 1'b1;
        input_pc       <= pc;
		input_cc_id	   <= a_cc_id;
        @(posedge clk);
        memory_ready   <= 1'b1;
        @(posedge clk);
        input_pc_valid <= 1'b0;
        if(memory_valid !== 1'b1)
        begin
            $display("regex_cpu does not wait memory");
            $stop();
        end
        if(memory_addr !== pc)
        begin
            $display("regex_cpu address mismatch %h != %h", memory_addr, pc);
            $stop();
        end
        memory_data  <= value;
        memory_ready <= 1'b0;
        @(posedge clk);
        if(memory_valid == 1'b1)
        begin
            $display("regex_cpu want something frem memory even if it had just fetched!");
            $stop();
        end
        if(elaborating_chars[a_cc_id] !== 1'b1)
        begin
            $display("regex_cpu seems not having received instruction");
            $stop();
        end
        
    end
    endtask

      task wait_pc_output( input reg[MEMORY_ADDR_WIDTH-1:0] expected_pc,
                         input reg[CC_ID_BITS-1:0]        expected_cc_id,
                         input reg                        wait_immediately_after );
    begin

        while(output_pc_valid == 1'b0 )
            @(posedge clk);
            if(~running)
            begin
                $display("regex_cpu stopped running without producing any pc!");
                $stop();
            end
        output_pc_ready    <= 1'b1;
        @(posedge clk);
        

        if( output_pc_valid !== 1'b1)
        begin
            $display("regex_cpu didn't need to produce pc!");
            $stop();
        end
        if(output_pc !== expected_pc)
        begin
            $display("regex_cpu output pc %h != %h", output_pc, expected_pc);
            $stop();
        end
        if(output_cc_id !== expected_cc_id)
        begin
            $display("regex_cpu output cc id %h != %h", output_cc_id, expected_cc_id);
            $stop();
        end
        @(posedge clk);
        output_pc_ready    <=1'b0;
        @(posedge clk);
        if(output_pc_valid == 1'b1 && wait_immediately_after == 1'b0 && ~running)
        begin
            $display("regex_cpu outputted a pc immediately after having outputted one!");
            $stop();
        end
        
        
    end
    endtask

    task wait_2pc_unordered_output(
                        input reg [MEMORY_ADDR_WIDTH-1:0]expected0_pc,
                        input reg [CC_ID_BITS-1:0]       expected0_cc_id,
                        input reg [MEMORY_ADDR_WIDTH-1:0]expected1_pc,
                        input reg [CC_ID_BITS-1:0]       expected1_cc_id
                        );
    begin
        logic zero_ok=1'b0;
        logic one_ok=1'b0;
        while(output_pc_valid == 1'b0 )
            @(posedge clk);
            if(~running)
            begin
                $display("regex_cpu stopped running without producing any pc!");
                $stop();
            end
        repeat(2)
            begin
            output_pc_ready    <= 1'b1;
            @(posedge clk);

            if( output_pc_valid !== 1'b1)
            begin
                $display("regex_cpu didn't need to produce pc!");
                $stop();
            end
            if(output_pc == expected0_pc)
            begin 
                if(output_cc_id !== expected0_cc_id)
                begin
                    $display("regex_cpu is directed to current %h != %h", output_cc_id, expected0_cc_id);
                    $stop();
                end
                else
                begin
                    zero_ok=1'b1;
                end
            end
            else if(output_pc == expected1_pc)
            begin 
                if(output_cc_id !== expected1_cc_id)
                begin
                    $display("regex_cpu is directed to current %h != %h", output_cc_id, expected1_cc_id);
                    $stop();
                end
                else
                begin
                    zero_ok=1'b1;
                end
            end
            else
            begin
                $display("regex_cpu output pc %h not in [ %h, %h] ", output_pc, expected0_pc, expected1_pc);
                $stop();
            end
            output_pc_ready    <=1'b0;
            @(posedge clk);
        end
        @(posedge clk);
        if(running)
        begin
            $display("regex_cpu still has work to do!");
            $stop();
        end
        
        
    end
    endtask



    initial begin
        reg [PC_WIDTH-1:0] a_pc, another_pc;
        reg [PC_WIDTH-1:0] min_pc,max_pc, max_another_pc;
        min_pc          = 245;
        max_pc          = 270;
        max_another_pc  = 64; 
        
        input_pc_valid  = 1'b0;
        memory_ready    = 1'b0;
        output_pc_ready = 1'b0;
        clk             = 1'b0;
        rst          <= 1'b0;
        @(posedge clk);
        rst          <= 1'b1;
        @(posedge clk);
        rst          <= 1'b0;
        repeat(30) @(posedge clk);

        for ( a_pc = min_pc ; a_pc < max_pc ; a_pc+=1 ) begin
            for(another_pc = 0 ; another_pc < max_another_pc; another_pc+=1)begin
				for (int a_cc_id=0; a_cc_id<2**CC_ID_BITS; ++a_cc_id) begin
				
                end_of_string      <= {(2**CC_ID_BITS){1'b0}};
                current_characters <= {((2**CC_ID_BITS)*CHARACTER_WIDTH){1'b0}};
                
                load_pc_and_supply_memory(a_pc,{SPLIT,{(INSTRUCTION_DATA_WIDTH-PC_WIDTH){1'b0}},another_pc }, a_cc_id);
                wait_2pc_unordered_output(a_pc+8'h01, a_cc_id, another_pc, a_cc_id);
                $display("OK %h -> %h,%h", a_pc, a_pc+1, another_pc);
                
                repeat (10)
                    begin
                        @(posedge clk);
                        if( output_pc_valid == 1'b1)
                        begin
                            $display("regex_cpu didn't need to produce pc!");
                            $stop();
                        end
                        if( running == 1'b1)
                        begin
                            $display("regex_cpu still working");
                            $stop();
                        end
                    end

				end
            end
        end
        

        $display("OK");
        $finish();

    end

endmodule