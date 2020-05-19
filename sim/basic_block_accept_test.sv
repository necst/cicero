`timescale 1ns / 10ps

import instruction::*;

module basic_accept_test();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    parameter  PC_WIDTH          = 8;
    parameter  CHARACTER_WIDTH   = 8;
    parameter  MEMORY_WIDTH      = 16;
    parameter  MEMORY_ADDR_WIDTH = 11;

    logic                               clk                             ;
    logic                             reset                             ; 
    logic[CHARACTER_WIDTH-1:0]        current_character                 ;
    logic                             input_pc_valid                    ;
    logic[PC_WIDTH-1:0]               input_pc                          ;
    logic                             input_pc_ready                    ;
    logic                             memory_ready                      ;
    logic[MEMORY_ADDR_WIDTH-1:0]      memory_addr                       ;
    logic[MEMORY_WIDTH-1     :0]      memory_data                       ;
    logic                             memory_valid                      ;
    logic                             output_pc_is_directed_to_current  ;
    logic                             output_pc_valid                   ;
    logic[PC_WIDTH-1:0]               output_pc                         ;
    logic                             output_pc_ready                   ;
    logic                             accepts                           ;

    basic_block #(
        .PC_WIDTH          (PC_WIDTH          ),
        .CHARACTER_WIDTH   (CHARACTER_WIDTH   ),
        .MEMORY_WIDTH      (MEMORY_WIDTH      ),
        .MEMORY_ADDR_WIDTH (MEMORY_ADDR_WIDTH )
    ) abb (
        .clk                             (  clk                           ),   
        .reset                           (reset                           ),
        .current_character               (current_character               ),
        .input_pc_valid                  (input_pc_valid                  ),
        .input_pc                        (input_pc                        ),
        .input_pc_ready                  (input_pc_ready                  ),
        .memory_ready                    (memory_ready                    ),
        .memory_addr                     (memory_addr                     ),
        .memory_data                     (memory_data                     ),
        .memory_valid                    (memory_valid                    ),
        .output_pc_is_directed_to_current(output_pc_is_directed_to_current),
        .output_pc_valid                 (output_pc_valid                 ),
        .output_pc                       (output_pc                       ),
        .output_pc_ready                 (output_pc_ready                 ),
        .accepts                         (accepts                         )
    );

    // clock generator  
    always begin
        #CLOCK_SEMI_PERIOD clk = ~ clk;
    end

   task load_pc(  input reg[PC_WIDTH-1    :0] pc);
    begin
        if(input_pc_ready !== 1'b1)
        begin
            $display("basic block does not await pc");
            $stop();
        end
        input_pc_valid <= 1'b1;
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
            $display("basic block want something frem memory even if it had just fetched!");
            $stop();
        end
        
        
    end
    endtask

    
    initial begin
        input_pc_valid  = 1'b0;
        memory_ready    = 1'b0;
        output_pc_ready = 1'b0;
        clk             = 1'b0;
        reset          <= 1'b0;
        @(posedge clk);
        reset          <= 1'b1;
        @(posedge clk);
        reset          <= 1'b0;
        repeat(30) @(posedge clk);

        current_character <= 8'h00;
        load_pc(8'hEF);
        supply_memory({ACCEPT,{ (INSTRUCTION_DATA_WIDTH){1'b0}} } ,11'h0EF);
        
        @(negedge clk);
        if(accepts !== 1'b1)
        begin
            $display("didn't accept even if was supposed to!");
            $stop;
        end
        else
        begin
            $display("accepted correctly");
        end
        repeat(30) @(posedge clk);
        current_character <= 8'h01;
        load_pc(8'hAD);
        supply_memory({ACCEPT, { (INSTRUCTION_DATA_WIDTH){1'b0}} },11'h0AD);
        @(negedge clk);

        if(accepts !== 1'b0)
        begin
            $display("accepted even if was supposed to not accept!");
            $stop;
        end
         else
        begin
            $display("did not accept correctly");
        end

        $display("OK");
        $finish();

        end
    endmodule