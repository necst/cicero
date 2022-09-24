module topology_mesh #(
    parameter  BB_N_X                   = 2 ,
    parameter  BB_N_Y                   = 2 ,
    parameter  PC_WIDTH                 = 8 ,
    parameter  LATENCY_COUNT_WIDTH      = 8 ,
    parameter  FIFO_COUNT_WIDTH         = 6 ,
    parameter  CHARACTER_WIDTH          = 8 ,
    parameter  MEMORY_WIDTH             = 16,
    parameter  MEMORY_ADDR_WIDTH        = 11,
    parameter  CACHE_WIDTH_BITS         = 0 , 
    parameter  CACHE_BLOCK_WIDTH_BITS   = 2 ,
    parameter  PIPELINED                = 0 ,
    parameter  CONSIDER_PIPELINE_FIFO   = 0 ,
    parameter  CC_ID_BITS               = 1
) (
    input   wire                                            clk,
    input   wire                                            rst,
    output  logic                                           any_bb_accept,
    output  logic                                           any_bb_running,
    output  logic                                           all_bb_full,     
    output  logic[(2**CC_ID_BITS)-1:0]                      elaborating_chars,
    input   wire [(2**CC_ID_BITS)-1:0]                      cur_window_end_of_s,
    input   wire [(2**CC_ID_BITS)-1:0]                      cur_window_enable,
    input   wire [(2**CC_ID_BITS)*CHARACTER_WIDTH-1  :0]    cur_window, 
    input   wire                                            new_char,
    memory_read_iface.out                                   memory,
    channel_iface.in                                        override,
    memory_read_iface.in                                    memory_cc   
);
    //2. provide memory access for BB (note that to create a tree of arbiters  are required 2*#BB -1 arbiters)
    memory_read_iface               #(.MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), .MEMORY_WIDTH(MEMORY_WIDTH))  memory_bb [BB_N_Y-1:0][BB_N_X-1:0] ();
    //signals for basic blocks
    wire  [BB_N_X*BB_N_Y-1:0]       bb_running, bb_accepts, bb_full ;
    //station for each bb.
    channel_iface                   #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH))           channel_x [BB_N_Y:0][BB_N_X:0] ();
    channel_iface                   #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH))           channel_y [BB_N_Y:0][BB_N_X:0] ();
    //
	logic [(2**CC_ID_BITS)-1:0]    bb_elaborating_chars [BB_N_Y:0][BB_N_X:0];
	always_comb 
	begin
		for (int j=0; j<(2**CC_ID_BITS) ; j++) 
		begin
			reg [BB_N_Y*BB_N_X-1:0] tmp_elaborating_chars_i;
			for (int y=0; y < BB_N_Y ; y++) 
                for (int x=0; x < BB_N_X ; x++) 
                begin
                    tmp_elaborating_chars_i[y*BB_N_X+x] = bb_elaborating_chars[y][x][j];
                end
			elaborating_chars[j] = |( tmp_elaborating_chars_i );
		end
	end
    /// sub modules 
    genvar x,y;
    
	 generate
    for (y = 0; y < BB_N_Y; y+=1) 
	 begin : gen_eng_stat_outer
        for (x = 0; x < BB_N_X; x+=1) 
        begin : gen_eng_stat
            
            engine_and_station_xy #(
                .PC_WIDTH                   (PC_WIDTH                   ),
                .LATENCY_COUNT_WIDTH        (LATENCY_COUNT_WIDTH        ),
                .FIFO_COUNT_WIDTH           (FIFO_COUNT_WIDTH           ),
                .CHARACTER_WIDTH            (CHARACTER_WIDTH            ),
                .MEMORY_WIDTH               (MEMORY_WIDTH               ),
                .MEMORY_ADDR_WIDTH          (MEMORY_ADDR_WIDTH          ),
                .CACHE_WIDTH_BITS           (CACHE_WIDTH_BITS           ),
                .CACHE_BLOCK_WIDTH_BITS     (CACHE_BLOCK_WIDTH_BITS     ),
                .PIPELINED                  (PIPELINED                  ),
                .CONSIDER_PIPELINE_FIFO     (CONSIDER_PIPELINE_FIFO     ),
                .CC_ID_BITS                 (CC_ID_BITS                 )
            )engine_and_station_i(
                .clk                    (clk                            ),
                .rst                    (rst                            ),
                .bb_accepts             (bb_accepts [y*BB_N_X+x]        ),      
                .bb_running             (bb_running [y*BB_N_X+x]        ),      
                .bb_full                (bb_full    [y*BB_N_X+x]        ),
                .elaborating_chars      (bb_elaborating_chars[y][x]     ), 
                .cur_window_end_of_s    (cur_window_end_of_s            ),
                .cur_window_enable      (cur_window_enable              ),
                .cur_window             (cur_window                     ),
                .new_char               (new_char                       ),
                .memory                 (memory_bb  [y  ][x]            ),
                .x_in                   (channel_x  [y  ][x].in         ),
                .x_out                  (channel_x  [y  ][x+1].out      ),
                .y_in                   (channel_y  [y  ][x].in         ),
                .y_out                  (channel_y  [y+1][x].out        )
            );

        end
	  end
	  endgenerate

    //              +---+   +---+
    //     +---+    |   |   |   |
    //+--->+ M |  +-v-+ | +-v-+ |
    //     | U +-->CPU+--->CPU+----+
    //   +-> X |  +---+ | +---+ |  |
    //   | +---+    |   |   |   |  |
    //   +-------------------------+
    //              |   |   |   |
    //            +-v-+ | +-v-+ |
    //        +--->CPU+--->CPU+----+
    //        |   +---+ | +---+ |  |
    //        |     |   |   |   |  |
    //        |     +---+   +---+  |
    //        |                    |
    //        +--------------------+

    arbiter_2_fixed #(
        .DWIDTH(PC_WIDTH+CC_ID_BITS)
    ) arbiter_tree_to_cope_with_pc_insertion (
        .in_0_ready  ( override.ready            ),
        .in_0_data   ( override.data             ),
        .in_0_valid  ( override.valid            ),
        .in_1_ready  ( channel_x[0][BB_N_X].ready     ),
        .in_1_data   ( channel_x[0][BB_N_X].data      ),
        .in_1_valid  ( channel_x[0][BB_N_X].valid     ),
        .out_ready   ( channel_x[0][0].ready        ),
        .out_data    ( channel_x[0][0].data         ),
        .out_valid   ( channel_x[0][0].valid        )
    );
    assign override.latency                = channel_x[0][0].latency;
    assign channel_x[0][BB_N_X].latency    = channel_x[0][0].latency;
    
    //   +----+
    //   |    |
    // +-v-+  |
    // |   |  |
    // +---+  |
    //   |    |
    // +-v-+  |
    // |   |  |
    // +---+  |
    //   |    |
    // +-v-+  |
    // |   |  |
    // +---+  |
    //   |    |
    //   +----+
	 
	 generate
    for (x = 0; x < BB_N_X ; x+=1 )
    begin : gen_ch_y
        assign channel_y[BB_N_Y][x].ready           = channel_y[0     ][x].ready;
        assign channel_y[0     ][x].data            = channel_y[BB_N_Y][x].data ;
        assign channel_y[0     ][x].valid           = channel_y[BB_N_Y][x].valid;        
        assign channel_y[BB_N_Y][x].latency         = channel_y[0     ][x].latency;
    end 
	 endgenerate

    //      +------+    +------+     +------+     +------+
    // +--->+      +--->+      +---->+      +---->+      +----+
    // |    |      |    |      |     |      |     |      |    |
    // |    +------+    +------+     +------+     +------+    |
    // |                                                      |
    // +------------------------------------------------------+

    generate
	 for (y = 1; y < BB_N_Y ; y+=1 )
    begin : gen_ch_x
        assign channel_x[y][BB_N_X].ready           = channel_x[y][0     ].ready;
        assign channel_x[y][0     ].data            = channel_x[y][BB_N_X].data ;
        assign channel_x[y][0     ].valid           = channel_x[y][BB_N_X].valid;        
        assign channel_x[y][BB_N_X].latency         = channel_x[y][0     ].latency;
    end
	 endgenerate 

    //accept signal is simply or reduction of bb_accepts
    assign any_bb_accept  =  |bb_accepts;
    //running signal is defined high if any bb/channel contain an instruction
    assign any_bb_running =  |bb_running;
    assign all_bb_full    =  &(bb_full); 
    

    //wires to connect to generic bit arbiter remember there are BB_N_Y*BB_N_X + 1 (memory_cc) requests
    wire                               memory_ready_muxed [BB_N_Y*BB_N_X:0];
    wire [MEMORY_ADDR_WIDTH-1:0]       memory_addr_muxed  [BB_N_Y*BB_N_X:0];
    wire                               memory_valid_muxed [BB_N_Y*BB_N_X:0];
    
	 generate
    for (y = 0; y < BB_N_Y ; y+=1 )
	 begin : gen_mem_outer
        for (x = 0; x < BB_N_X ; x+=1 ) 
        begin : gen_mem
            assign memory_bb[y][x].ready              = memory_ready_muxed    [y*BB_N_X+x];
            assign memory_addr_muxed     [y*BB_N_X+x] = memory_bb[y][x].addr              ;
            assign memory_valid_muxed    [y*BB_N_X+x] = memory_bb[y][x].valid             ;
        end
    end
	 endgenerate
    assign     memory_cc.ready                    = memory_ready_muxed [BB_N_Y*BB_N_X]    ;
    assign     memory_addr_muxed  [BB_N_Y*BB_N_X] = memory_cc.addr                        ;
    assign     memory_valid_muxed [BB_N_Y*BB_N_X] = memory_cc.valid                       ;


    arbiter_rr_n #(
        .DWIDTH(MEMORY_ADDR_WIDTH),
        .N(BB_N_Y*BB_N_X+1) //memory_.*for_cc is mixed with memory_.*for_bb
    ) arbiter_tree_to_cope_with_memory_contention (
        .clk         ( clk                       ),
        .rst         ( rst                       ),
        .in_ready    ( memory_ready_muxed        ),
        .in_data     ( memory_addr_muxed         ),
        .in_valid    ( memory_valid_muxed        ),
        .out_ready   ( memory.ready              ),
        .out_data    ( memory.addr               ),
        .out_valid   ( memory.valid              )
    );

    //memory data is broadcasted but only the module 
    //which receives also a ready knows that it has
    //won the arbitration 
    assign memory_cc.data  = memory.data;
	 generate
    for (y = 0; y < BB_N_Y ; y+=1 )
	 begin : gen_mem_bb_outer
        for (x = 0; x < BB_N_X ; x+=1 ) 
        begin : gen_mem_bb
            assign memory_bb[y][x].data  = memory.data;
            assign memory_bb[y][x].broadcast_addr  = memory.broadcast_addr  ;
            assign memory_bb[y][x].broadcast_valid = memory.broadcast_valid ;
        end
	 end
    endgenerate

    

endmodule