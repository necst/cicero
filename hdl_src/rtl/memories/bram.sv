
module bram #(  
        parameter WIDTH            = 64,
        parameter ADDR_WIDTH       = 9
        )

        (
        input                         clk    ,
        input                         rst  ,
        input                         r_valid,
        input      [ADDR_WIDTH-1 :0]  r_addr ,
        output reg [WIDTH-1  :0]      r_data ,
        input      [ADDR_WIDTH-1:0]   w_addr ,
        input                         w_valid,
        input      [WIDTH-1     :0]   w_data 
        );
		
		localparam maxSIZE  = 2**ADDR_WIDTH;
		
		(* ramstyle = "M9K" *) reg [WIDTH-1:0] ram[0:maxSIZE-1];
		
		always_ff @ (posedge clk)
		begin
			if (w_valid) ram[w_addr] <= w_data;
			if (r_valid) r_data <= ram[r_addr];
		end

// This was the RAM of Cicero written for the Xilinx Ultra, it is not synthesizable with the Intel Cyclone
//
//      `define max(a,b) ((a) > (b) ? (a) : (b))
//      `define min(a,b) ((a) < (b) ? (a) : (b))
//
//      function integer log2; 
//        input integer value; reg [31:0] shifted; 
//        integer res; 
//      begin 
//        if (value < 2) log2 = value; 
//        else 
//          begin 
//            shifted = value-1;
//            for (res=0; shifted>0; res=res+1) 
//              shifted = shifted>>1; 
//            log2 = res;
//          end 
//      end 
//      endfunction
//
//      localparam READ_SIZE  = 2**READ_ADDR_WIDTH;
//      localparam WRITE_SIZE = 2**WRITE_ADDR_WIDTH;
//
//      localparam maxSIZE = `max(READ_SIZE, WRITE_SIZE); 
//      localparam maxWIDTH = `max(READ_WIDTH, WRITE_WIDTH); 
//      localparam minWIDTH = `min(READ_WIDTH, WRITE_WIDTH);
//      
//      localparam RATIO = maxWIDTH / minWIDTH; 
//      localparam log2RATIO = log2(RATIO);
//
//      (* ramstyle = "M9K" *) reg [minWIDTH-1:0] RAM [0:maxSIZE-1]; 
//
//      always_ff @(posedge clk) 
//      begin 
//
//          if (w_valid) 
//          begin
//            RAM[w_addr] <= w_data;
//          end
//
//      end
//
//      reg [READ_WIDTH-1:0] read;
//      always_ff @(posedge clk) 
//      begin : ramread 
//        integer i; 
//        reg [log2RATIO-1:0] lsbaddr; 
//        if (r_valid) 
//        begin 
//          for (i = 0; i < RATIO; i = i+1) 
//          begin 
//            lsbaddr = i; 
//            read[(i+1)*minWIDTH-1 -: minWIDTH] <= RAM[{r_addr, lsbaddr}];
//          end 
//        end 
//      end
//
//      assign r_data = read;
       
        
          
 endmodule