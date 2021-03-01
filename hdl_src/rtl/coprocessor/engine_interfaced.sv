module engine_interfaced #(
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
    parameter  CC_ID_BITS               = 1
) (
    input  wire                                         clk                    ,
    input  wire                                         rst                    , 
    output wire                                         accepts                ,
    output wire                                         running                ,
    output wire                                         full                   ,
    input  wire [(2**CC_ID_BITS)-1:0]                   enable_chars           ,
    output wire [(2**CC_ID_BITS)-1:0]                   elaborating_chars      ,
    input  wire [(2**CC_ID_BITS)*CHARACTER_WIDTH-1  :0] current_characters     ,
    input  wire                                         new_char               ,      
    memory_read_iface.out                               memory                 ,
    channel_iface.in                                    in                     ,
    channel_iface.out                                   out                    
);

    engine #(
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
    ) anEngine (
        .clk                        (clk                        ),
        .rst                        (rst                        ),
        .accepts                    (accepts                    ),
        .running                    (running                    ),
        .full                       (full                       ),
        .enable_chars               (enable_chars               ),
        .elaborating_chars          (elaborating_chars          ),
        .current_characters         (current_characters         ),
        .new_char                   (new_char                   ),
        .memory_ready               (memory.ready               ),
        .memory_addr                (memory.addr                ),
        .memory_data                (memory.data                ),
        .memory_valid               (memory.valid               ),
        .input_pc_valid             (in.valid                   ),
        .input_pc_and_cc_id         (in.data                    ),
        .input_pc_ready             (in.ready                   ),
        .input_pc_latency           (in.latency                 ),
        .output_pc_valid            (out.valid                  ),
        .output_pc_and_cc_id        (out.data                   ),
        .output_pc_ready            (out.ready                  )
        //.output_pc_latency      (out.latency ),
        
    );
    //Unused input
    wire _unused_ok;
    assign _unused_ok = &{1'b0, out.latency};
    
endmodule