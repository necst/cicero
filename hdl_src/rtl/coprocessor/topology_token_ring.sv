module topology_token_ring #(
    parameter  BB_N                     = 1,
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
    memory_read_iface               #(.MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), .MEMORY_WIDTH(MEMORY_WIDTH))  memory_bb [BB_N-1:0] ();
    //signals for basic blocks
    wire  [BB_N-1:0]               bb_running, bb_accepts, bb_full ;
    //station for each bb.
    channel_iface                   #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) channel_i [BB_N:0] ();
	//
	logic [(2**CC_ID_BITS)-1:0]    bb_elaborating_chars [BB_N-1:0];
	always_comb 
	begin
		for (int j=0; j<(2**CC_ID_BITS) ; j++) 
		begin
			reg [BB_N-1:0] tmp_elaborating_chars_i;
			for (int i=0; i<BB_N ; i++) 
			begin
				tmp_elaborating_chars_i[i] = bb_elaborating_chars[i][j];
			end
			elaborating_chars[j] = |( tmp_elaborating_chars_i );
		end
	end
	
    /// sub modules
	 genvar i;
	 
	 generate
    for (i = 0; i < BB_N; i+=1) 
    begin : gen_engine_and_station
        
        
        engine_and_station #(
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
            .bb_accepts             (bb_accepts[i]                  ),      
            .bb_running             (bb_running[i]                  ),      
            .bb_full                (bb_full[i]                     ),
			.elaborating_chars		(bb_elaborating_chars[i]     	),
            .cur_window_end_of_s    (cur_window_end_of_s            ),
            .cur_window_enable      (cur_window_enable              ),
            .cur_window             (cur_window                     ), 
			.new_char				(new_char						),
            .memory                 (memory_bb[i]                   ),
            .in                     (channel_i[i].in                ),
            .out                    (channel_i[i+1].out             )
        );

        
    end
	 endgenerate


    arbiter_2_fixed #(
        .DWIDTH(PC_WIDTH+CC_ID_BITS)
    ) arbiter_tree_to_cope_with_pc_insertion (
        .in_0_ready  ( override.ready            ),
        .in_0_data   ( override.data             ),
        .in_0_valid  ( override.valid            ),
        .in_1_ready  ( channel_i[BB_N].ready     ),
        .in_1_data   ( channel_i[BB_N].data      ),
        .in_1_valid  ( channel_i[BB_N].valid     ),
        .out_ready   ( channel_i[0].ready        ),
        .out_data    ( channel_i[0].data         ),
        .out_valid   ( channel_i[0].valid        )
    );
    assign override.latency         = channel_i[0].latency;
    assign channel_i[BB_N].latency  = channel_i[0].latency;

    //accept signal is simply or reduction of bb_accepts
    assign any_bb_accept  =  |bb_accepts;
    //running signal is defined high if any bb/channel contain an instruction
    assign any_bb_running =  |bb_running;
    assign all_bb_full    =  &(bb_full); 
    

    //wires to connect to generic bit arbiter
    wire                               memory_ready_muxed [BB_N:0];
    wire [MEMORY_ADDR_WIDTH-1:0]       memory_addr_muxed  [BB_N:0];
    wire                               memory_valid_muxed [BB_N:0];

    assign     memory_cc.ready           = memory_ready_muxed [BB_N];
    assign     memory_addr_muxed  [BB_N] = memory_cc.addr           ;
    assign     memory_valid_muxed [BB_N] = memory_cc.valid          ;
	 generate
    for (i = 0; i < BB_N ; i+=1 ) 
    begin : gen_mem_signals
        assign memory_bb[i].ready        = memory_ready_muxed    [i];
        assign memory_addr_muxed     [i] = memory_bb[i].addr        ;
        assign memory_valid_muxed    [i] = memory_bb[i].valid       ;
    end
	 endgenerate


    arbiter_rr_n #(
        .DWIDTH(MEMORY_ADDR_WIDTH),
        .N(BB_N+1) //memory_.*for_cc is mixed with memory_.*for_bb
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
    for (i = 0 ; i < BB_N ; i+=1 ) 
    begin : gen_mem_bb
        assign memory_bb[i].data  = memory.data;
        assign memory_bb[i].broadcast_addr  = memory.broadcast_addr  ;
        assign memory_bb[i].broadcast_valid = memory.broadcast_valid ;
    end
	 endgenerate

    

endmodule