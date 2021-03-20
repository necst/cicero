//`include "instruction_package.sv"
import instruction_package::*;
//A simple processor of reg2_instructions
// It uses two ready-valid interface to receive and output the instruction pc which identifies respectively
// the instruction that will be elaborated and a new instruction(continuation) that has to be elaborated.
module regex_cpu_pipelined #(
    parameter  PC_WIDTH          = 9 ,
    parameter  CC_ID_BITS        = 2 ,            
    parameter  CHARACTER_WIDTH   = 8 ,
    parameter  MEMORY_WIDTH      = 16,
    parameter  MEMORY_ADDR_WIDTH = 11,
    parameter  FIFO_WIDTH_POWER_OF_2= 2    
)(
    input   wire                            clk,
    input   wire                            rst, 
    input   logic[CHARACTER_WIDTH*(2**CC_ID_BITS)-1:0]      current_characters,
    input   logic[(2**CC_ID_BITS)-1:0                ]      end_of_string,

    input   logic                           input_pc_valid,
    input   logic[CC_ID_BITS-1:0]           input_cc_id, 
    input   logic[PC_WIDTH-1:0]             input_pc, 
    output  logic                           input_pc_ready,

    input   logic                           memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]    memory_data,
    output  logic                           memory_valid,

 
    output  logic                           output_pc_valid,
    output  logic[CC_ID_BITS-1:0]           output_cc_id,
    output  logic[PC_WIDTH-1:0]             output_pc,
    input   logic                           output_pc_ready,

    output  logic[(2**CC_ID_BITS)-1:0]      elaborating_chars,
    output  logic                           accepts,
    output  logic                           running
);
    localparam C_WINDOW_SIZE_IN_CHAR = 2**CC_ID_BITS ;
    //stage status
    logic [PC_WIDTH-1:0]                                         FETCH_REC_Pc            ,EXE1_Pc          , EXE2_Pc            ;
	logic [CC_ID_BITS-1:0]										 FETCH_REC_Cc_id		 ,EXE1_Cc_id	   , EXE2_Cc_id			;
    logic [INSTRUCTION_WIDTH-1:0]                                FETCH_REC_Instr         ,EXE1_Instr       , EXE2_Instr         ;
    logic                                                        FETCH_REC_Instr_valid   ,EXE1_Instr_valid , EXE2_Instr_valid   ;
    logic                                                        FETCH_REC_has_to_save                                          ;
    //stage outputs
    logic                           FETCH_SEND_waits                                     , EXE1_waits             , EXE2_waits  ;                                           
    logic [INSTRUCTION_WIDTH-1:0]   FETCH_REC_Instr_next;         
    logic                           FETCH_SEND_not_stall      , FETCH_REC_not_stall      , EXE1_not_stall         , EXE2_not_stall  ;
    logic                                                                                  EXE1_accepts           , EXE2_accepts;
    logic                                                                                  EXE1_completes_instr                 ;    
    
    //for cpu exe_. stages
    logic                             EXE1_output_pc_not_ready                      , EXE2_output_pc_not_ready             	; 
    logic                             EXE1_output_pc_ready                          , EXE2_output_pc_ready                 	;
    logic [CC_ID_BITS-1:0]			  EXE1_output_cc_id				            	, EXE2_output_cc_id		           		;
    logic [PC_WIDTH-1:0]              EXE1_output_pc                                , EXE2_output_pc                       	;
    logic [PC_WIDTH+CC_ID_BITS-1:0]   EXE1_output_pc_and_cc_id                      , EXE2_output_pc_and_cc_id             	;
    logic                             EXE1_output_pc_valid                          , EXE2_output_pc_valid                 	;
    // output arbiter  
    logic [PC_WIDTH+CC_ID_BITS-1:0]   output_pc_and_cc_id;

     always_comb
    begin //ASSERTION CONCERNING INSTRUCTION SIZE WIDTH
        assert (INSTRUCTION_DATA_WIDTH >= PC_WIDTH)         else $error("Instruction width not compatible with PC width!");
        assert (INSTRUCTION_DATA_WIDTH >= CHARACTER_WIDTH)  else $error("Instruction width not compatible with character width!");
    end

    always_ff @(posedge clk ) 
    begin 
        if(rst)
        begin
            FETCH_REC_has_to_save <= 1'b0;

            FETCH_REC_Instr_valid <= 1'b0;
                 EXE1_Instr_valid <= 1'b0;
                 EXE2_Instr_valid <= 1'b0; 
            FETCH_REC_Pc          <= {   (PC_WIDTH){1'b0}};
                 EXE1_Pc          <= {   (PC_WIDTH){1'b0}};                
                 EXE2_Pc          <= {   (PC_WIDTH){1'b0}}; 
            FETCH_REC_Instr       <= {END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH) {1'b0}}};
                 EXE1_Instr       <= {END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH) {1'b0}}};          
                 EXE2_Instr       <= {END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH) {1'b0}}}; 
			FETCH_REC_Cc_id       <= {(CC_ID_BITS){1'b0}};
                 EXE1_Cc_id       <= {(CC_ID_BITS){1'b0}};          
                 EXE2_Cc_id       <= {(CC_ID_BITS){1'b0}};                             
            
        end
        else
        begin
            
            if(EXE2_not_stall  )
            begin//for sure instruction does not require any further computation

                EXE2_Instr_valid    <= 1'b0;
            end
            else
            begin //if stage stalled mantain state
                EXE2_Pc             <= EXE2_Pc		   ;
                EXE2_Instr          <= EXE2_Instr	   ;
                EXE2_Instr_valid    <= EXE2_Instr_valid;
				EXE2_Cc_id			<= EXE2_Cc_id	   ;
            end


            
            if(EXE1_not_stall )  
            begin
                //cancel status of this stage
                //in case it will be overwritten by following stages
                
                EXE1_Instr_valid    <= 1'b0;
                if(~EXE1_completes_instr)
                begin
                    //otherwise not having stalled ensures that next stage is free we can move status
                    EXE2_Pc         <= EXE1_Pc         ;
                    EXE2_Instr      <= EXE1_Instr      ;
                    EXE2_Instr_valid<= EXE1_Instr_valid;
					EXE2_Cc_id		<= EXE1_Cc_id      ;
                end
            end
            else
            begin //if stage stalled mantain state
                EXE1_Pc             <= EXE1_Pc			;
                EXE1_Instr          <= EXE1_Instr		;    
                EXE1_Instr_valid    <= EXE1_Instr_valid ;
				EXE1_Cc_id			<= EXE1_Cc_id		;
            end
            
            
            FETCH_REC_has_to_save <= 1'b0;
            if(FETCH_REC_not_stall )
            begin
                FETCH_REC_Instr_valid<= 1'b0;
                    
                //otherwise if next stage is free we can move status to the next instruction
                EXE1_Pc             <= FETCH_REC_Pc         ;
                EXE1_Instr          <= FETCH_REC_Instr_next ;
                EXE1_Instr_valid    <= FETCH_REC_Instr_valid;
				EXE1_Cc_id			<= FETCH_REC_Cc_id		;
            end
            else
            begin
                FETCH_REC_Pc         	<= FETCH_REC_Pc;
                FETCH_REC_Instr      	<= FETCH_REC_Instr_next;    
                FETCH_REC_Instr_valid	<= FETCH_REC_Instr_valid;
				FETCH_REC_Cc_id			<= FETCH_REC_Cc_id;
            end

            if(FETCH_SEND_not_stall )
            begin //FETCH stall accounts for non ready FETCH_REC_stage
                FETCH_REC_Pc                 <= input_pc    ;
				FETCH_REC_Cc_id				 <= input_cc_id ;
                FETCH_REC_Instr_valid        <= 1'b1        ;
                FETCH_REC_has_to_save        <= 1'b1        ;
            end
            
        end
    end
    
    assign FETCH_SEND_not_stall  = (                           ~FETCH_SEND_waits  &&  (~FETCH_REC_Instr_valid || FETCH_REC_not_stall)) ;
    assign  FETCH_REC_not_stall  = ( FETCH_REC_Instr_valid &&                         (     ~EXE1_Instr_valid ||      EXE1_not_stall)) ;
    assign       EXE1_not_stall  = (      EXE1_Instr_valid &&        ~EXE1_waits  && ((     ~EXE2_Instr_valid ||      EXE2_not_stall) || EXE1_completes_instr)) ;
    assign       EXE2_not_stall  = (      EXE2_Instr_valid &&        ~EXE2_waits                                                     ) ;
    

    //fetch_send stage
    always_comb begin
 
        FETCH_SEND_waits          = 1'b1   ;
        input_pc_ready            = 1'b0   ;
        memory_addr               = { { (MEMORY_ADDR_WIDTH-PC_WIDTH) {1'b0} } , input_pc };
        memory_valid              = 1'B0   ;
        if(input_pc_valid && (~FETCH_REC_Instr_valid || FETCH_REC_not_stall) )
        begin
            memory_valid              = 1'b1   ;
            
            if(memory_ready == 1'b1)
            begin
                input_pc_ready    = 1'b1;
                FETCH_SEND_waits  = 1'b0;
            end
            
        end
        
    end

    //fetch_rec stage
    always_comb begin 
       
        if (FETCH_REC_has_to_save && FETCH_REC_Instr_valid) FETCH_REC_Instr_next = memory_data[0+:INSTRUCTION_WIDTH];
        else                                                FETCH_REC_Instr_next = FETCH_REC_Instr;

    end

    //exe1  stage
    always_comb begin
        EXE1_accepts                          = 1'b0;
        EXE1_output_pc_valid                  = 1'b0;
        EXE1_output_pc                        = EXE1_Pc + 1;
        EXE1_output_cc_id				  	  = EXE1_Cc_id ;
        //not requires to go through other stages
        EXE1_completes_instr                  = 1'b1;
        EXE1_waits                            = 1'b0;
        
        //implements 
        if( EXE1_Instr_valid )
        begin
            case(EXE1_Instr[INSTRUCTION_TYPE_START:INSTRUCTION_TYPE_END])
                ACCEPT:
                begin
                    if( end_of_string[EXE1_Cc_id] ) begin
                        EXE1_accepts                        = 1'b1;
                        EXE1_completes_instr                = 1'b1;
                    end
                end
                ACCEPT_PARTIAL:
                begin
                    EXE1_accepts         					= 1'b1;
                    EXE1_completes_instr                 	= 1'b1;
                end
                SPLIT:
                begin
                    
                    EXE1_output_pc_valid                    = 1'b1;
                    EXE1_output_pc                          = EXE1_Pc + 1;
					EXE1_output_cc_id					  	= EXE1_Cc_id ;
                    EXE1_completes_instr                    = 1'b0;
                    if(~EXE1_output_pc_ready)
                    begin
                        EXE1_waits                          = 1'b1;
                    end
                end
                MATCH:
                begin
                    if( current_characters[EXE1_Cc_id*CHARACTER_WIDTH+:CHARACTER_WIDTH] == EXE1_Instr[INSTRUCTION_DATA_END+:CHARACTER_WIDTH] ) begin
                        EXE1_output_pc_valid                 = 1'b1;
                        EXE1_output_pc                       = EXE1_Pc + 1;
						EXE1_output_cc_id 					 = EXE1_Cc_id + 1;
                        if(~EXE1_output_pc_ready)
                        begin
                            EXE1_waits                       = 1'b1;
                        end     
                    end
                end
                NOT_MATCH:
                begin
                    if( current_characters[EXE1_Cc_id*CHARACTER_WIDTH+:CHARACTER_WIDTH] != EXE1_Instr[INSTRUCTION_DATA_END+:CHARACTER_WIDTH] ) begin
                        EXE1_output_pc_valid                 = 1'b1;
                        EXE1_output_pc                       = EXE1_Pc + 1;
						EXE1_output_cc_id 					 = EXE1_Cc_id;
                        if(~EXE1_output_pc_ready)
                        begin
                            EXE1_waits                       = 1'b1;
                        end     
                    end
                end
                MATCH_ANY:
                begin
                   
                    EXE1_output_pc_valid                 = 1'b1;
                    EXE1_output_pc                       = EXE1_Pc + 1;
                    EXE1_output_cc_id 					 = EXE1_Cc_id + 1;
                    if(~EXE1_output_pc_ready)
                    begin
                        EXE1_waits                       = 1'b1;
                    end     
                    
                end
                JMP:
                begin
                    EXE1_output_pc_valid                    = 1'b1;
                    EXE1_output_pc                          = EXE1_Instr[INSTRUCTION_DATA_END+:PC_WIDTH];
                    EXE1_output_cc_id				     	= EXE1_Cc_id;
                    if( ~EXE1_output_pc_ready)
                    begin
                        EXE1_waits                          = 1'b1;
                    end   
                end
                END_WITHOUT_ACCEPTING:
                begin
                    
                end
                
            endcase
        end

    end

    //exe2  stage
    always_comb begin
        EXE2_accepts                          = 1'b0;
        EXE2_output_pc_valid                  = 1'b0;
        EXE2_output_pc                        = EXE2_Pc + 1;
        EXE2_output_cc_id					  = EXE2_Cc_id;
        //not requires to go through other stages
        EXE2_waits                            = 1'b0;
        if( EXE2_Instr_valid ) 
        begin
            case(EXE2_Instr[INSTRUCTION_TYPE_START:INSTRUCTION_TYPE_END])
                SPLIT:
                begin
                    EXE2_output_pc_valid                  = 1'b1;
                    EXE2_output_pc                        = EXE2_Instr[INSTRUCTION_DATA_END+:PC_WIDTH];
                    EXE2_output_cc_id					  = EXE2_Cc_id;
                    if(~EXE2_output_pc_ready)
                    begin
                        EXE2_waits                        = 1'b1;
                    end
                end
            endcase
        end
    end

	//elaborating chars computing
	always_comb begin
		elaborating_chars 					= {(C_WINDOW_SIZE_IN_CHAR){1'b0}};
		if (FETCH_REC_Instr_valid )
		begin
			elaborating_chars[FETCH_REC_Cc_id] 	= 1'b1;
		end
		if (EXE1_Instr_valid 	  )
		begin
			elaborating_chars[EXE1_Cc_id]		= 1'b1;
		end

		if (EXE2_Instr_valid	  )
		begin
			elaborating_chars[EXE2_Cc_id] 		= 1'b1;
		end
	end


    assign EXE1_output_pc_and_cc_id   = {EXE1_output_pc, EXE1_output_cc_id				 };
    assign EXE2_output_pc_and_cc_id   = {EXE2_output_pc, EXE2_output_cc_id				 };
    

    //round robin arbiter for EXE1_output
    arbiter_2_rr #(
        .DWIDTH(PC_WIDTH+CC_ID_BITS                           )
    ) arbiter_output_pc_port (
        .clk       ( clk                                      ),
        .rst       ( rst                                      ),
        .in_0_ready( EXE1_output_pc_ready                     ),
        .in_0_data ( EXE1_output_pc_and_cc_id                 ),
        .in_0_valid( EXE1_output_pc_valid                     ),
        .in_1_ready( EXE2_output_pc_ready                     ),
        .in_1_data ( EXE2_output_pc_and_cc_id                 ),
        .in_1_valid( EXE2_output_pc_valid                     ),
        .out_ready ( output_pc_ready                          ),
        .out_data  ( output_pc_and_cc_id                      ),
        .out_valid ( output_pc_valid                          )
    );

    assign output_pc                        = output_pc_and_cc_id[CC_ID_BITS +:PC_WIDTH];
    assign output_cc_id				        = output_pc_and_cc_id[CC_ID_BITS-1:0];
    assign accepts =                          EXE1_accepts      || EXE2_accepts ;
    assign running = FETCH_REC_Instr_valid || EXE1_Instr_valid  || EXE2_Instr_valid ;

    
endmodule 