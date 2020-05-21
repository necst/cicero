`timescale 1ns / 10ps

import instruction::*;

module basic_block_jmp_tb();
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

    task wait_pc_output( input reg[MEMORY_ADDR_WIDTH-1:0] expected_pc,
                         input reg                        expected_is_directed_to_current,
                         input reg                        wait_immediately_after );
    begin
        @(posedge clk);
        output_pc_ready    <= 1'b1;

        if( output_pc_valid !== 1'b1)
        begin
            $display("basic block didn't need to produce pc!");
            $stop();
        end
        if(output_pc !== expected_pc)
        begin
            $display("basic block output pc %h != %h", output_pc, expected_pc);
            $stop();
        end
        if(output_pc_is_directed_to_current !== expected_is_directed_to_current)
        begin
            $display("basic block output pc %h != %h", output_pc_is_directed_to_current, expected_is_directed_to_current);
            $stop();
        end
        @(posedge clk);
        output_pc_ready    <=1'b0;
        @(posedge clk);
        if(output_pc_valid == 1'b1 && wait_immediately_after == 1'b0)
        begin
            $display("basic block outputted a pc immediately after having outputted one!");
            $stop();
        end
        
        
    end
    endtask


    initial begin
        reg [PC_WIDTH-1:0               ] a_pc;
        reg [CHARACTER_WIDTH-1:0        ] a_character;
        reg [INSTRUCTION_DATA_WIDTH-1:0 ] a_jmp_amount;
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
        a_character = 8'h00;
        a_pc        = 8'hCC;
        a_jmp_amount= 8'h0F;
        current_character <= a_character;

        load_pc(a_pc);
        supply_memory({JMP, a_jmp_amount } ,a_pc);
        wait_pc_output(a_jmp_amount, 1'b1, 1'b0);
        $display("OK");

        repeat(30) @(posedge clk);
        a_character = 8'h01;
        a_pc        = 8'hCD;
        a_jmp_amount= 8'h00;
        current_character <= a_character;

        load_pc(a_pc);
        supply_memory({JMP,a_jmp_amount } ,a_pc);
        wait_pc_output(a_jmp_amount, 1'b1, 1'b0);

        $display("OK");
        $finish();

    end

endmodule