`timescale 1ns / 10ps

import instruction::*;

module regex_cpu_pipelined_match_pipeline_tb();
    parameter CLOCK_SEMI_PERIOD = 5  ;

    parameter  PC_WIDTH          = 8;
    parameter  CHARACTER_WIDTH   = 8;
    parameter  MEMORY_WIDTH      = 16;
    parameter  MEMORY_ADDR_WIDTH = 11;

    logic                             clk                               ;
    logic                             rst                             ; 
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
        .rst                             ( rst                             ), 
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
        memory_ready   <= 1'b1;
        @(posedge clk);
        input_pc_valid <= 1'b0;
        memory_data    <= value;
        memory_ready   <= 1'b0;
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
        //@(posedge clk);
        //output_pc_ready    <= 1'b0;
       
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
        rst          <= 1'b0;
        @(posedge clk);
        rst          <= 1'b1;
        @(posedge clk);
        rst          <= 1'b0;
        repeat(30) @(posedge clk);

        
        for ( a_character=0 ; a_character < max_character ; a_character+=1 ) 
            for (a_pc = 0; a_pc < max_pc ; a_pc+=4 ) begin
            begin
                localparam BATCH_SIZE   =4;
                logic [BATCH_SIZE:1] ok;
                current_character <= a_character;
                for(int i=0; i<BATCH_SIZE;i++)
                begin
                    load_pc_and_supply_memory(a_pc+i,{MATCH,a_character } );
                    ok[i+1] = 1'b0;
                end
                input_pc_valid <= 1'b0;
                output_pc_ready<= 1'b1;
                @(posedge clk);
                for(int i=1;i<BATCH_SIZE+1;i++)
                begin
                    //$display("%d", (output_pc-a_pc));
                    if( ~output_pc_valid )
                    begin
                        $display("nok valid");
                        $stop(2);
                    end
                    if( ok[(output_pc-a_pc)] )
                    begin
                        $display("nok instructions multiplied");
                        $stop(2);
                    end
                    if( output_pc_is_directed_to_current ==  1'b1 )
                    begin
                        $display("nok output_pc_is_directed_to_current");
                        $stop(2);
                    end
                    ok[(output_pc-a_pc)] = 1'b1;
                    
                    @(posedge clk);
                end
                if(&ok == 1'b0)
                begin
                    $display("nok missing instruction");
                    $stop(2);
                end
                if(running)
                begin
                    $display("nok regex cpu still has to output some instructions ");
                    $stop(2);
                end
                output_pc_ready <= 1'b0;

            end
        end
 
       
        
       
        

        $display("OK");
        $finish();

    end

endmodule