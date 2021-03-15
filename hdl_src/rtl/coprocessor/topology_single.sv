module topology_single #(
    parameter  BB_N                     = 1,
    parameter  PC_WIDTH                 = 8 ,
    parameter  LATENCY_COUNT_WIDTH      = 8 ,
    parameter  FIFO_COUNT_WIDTH         = 6 ,
    parameter  CHARACTER_WIDTH          = 8 ,
    parameter  MEMORY_WIDTH             = 16,
    parameter  MEMORY_ADDR_WIDTH        = 11,
    parameter  CACHE_WIDTH_BITS         = 0, 
    parameter  CACHE_BLOCK_WIDTH_BITS   = 2 ,
    parameter  PIPELINED                = 0,
    parameter  CONSIDER_PIPELINE_FIFO   = 0,
    parameter  CC_ID_BITS               =  1
) (
    input   wire                                            clk,
    input   wire                                            rst,
    output  logic                                           any_bb_accept,
    output  logic                                           any_bb_running,
    output  logic                                           all_bb_full,     
    output  wire [(2**CC_ID_BITS)-1:0]                      elaborating_chars,
    input   wire [(2**CC_ID_BITS)-1:0]                      cur_window_end_of_s,
    input   wire [(2**CC_ID_BITS)-1:0]                      cur_window_enable,
    input   wire [(2**CC_ID_BITS)*CHARACTER_WIDTH-1  :0]    cur_window, 
    input   wire                                            new_char,
    memory_read_iface.out                                   memory,
    channel_iface.in                                        override,
    memory_read_iface.in                                    memory_cc
);
    //2. provide memory access for BB (note that to create a tree of arbiters  are required 2*#BB -1 arbiters)
    memory_read_iface               #(.MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), .MEMORY_WIDTH(MEMORY_WIDTH)) memory_bb[0:0]();
    //2 channel interface 0 input 1 output
    channel_iface                   #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) channel_i [1:0] ();

    /// sub modules 
    
    engine_interfaced #(
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
    ) anEngine(
        .clk                        (clk                        ),
        .rst                        (rst                        ),
        .accepts                    (any_bb_accept              ),      
        .running                    (any_bb_running             ),      
        .full                       (all_bb_full                ),
        .elaborating_chars          (elaborating_chars          ),
        .cur_window_end_of_s        (cur_window_end_of_s        ),
        .cur_window_enable          (cur_window_enable          ),
        .cur_window                 (cur_window                 ), 
        .new_char                   (new_char                   ),
        .memory                     (memory_bb[0]               ),
        .in                         (channel_i[0].in            ),
        .out                        (channel_i[1].out           )
    );


    arbiter_2_fixed #(
        .DWIDTH(PC_WIDTH+CC_ID_BITS)
    ) arbiter_tree_to_cope_with_pc_insertion (
        .in_0_ready  ( override.ready            ),
        .in_0_data   ( override.data             ),
        .in_0_valid  ( override.valid            ),
        .in_1_ready  ( channel_i[1].ready        ),
        .in_1_data   ( channel_i[1].data         ),
        .in_1_valid  ( channel_i[1].valid        ),
        .out_ready   ( channel_i[0].ready        ),
        .out_data    ( channel_i[0].data         ),
        .out_valid   ( channel_i[0].valid        )
    );
    assign override.latency         = channel_i[0].latency;
    assign channel_i[1].latency     = channel_i[0].latency;
    
    arbiter_2_fixed #(
        .DWIDTH(MEMORY_ADDR_WIDTH)
    ) arbiter_tree_to_cope_with_memory_contention (
        .in_0_ready  ( memory_cc.ready           ),
        .in_0_data   ( memory_cc.addr            ),
        .in_0_valid  ( memory_cc.valid           ),
        .in_1_ready  ( memory_bb[0].ready        ),
        .in_1_data   ( memory_bb[0].addr         ),
        .in_1_valid  ( memory_bb[0].valid        ),
        .out_ready   ( memory.ready              ),
        .out_data    ( memory.addr               ),
        .out_valid   ( memory.valid              )
    );
    
    //memory data is broadcasted but only the module 
    //which receives also a ready knows that it has
    //won the arbitration 
    assign memory_cc.data       = memory.data;
    assign memory_bb[0].data    = memory.data;
    
    assign  memory_bb[0].broadcast_addr  = memory.broadcast_addr  ;
    assign  memory_bb[0].broadcast_valid = memory.broadcast_valid ;
endmodule