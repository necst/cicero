`timescale 1ns / 10ps
// Author: Daniele Parravicini
// This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// Furthermore no-copy is allowed without explicit permission of the authors.
module bram #(  
        parameter READ_WIDTH            = 64,
        parameter READ_ADDR_WIDTH       = 9,
        parameter WRITE_WIDTH           = 32,
        parameter WRITE_ADDR_WIDTH      = 10,
        parameter WE_WIDTH              = 4
        )

        (
        input                         clk    ,
        input                         reset  ,
        input  [READ_ADDR_WIDTH-1 :0] r_addr ,
        input                         r_valid,
        output [READ_WIDTH-1      :0] r_data ,
        input  [WRITE_ADDR_WIDTH-1:0] w_addr ,
        input  [WE_WIDTH-1        :0] w_valid,
        input  [WRITE_WIDTH-1     :0] w_data 
        );
       
        wire    regce;
        wire    one_we;
        assign  regce   = 1'b0;
        assign  one_we  = |(w_valid);
        

        BRAM_SDP_MACRO #(
          .BRAM_SIZE("36Kb"),           // Target BRAM, "18Kb" or "36Kb" 
          .DEVICE("7SERIES"),           // Target device: "7SERIES" 
          .WRITE_WIDTH(WRITE_WIDTH),    // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
          .READ_WIDTH(READ_WIDTH),      // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
          .DO_REG(0),                   // Optional output register (0 or 1)
          .INIT_FILE ("NONE"),
          .SIM_COLLISION_CHECK ("ALL"),   // Collision check enable "ALL", "WARNING_ONLY",
                                          //   "GENERATE_X_ONLY" or "NONE" 
          .SRVAL(72'h000000000000000000), // Set/Reset value for port output
          .INIT(72'h000000000000000000),  // Initial values on output port
          .WRITE_MODE("READ_FIRST")       // Specify "READ_FIRST" for same clock or synchronous clocks
                                          //   Specify "WRITE_FIRST for asynchronous clocks on ports
          ) BRAM_SDP_MACRO_inst (
            .RDADDR(r_addr      ),         // Input read address, width defined by read port depth
            .RDEN  (r_valid     ),         // 1-bit input read port enable
            .DO    (r_data      ),         // Input write data port, width defined by WRITE_WIDTH parameter
            .RDCLK (clk         ),         // 1-bit input read clock
            .WRADDR(w_addr      ),         // Input write address, width defined by write port depth
            .WE    (w_valid     ),         // Input write enable, width defined by write port depth
            .DI    (w_data      ),         // Output read data port, width defined by READ_WIDTH parameter
            .WREN  (one_we      ),         // 1-bit input write port enable
            .WRCLK (clk         ),         // 1-bit input write clock
            .RST   (reset       ),         // 1-bit input reset
            .REGCE (regce       )          // 1-bit input read output register enable
          );

          /////////////////////////////////////////////////////////////////////
          //  READ_WIDTH | BRAM_SIZE | READ Depth  | ADDR Width |            //
          // WRITE_WIDTH |           | WRITE Depth |            |  WE Width  //
          // ============|===========|=============|============|============//
          //    37-72    |  "36Kb"   |      512    |    9-bit   |    8-bit   //
          //    19-36    |  "36Kb"   |     1024    |   10-bit   |    4-bit   //
          //    19-36    |  "18Kb"   |      512    |    9-bit   |    4-bit   //
          //    10-18    |  "36Kb"   |     2048    |   11-bit   |    2-bit   //
          //    10-18    |  "18Kb"   |     1024    |   10-bit   |    2-bit   //
          //     5-9     |  "36Kb"   |     4096    |   12-bit   |    1-bit   //
          //     5-9     |  "18Kb"   |     2048    |   11-bit   |    1-bit   //
          //     3-4     |  "36Kb"   |     8192    |   13-bit   |    1-bit   //
          //     3-4     |  "18Kb"   |     4096    |   12-bit   |    1-bit   //
          //       2     |  "36Kb"   |    16384    |   14-bit   |    1-bit   //
          //       2     |  "18Kb"   |     8192    |   13-bit   |    1-bit   //
          //       1     |  "36Kb"   |    32768    |   15-bit   |    1-bit   //
          //       1     |  "18Kb"   |    16384    |   14-bit   |    1-bit   //
          /////////////////////////////////////////////////////////////////////
          
 endmodule