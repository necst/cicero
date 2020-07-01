`timescale 1ns / 10ps

import instruction::*;

module regex_cpu_pipelined_accept_tb();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    parameter  PC_WIDTH          = 8;
    parameter  CHARACTER_WIDTH   = 8;
    parameter  MEMORY_WIDTH      = 16;
    parameter  MEMORY_ADDR_WIDTH = 11;

    logic                             clk                               ;
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
    logic                             running                           ;

    regex_cpu_pipelined #(
        .PC_WIDTH             (PC_WIDTH             ),
        .CHARACTER_WIDTH      (CHARACTER_WIDTH      ),
        .MEMORY_WIDTH         (MEMORY_WIDTH         ),
        .MEMORY_ADDR_WIDTH    (MEMORY_ADDR_WIDTH    ),
        .FIFO_WIDTH_POWER_OF_2(2                    )   
    )a_cpu_under_test(
        .clk                               ( clk                               ),
        .reset                             ( reset                             ), 
        .current_character                 ( current_character                 ),
        .input_pc_valid                    ( input_pc_valid                    ),
        .input_pc                          ( input_pc                          ), 
        .input_pc_ready                    ( input_pc_ready                    ),
        .memory_ready                      ( memory_ready                      ),
        .memory_addr                       ( memory_addr                       ),
        .memory_data                       ( memory_data                       ),
        .memory_valid                      ( memory_valid                      ),
        .output_pc_is_directed_to_current  ( output_pc_is_directed_to_current  ),
        .output_pc_valid                   ( output_pc_valid                   ),
        .output_pc                         ( output_pc                         ),
        .output_pc_ready                   ( output_pc_ready                   ),
        .accepts                           ( accepts                           ),
        .running                           ( running                           )
);

    // clock generator  
    always begin
        #CLOCK_SEMI_PERIOD clk = ~ clk;
    end

   task load_pc_and_supply_memory(  input reg[PC_WIDTH-1    :0] pc,
                                    input reg[MEMORY_WIDTH-1     :0] value
                                    );
    begin
        
        input_pc_valid <= 1'b1;
        input_pc       <= pc;
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
        if(running !== 1'b1)
        begin
            $display("regex_cpu seems not having received instruction");
            $stop();
        end
        
    end
    endtask

   

    
    initial begin
        logic [PC_WIDTH-1:0] max_pc;

        max_pc          = (1<<(PC_WIDTH-1))-1;
        input_pc_valid  = 1'b0;
        memory_ready    = 1'b0;
        output_pc_ready = 1'b0;
        clk             = 1'b0;
        reset           = 1'b0;
        @(posedge clk);
        reset          <= 1'b1;
        @(posedge clk);
        reset          <= 1'b0;
        repeat(30) @(posedge clk);

        for (logic [PC_WIDTH-1:0] pc = 0 ; pc < max_pc ; pc+=1) begin
            current_character <= 8'h00;
            load_pc_and_supply_memory(pc,{ACCEPT,{ (INSTRUCTION_DATA_WIDTH){1'b0}}} );
            
            if(accepts !== 1'b1)
            begin
                $display("%h didn't accept even if was supposed to!", pc);
                $stop;
            end
            else
            begin
                $display("%h accepted correctly", pc );
            end
            @(posedge clk);
            if(running == 1'b1)
            begin
                $display("%h regex_cpu still has work to do even if pc have been all fetched!", pc);
                $stop;
            end
        end

        repeat(30) @(posedge clk);
        for (logic [PC_WIDTH-1:0] pc = 0 ; pc < max_pc ; pc+=1) begin
            for (logic [CHARACTER_WIDTH-1:0] non_terminator=1; non_terminator< 255; non_terminator+=1)
            begin
                current_character <= non_terminator;
                load_pc_and_supply_memory(pc,{ACCEPT, { (INSTRUCTION_DATA_WIDTH){1'b0}} });
                
                if(accepts !== 1'b0)
                begin
                    $display("pc: %h cc: %c accepted even if was supposed to not accept!",pc,  current_character);
                    $stop;
                end
                else
                begin
                    $display("pc: %h cc: %c correctly did not accept ", pc,  current_character);
                end
                @(posedge clk);
                if(running == 1'b1)
                begin
                    $display("%h regex_cpu still has work to do even if pc have been all fetched!", pc);
                    $stop;
                end
            end
        end
        $display("OK");
        $finish();

        end
    endmodule