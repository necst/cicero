`timescale 1ns/1ps

`ifndef INSTRUCTION_PACKAGE
    `define INSTRUCTION_PACKAGE

    package instruction;

        parameter INSTRUCTION_WIDTH         = 16;
        parameter INSTRUCTION_TYPE_WIDTH    = 8;
        parameter INSTRUCTION_TYPE_START    = 15;
        parameter INSTRUCTION_TYPE_END      = 8;
        
        parameter INSTRUCTION_DATA_WIDTH    = 8;
        parameter INSTRUCTION_DATA_START    = 7;
        parameter INSTRUCTION_DATA_END      = 0;

        typedef enum logic[7:0] {ACCEPT, SPLIT,MATCH,JMP,END_WITHOUT_ACCEPTING, MATCH_ANY, ACCEPT_PARTIAL} instr_type;
        
        typedef struct packed{
            instr_type itype;
            logic[7:0] data;
        } istruction;

    endpackage : instruction 

`endif 