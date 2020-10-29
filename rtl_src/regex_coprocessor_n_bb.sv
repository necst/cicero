`timescale 1ns/1ps
// Author: Daniele Parravicini
// This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// Furthermore no-copy is allowed without explicit permission of the authors.
import Regex_coprocessor_package::*;

module regex_coprocessor_n_bb #(
    parameter  PC_WIDTH              = 8 ,
    parameter  LATENCY_COUNT_WIDTH   = 8 ,
    parameter  FIFO_COUNT_WIDTH      = 6 ,
    parameter  CHANNEL_COUNT_WIDTH   = 5 ,
    parameter  CHARACTER_WIDTH       = 8 ,
    parameter  MEMORY_WIDTH          = 16,
    parameter  MEMORY_ADDR_WIDTH     = 11,
    parameter  BB_N                  = 4 ,
    parameter  CACHE_WIDTH_BITS      = 5 ,
    parameter  CACHE_BLOCK_WIDTH_BITS= 2 ,
    parameter  BASIC_BLOCK_PIPELINED = 0 ,
    parameter  REG_WIDTH             = 32
)
(
    input   logic                           clk,
    input   logic                           reset,

    input   logic                           memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]    memory_data,
    output  logic                           memory_valid,

    input   logic                           start_ready,
    input   logic[REG_WIDTH-1        :0]    start_cc_pointer,
    output  logic                           start_valid,
    output  logic                           finish,
    output  logic                           accept,
    output  logic                           error
);
    localparam                       C_ADDR_OFFSET = $clog2(MEMORY_WIDTH/CHARACTER_WIDTH);

    localparam [CHARACTER_WIDTH-1:0] CHARACTER_TERMINATOR = { CHARACTER_WIDTH {1'b0}};
    localparam [PC_WIDTH-1       :0] start_pc = { PC_WIDTH{1'b0} };
    logic      [REG_WIDTH-1      :0] cur_cc_pointer           , next_cc_pointer;
    logic      [CHARACTER_WIDTH-1:0] cur_cc                   , next_cc;
    logic                            cur_is_even_character   , next_is_even_character;
      
    

    logic                           memory_ready_for_cc ;
    logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr_for_cc  ;
    logic[MEMORY_WIDTH-1     :0]    memory_data_for_cc  ;
    logic                           memory_valid_for_cc ;

    logic                            memory_ready_for_bb     [BB_N-1:0];
    logic[MEMORY_ADDR_WIDTH-1:0]     memory_addr_for_bb      [BB_N-1:0];
    logic[MEMORY_WIDTH-1     :0]     memory_data_for_bb      [BB_N-1:0];
    logic                            memory_valid_for_bb     [BB_N-1:0];
    wire                             memory_ready_bb_arbitred     ;
    wire [MEMORY_ADDR_WIDTH-1:0]     memory_addr_bb_arbitred      ;
    wire                             memory_valid_bb_arbitred     ;

    logic                           bbs_go                            ;
    logic                           bb_running              [BB_N-1:0];
    logic                           bb_accepts              [BB_N-1:0];
    logic                           bb_input_pc_valid       [BB_N-1:0];
    logic[PC_WIDTH-1+1:0]           bb_input_pc_and_current [BB_N-1:0]; 
    logic                           bb_input_pc_ready       [BB_N-1:0];
    logic[LATENCY_COUNT_WIDTH-1:0]  bb_input_pc_latency     [BB_N-1:0];
    logic                           bb_output_pc_valid      [BB_N-1:0];
    logic[PC_WIDTH-1+1:0]           bb_output_pc_and_current[BB_N-1:0];
    logic                           bb_output_pc_ready      [BB_N-1:0];
    logic[LATENCY_COUNT_WIDTH-1:0]  bb_output_pc_latency    [BB_N-1:0];

    logic [BB_N-1:0] tmp_bb_accepts;
    logic [BB_N-1:0] tmp_bb_running;
    logic [BB_N-1:0] tmp_channel_not_empty;
    logic [BB_N-1:0] tmp_bb_input_pc_ready;

    logic                           override_pc_ready;
    logic [PC_WIDTH-1:0]            override_pc;
    logic                           override_pc_current;
    logic [PC_WIDTH:0]              override_pc_and_current;
    logic                           override_pc_valid;
    logic                           override_pc_directed_to_current;
    assign override_pc_directed_to_current  = 1'b1;
    assign override_pc_and_current          = {override_pc, override_pc_directed_to_current};


    logic                           station_input_pc_valid       [BB_N-1:0];
    logic[PC_WIDTH-1+1:0]           station_input_pc_and_current [BB_N-1:0]; 
    logic                           station_input_pc_ready       [BB_N-1:0];
    logic[LATENCY_COUNT_WIDTH-1:0]  station_input_pc_latency     [BB_N-1:0];
    logic                           station_output_pc_valid      [BB_N-1:0];
    logic[PC_WIDTH-1+1:0]           station_output_pc_and_current[BB_N-1:0];
    logic                           station_output_pc_ready      [BB_N-1:0];
    logic[LATENCY_COUNT_WIDTH-1:0]  station_output_pc_latency    [BB_N-1:0];

    logic                           channel_input_pc_valid       [BB_N-1:0];
    logic[PC_WIDTH-1+1:0]           channel_input_pc_and_current [BB_N-1:0]; 
    logic                           channel_input_pc_ready       [BB_N-1:0];
    logic[LATENCY_COUNT_WIDTH-1:0]  channel_input_pc_latency     [BB_N-1:0];
    logic                           channel_output_pc_valid      [BB_N-1:0];
    logic[PC_WIDTH-1+1:0]           channel_output_pc_and_current[BB_N-1:0];
    logic                           channel_output_pc_ready      [BB_N-1:0];
    logic[LATENCY_COUNT_WIDTH-1:0]  channel_output_pc_latency    [BB_N-1:0];

    logic                   any_bb_accept;
    logic                   any_bb_running;
    logic                   subcomponent_reset;


    State cur_state, next_state;
    always_ff @( posedge clk ) begin
         
        if(reset)
        begin
            cur_state               <= REGEX_COPRO_S_IDLE;
            cur_cc_pointer          <= { REG_WIDTH{1'b0}      };
            cur_cc                  <= { (CHARACTER_WIDTH){1'b0} };
            cur_is_even_character   <= 1'b1;
        end
        else
        begin
            cur_state               <= next_state;
            cur_cc_pointer          <= next_cc_pointer;
            cur_cc                  <= next_cc;
            cur_is_even_character   <= next_is_even_character;
        end
    end

    always_comb 
    begin 
        next_state              = cur_state;
        next_cc_pointer         = cur_cc_pointer;
        next_cc                 = cur_cc;
        next_is_even_character  = cur_is_even_character;

        start_valid             = 1'b0;
        finish                  = 1'b0;
        accept                  = 1'b0;
        error                   = 1'b0;

        memory_addr_for_cc     = { (MEMORY_ADDR_WIDTH) {1'b0} };
        memory_valid_for_cc    = 1'b0;

        override_pc            = { (PC_WIDTH){1'b0}           };
        override_pc_valid      = 1'b0;

        if (reset == 1'b1)   subcomponent_reset = 1'b1;
        else                 subcomponent_reset = 1'b0;

        bbs_go                 = 1'b0;
        case(cur_state)
        REGEX_COPRO_S_IDLE:
        begin

            
            memory_addr_for_cc  = start_cc_pointer[C_ADDR_OFFSET+: MEMORY_ADDR_WIDTH];
            memory_valid_for_cc = 1'b1;
            

            if(start_ready && memory_ready_for_cc ) 
            begin
                next_state          = REGEX_COPRO_S_FETCH_1ST_CC;

                next_cc_pointer     = start_cc_pointer;
                start_valid         = 1'b1;
            end
        end
        REGEX_COPRO_S_FETCH_1ST_CC:
        begin
            
            next_cc    = memory_data[CHARACTER_WIDTH*cur_cc_pointer[0+:C_ADDR_OFFSET]+:CHARACTER_WIDTH];
            
            override_pc         = start_pc; 
            override_pc_valid   = 1'b1;
            if(override_pc_ready)
            begin
                next_state      = REGEX_COPRO_S_EXEC;
            end
            
        end
        REGEX_COPRO_S_FETCH_NEXT_CC:
        begin

            
            next_cc    = memory_data[CHARACTER_WIDTH*cur_cc_pointer[0+:C_ADDR_OFFSET]+:CHARACTER_WIDTH];

            if(any_bb_running)  next_state = REGEX_COPRO_S_EXEC;
            else                next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
              
        end
        REGEX_COPRO_S_EXEC:
        begin

            bbs_go          = 1'b1;
            if(any_bb_accept)
            begin 
                next_state  = REGEX_COPRO_S_COMPLETE_ACCEPTING;
            end
            else if( ~ any_bb_running ) 
            begin 
                if( cur_cc == CHARACTER_TERMINATOR)
                begin 
                    next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
                end
                else  
                begin
                    logic [REG_WIDTH-1:0] tmp_cur_cc_increment ;
                    tmp_cur_cc_increment= cur_cc_pointer + 1;
                    memory_valid_for_cc = 1'b1;

                    memory_addr_for_cc  = tmp_cur_cc_increment [C_ADDR_OFFSET+: MEMORY_ADDR_WIDTH];
                   
                    if( memory_ready_for_cc)
                    begin 
                        next_state              = REGEX_COPRO_S_FETCH_NEXT_CC;
                        next_cc_pointer         = tmp_cur_cc_increment;
                        next_is_even_character  = ~ cur_is_even_character;
                    end
                end
                
            end
            else if ( (|tmp_bb_input_pc_ready) == 1'b0 && ( (|tmp_channel_not_empty) == 1'b1)) 
            begin 
                next_state = REGEX_COPRO_S_ERROR;
            end
        end
        REGEX_COPRO_S_COMPLETE_ACCEPTING:
        begin
            finish = 1'b1;
            accept = 1'b1;
            next_state = REGEX_COPRO_S_IDLE;

            subcomponent_reset = 1'b1;
        end
        REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING:
        begin
            finish = 1'b1;
            accept = 1'b0;
            next_state = REGEX_COPRO_S_IDLE;

            subcomponent_reset = 1'b1;
        end
        REGEX_COPRO_S_ERROR:
        begin
            error = 1'b1;
        end
        endcase
    end


    genvar i;
    
    generate
        for (i=0; i < BB_N; i++) 
        begin
            assign tmp_bb_input_pc_ready        [i] = bb_input_pc_ready            [i];
        end
    endgenerate

    generate
        for (i=0; i < BB_N; i++) 
        begin :g

            logic [LATENCY_COUNT_WIDTH-1:0] tmp_channel_input_latency  ;
            logic                           channel_input_pc_not_ready ;
            logic                           station_input_pc_not_valid ;
            logic [CHANNEL_COUNT_WIDTH-1:0] channel_count              ;


            basic_block #(
                .PC_WIDTH               (PC_WIDTH                       ),
                .LATENCY_COUNT_WIDTH    (LATENCY_COUNT_WIDTH            ),
                .FIFO_COUNT_WIDTH       (FIFO_COUNT_WIDTH               ),
                .CHARACTER_WIDTH        (CHARACTER_WIDTH                ),
                .MEMORY_WIDTH           (MEMORY_WIDTH                   ),
                .MEMORY_ADDR_WIDTH      (MEMORY_ADDR_WIDTH              ),
                .CACHE_BLOCK_WIDTH_BITS (CACHE_BLOCK_WIDTH_BITS         ),
                .CACHE_WIDTH_BITS       (CACHE_WIDTH_BITS               ),
                .PIPELINED              (BASIC_BLOCK_PIPELINED          )
            ) abb (
                .clk                    (clk                            ),
                .reset                  (subcomponent_reset             ), 
                .cur_is_even_character  (cur_is_even_character          ),
                .current_character      (cur_cc                         ),
                .go                     (bbs_go                         ),
                .running                (bb_running                 [i] ),
                .accepts                (bb_accepts                 [i] ),
                .memory_ready           (memory_ready_for_bb        [i] ),
                .memory_addr            (memory_addr_for_bb         [i] ),
                .memory_data            (memory_data_for_bb         [i] ),
                .memory_valid           (memory_valid_for_bb        [i] ),
                .input_pc_valid         (bb_input_pc_valid          [i] ),
                .input_pc_and_current   (bb_input_pc_and_current    [i] ), 
                .input_pc_ready         (bb_input_pc_ready          [i] ),
                .input_pc_latency       (bb_input_pc_latency        [i] ),
                .output_pc_valid        (bb_output_pc_valid         [i] ),
                .output_pc_and_current  (bb_output_pc_and_current   [i] ),
                .output_pc_ready        (bb_output_pc_ready         [i] ),
                .output_pc_latency      (bb_output_pc_latency       [i] )
            );

            assign memory_data_for_bb[i] = memory_data;

            switch #(
                .DWIDTH             ( PC_WIDTH+1                    ),
                .LATENCY_COUNT_WIDTH( LATENCY_COUNT_WIDTH           )
            ) aswitch (
                .in_0_valid         (bb_output_pc_valid             [i]),
                .in_0_data          (bb_output_pc_and_current       [i]),
                .in_0_latency       (bb_output_pc_latency           [i]),
                .in_0_ready         (bb_output_pc_ready             [i]),
                .out_0_valid        (bb_input_pc_valid              [i]),
                .out_0_data         (bb_input_pc_and_current        [i]),
                .out_0_latency      (bb_input_pc_latency            [i]),
                .out_0_ready        (bb_input_pc_ready              [i]),
                .in_1_valid         (station_input_pc_valid         [i]),
                .in_1_data          (station_input_pc_and_current   [i]),
                .in_1_latency       (station_input_pc_latency       [i]),
                .in_1_ready         (station_input_pc_ready         [i]),
                .out_1_valid        (station_output_pc_valid        [i]),
                .out_1_data         (station_output_pc_and_current  [i]),
                .out_1_latency      (station_output_pc_latency      [i]),
                .out_1_ready        (station_output_pc_ready        [i])
            );



            fifo #(
                .DWIDTH     (PC_WIDTH+1                         ),
                .COUNT_WIDTH(CHANNEL_COUNT_WIDTH                )
            ) fifo_channel(
                .clk        (clk                                ), 
                .reset      (subcomponent_reset                 ), 
                .full       (channel_input_pc_not_ready         ), 
                .din        (channel_input_pc_and_current  [i]  ),  
                .wr_en      (channel_input_pc_valid        [i]  ), 
                .rd_en      (station_input_pc_ready        [i]  ), 
                .dout       (station_input_pc_and_current  [i]  ), 
                .empty      (station_input_pc_not_valid         ), 
                .data_count (channel_count                      )
            );

            assign channel_input_pc_ready  [i] = ~  channel_input_pc_not_ready;
            assign station_input_pc_valid  [i] = ~  station_input_pc_not_valid;


            assign channel_input_pc_latency[i] = tmp_channel_input_latency + channel_count ;
           
           
            always_ff @( posedge clk ) begin : create_tmp_channel_input_latency
                if(subcomponent_reset)  tmp_channel_input_latency   <= 0;
                else                    tmp_channel_input_latency   <= station_input_pc_latency[i] +1;
            end 
 
            assign station_output_pc_latency       [i] = channel_output_pc_latency       [i];
            assign station_output_pc_ready         [i] = channel_output_pc_ready         [i];
            assign channel_output_pc_and_current   [i] = station_output_pc_and_current   [i];
            assign channel_output_pc_valid         [i] = station_output_pc_valid         [i];     


            if(i==0)
            begin

                arbiter_fixed #(
                    .DWIDTH(PC_WIDTH+1),
                    .PRIORITY_0(1)
                ) arbiter_to_override_pc_at_bb_0_input (
                    .in_0_ready( override_pc_ready                      ),
                    .in_0_data ( override_pc_and_current                ),
                    .in_0_valid( override_pc_valid                      ),
                    .in_1_ready( channel_output_pc_ready       [BB_N-1] ),
                    .in_1_data ( channel_output_pc_and_current [BB_N-1] ),
                    .in_1_valid( channel_output_pc_valid       [BB_N-1] ),
                    .out_ready ( channel_input_pc_ready        [0   ]   ),
                    .out_data  ( channel_input_pc_and_current  [0   ]   ),
                    .out_valid ( channel_input_pc_valid        [0   ]   )
                );

                assign channel_output_pc_latency[BB_N-1] = channel_input_pc_latency[0  ];
            end
            else
            begin

                assign channel_output_pc_latency     [i-1]  = channel_input_pc_latency          [i];
                assign channel_output_pc_ready       [i-1]  = channel_input_pc_ready            [i];
                assign channel_input_pc_and_current  [i]    = channel_output_pc_and_current   [i-1];
                assign channel_input_pc_valid        [i]    = channel_output_pc_valid         [i-1]; 
            end
        end
    endgenerate
    

    generate
        for (i=0; i < BB_N; i++) 
        begin
            assign tmp_bb_accepts       [i] = bb_accepts            [i];
            assign tmp_bb_running       [i] = bb_running            [i];
            assign tmp_channel_not_empty[i] = station_input_pc_valid[i];
        end
    endgenerate

    assign any_bb_accept  =  |tmp_bb_accepts;

    assign any_bb_running = (|tmp_bb_running ) || (|tmp_channel_not_empty) ;
    
    
    arbiter_rr_n #(
        .DWIDTH(MEMORY_ADDR_WIDTH),
        .N(BB_N)
    ) arbiter_tree_to_cope_with_memory_contention (
        .clk       ( clk                       ),
        .reset     ( subcomponent_reset        ),
        .in_ready  ( memory_ready_for_bb       ),
        .in_data   ( memory_addr_for_bb        ),
        .in_valid  ( memory_valid_for_bb       ),
        .out_ready ( memory_ready_bb_arbitred  ),
        .out_data  ( memory_addr_bb_arbitred   ),
        .out_valid ( memory_valid_bb_arbitred  )
    );


    arbiter_fixed #(
        .DWIDTH(MEMORY_ADDR_WIDTH),
        .PRIORITY_0(1)
    ) arbiter_for_memory_contention_bbs_and_cc (
        .in_0_ready( memory_ready_for_cc           ),
        .in_0_data ( memory_addr_for_cc            ),
        .in_0_valid( memory_valid_for_cc           ),
        .in_1_ready( memory_ready_bb_arbitred      ),
        .in_1_data ( memory_addr_bb_arbitred       ),
        .in_1_valid( memory_valid_bb_arbitred      ),
        .out_ready ( memory_ready                  ),
        .out_data  ( memory_addr                   ),
        .out_valid ( memory_valid                  )
    );


    assign memory_data_for_cc = memory_data;
    
endmodule