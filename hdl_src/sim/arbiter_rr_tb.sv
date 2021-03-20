`timescale 1ns/100ps

module arbiter_rr_tb();
    localparam DWIDTH                   = 16;
    localparam HALF_CLOCK_CYCLE_PERIOD  = 5ns;

    logic                           clk;
    logic                           rst;
    logic                           in_0_valid;
    logic [DWIDTH -1:0]             in_0_data;
    logic                           in_0_ready;
    logic                           in_1_valid;
    logic [DWIDTH -1:0]             in_1_data;
    logic                           in_1_ready;
    logic                           out_valid;
    logic [DWIDTH -1:0]             out_data;
    logic                           out_ready;


    always begin
        #HALF_CLOCK_CYCLE_PERIOD clk = ~ clk;
    end 

    arbiter_2_rr #(
        .DWIDTH(DWIDTH),
        .PRIORITY_0(1)
    ) arbiter_under_test (
        .clk       ( clk        ),
        .rst     ( rst      ),
        .in_0_valid( in_0_valid ),
        .in_0_data ( in_0_data  ),
        .in_0_ready( in_0_ready ),
        .in_1_valid( in_1_valid ),
        .in_1_data ( in_1_data  ),
        .in_1_ready( in_1_ready ),
        .out_valid ( out_valid  ),
        .out_data  ( out_data   ),
        .out_ready ( out_ready  )
    );
    
    

    initial 
    begin
        clk           = 1'b0; 
        rst         = 1'b0;
        in_0_valid    = 1'b0;
        in_1_valid    = 1'b0;  
        out_ready     = 1'b0; 
        @(posedge clk);
        rst         <= 1'b1;
        @(posedge clk);
        rst         <= 1'b0;

        if( out_valid == 1'b1)
        begin
            $display(" failed: valid even if no data");
            $stop(1);
        end
        @(posedge clk);

        out_ready   <= 1'b1;
        in_1_data   <= 16'hBEEF;
        in_0_data   <= 16'hDEAD;
        in_1_valid  <= 1'b1;
        in_0_valid  <= 1'b0;

        @(posedge clk);
        if(in_1_ready !== 1'b1 || out_valid !== 1'b1 || out_data !== in_1_data )
        begin
            $display("KO data out");
        end
       
        out_ready   <= 1'b1;
        in_1_data   <= 16'hBEEF;
        in_0_data   <= 16'hDEAD;
        in_1_valid  <= 1'b1;
        in_0_valid  <= 1'b1;

        @(posedge clk);
        if(in_0_ready !== 1'b1 || out_valid !== 1'b1 || out_data !== in_0_data )
        begin
            $display("KO data out, toggle");
        end
        
        $display("OK");
        $finish(0);
    end

endmodule
        