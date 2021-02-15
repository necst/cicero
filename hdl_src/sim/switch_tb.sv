`timescale 1ns/100ps

module switch_tb();
    localparam DWIDTH                   = 16;
    localparam LATENCY_COUNT_WIDTH      = 5;
    localparam HALF_CLOCK_CYCLE_PERIOD  = 5ns;
    logic                           clk;
    logic                           in_0_valid;
    logic [DWIDTH -1:0]             in_0_data;
    logic                           in_0_ready;
    logic [LATENCY_COUNT_WIDTH-1:0] in_0_latency;
    logic                           in_1_valid;
    logic [DWIDTH -1:0]             in_1_data;
    logic                           in_1_ready;
    logic [LATENCY_COUNT_WIDTH-1:0] in_1_latency;
    logic                           out_0_valid;
    logic [DWIDTH -1:0]             out_0_data;
    logic                           out_0_ready;
    logic [LATENCY_COUNT_WIDTH-1:0] out_0_latency;
    logic                           out_1_valid;
    logic [DWIDTH -1:0]             out_1_data;
    logic                           out_1_ready;
    logic [LATENCY_COUNT_WIDTH-1:0] out_1_latency;

    always begin
        #HALF_CLOCK_CYCLE_PERIOD clk = ~ clk;
    end 

    switch #(
        .DWIDTH     (DWIDTH),
        .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)
    ) aswitch (      
        .in_0_valid     (in_0_valid    ),
        .in_0_data      (in_0_data     ),
        .in_0_latency   (in_0_latency  ),
        .in_0_ready     (in_0_ready    ),
        .in_1_valid     (in_1_valid    ),
        .in_1_data      (in_1_data     ),
        .in_1_latency   (in_1_latency  ),
        .in_1_ready     (in_1_ready    ),
        .out_0_valid    (out_0_valid   ),
        .out_0_data     (out_0_data    ),
        .out_0_latency  (out_0_latency ),
        .out_0_ready    (out_0_ready   ),
        .out_1_valid    (out_1_valid   ),
        .out_1_data     (out_1_data    ),
        .out_1_latency  (out_1_latency ),
        .out_1_ready    (out_1_ready   )
    );

    initial 
    begin
        clk           = 1'b0;    
        @(posedge clk);
        //out0 has lower latency 
        //out1 has higher latency
        out_0_latency <= 5'b00001;
        out_1_latency <= 5'b00010;
        
        //only in 1 is valid
        in_1_valid  <= 1'b1;
        in_1_data   <= 16'd255;
        in_0_valid  <= 1'b0;
        in_0_data   <= 16'd33;
        //out0 not ready, out1 ready
        out_0_ready <= 1'b0;
        out_1_ready <= 1'b1;
        //expecte that data is driven onto out1
        @(posedge clk);
        if(out_1_data !== 16'd255 || out_1_valid !== 1'b1 || out_0_valid !== 1'b0 )
        begin
            $display("KO data out");
        end
        //lower latency is outputted
        if(in_0_latency !== 5'b00001 || in_1_latency !== 5'b00001)
        begin
            $display("KO latency");
        end
       

        //if only out0 is valid
        out_0_ready <= 1'b1;
        out_1_ready <= 1'b0;
        //output on 0
        @(posedge clk);
        if(out_0_data !== 16'd255 || out_0_valid !== 1'b1 || out_1_valid !== 1'b0 )
        begin
            $display("KO data out");
        end
        if(in_0_latency !== 5'b00001 || in_1_latency !== 5'b00001)
        begin
            $display("KO latency");
        end

        //if both out are valid expect that the one with less 
        //latency namely output0 is preferred 
        out_0_ready <= 1'b1;
        out_1_ready <= 1'b1;
        @(posedge clk);
        if(out_0_data !== 16'd255 || out_0_valid !== 1'b1 || out_1_valid !== 1'b0 )
        begin
            $display("KO data out");
        end
        if(in_0_latency !== 5'b00001 || in_1_latency !== 5'b00001)
        begin
            $display("KO latency");
        end
        
        $display("OK");
        $finish(0);
    end

endmodule
        