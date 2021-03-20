`ifndef INSTRUCTION_PACKAGE
    `define INSTRUCTION_PACKAGE

    package instruction_package;

        parameter INSTRUCTION_WIDTH         = 16;
        parameter INSTRUCTION_TYPE_START    = 15;
        parameter INSTRUCTION_TYPE_END      = 13;
        parameter INSTRUCTION_TYPE_WIDTH    = (INSTRUCTION_TYPE_START-INSTRUCTION_TYPE_END)+1;
        
        parameter INSTRUCTION_DATA_START    = INSTRUCTION_TYPE_END-1;
        parameter INSTRUCTION_DATA_END      = 0;
        parameter INSTRUCTION_DATA_WIDTH    = (INSTRUCTION_DATA_START-INSTRUCTION_DATA_END)+1;

        typedef enum logic[INSTRUCTION_TYPE_WIDTH-1:0] {ACCEPT, SPLIT,MATCH,JMP,END_WITHOUT_ACCEPTING, MATCH_ANY, ACCEPT_PARTIAL, NOT_MATCH} instr_type;
        
        typedef struct packed{
            instr_type itype;
            logic[7:0] data;
        } instruction;

    endpackage : instruction_package 

`endif 