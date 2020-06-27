`timescale 1ns/1ps

import instruction::*;

module regex_cpu #(
    parameter  PC_WIDTH          = 8 ,
    parameter  CHARACTER_WIDTH   = 8 ,
    parameter  MEMORY_WIDTH      = 16,
    parameter  MEMORY_ADDR_WIDTH = 11
)(
    input   wire                        clk,
    input   wire                        reset, 
    input   logic[CHARACTER_WIDTH-1:0]  current_character,

    input   logic                       input_pc_valid,
    input   logic[PC_WIDTH-1:0]         input_pc, 
    output  logic                       input_pc_ready,

    input   logic                       memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]memory_data,
    output  logic                       memory_valid,

 
    output  logic                       output_pc_is_directed_to_current,
    output  logic                       output_pc_valid,
    output  logic[PC_WIDTH-1:0]         output_pc,
    input   logic                       output_pc_ready,

    output  logic                       accepts
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

    logic [PC_WIDTH-1:0]            output_pc_fromInstruction;
    logic                           output_pc_fromInstruction_is_directed_to_current;
    logic                           output_pc_fromInstruction_valid;
    State                           nextState_fromInstruction;
    logic                           accepts_fromInstruction;

    always_ff @(posedge clk ) 
    begin 
        if(reset)
        begin
            curState <= S_IDLE;
            currPc   <= { (PC_WIDTH){1'b0} };
            currInstr<= {END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH) {1'b0}}};
        end
        else
        begin
            curState <= nextState;
            currPc   <= nextPc;
            currInstr<= nextInstr;
        end
    end
    
    
    always_comb begin
        accepts_fromInstruction                          = 1'b0;
        output_pc_fromInstruction_valid                  = 1'b0;
        output_pc_fromInstruction                        = currPc + 1;
        nextState_fromInstruction                        = S_IDLE;
        output_pc_fromInstruction_is_directed_to_current = 1'b1;

        case(currInstr[15:8])
            ACCEPT:
            begin
                if( current_character == { (CHARACTER_WIDTH){1'b0}} ) begin
                    accepts_fromInstruction         = 1'b1;
                    nextState_fromInstruction       = S_IDLE;
                end
            end
            SPLIT:
            begin
                if (curState == S_EXEC_1 ) 
                begin
                    output_pc_fromInstruction_valid                  = 1'b1;
                    output_pc_fromInstruction                        = currPc + 1;
                    output_pc_fromInstruction_is_directed_to_current = 1'b1;
                    nextState_fromInstruction                        = S_EXEC_2;
                end
                else if(curState == S_EXEC_2)
                begin
                    output_pc_fromInstruction_valid                  = 1'b1;
                    output_pc_fromInstruction                        = currInstr[INSTRUCTION_DATA_START:INSTRUCTION_DATA_END];
                    output_pc_fromInstruction_is_directed_to_current = 1'b1;
                    nextState_fromInstruction                        = S_IDLE;
                end
            end
            MATCH:
            begin
                if( current_character == currInstr[INSTRUCTION_DATA_START:INSTRUCTION_DATA_END]) begin
                    output_pc_fromInstruction_valid                  = 1'b1;
                    output_pc_fromInstruction                        = currPc + 1;
                    output_pc_fromInstruction_is_directed_to_current = 1'b0;
                    nextState_fromInstruction                        = S_IDLE;
                end
            end
            JMP:
            begin
                output_pc_fromInstruction_valid                      = 1'b1;
                output_pc_fromInstruction                            = currInstr[INSTRUCTION_DATA_START:INSTRUCTION_DATA_END];
                output_pc_fromInstruction_is_directed_to_current     = 1'b1;
                nextState_fromInstruction                            = S_IDLE;
            end
            END_WITHOUT_ACCEPTING:
            begin
                nextState_fromInstruction                            = S_IDLE;
            end
        endcase
    end

    always_comb begin 
        accepts                          = 1'b0;

        output_pc_valid                  = 1'b0;
        output_pc                        = { PC_WIDTH {1'b0} };
        output_pc_is_directed_to_current = 1'b0;
        input_pc_ready                   = 1'b0;
                 
        memory_valid                     = 1'b0;
        memory_addr                      = { MEMORY_ADDR_WIDTH {1'b0} };
                 
        nextState                        = curState;
        nextInstr                        = currInstr;
        nextPc                           = currPc;

        case(curState)
        S_IDLE:
        begin
            input_pc_ready      = 1'b1;
            if(input_pc_valid)
            begin
                nextPc          = input_pc;
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
            output_pc_is_directed_to_current    = output_pc_fromInstruction_is_directed_to_current;
       
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