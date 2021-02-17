//
//         +-----------------------------------------------------+
//         |                                                     |
//         |     +-------------+                                 |
//         |     |             |                                 |
//         |     |   Engine    |                                 |
//         |     |             |                                 |
//         |     +----^--------+                                 |
//         |          |    |                                     |
//         |          |    |                                     |
//         |          |    |                                     |
//         |     +---------v-----+           +---------------+   |
//         |     |   o_0  i_0    |           |               |   |
//  +------------>i_1 Station o_1+----------->  Channel      +--------->
//         |     |               |           |               |   |
//         |     +---------------+           +---------------+   |
//         |                                                     |
//         +-----------------------------------------------------+

module engine_and_station#(
    parameter  PC_WIDTH            = 8 ,
    parameter  LATENCY_COUNT_WIDTH = 8 ,
    parameter  FIFO_COUNT_WIDTH    = 6 ,
    parameter  CHARACTER_WIDTH     = 8 ,
    parameter  MEMORY_WIDTH        = 16,
    parameter  MEMORY_ADDR_WIDTH   = 11,
    parameter  CACHE_WIDTH_BITS    = 0, 
    parameter  CACHE_BLOCK_WIDTH_BITS   = 2 ,
    parameter  PIPELINED                = 0,
    parameter  CONSIDER_PIPELINE_FIFO   = 0
)(
    input wire          clk,
    input wire          rst,
    input wire [CHARACTER_WIDTH-1  :0]    cur_cc, 
    input wire                            cur_is_even_character,
    memory_read_iface.out memory,

    channel_iface.in      in,
    channel_iface.out     out,

    input   wire          enable,
    output  wire          bb_accepts,      
    output  wire          bb_running,      
    output  wire          bb_full   
);
    channel_iface                  #(.N(PC_WIDTH+1), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) switch2cpu()            ;
    channel_iface                  #(.N(PC_WIDTH+1), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) cpu2switch()            ;
    channel_iface                  #(.N(PC_WIDTH+1), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) switch2channel()        ;
    //station for each bb.
    wire engine_full, engine_running;
   
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
        .PIPELINED              (PIPELINED                      )
    ) anEngine (
        .clk                    (clk                            ),
        .rst                    (rst                            ), 
        .cur_is_even_character  (cur_is_even_character          ),
        .current_character      (cur_cc                         ),
        .enable                 (enable                         ),
        .running                (engine_running                 ),
        .accepts                (bb_accepts                     ),
        .memory                 (memory                         ),
        .in                     (switch2cpu.in                  ),
        .out                    (cpu2switch.out                 ),
        .full                   (engine_full                    )
    );
//memory data are broadcasted but only module which receives a ready 
//knows that it has won arbitration

//2. channel
channel #(
    .WIDTH(PC_WIDTH+1),
    .CHANNEL_COUNT_WIDTH(FIFO_COUNT_WIDTH),
    .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)
)aChannel(
    .clk(clk                ),
    .rst(rst                ),
    .in (switch2channel.in  ),
    .out(out                )
);

//2. output switch 
switch station (
    .in_0   (cpu2switch.in      ),
    .out_0  (switch2cpu.out     ),
    .in_1   (in                 ),
    .out_1  (switch2channel.out )
); 

    assign bb_full    = !switch2channel.ready && engine_full;
    assign bb_running = switch2channel.valid || engine_running ;

endmodule