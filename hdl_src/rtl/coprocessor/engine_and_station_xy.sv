//
//                                                             +-----------------+
//                                                             |                 |
//                                                             |    Cpu          |
//                  +                                          |                 |
//                  |                                          +------^----------+
//                  |                                                 |    |
//                  |                                                 |    |
//                  |                                                 |    |
//             +----v-----------+                              +-----------v-----+
//             |   y_in         |        +------------+        |   s2cpu  cpu2s  |       +------------+
//   +---------> x_in    tmp_ch +-------->            +--------> tmp_ch     x_out+------->            +------>
//             |                |        |  ch        |        |                 |       |  ch        |
//             |   Station_xy   |        |            |        |   Station_x_out |       |            |
//             |                |        |            |        |                 |       |            |
//             |   y_out        |        +------------+        |                 |       +------------+
//             +----------------+                              +-----------------+
//                  |
//                  |
//                  |
//               +--v---------+
//               |            |
//               |            |
//               |  ch        |
//               |            |
//               |            |
//               |            |
//               +------------+
//                  |
//                  |
//                  v
//


module engine_and_station_xy#(
    parameter  PC_WIDTH            = 8 ,
    parameter  LATENCY_COUNT_WIDTH = 8 ,
    parameter  FIFO_COUNT_WIDTH    = 6 ,
    parameter  CHARACTER_WIDTH     = 8 ,
    parameter  MEMORY_WIDTH        = 16,
    parameter  MEMORY_ADDR_WIDTH   = 11,
    parameter  CACHE_WIDTH_BITS    = 0, 
    parameter  CACHE_BLOCK_WIDTH_BITS   = 2 ,
    parameter  PIPELINED                = 0,
    parameter  CONSIDER_PIPELINE_FIFO   = 0,
	parameter  CC_ID_BITS   			= 2
)(
    input 	wire          	clk,
    input 	wire          	rst,
    output  wire          	bb_accepts,      
    output  wire          	bb_running,      
    output  wire          	bb_full   ,
	output  wire [(2**CC_ID_BITS)-1:0]                      elaborating_chars,
    input	wire [(2**CC_ID_BITS)-1:0]                      cur_window_end_of_s,
    input	wire [(2**CC_ID_BITS)-1:0]                      cur_window_enable,
    input 	wire [((2**CC_ID_BITS)*CHARACTER_WIDTH)-1  :0]  cur_window, 
	input 	wire										    new_char,
    memory_read_iface.out memory,
    channel_iface.in      x_in,
    channel_iface.in      y_in,
    channel_iface.out     x_out,
    channel_iface.out     y_out
);
    channel_iface                  #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) switch2cpu() ;
    channel_iface                  #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) cpu2switch() ;
    channel_iface                  #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) s2x_out()    ;
    channel_iface                  #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) s2y_out()    ;
    channel_iface                  #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) s2ch_tmp()   ;
    channel_iface                  #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) ch_tmp2s()   ;
    //station for each bb.
    wire engine_full, engine_running;
    wire [(2**CC_ID_BITS)-1:0] elaborating_chars_channel_x_out, elaborating_chars_channel_y_out, elaborating_chars_channel_tmp, elaborating_chars_engine;
   
    //1. basic block
    engine_interfaced #(
        .PC_WIDTH               (PC_WIDTH                       ),
        .LATENCY_COUNT_WIDTH    (LATENCY_COUNT_WIDTH            ),
        .FIFO_COUNT_WIDTH       (FIFO_COUNT_WIDTH               ),
        .CHARACTER_WIDTH        (CHARACTER_WIDTH                ),
        .MEMORY_WIDTH           (MEMORY_WIDTH                   ),
        .MEMORY_ADDR_WIDTH      (MEMORY_ADDR_WIDTH              ),
        .CACHE_WIDTH_BITS       (CACHE_WIDTH_BITS               ),
        .CACHE_BLOCK_WIDTH_BITS (CACHE_BLOCK_WIDTH_BITS         ),
        .PIPELINED              (PIPELINED                      ),
		.CC_ID_BITS				(CC_ID_BITS						)
    ) anEngine (
        .clk                    (clk                            ),
        .rst                    (rst                            ), 
        .accepts                (bb_accepts                     ),
        .running                (engine_running                 ),
        .full                   (engine_full                    ),
		.elaborating_chars		(elaborating_chars_engine		),
        .cur_window_end_of_s    (cur_window_end_of_s            ),
        .cur_window_enable	    (cur_window_enable			    ),
        .cur_window             (cur_window                     ),
        .new_char               (new_char                       ),
        .memory                 (memory                         ),
        .in                     (switch2cpu.in                  ),
        .out                    (cpu2switch.out                 )
    );
//memory data are broadcasted but only module which receives a ready 
//knows that it has won arbitration

//2. channels
channel_multi_cc #(
    .PC_WIDTH(PC_WIDTH),
    .CC_ID_BITS(CC_ID_BITS),
    .CHANNEL_COUNT_WIDTH(FIFO_COUNT_WIDTH),
    .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)
)ch_x_out(
    .clk(clk                ),
    .rst(rst                ),
    .in (s2x_out.in         ),
    .out(x_out              ),
    .present_cc_id(elaborating_chars_channel_x_out)
);

channel_multi_cc #(
    .PC_WIDTH(PC_WIDTH),
    .CC_ID_BITS(CC_ID_BITS),
    .CHANNEL_COUNT_WIDTH(FIFO_COUNT_WIDTH),
    .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)
)ch_y_out(
    .clk(clk                ),
    .rst(rst                ),
    .in (s2y_out.in         ),
    .out(y_out              ),
    .present_cc_id(elaborating_chars_channel_y_out)
);

channel_multi_cc #(
    .PC_WIDTH(PC_WIDTH),
    .CC_ID_BITS(CC_ID_BITS),
    .CHANNEL_COUNT_WIDTH(FIFO_COUNT_WIDTH),
    .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)
)ch_tmp(
    .clk(clk                ),
    .rst(rst                ),
    .in (s2ch_tmp.in        ),
    .out(ch_tmp2s.out       ),
    .present_cc_id(elaborating_chars_channel_tmp)
);


//2. output switch 
switch station_xy (
    .in_0   (y_in               ),
    .out_0  (s2y_out.out        ),
    .in_1   (x_in               ),
    .out_1  (s2ch_tmp.out )
); 

//2. output switch 
switch station_cpu_or_x_out (
    .in_0   (cpu2switch.in      ),
    .out_0  (switch2cpu.out     ),
    .in_1   (ch_tmp2s.in        ),
    .out_1  (s2x_out.out )
); 
    assign elaborating_chars = elaborating_chars_channel_x_out | elaborating_chars_channel_y_out |elaborating_chars_channel_tmp | elaborating_chars_engine;
    assign bb_full          = !s2y_out.ready && !s2x_out.ready && !s2ch_tmp.ready && engine_full ;
    assign bb_running       = y_out.valid || x_out.valid || ch_tmp2s.valid || engine_running ;

endmodule