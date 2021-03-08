`timescale 1ns / 10ps

import instruction_package::*;

module regex_cpu_accept_tb();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    parameter  PC_WIDTH          = 9;
    parameter  CC_ID_BITS        = 2;
    parameter  CHARACTER_WIDTH   = 8;
    parameter  MEMORY_WIDTH      = 16;
    parameter  MEMORY_ADDR_WIDTH = 11;

    logic                             clk                               ;
    logic                             rst                               ;
    logic[(2**CC_ID_BITS)*CHARACTER_WIDTH-1:0]        current_characters     ;
    logic[(2**CC_ID_BITS)-1:0                ]        end_of_string          ;
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

    regex_cpu #(
        .PC_WIDTH          (PC_WIDTH          ),
        .CC_ID_BITS        (CC_ID_BITS        ),
        .CHARACTER_WIDTH   (CHARACTER_WIDTH   ),
        .MEMORY_WIDTH      (MEMORY_WIDTH      ),
        .MEMORY_ADDR_WIDTH (MEMORY_ADDR_WIDTH )
    ) a_cpu (
        .clk                             (  clk                           ),   
        .rst                             (rst                             ),
        .end_of_string                   (end_of_string                   ),
        .current_characters              (current_characters              ),
        .input_pc_valid                  (input_pc_valid                  ),
        .input_cc_id                     (input_cc_id                     ),
        .input_pc                        (input_pc                        ),
        .input_pc_ready                  (input_pc_ready                  ),
        .memory_ready                    (memory_ready                    ),
        .memory_addr                     (memory_addr                     ),
        .memory_data                     (memory_data                     ),
        .memory_valid                    (memory_valid                    ),
        .output_cc_id                    (output_cc_id                    ),
        .output_pc_valid                 (output_pc_valid                 ),
        .output_pc                       (output_pc                       ),
        .output_pc_ready                 (output_pc_ready                 ),
        .accepts                         (accepts                         )
    );

    // clock generator  
    always begin
        #CLOCK_SEMI_PERIOD clk = ~ clk;
    end

   task load_pc(  input reg[PC_WIDTH-1    :0] pc, 
                  input reg[CC_ID_BITS-1  :0] cc_id);
    begin
        if(input_pc_ready !== 1'b1)
        begin
            $display("basic block does not await pc");
            $stop();
        end
        input_pc_valid <= 1'b1;
        input_cc_id    <= cc_id;
        input_pc       <= pc;
        @(posedge clk);
        input_pc_valid <= 1'b0;
        @(posedge clk);
        if(input_pc_ready == 1'b1)
        begin
            $display("basic block waits a pc immediately after having taken one!");
            $stop();
        end
        @(posedge clk);
    end
    endtask

    task supply_memory(input reg[MEMORY_WIDTH-1     :0] value,
                       input reg[MEMORY_ADDR_WIDTH-1:0] addr);
    begin
        memory_ready <= 1'b1;

        if(memory_valid !== 1'b1)
        begin
            $display("basic block does not wait memory");
            $stop();
        end
        if(memory_addr !== addr)
        begin
            $display("basic block address mismatch %h != %h", memory_addr, addr);
            $stop();
        end
        @(posedge clk);
        memory_data  <= value;
        memory_ready <= 1'b0;
        @(posedge clk);
        if(memory_valid == 1'b1)
        begin
            $display("basic block want something from memory even if it had just fetched!");
            $stop();
        end
        
        
    end
    endtask

    
    initial begin
        logic [PC_WIDTH-1:0] max_pc;
        logic [CHARACTER_WIDTH-1:0] terminator = {(CHARACTER_WIDTH){1'b0}};
        max_pc          = (1<<(PC_WIDTH-1))-1;
        input_pc_valid  = 1'b0;
        input_cc_id     = 1'b0;
        memory_ready    = 1'b0;
        output_pc_ready = 1'b0;
        clk             = 1'b0;
        rst          <= 1'b0;
        @(posedge clk);
        rst          <= 1'b1;
        @(posedge clk);
        rst          <= 1'b0;
        repeat(30) @(posedge clk);

        for (logic [PC_WIDTH-1:0] pc = 0 ; pc < max_pc ; pc+=1) begin
            for (logic [CHARACTER_WIDTH-1:0] non_terminator=1; non_terminator< 255; non_terminator+=1)
            begin
                
                current_characters <= {{(2**CC_ID_BITS){non_terminator}}};
                end_of_string      <= {{((2**CC_ID_BITS)-1){1'b0}},1'b1};
                load_pc(pc, {(CC_ID_BITS){1'b0}});
                supply_memory({ACCEPT,{ (INSTRUCTION_DATA_WIDTH){1'b0}} } ,pc);
                @(posedge clk);
                if(accepts !== 1'b1)
                begin
                    $display("pc: %h cc: %c correctly accepted  !",pc,  current_characters);
                    $stop;
                end
                else
                begin
                    $display("pc: %h cc: %c did not accept even if was supposed to ", pc,  current_characters);
                end
                @(posedge clk);
            end
        end

        repeat(30) @(posedge clk);
        for (logic [PC_WIDTH-1:0] pc = 0 ; pc < max_pc ; pc+=1) begin
            for (logic [CHARACTER_WIDTH-1:0] non_terminator=1; non_terminator< 255; non_terminator+=1)
            begin
                
                current_characters <= {(2**CC_ID_BITS){non_terminator}};
                end_of_string      <= {(2**CC_ID_BITS){1'b0}};
                load_pc(pc,{(CC_ID_BITS){1'b0}});
                supply_memory({ACCEPT, { (INSTRUCTION_DATA_WIDTH){1'b0}} },pc);
                @(posedge clk);
                if(accepts !== 1'b0)
                begin
                    $display("pc: %h cc: %c accepted even if was supposed to not accept!",pc,  current_characters);
                    $stop;
                end
                else
                begin
                    $display("pc: %h cc: %c correctly did not accept ", pc,  current_characters);
                end
                @(posedge clk);
            end
        end

        repeat(30) @(posedge clk);
        for (logic [PC_WIDTH-1:0] pc = 0 ; pc < max_pc ; pc+=1) begin
            for (logic [CHARACTER_WIDTH-1:0] any_char=0; any_char< 255; any_char+=1)
            begin
                
                current_characters <= {(2**CC_ID_BITS){any_char}};
                end_of_string      <= {(2**CC_ID_BITS){1'b0}};
                load_pc(pc,'0);
                supply_memory({ACCEPT_PARTIAL, { (INSTRUCTION_DATA_WIDTH){1'b0}} },pc);
                @(posedge clk);
                if(accepts == 1'b0)
                begin
                    $display("pc: %h cc: %c didn't accept even if was supposed to",pc,  current_characters);
                    $stop;
                end
                else
                begin
                    $display("pc: %h cc: %c correctly accepted ", pc,  current_characters);
                end
                @(posedge clk);
            end
        end
        $display("OK");
        $finish();

        end
    endmodule