`timescale 1ns/100ps

module fifo_tb();
    localparam DWIDTH     = 16;
    localparam COUNT_BITS = 5;
    localparam HALF_CLOCK_CYCLE_PERIOD = 5ns;
    logic                   clk;
    logic                   rst;
    logic                   write_not_ready;
    logic                   write_ready;
    logic [DWIDTH-1:0]      write_data;
    logic                   write_valid;
    logic                   read_ready;
    logic [DWIDTH-1:0]      read_data;
    logic                   read_not_valid;
    logic                   read_valid;
    logic [COUNT_BITS-1:0]  count;

    always begin
        #HALF_CLOCK_CYCLE_PERIOD clk = ~ clk;
    end 

    fifo #(
        .DWIDTH     (DWIDTH),
        .COUNT_WIDTH(COUNT_BITS)
    ) afifo (      
        .clk            (clk),
        .rst          (rst),
        .full           (write_not_ready),
        .din            (write_data),
        .wr_en          (write_valid),
        .rd_en          (read_ready),
        .dout           (read_data),
        .empty          (read_not_valid),
        .data_count     (count)
    );

    assign write_ready = ~ write_not_ready;
    assign read_valid  = ~ read_not_valid;

    task write(input logic [DWIDTH-1:0] value);
    begin
        if(write_ready == 1'b0)
        begin
            $display("fifo full");
            $finish();
        end
        write_data  <= value;
        write_valid <= 1'b1;
        @(posedge clk);
        write_valid <= 1'b0;
    end    
    endtask 

    task read(output logic [DWIDTH-1:0] value);
    begin
        if(read_valid == 1'b0)
        begin
            $display("fifo empty");
            $finish();
        end
        read_ready  <= 1'b1;
        //note fall-through option
        value       <= read_data;
        @(posedge clk);
        read_ready  <= 1'b0;
    end    
    endtask 

    initial 
    begin
        rst      = 1'b0;
        write_valid= 1'b0;
        write_data = {DWIDTH{1'b0}};
        read_ready = 1'b0;
        clk        = 1'b0;    
        @(posedge clk);
        rst      <= 1'b1;
        @(posedge clk);
        rst      <= 1'b0;
        //test basic read and write
        //wait for bram ready.
        repeat(30)
            @(posedge clk);
        @(posedge clk);
        if( count !== {COUNT_BITS{1'b0}} )
        begin
            $display("no zero count at the very beginning");
            $finish();
        end
        if( read_valid !== 1'b0 )
        begin
            $display("no empty fifo at the very beginning");
            $finish();
        end
        

        for (logic [COUNT_BITS-1:0] c_max = 1 ; c_max < 1<<(COUNT_BITS-1) ; c_max+=1) 
        begin

            for (logic [COUNT_BITS-1:0] c = 1 ; c < c_max+1 ; c+=1) 
            begin
                write(c);
                @(posedge clk);
                if (count !== (c)) begin
                    $display("problem with count: current %d, expected %d", count, (c+1));
                    $finish();
                end
            end

            $display("OK writing");

            for (logic [COUNT_BITS-1:0] c = 1 ; c < c_max+1 ; c+=1) 
            begin
                logic [DWIDTH-1:0] tmp;
                read(tmp);
                @(posedge clk);
                if(tmp !== c)
                begin
                    $display("problem with reading: read %d, expected %d", tmp, c);
                    $finish();
                end
            end

            $display("OK reading %d elements", c_max);
        end



        //test count
        
        @(posedge clk);
        if( count !== {COUNT_BITS{1'b0}} )
        begin
            $display("no zero count at the very beginning");
            $finish();
        end
        if( read_valid !== 1'b0 )
        begin
            $display("no empty fifo at the very beginning");
            $finish();
        end

        for (logic [COUNT_BITS-1:0] c_max = 1 ; c_max < 1<<(COUNT_BITS-1) ; c_max+=1) 
        begin
            for (logic [COUNT_BITS-1:0] c = 0 ; c < c_max ; c+=1) 
            begin
                write(c);
                @(posedge clk);
                if (count !== (c+1)) begin
                    $display("problem with count: current %d, expected %d", count, (c+1));
                    $finish();
                end
            end

            $display("OK writing");

            @(posedge clk);
            rst <= 1'b1;
            @(posedge clk);
            rst <= 1'b0;
            @(posedge clk);
            if( count !== {COUNT_BITS{1'b0}} )
            begin
                $display("no zero count at rst");
                $finish();
            end
            if( read_valid !== 1'b0 )
            begin
                $display("no empty fifo at rst");
                $finish();
            end
            $display("OK rstting after writing %d elements", c_max);
        end
        

        //test subsequent read/write
        write_data  <= 16'hDEAD;
        write_valid <= 1'b1;
        @(posedge clk);
        read_ready  <= 1'b1;
        write_valid <= 1'b1;
        write_data  <= 16'hBEEF;
        @(posedge clk);
        if(read_data !== 16'hDEAD) 
        begin
            $display("error first write");
            $finish();
        end
        read_ready  <= 1'b1;
        write_valid <= 1'b0;
        @(posedge clk);
        if(read_data !== 16'hBEEF) 
        begin
            $display("error second subsequent write");
            $finish();
        end
        read_ready  <= 1'b1;
        write_valid <= 1'b0;
        @(posedge clk);
        read_ready  <= 1'b0;
        write_valid <= 1'b0;
        if(count !== 0) 
        begin
            $display("error data count");
            $finish();
        end
        //test subsequent read/write
        write_data  <= 16'hDEAD;
        write_valid <= 1'b1;
        @(posedge clk);
        read_ready  <= 1'b1;
        write_valid <= 1'b1;
        write_data  <= 16'hBEEF;
        @(posedge clk);
        if(read_data !== 16'hDEAD) 
        begin
            $display("error first write");
            $finish();
        end
        read_ready  <= 1'b0;
        write_valid <= 1'b0;
        @(posedge clk);
        read_ready  <= 1'b1;
        if(read_data !== 16'hBEEF) 
        begin
            $display("error second subsequent write");
            $finish();
        end
        @(posedge clk);
        if(read_data !== 16'hBEEF) 
        begin
            $display("error second subsequent write");
            $finish();
        end
        read_ready  <= 1'b1;
        write_valid <= 1'b0;
        @(posedge clk);
        read_ready  <= 1'b0;
        write_valid <= 1'b0;
        if(count !== 0) 
        begin
            $display("error data count");
            $finish();
        end
        
        $finish();
    end

endmodule