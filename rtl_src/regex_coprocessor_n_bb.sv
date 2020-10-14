`timescale 1ns/1ps
//The regex_coprocessor_nn_bb is in charge of :
// - supplying control signal for the underlying basic clock (e.g. current_character,cur_is_even_character,.. )
// - reading output signals from a basic block  (e.g. running, accepts, )
// - implementing the logic to move from current character to the next character.
// - expose control signals to control the overal logic of the coprocessor
//                      +----------------------------------------------------------------------------------------------------------------+
//                      | Regex_coprocessor                                                                                              |
//                      |         +-------------------------------------------+                                                          |
//                      |         |                                           |                                                          |
//                      |         |                                          ....                                                        |
//                      |         |                              +------------------+                                                    |
//                      |         |                              |     arbiter rr   |                                                    |
//                      |         |                              -------------------+                                                    |
//                      |         |                                -/            \------------------------------                         |
//                      |         |                       +-------/----+                                        \-----------------+      |
//                      |         |                       | arbiter rr |                                             | arbiter rr |      |
//                      |         |                       +------|-----+                                             +------|-----+      |
//                      |         |              memory_*_for_bb |                                                          |            |
//                      |         |                       +------|-----+                                             +------|-----+      |
//                      |         |                       |Basic block |                                             |Basic block |      |
//                      |         |                       |            |                                             |            |      |
//                      |         |                       +---|-----^--+                                             +---|-----^--+      |
//                      |         |                           |     |                                                    |     |         |
//                      | arbiter |                           v     |                 +--------------------------+       v     |         |
//                      | with    |                       +---------|--+              |       +----------------+ |   +---------|--+      |
//                      | fixed   |         +--------+    |  I0     O0 |    data      |   /---| fifo    |      ---   |  I0     O0 |      |
//         +----------+ | priority|   +-----|channel ----->            -------------------    +-------/-|------+ |\-->            ----+  |
//         |          | | +-----+ |   | +---|        <-----  I1     O1 <--------------<---\   +---------v------+ | ---  I1     O1 <-+ |  |
//         |memory    | | |     | |   | |   +--------+    |   switch   |    latency   |    ---| latency update <--/  |   switch   | | |  |
//         |          ----|     --+   | |                 |  (station) |              |channel+----------------+ |   |  (station) | | |  |
//         |          | | |     --+   | |                 +------------+              +--------------------------+   +------------+ | |  |
//         |          | | +-----+ |   | +------------------------------------->-----------------------------------------------------+ |  |
//         |          | |         |   |              +------------+                                                                   |  |
//         +----------+ |         |   |              |  arbiter   |                                                                   |  |
//                      |         |   +---------------  fixed prio<-------------------------------------------------------------------+  |
//                      |         |                  +------------+                                                                      |
//       control signals|         +---------------------+   |                                                                            |
//                 -------------------------------> +---|---+--------+                                                                   |
// finish/accept signals|                           |FSM of regex    |                                                                   |
//                 <--------------------------------|coprocessor     |                                                                   |
//                      |                           +----------------+                                                                   |
//                      +----------------------------------------------------------------------------------------------------------------
//
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
      
    
    //MEMORY
    //1. provide memory access for FSM outside the basic block
    logic                           memory_ready_for_cc ;
    logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr_for_cc  ;
    logic[MEMORY_WIDTH-1     :0]    memory_data_for_cc  ;
    logic                           memory_valid_for_cc ;
    //2. provide memory access for BB (note that to create a tree of arbiters are required 2*#BB -1 arbiters)
    logic                            memory_ready_for_bb     [BB_N-1:0];
    logic[MEMORY_ADDR_WIDTH-1:0]     memory_addr_for_bb      [BB_N-1:0];
    logic[MEMORY_WIDTH-1     :0]     memory_data_for_bb      [BB_N-1:0];
    logic                            memory_valid_for_bb     [BB_N-1:0];
    wire                             memory_ready_bb_arbitred     ;
    wire [MEMORY_ADDR_WIDTH-1:0]     memory_addr_bb_arbitred      ;
    wire                             memory_valid_bb_arbitred     ;

    //signals for basic blocks
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
    //temporary signals to create a single bit any_bb_accept/any_bb_running
    logic [BB_N-1:0] tmp_bb_accepts;
    logic [BB_N-1:0] tmp_bb_running;
    logic [BB_N-1:0] tmp_channel_not_empty;
    logic [BB_N-1:0] tmp_bb_input_pc_ready;
    //to fill basic block 0 with first instruction
    logic                           override_pc_ready;
    logic [PC_WIDTH-1:0]            override_pc;
    logic                           override_pc_current;
    logic [PC_WIDTH:0]              override_pc_and_current;
    logic                           override_pc_valid;
    logic                           override_pc_directed_to_current;
    assign override_pc_directed_to_current  = 1'b1;
    assign override_pc_and_current          = {override_pc, override_pc_directed_to_current};

    //1 station for each bb.
    logic                           station_input_pc_valid       [BB_N-1:0];
    logic[PC_WIDTH-1+1:0]           station_input_pc_and_current [BB_N-1:0]; 
    logic                           station_input_pc_ready       [BB_N-1:0];
    logic[LATENCY_COUNT_WIDTH-1:0]  station_input_pc_latency     [BB_N-1:0];
    logic                           station_output_pc_valid      [BB_N-1:0];
    logic[PC_WIDTH-1+1:0]           station_output_pc_and_current[BB_N-1:0];
    logic                           station_output_pc_ready      [BB_N-1:0];
    logic[LATENCY_COUNT_WIDTH-1:0]  station_output_pc_latency    [BB_N-1:0];
    //interconnection
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

    //FSM surpevisioning the basic block
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
    begin //realize next state function
        next_state              = cur_state;
        next_cc_pointer         = cur_cc_pointer;
        next_cc                 = cur_cc;
        next_is_even_character  = cur_is_even_character;
        //default signal
        start_valid             = 1'b0;
        finish                  = 1'b0;
        accept                  = 1'b0;
        error                   = 1'b0;
        //for memory req override
        memory_addr_for_cc     = { (MEMORY_ADDR_WIDTH) {1'b0} };
        memory_valid_for_cc    = 1'b0;
        //for pc override
        override_pc            = { (PC_WIDTH){1'b0}           };
        override_pc_valid      = 1'b0;
        //reset subcomponents is a reset is given
        if (reset == 1'b1)   subcomponent_reset = 1'b1;
        else                 subcomponent_reset = 1'b0;
        //basic bock computation default disabled
        bbs_go                 = 1'b0;
        case(cur_state)
        REGEX_COPRO_S_IDLE:
        begin
            //prepare signals to fetch first character at the next clock cycle
            
            memory_addr_for_cc  = start_cc_pointer[C_ADDR_OFFSET+: MEMORY_ADDR_WIDTH];
            memory_valid_for_cc = 1'b1;
            
            //if memory answer affirmatively and start signal is raised start
            if(start_ready && memory_ready_for_cc ) 
            begin
                next_state          = REGEX_COPRO_S_FETCH_1ST_CC;
                //start_cc_pointer is a quad-word address while regex_coprocessor_memory interface handles
                //dual-word address. we have to concatenate a bit. 
                //First char of the string is assumed to be allineated to 32 bits  
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
            //at the previous clock cycle the memory has been requested to issue the next
            //current character
            
            next_cc    = memory_data[CHARACTER_WIDTH*cur_cc_pointer[0+:C_ADDR_OFFSET]+:CHARACTER_WIDTH];
            //if the basic block immediately show not to have any work to do
            //for the current character
            //means that the regular expression does not match the string.
            if(any_bb_running)  next_state = REGEX_COPRO_S_EXEC;
            else                next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
              
        end
        REGEX_COPRO_S_EXEC:
        begin
            //basic bock computation enable
            bbs_go          = 1'b1;
            if(any_bb_accept)
            begin // if during execution phase one basic block raise accept: end computations!
                next_state  = REGEX_COPRO_S_COMPLETE_ACCEPTING;
            end
            else if( ~ any_bb_running ) 
            begin // if all basic blocks have finished to execute instructions related to current char it's time to move to the next character
                if( cur_cc == CHARACTER_TERMINATOR)
                begin //if we reach the end of the string (i.e. current char is terminator) 
                    next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
                end
                else  // otherwise we have still work to do
                begin // ask for new current character
                    //TODO: avoid asking character if tmp_cur_cc[0] == 1
                    logic [REG_WIDTH-1:0] tmp_cur_cc_increment ;
                    tmp_cur_cc_increment= cur_cc_pointer + 1;
                    memory_valid_for_cc = 1'b1;
                    //memory with 2B width support only even aligned adresses
                    memory_addr_for_cc  = tmp_cur_cc_increment [C_ADDR_OFFSET+: MEMORY_ADDR_WIDTH];
                   
                    if( memory_ready_for_cc)
                    begin //if memory answers affermatively go to state where at next cc memory data is latched in current character register.
                          //update is_even_character ff 
                        next_state              = REGEX_COPRO_S_FETCH_NEXT_CC;
                        next_cc_pointer         = tmp_cur_cc_increment;
                        next_is_even_character  = ~ cur_is_even_character;
                    end
                end
                
            end
            else if ( (|tmp_bb_input_pc_ready) == 1'b0 && ( (|tmp_channel_not_empty) == 1'b1)) 
            begin // if there's an instruction that should be saved but no one is able to save it 
                next_state = REGEX_COPRO_S_ERROR;
            end
        end
        REGEX_COPRO_S_COMPLETE_ACCEPTING:
        begin
            finish = 1'b1;
            accept = 1'b1;
            next_state = REGEX_COPRO_S_IDLE;
            //flush subcomponents (e.g. fifos inside bb)
            subcomponent_reset = 1'b1;
        end
        REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING:
        begin
            finish = 1'b1;
            accept = 1'b0;
            next_state = REGEX_COPRO_S_IDLE;
            //flush subcomponents (e.g. fifos inside bb)
            subcomponent_reset = 1'b1;
        end
        REGEX_COPRO_S_ERROR:
        begin
            error = 1'b1;
        end
        endcase
    end

    /// Moduleinstances
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
            // internal signals
            logic [LATENCY_COUNT_WIDTH-1:0] tmp_channel_input_latency  ;
            logic                           channel_input_pc_not_ready ;
            logic                           station_input_pc_not_valid ;
            logic [CHANNEL_COUNT_WIDTH-1:0] channel_count              ;

            //1. basic block
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
            //memory data are broadcasted but only memory which receives ready 
            //knows that at next cc it would be its turn.
            assign memory_data_for_bb[i] = memory_data;
            //2. output switch 
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


            //3. create incoming channel that preeceed the station
            fifo #(
                .DWIDTH     (PC_WIDTH+1                         ),
                .COUNT_WIDTH(CHANNEL_COUNT_WIDTH                )
            ) fifo_channel(
                .clk        (clk                                ), 
                .reset      (subcomponent_reset                 ), 
                .full       (channel_input_pc_not_ready         ), //equivalent to not data_in_ready
                .din        (channel_input_pc_and_current  [i]  ),  
                .wr_en      (channel_input_pc_valid        [i]  ), //equivalent to data_in_valid
                .rd_en      (station_input_pc_ready        [i]  ), //equivalent to data_out_ready
                .dout       (station_input_pc_and_current  [i]  ), 
                .empty      (station_input_pc_not_valid         ), //equivalent to not data_out_valid
                .data_count (channel_count                      )
            );

            assign channel_input_pc_ready  [i] = ~  channel_input_pc_not_ready;
            assign station_input_pc_valid  [i] = ~  station_input_pc_not_valid;

            //3.2. compute ~estimated number of clock cycles the data is going to wait
            //     before being served on this channel.
            assign channel_input_pc_latency[i] = tmp_channel_input_latency + channel_count ;
           
           
            always_ff @( posedge clk ) begin : create_tmp_channel_input_latency
                if(subcomponent_reset)  tmp_channel_input_latency   <= 0;
                else                    tmp_channel_input_latency   <= station_input_pc_latency[i] +1;
            end 
            
            //always_ff @( posedge clk ) begin : create_tmp_channel_input_latency
            //    if(subcomponent_reset)  channel_input_pc_latency[i]   <= 0;
            //    else                    channel_input_pc_latency[i]   <= station_input_pc_latency[i] + channel_count + 1;
            //end 
            //4. create outcoming i 
            assign station_output_pc_latency       [i] = channel_output_pc_latency       [i];
            assign station_output_pc_ready         [i] = channel_output_pc_ready         [i];
            assign channel_output_pc_and_current   [i] = station_output_pc_and_current   [i];
            assign channel_output_pc_valid         [i] = station_output_pc_valid         [i];     

            //5 connect channel input[i] with channel output [i-1]
            if(i==0)
            begin
                //add a way to supply an instruction
                //5.a for the first station close the loop and add a way to supply an instruction
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
                //5.b connect outcoming i-1 and incoming i
                assign channel_output_pc_latency     [i-1]  = channel_input_pc_latency          [i];
                assign channel_output_pc_ready       [i-1]  = channel_input_pc_ready            [i];
                assign channel_input_pc_and_current  [i]    = channel_output_pc_and_current   [i-1];
                assign channel_input_pc_valid        [i]    = channel_output_pc_valid         [i-1]; 
            end
        end
    endgenerate
    
    //temporary signals to create a single bit any_bb_accept/any_bb_running    
    generate
        for (i=0; i < BB_N; i++) 
        begin
            assign tmp_bb_accepts       [i] = bb_accepts            [i];
            assign tmp_bb_running       [i] = bb_running            [i];
            assign tmp_channel_not_empty[i] = station_input_pc_valid[i];
        end
    endgenerate
    //accept signal is simply or reduction of bb_accepts
    assign any_bb_accept  =  |tmp_bb_accepts;
    //running signal is defined high if any bb/channel contain an instruction
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

    //memory data are broadcasted but only memory which receives ready 
    //knows that at next cc it would be its turn.
    assign memory_data_for_cc = memory_data;
    
endmodule