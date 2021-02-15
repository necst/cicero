`timescale 1ns/100ps
module cache_directly_mapped_tb();
    localparam DWIDTH                   = 16;
    localparam HALF_CLOCK_CYCLE_PERIOD  = 5ns;
    localparam CACHE_WIDTH_BITS         = 5;
    localparam ADDR_WIDTH               = 16;

    logic                  clk           ;
    logic                  rst         ;
    logic                  addr_in_valid ;
    logic [ADDR_WIDTH-1:0] addr_in       ;
    logic                  addr_in_ready ;
    logic [DWIDTH-1:0]     data_out      ;
    logic                  addr_out_valid;
    logic [ADDR_WIDTH-1:0] addr_out      ;
    logic                  addr_out_ready;
    logic [DWIDTH-1:0]     data_in       ;


    always begin
        #HALF_CLOCK_CYCLE_PERIOD clk = ~ clk;
    end 

    cache_directly_mapped #(          
        .DWIDTH             (DWIDTH          ),
        .CACHE_WIDTH_BITS   (CACHE_WIDTH_BITS),
        .ADDR_WIDTH         (ADDR_WIDTH      )
    ) acache_under_test (
        .clk                (clk             ),
        .rst              (rst           ),
        .addr_in_valid      (addr_in_valid   ),
        .addr_in            (addr_in         ),
        .addr_in_ready      (addr_in_ready   ),
        .data_out           (data_out        ),
        .addr_out_valid     (addr_out_valid  ),
        .addr_out           (addr_out        ),
        .addr_out_ready     (addr_out_ready  ),
        .data_in            (data_in         )
    );

    initial
    begin
        logic [ADDR_WIDTH-1:0] an_address = 16'hDEAD;
        clk             = 1'b0;
        rst           = 1'b0;
        addr_in_valid   = 1'b0;
        addr_out_ready  = 1'b0;
        @(posedge clk);
        rst           <= 1'b1;
        @(posedge clk);
        rst           <= 1'b0;
        //rememeber that rams need some time before start working!
        repeat(30)
            @(posedge clk);
        //ask a address that is missing
        addr_in_valid   <= 1'b1;
        addr_in         <= an_address;
        @(posedge clk);
        if(addr_in_ready == 1'b1)
        begin
            $display("error in rst");
            $stop(0);
        end
        if(addr_out_valid !== 1'b1)
        begin
            $display("error not requesting missing cache line");
            $stop(0);
        end
        if(addr_out !== an_address)
        begin
            $display("error in out address");
            $stop(0);
        end
        @(posedge clk);
        addr_out_ready  <=1'b1;
        if(addr_out_valid !== 1'b1)
        begin
            $display("error not requesting missing cache line");
            $stop(0);
        end
        if(addr_out !== an_address)
        begin
            $display("error in out address");
            $stop(0);
        end
        @(posedge clk);
        addr_out_ready  <=1'b0;
        if(addr_in_ready !== 1'b1)
        begin
            $display("error not signaling data incoming");
            $stop(0);
        end
        data_in        <= 16'hBEEF;
        @(posedge clk);
        addr_in_valid  <= 1'b0;
        if(data_out !== 16'hBEEF)
        begin
            $display("error in data out");
            $stop(0);
        end
        @(posedge clk);
        //If I ask again the same address it answers immediately
        addr_in_valid   <= 1'b1;
        addr_in         <= an_address;
        @(posedge clk);
        addr_in_valid   <=1'b0;
        if(addr_in_ready !== 1'b1)
        begin
            $display("data is not available at very next request");
            $stop(0);
        end
        if(addr_out_valid !== 1'b0)
        begin
            $display("error requesting already available contetn");
            $stop(0);
        end
        @(posedge clk);
        
        if(data_out !== 16'hBEEF)
        begin
            $display("errorin data re-request");
            $stop(0);
        end
        
        $display("ok");

        $finish(1);
    end
endmodule