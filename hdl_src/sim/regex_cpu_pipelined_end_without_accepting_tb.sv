`timescale 1ns / 10ps

import instruction_package::*;

module regex_cpu_pipelined_end_without_accepting();
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



     initial begin
        reg [PC_WIDTH-1:0               ] a_pc;
        reg [PC_WIDTH-1:0               ] max_pc, min_pc;
        reg [CHARACTER_WIDTH-1:0        ] a_character;
        reg [CHARACTER_WIDTH-1:0        ] max_character;
        reg [INSTRUCTION_DATA_WIDTH-1:0 ] a_random_payload;
        reg [INSTRUCTION_DATA_WIDTH-1:0 ] max_random_payload;
        min_pc          = 'd220;
        max_pc          = 'd294;
        max_character   = 'd64;
        max_random_payload = 'd11;

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

        for ( a_pc=min_pc ; a_pc < max_pc ; a_pc+=1) begin
            for ( a_character=0 ; a_character<max_character ; a_character+=1) begin
                for ( a_random_payload=0 ; a_random_payload < max_random_payload; a_random_payload+=1 ) begin
                    for (int a_cc_id=0; a_cc_id<2**CC_ID_BITS; a_cc_id+=1) 
                    begin
						
                        current_characters <= {(2**CC_ID_BITS){a_character}};
                        end_of_string      <= {(2**CC_ID_BITS){1'b0}};

                        load_pc_and_supply_memory(a_pc,{END_WITHOUT_ACCEPTING, a_random_payload }, a_cc_id);
                        @(posedge clk);
                        while(running)
                        begin
                            @(posedge clk);
                            if( output_pc_valid == 1'b1)
                                begin
                                    $display("basic block didn't need to produce pc!");
                                    $stop();
                                end
                        end

					end
                end
            end
        end

        $display("OK");
        $finish();

    end

endmodule