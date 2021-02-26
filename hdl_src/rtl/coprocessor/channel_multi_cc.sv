module channel_multi_cc #(
    parameter PC_WIDTH           =8    ,
    parameter CC_ID              =2    ,
    parameter CHANNEL_COUNT_WIDTH=10   ,
    parameter LATENCY_COUNT_WIDTH=10   
)
(
    input wire              clk,
    input wire              rst,
    channel_iface.in        in,
    channel_iface.out       out,
    output wire [2**CC_ID-1:0] present_cc_id  
);
    wire channel_input_ready    , channel_input_not_ready;
    wire channel_output_valid   , channel_output_not_valid;
    wire [CHANNEL_COUNT_WIDTH-1:0]   fifo_count;

    wire [CHANNEL_COUNT_WIDTH-1:0]   cc_id_count [2**CC_ID_BITS-1:0];

    logic [LATENCY_COUNT_WIDTH-1:0]  channel_old_latency, channel_old_latency_next;

    fifo #(
        .DWIDTH     (WIDTH                     ),
        .COUNT_WIDTH(PC_WIDTH+CC_ID            )
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

    assign channel_input_ready       = ~  channel_input_not_ready;
    assign channel_output_valid      = ~  channel_output_not_valid;

    assign in.ready                  = channel_input_ready;
    assign out.valid                 = channel_output_valid;

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


    //create present_cc_id[i]    
    always_ff @(posedge ck) 
    begin
        if(rst)
        begin
            for (int i=0; i<2**CC_ID_BITS; ++i) begin
                cc_id_count[i] <= {(CHANNEL_COUNT_WIDTH){1'b0}};
            end
        end
        else
        begin
            if (in.valid && channel_input_ready)
            begin
                cc_id_count[in.data[0+:CC_ID]] <= cc_id_count[in.data[0+:CC_ID]]+1;
            end

            if (out.ready && channel_output_valid)
            begin
                cc_id_count[in.data[0+:CC_ID]] <= cc_id_count[in.data[0+:CC_ID]]-1;
            end
        end
    end

    always_comb 
    begin
        for (int i=0; i<2**CC_ID_BITS; ++i) begin
            present_cc_id[i] =  (cc_id_count[in.data[0+:CC_ID]] == 0);
        end
    end


endmodule