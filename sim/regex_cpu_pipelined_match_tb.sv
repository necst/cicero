`timescale 1ns / 10ps

import instruction::*;

module regex_cpu_pipelined_match_tb();
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

    task wait_pc_output( input reg[MEMORY_ADDR_WIDTH-1:0] expected_pc,
                         input reg                        expected_is_directed_to_current,
                         input reg                        wait_immediately_after );
    begin

        while(output_pc_valid == 1'b0 )
            @(posedge clk);
            if(~running)
            begin
                $display("regex_cpu stopped running without producing any pc!");
                $stop();
            end
        @(posedge clk);
        output_pc_ready    <= 1'b1;

        if( output_pc_valid !== 1'b1)
        begin
            $display("regex_cpu didn't need to produce pc!");
            $stop();
        end
        if(output_pc !== expected_pc)
        begin
            $display("regex_cpu output pc %h != %h", output_pc, expected_pc);
            $stop();
        end
        if(output_pc_is_directed_to_current !== expected_is_directed_to_current)
        begin
            $display("regex_cpu output pc %h != %h", output_pc_is_directed_to_current, expected_is_directed_to_current);
            $stop();
        end
        @(posedge clk);
        output_pc_ready    <=1'b0;
        @(posedge clk);
        if(output_pc_valid == 1'b1 && wait_immediately_after == 1'b0 && ~running)
        begin
            $display("regex_cpu outputted a pc immediately after having outputted one!");
            $stop();
        end
        
        
    end
    endtask


    initial begin
        reg [CHARACTER_WIDTH-1:0]   a_character, a_different_character;
        reg [PC_WIDTH-1:0]          a_pc;
        reg [CHARACTER_WIDTH-1:0]   max_character;
        reg [CHARACTER_WIDTH-1:0]   max_character_difference;
        reg [PC_WIDTH-1:0]          max_pc;
        max_character               = 254;
        max_character_difference    = 32;
        max_pc                      = 127;

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

        for (a_pc = 0; a_pc < max_pc ; a_pc+=1 ) begin
            for ( a_character=0 ; a_character < max_character ; a_character+=1 ) begin
                current_character <= a_character;
                @(posedge clk);
                //expected match
                load_pc_and_supply_memory(a_pc,{MATCH,a_character } );
                wait_pc_output(a_pc+8'h01, 1'b0, 1'b0);
                //ensure it can wait other instructions
                repeat (3)
                    begin
                        @(posedge clk);
                        if( running == 1'b1)
                        begin
                            $display("regex_cpu still running!");
                            $stop();
                        end
                        if( output_pc_valid == 1'b1)
                        begin
                            $display("basic block didn't need to produce pc!");
                            $stop();
                        end
                    end
                $display("%h positive match with %c ok", a_pc, a_character);
                //test non match
                for (logic [CHARACTER_WIDTH-1:0] character_difference=1  ; character_difference < max_character_difference && a_character+character_difference < {CHARACTER_WIDTH{1'b1}} ; character_difference+=1 ) begin
                    //expect a non match no output and wait for another instruction raised.
                    a_different_character  = a_character+character_difference;
                    current_character      <= a_character;
                    $display("%h start negative match with currchar=%c, match_char=%c", a_pc, a_character, a_different_character);
                    load_pc_and_supply_memory(a_pc,{MATCH,a_different_character });
                    while(running)
                    begin
                        if( output_pc_valid == 1'b1)
                        begin
                            $display("basic block didn't need to produce pc!");
                            $stop();
                        end
                        @(posedge clk);
                    end
                    $display("%h %c ok", a_pc, a_different_character);
                    repeat (3)
                    begin
                        @(posedge clk);
                        if( running == 1'b1)
                        begin
                            $display("regex_cpu still running!");
                            $stop();
                        end
                        if( output_pc_valid == 1'b1)
                        begin
                            $display("basic block didn't need to produce pc!");
                            $stop();
                        end
                    end
                end
            end
        end
 
       
        
        repeat (10) @(posedge clk);
        

        @(posedge clk);
        if( output_pc_valid == 1'b1)
            begin
                $display("basic block didn't need to produce pc!");
                $stop();
            end

        repeat (10)
        begin
            @(posedge clk);
            if( output_pc_valid == 1'b1)
            begin
                $display("basic block didn't need to produce pc!");
                $stop();
            end
            if( input_pc_ready != 1'b1)
            begin
                $display("basic block didn't expect a new pc to be executed!");
                $stop();
            end
        end
        

        $display("OK");
        $finish();

    end

endmodule