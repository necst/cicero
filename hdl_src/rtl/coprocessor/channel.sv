module channel #(
    parameter WIDTH              =10   ,
    parameter CHANNEL_COUNT_WIDTH=10   ,
    parameter LATENCY_COUNT_WIDTH=10
)
(
    input wire              clk,
    input wire              rst,
    channel_iface.in        in,
    channel_iface.out       out
);
    wire channel_input_ready    , channel_input_not_ready;
    wire channel_output_valid   , channel_output_not_valid;
    wire [CHANNEL_COUNT_WIDTH-1:0]   fifo_count;

    logic [LATENCY_COUNT_WIDTH-1:0]  channel_old_latency, channel_old_latency_next;

    fifo #(
        .DWIDTH     (WIDTH                     ),
        .COUNT_WIDTH(CHANNEL_COUNT_WIDTH       )
    ) fifo_channel(
        .clk        (clk                       ), 
        .rst        (rst                       ), 
        .full       (channel_input_not_ready   ), //equivalent to not data_in_ready
        .din        (in.data                   ),  
        .wr_en      (in.valid                  ), //equivalent to data_in_valid
        .rd_en      (out.ready                 ), //equivalent to data_out_ready
        .dout       (out.data                  ), 
        .empty      (channel_output_not_valid  ), //equivalent to not data_out_valid
        .data_count (fifo_count                )
    );

    assign in.ready                  = ~  channel_input_not_ready;
    assign out.valid                 = ~  channel_output_not_valid;

    //   compute ~estimated number of clock cycles the data is going to wait
    //   before being served.
    //   assign in.latency                = channel_old_latency + fifo_count ;
    
    
    always_ff @( posedge clk ) begin 
        if(rst)  channel_old_latency <= {{(LATENCY_COUNT_WIDTH-1){1'b0}}, 1'b1};
        else     channel_old_latency <= channel_old_latency_next;
    end 

    always_comb begin
        if( &(out.latency)==1'b1) channel_old_latency_next  = out.latency   ;
        else                      channel_old_latency_next  = out.latency +1;

        if (channel_old_latency + fifo_count < {LATENCY_COUNT_WIDTH{1'b1}}) in.latency = channel_old_latency + fifo_count;
        else                                                                in.latency = {LATENCY_COUNT_WIDTH{1'b1}};
    end 
    
    //always_ff @( posedge clk ) begin : create_tmp_channel_input_latency
    //    if(subcomponent_rst)  channel_input_pc_latency[i]   <= 0;
    //    else                    channel_input_pc_latency[i]   <= station_input_pc_latency[i] + channel_count + 1;
    //end 
    //4. create outcoming i 
endmodule