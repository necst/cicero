`timescale 1ns/100ps
module cache_block_directly_mapped_tb();
    localparam HALF_CLOCK_CYCLE_PERIOD  = 5ns;
    localparam DWIDTH                   = 4;
    localparam CACHE_WIDTH_BITS         = 4;
    localparam BLOCK_WIDTH_BITS         = 4;
    localparam ADDR_WIDTH               = 16;

    logic                                       clk           ;
    logic                                       rst         ;
    logic                                       addr_in_valid ;
    logic [ADDR_WIDTH-1:0]                      addr_in       ;
    logic                                       addr_in_ready ;
    logic [DWIDTH-1:0]    data_out      ;
    logic                                       addr_out_valid;
    logic [ADDR_WIDTH-1-BLOCK_WIDTH_BITS:0]     addr_out      ;
    logic                                       addr_out_ready;
    logic [DWIDTH*(2**BLOCK_WIDTH_BITS)-1:0]    data_in       ;


    always begin
        #HALF_CLOCK_CYCLE_PERIOD clk = ~ clk;
    end 


    cache_block_directly_mapped #(          
        .DWIDTH             (DWIDTH          ),
        .CACHE_WIDTH_BITS   (CACHE_WIDTH_BITS),
        .BLOCK_WIDTH_BITS   (BLOCK_WIDTH_BITS),
        .ADDR_IN_WIDTH      (ADDR_WIDTH      )
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

task request_missing_word(
            input  logic [ADDR_WIDTH-1:0]                      an_address,
            input  logic [DWIDTH-1:0]                      data,
            input  logic [DWIDTH*(2**BLOCK_WIDTH_BITS)-1:0]    block,
            input  int req_latency = 1,
            input  int res_latency = 1
            );
            //ask a address that is missing
            addr_in_valid   <= 1'b1;
            addr_in         <= an_address;
            
            repeat(req_latency)
            begin
                @(posedge clk);
                if(addr_in_ready == 1'b1)
                begin
                    $display("error, block already present");
                    $stop(0);
                end
                if(addr_out_valid == 1'b1)
                begin
                    $display("error too fast in requesting block");
                    $stop(0);
                end
            end
            repeat(res_latency)
            begin
                @(posedge clk);
                if(addr_out_valid == 1'b0)
                begin
                    $display("error not requesting missing cache line");
                    $stop(0);
                end
                if(addr_out !== an_address[ADDR_WIDTH-1:BLOCK_WIDTH_BITS])
                begin
                    $display("error in out address");
                    $stop(0);
                end
            end
            @(posedge clk);
            addr_out_ready  <= 1'b1;
            if(addr_out_valid == 1'b0)
            begin
                $display("error not requesting anymore missing cache line");
                $stop(0);
            end
            if(addr_out !== an_address[ADDR_WIDTH-1:BLOCK_WIDTH_BITS])
            begin
                $display("error in out address");
                $stop(0);
            end
            //end response
            @(posedge clk);
            if(addr_in_ready !== 1'b1)
            begin
                $display("error not signaling data incoming");
                $stop(0);
            end
            addr_out_ready <=1'b0;
            data_in        <= block;
            addr_in_valid  <= 1'b0;
            @(posedge clk);
            if(data_out !== data)
            begin
                $display("error in data out");
                $stop(0);
            end
endtask

task request_non_missing_word(
            input  logic [ADDR_WIDTH-1:0] an_address,
            input  logic [DWIDTH-1:0] data,
            input  int expected_latency = 0
            );
            
            addr_in_valid   <= 1'b1;
            addr_in         <= an_address;
            
            repeat(expected_latency)
            begin
                @(posedge clk);
                if(addr_in_ready == 1'b1)
                begin
                    $display("error, block already present");
                    $stop(0);
                end
                if(addr_out_valid == 1'b1)
                begin
                    $display("error too fast in requesting block");
                    $stop(0);
                end
            end
            @(posedge clk)
            if(addr_out_valid == 1'b1)
            begin
                $display("error requesting a missing cache line that is expected to be present");
                $stop(0);
            end
            if(addr_in_ready !== 1'b1)
            begin
                $display("error not signaling data incoming");
                $stop(0);
            end
            //end response
            addr_in_valid  <= 1'b0;

            @(posedge clk);
            if(data_out !== data)
            begin
                $display("error in data out");
                $stop(0);
            end
endtask

task request_non_missing_block(
            input  logic [ADDR_WIDTH-1:0] an_address,
            input  logic [DWIDTH*(2**BLOCK_WIDTH_BITS)-1:0] block
            );

            addr_in_valid   <= 1'b1;
            addr_in         <= an_address;
            
            for(int i=1; i < 2**BLOCK_WIDTH_BITS; i++)
            begin
                @(posedge clk)
                if(addr_out_valid == 1'b1)
                begin
                    $display("error requesting a missing cache line that is expected to be present");
                    $stop(0);
                end
                if(addr_in_ready == 1'b0)
                begin
                    $display("error not signaling data incoming");
                    $stop(0);
                end
        
                addr_in_valid   <= 1'b1;
                addr_in         <= an_address+i;

                if( data_out !== block[DWIDTH*(i-1)+:DWIDTH])
                begin
                    $display("error in data out %d != %d ", data_out, block[DWIDTH*(i-1)+:DWIDTH]) ;
                    $stop(0);
                end
                else
                    $display("block address %d read ok", an_address+i-2);
            end
            
            //end response
            addr_in_valid  <= 1'b0;
            @(posedge clk);
            if(data_out !== block[DWIDTH*(2**BLOCK_WIDTH_BITS-1)+:DWIDTH])
            begin
                $display("error in data out %d != %d ", data_out, block[DWIDTH*(2**BLOCK_WIDTH_BITS-1)+:DWIDTH]) ;
                $stop(0);
            end
            else
                $display("block address %d read ok", an_address+(2**BLOCK_WIDTH_BITS-1));
            

endtask 


    initial
    begin
        logic [ADDR_WIDTH-1:0] an_address = 16'hEAD0; // DEAD is the address without block indexing 0 is block index
        logic [DWIDTH-1:0    ] a_data     = 4'hF;
        logic [DWIDTH-1:0    ] another_data  = 4'hA;
        logic [DWIDTH-1:0    ] a_rd_data  = 4'hB; 
        logic [DWIDTH-1:0    ] a_th_data  = 4'h2; 
        logic [2**BLOCK_WIDTH_BITS*DWIDTH-1:0] block0, block1;
        int offset;
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
        block0 = {{(2**BLOCK_WIDTH_BITS-1){another_data}},a_data};
        request_missing_word( an_address,a_data,block0);
        $display("%d read ok", 0);
       
        request_non_missing_word( an_address,a_data);
        $display("%d read ok", 0);
        for(int i=1; i< 2** BLOCK_WIDTH_BITS ; i++)
        begin
            request_non_missing_word( an_address+i,another_data);
            $display("%d read ok", i);
            
        end
        //consecutive block
        block1 = {{(2**BLOCK_WIDTH_BITS){a_rd_data}}};
        offset = an_address+2** BLOCK_WIDTH_BITS;
        request_missing_word( offset, a_rd_data, block1);
        $display("%d read ok", offset);
        request_non_missing_word( offset, a_rd_data);
        $display("%d read ok",offset);

        for(int i=1; i< 2** BLOCK_WIDTH_BITS ; i++)
        begin
            request_non_missing_word(offset + i,a_rd_data);
            $display("%d read ok", offset + i);
            
        end
        //block that conflict in cache with block 0 [( address mod ((2**CACHE_WIDTH_BITS)*(2**BLOCK_WIDTH_BITS))) = 0]
        block0 = {(2**(BLOCK_WIDTH_BITS-1)){a_th_data, a_rd_data}};
        offset = an_address + ((2**CACHE_WIDTH_BITS)*(2**BLOCK_WIDTH_BITS));
        request_missing_word( offset ,a_rd_data,block0);
        $display("%d read ok", offset);
        
        request_non_missing_word( offset,a_rd_data);
        $display("%d read ok", offset);
        for(int i=1; i< 2** BLOCK_WIDTH_BITS ; i++)
        begin
            if(i%2 == 0)
                request_non_missing_word( offset+i,a_rd_data);
            else
                request_non_missing_word( offset+i,a_th_data);
            
            $display("%d read ok", offset+i);
            
        end
        
        request_non_missing_block(offset, block0);

        $display("ok");

        $finish(1);
    end
endmodule