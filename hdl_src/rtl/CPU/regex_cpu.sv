//`include "instruction_package.sv"
import instruction_package::*;
//A simple processor of reg2_instructions
// It uses two ready-valid interface to receive and output the instruction pc which identifies respectively
// the instruction that will be elaborated and a new instruction(continuation) that has to be elaborated.
module regex_cpu #(
    parameter  PC_WIDTH          = 9 ,
    parameter  CC_ID_BITS        = 2 ,            
    parameter  CHARACTER_WIDTH   = 8 ,
    parameter  MEMORY_WIDTH      = 16,
    parameter  MEMORY_ADDR_WIDTH = 11
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
    localparam BITS_STATES = 3;
    typedef enum logic [BITS_STATES-1 : 0] {  S_IDLE  , 
                                S_FETCH_SEND ,
                                S_FETCH_REC  ,
                                S_EXEC_1     ,
                                S_EXEC_2
                        } State;

    State                           curState  , nextState;
    logic [PC_WIDTH-1:0]            currPc    , nextPc;
    logic [INSTRUCTION_WIDTH-1:0]   currInstr , nextInstr;
    logic [CC_ID_BITS-1:0]          currCcId  , nextCcId;

    logic [PC_WIDTH-1:0]            output_pc_fromInstruction;
    logic [CC_ID_BITS-1:0]          output_cc_id_fromInstruction;
    logic                           output_pc_fromInstruction_valid;
    State                           nextState_fromInstruction;
    logic                           accepts_fromInstruction;

    always_comb
    begin //ASSERTION CONCERNING INSTRUCTION SIZE WIDTH
        assert (INSTRUCTION_DATA_WIDTH >= PC_WIDTH)         else $error("Instruction width not compatible with PC width!");
        assert (INSTRUCTION_DATA_WIDTH >= CHARACTER_WIDTH)  else $error("Instruction width not compatible with character width!");
    end

    always_ff @(posedge clk ) 
    begin 
        if(rst)
        begin
            curState <= S_IDLE;
            currPc   <= { (PC_WIDTH){1'b0} };
            currInstr<= {END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH) {1'b0}}};
            currCcId <= { (CC_ID_BITS){1'b0}};
        end
        else
        begin
            curState <= nextState;
            currPc   <= nextPc;
            currInstr<= nextInstr;
            currCcId <= nextCcId;
        end
    end
    
    
    always_comb begin //.*_fromInstruction
        accepts_fromInstruction                          = 1'b0;
        output_pc_fromInstruction_valid                  = 1'b0;
        output_pc_fromInstruction                        = currPc + 1;
        nextState_fromInstruction                        = S_IDLE;
        output_cc_id_fromInstruction                     = currCcId;

        case(currInstr[INSTRUCTION_TYPE_START:INSTRUCTION_TYPE_END])
            ACCEPT:
            begin
                if( end_of_string[currCcId] ) begin
                    accepts_fromInstruction                         = 1'b1;
                    nextState_fromInstruction                       = S_IDLE;
                end
            end
            ACCEPT_PARTIAL:
            begin
                accepts_fromInstruction                             = 1'b1;
                nextState_fromInstruction                           = S_IDLE;
            end
            SPLIT:
            begin
                if (curState == S_EXEC_1 ) 
                begin
                    output_pc_fromInstruction_valid                  = 1'b1;
                    output_pc_fromInstruction                        = currPc + 1;
                    output_cc_id_fromInstruction                     = currCcId;
                    nextState_fromInstruction                        = S_EXEC_2;
                end
                else if(curState == S_EXEC_2)
                begin
                    output_pc_fromInstruction_valid                  = 1'b1;
                    output_pc_fromInstruction                        = currInstr[INSTRUCTION_DATA_END+:PC_WIDTH];
                    output_cc_id_fromInstruction                     = currCcId;
                    nextState_fromInstruction                        = S_IDLE;
                end
            end
            MATCH:
            begin
                if( current_characters[currCcId*CHARACTER_WIDTH+:CHARACTER_WIDTH] == currInstr[INSTRUCTION_DATA_END+:CHARACTER_WIDTH]) 
                begin
                    output_pc_fromInstruction_valid                 = 1'b1;
                    output_pc_fromInstruction                       = currPc + 1;
					output_cc_id_fromInstruction 					= currCcId + 1;
                    nextState_fromInstruction                       = S_IDLE;
                end
            end
            NOT_MATCH:
            begin
                if( current_characters[currCcId*CHARACTER_WIDTH+:CHARACTER_WIDTH] != currInstr[INSTRUCTION_DATA_END+:CHARACTER_WIDTH])
                begin
                    output_pc_fromInstruction_valid                 = 1'b1;
                    output_pc_fromInstruction                       = currPc + 1;
                    output_cc_id_fromInstruction                    = currCcId ;
                    nextState_fromInstruction                       = S_IDLE;
                end
            end
            MATCH_ANY:
            begin
                
                output_pc_fromInstruction_valid                 = 1'b1;
                output_cc_id_fromInstruction = currCcId + 1;
                nextState_fromInstruction                       = S_IDLE;
                
            end
            JMP:
            begin
                output_pc_fromInstruction_valid                  = 1'b1;
                output_pc_fromInstruction                        = currInstr[INSTRUCTION_DATA_END+:PC_WIDTH];
                output_cc_id_fromInstruction                     = currCcId;
                nextState_fromInstruction                        = S_IDLE;
            end
            END_WITHOUT_ACCEPTING:
            begin
                nextState_fromInstruction                        = S_IDLE;
            end

        endcase
    end

    always_comb begin 
        accepts                          = 1'b0;
        running                          = 1'b1;

        output_pc_valid                  = 1'b0;
        output_pc                        = { PC_WIDTH {1'b0}  };
        output_cc_id                     = { CC_ID_BITS{1'b0} };
        input_pc_ready                   = 1'b0;
                 
        memory_valid                     = 1'b0;
        memory_addr                      = { MEMORY_ADDR_WIDTH {1'b0} };
                 
        nextState                        = curState;
        nextInstr                        = currInstr;
		nextCcId        				 = currCcId;
        nextPc                           = currPc;

        elaborating_chars                = {(CC_ID_BITS){1'b0}};
        if (curState != S_IDLE )         elaborating_chars[currCcId]      = 1'b1;

        case(curState)
        S_IDLE:
        begin
            running             = 1'b0;
            input_pc_ready      = 1'b1;
            if(input_pc_valid)
            begin
                nextPc          = input_pc;
                nextCcId        = input_cc_id;
                nextState       = S_FETCH_SEND;
            end
        end
        S_FETCH_SEND:
        begin
            memory_valid    = 1'b1;
            memory_addr     = { { (MEMORY_ADDR_WIDTH-PC_WIDTH) {1'b0} } , currPc };
            
            if(memory_ready)
            begin
                nextState   = S_FETCH_REC;
            end
        end
        S_FETCH_REC:
        begin
            
            nextInstr      = memory_data[0+:INSTRUCTION_WIDTH];
            nextState      = S_EXEC_1;
            
        end
        S_EXEC_1, S_EXEC_2:
        begin
            accepts                             = accepts_fromInstruction;
            output_pc_valid                     = output_pc_fromInstruction_valid;
            output_pc                           = output_pc_fromInstruction;
            output_cc_id                        = output_cc_id_fromInstruction;
       
            // if (output_pc_fromInstruction_valid) return output_pc_ready
            if( ~output_pc_fromInstruction_valid  || output_pc_ready )
            begin
                nextState                       = nextState_fromInstruction;
                /*if( nextState_fromInstruction  == S_IDLE )
                begin // to regain some advantages immediately receive input.

                    input_pc_ready      = 1'b1;
                    nextPc              = { (PC_WIDTH){1'b0}                                          };
                    nextInstr           = { END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH){1'b0} } };

                    if(input_pc_valid)
                    begin
                        nextPc          = input_pc;
                        nextState       = S_FETCH_SEND;
                    end
                end*/
            end
        
        end
        endcase
        
    end

    
endmodule 