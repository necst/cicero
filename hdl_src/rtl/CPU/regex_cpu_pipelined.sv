//`include "instruction_package.sv"
import instruction_package::*;
//A simple processor of reg2_instructions
// It uses two ready-valid interface to receive and output the instruction pc which identifies respectively
// the instruction that will be elaborated and a new instruction(continuation) that has to be elaborated.
module regex_cpu_pipelined #(
    parameter  PC_WIDTH             = 8 ,
    parameter  CHARACTER_WIDTH      = 8 ,
    parameter  MEMORY_WIDTH         = 16,
    parameter  MEMORY_ADDR_WIDTH    = 11,
    parameter  FIFO_WIDTH_POWER_OF_2= 2    
)(
    input   wire                            clk,
    input   wire                            rst, 
    input   logic[CHARACTER_WIDTH-1:0]      current_character,

    input   logic                           input_pc_valid,
    input   logic[PC_WIDTH-1:0]             input_pc, 
    output  logic                           input_pc_ready,

    input   logic                           memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]    memory_data,
    output  logic                           memory_valid,

 
    output  logic                           output_pc_is_directed_to_current,
    output  logic                           output_pc_valid,
    output  logic[PC_WIDTH-1:0]             output_pc,
    input   logic                           output_pc_ready,

    output  logic                           accepts,
    output  logic                           running,
    output  logic[FIFO_WIDTH_POWER_OF_2:0]  latency
);
    
    //stage status
    logic [PC_WIDTH-1:0]                                         FETCH_REC_Pc            ,EXE1_Pc          , EXE2_Pc            ;
    logic [INSTRUCTION_WIDTH-1:0]                                FETCH_REC_Instr         ,EXE1_Instr       , EXE2_Instr         ;
    logic                                                        FETCH_REC_Instr_valid   ,EXE1_Instr_valid , EXE2_Instr_valid   ;
    logic                                                        FETCH_REC_has_to_save                                          ;
    //stage outputs
    logic                           FETCH_SEND_waits                                     , EXE1_waits             , EXE2_waits  ;                                           
    logic [INSTRUCTION_WIDTH-1:0]                                FETCH_REC_Instr_next                                           ;         
    logic                           FETCH_SEND_not_stall           , FETCH_REC_not_stall         , EXE1_not_stall             , EXE2_not_stall  ;
    logic                                                                                  EXE1_accepts           , EXE2_accepts;
    logic                                                                                  EXE1_completes_instr                 ;    
    
    //for cpu exe_. stages
    logic                           EXE1_output_pc_not_ready                      , EXE2_output_pc_not_ready             ; 
    logic                           EXE1_output_pc_ready                          , EXE2_output_pc_ready                 ;
    logic                           EXE1_output_pc_is_directed_to_current         , EXE2_output_pc_is_directed_to_current;
    logic [PC_WIDTH-1:0]            EXE1_output_pc                                , EXE2_output_pc                       ;
    logic [PC_WIDTH  :0]            EXE1_output_pc_and_current                    , EXE2_output_pc_and_current           ;
    logic                           EXE1_output_pc_valid                          , EXE2_output_pc_valid                 ;
    // output arbiter
    logic [PC_WIDTH  :0]            output_pc_and_current;

    always_ff @(posedge clk ) 
    begin 
        if(rst)
        begin
            FETCH_REC_has_to_save <= 1'b0;

            FETCH_REC_Instr_valid <= 1'b0;
                 EXE1_Instr_valid <= 1'b0;
                 EXE2_Instr_valid <= 1'b0; 
            FETCH_REC_Pc          <= { (PC_WIDTH){1'b0} };
                 EXE1_Pc          <= { (PC_WIDTH){1'b0} };                
                 EXE2_Pc          <= { (PC_WIDTH){1'b0} }; 
            FETCH_REC_Instr       <= {END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH) {1'b0}}};
                 EXE1_Instr       <= {END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH) {1'b0}}};          
                 EXE2_Instr       <= {END_WITHOUT_ACCEPTING, { (INSTRUCTION_DATA_WIDTH) {1'b0}}};                                  
            
        end
        else
        begin
            
            if(EXE2_not_stall  )
            begin//for sure instruction does not require any further computation

                EXE2_Instr_valid    <= 1'b0;
            end
            else
            begin //if stage stalled mantain state
                EXE2_Pc             <= EXE2_Pc;
                EXE2_Instr          <= EXE2_Instr;
                EXE2_Instr_valid    <= EXE2_Instr_valid;
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
                end
            end
            else
            begin //if stage stalled mantain state
                EXE1_Pc             <= EXE1_Pc;
                EXE1_Instr          <= EXE1_Instr;    
                EXE1_Instr_valid    <= EXE1_Instr_valid;
            end
            
            
            FETCH_REC_has_to_save <= 1'b0;
            if(FETCH_REC_not_stall )
            begin
                FETCH_REC_Instr_valid<= 1'b0;
                    
                //otherwise if next stage is free we can move status to the next instruction
                EXE1_Pc             <= FETCH_REC_Pc         ;
                EXE1_Instr          <= FETCH_REC_Instr_next ;
                EXE1_Instr_valid    <= FETCH_REC_Instr_valid;
            end
            else
            begin
                FETCH_REC_Pc         <= FETCH_REC_Pc;
                FETCH_REC_Instr      <= FETCH_REC_Instr_next;    
                FETCH_REC_Instr_valid<= FETCH_REC_Instr_valid;
            end

            if(FETCH_SEND_not_stall )
            begin //FETCH stall accounts for non ready FETCH_REC_stage
                FETCH_REC_Pc                 <= input_pc    ;
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
        EXE1_output_pc_is_directed_to_current = 1'b1;
        //not requires to go through other stages
        EXE1_completes_instr                  = 1'b1;
        EXE1_waits                            = 1'b0;
        
        //implements 
        if( EXE1_Instr_valid )
        begin
            case(EXE1_Instr[INSTRUCTION_TYPE_START:INSTRUCTION_TYPE_END])
                ACCEPT:
                begin
                    if( current_character == { (CHARACTER_WIDTH){1'b0}} ) begin
                        EXE1_accepts                         = 1'b1;
                        EXE1_completes_instr                 = 1'b1;
                    end
                end
                ACCEPT_PARTIAL:
                begin
                    EXE1_accepts         = 1'b1;
                    EXE1_completes_instr                 = 1'b1;
                end
                SPLIT:
                begin
                    
                    EXE1_output_pc_valid                     = 1'b1;
                    EXE1_output_pc                           = EXE1_Pc + 1;
                    EXE1_output_pc_is_directed_to_current    = 1'b1;
                    EXE1_completes_instr                     = 1'b0;
                    if(~EXE1_output_pc_ready)
                    begin
                        EXE1_waits                           = 1'b1;
                    end
                end
                MATCH:
                begin
                    if( current_character == EXE1_Instr[INSTRUCTION_DATA_START:INSTRUCTION_DATA_END]) begin
                        EXE1_output_pc_valid                 = 1'b1;
                        EXE1_output_pc                       = EXE1_Pc + 1;
                        EXE1_output_pc_is_directed_to_current= 1'b0;
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
                    EXE1_output_pc_is_directed_to_current= 1'b0;
                    if(~EXE1_output_pc_ready)
                    begin
                        EXE1_waits                       = 1'b1;
                    end     
                    
                end
                JMP:
                begin
                    EXE1_output_pc_valid                     = 1'b1;
                    EXE1_output_pc                           = EXE1_Instr[INSTRUCTION_DATA_START:INSTRUCTION_DATA_END];
                    EXE1_output_pc_is_directed_to_current    = 1'b1;
                    if( ~EXE1_output_pc_ready)
                    begin
                        EXE1_waits                           = 1'b1;
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
        EXE2_output_pc_is_directed_to_current = 1'b1;
        //not requires to go through other stages
        EXE2_waits                            = 1'b0;
        if( EXE2_Instr_valid ) 
        begin
            case(EXE2_Instr[INSTRUCTION_TYPE_START:INSTRUCTION_TYPE_END])
                SPLIT:
                begin
                    EXE2_output_pc_valid                  = 1'b1;
                    EXE2_output_pc                        = EXE2_Instr[INSTRUCTION_DATA_START:INSTRUCTION_DATA_END];
                    EXE2_output_pc_is_directed_to_current = 1'b1;
                    if(~EXE2_output_pc_ready)
                    begin
                        EXE2_waits                        = 1'b1;
                    end
                end
            endcase
        end
    end


    assign EXE1_output_pc_and_current   = {EXE1_output_pc, EXE1_output_pc_is_directed_to_current};

    assign EXE2_output_pc_and_current   = {EXE2_output_pc, EXE2_output_pc_is_directed_to_current};
    

    //round robin arbiter for EXE1_output
    arbiter_2_rr #(
        .DWIDTH(PC_WIDTH+1                                    )
        
    ) arbiter_output_pc_port (
        .clk       ( clk                                      ),
        .rst     ( rst                                      ),
        .in_0_ready( EXE1_output_pc_ready                     ),
        .in_0_data ( EXE1_output_pc_and_current               ),
        .in_0_valid( EXE1_output_pc_valid                     ),
        .in_1_ready( EXE2_output_pc_ready                     ),
        .in_1_data ( EXE2_output_pc_and_current               ),
        .in_1_valid( EXE2_output_pc_valid                     ),
        .out_ready ( output_pc_ready                          ),
        .out_data  ( output_pc_and_current                    ),
        .out_valid ( output_pc_valid                          )
    );

    assign output_pc                        = output_pc_and_current[1+:PC_WIDTH];
    assign output_pc_is_directed_to_current = output_pc_and_current[          0];
    assign accepts =                          EXE1_accepts      || EXE2_accepts ;
    assign running = FETCH_REC_Instr_valid || EXE1_Instr_valid  || EXE2_Instr_valid ;
    assign latency = 0; //EXE1_buffered_count + EXE2_buffered_count;
    
endmodule 