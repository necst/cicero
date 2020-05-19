`timescale 1ns / 10ps

module bram #(  
        parameter READ_WIDTH            = 18,
        parameter WRITE_WIDTH           = 36,
        parameter ADDR_WIDTH            = 11,
        parameter WE_WIDTH              = 4
        )

        (
        input                        clk    ,
        input                        reset  ,
        input  [ADDR_WIDTH-1  :0]    addr_i ,
        input  [WRITE_WIDTH-1 :0]    data_i ,
        input  [WE_WIDTH-1    :0]    we     ,
        input                        valid_i,
        output [READ_WIDTH-1  :0]    data_o
        );
        wire [READ_WIDTH-1:0]        full_data_o;
        wire [ WE_WIDTH-1 :0]         full_we;
        wire                         regce;

        assign  regce   = 1'b0;
        assign  data_o  = full_data_o[0+:READ_WIDTH];
        assign  full_we = { { (8 - WE_WIDTH){1'b0}} ,we};
        
        BRAM_SINGLE_MACRO #(
            .BRAM_SIZE("36Kb"),         // Target BRAM, "18Kb" or "36Kb" 
            .DEVICE("7SERIES"),         // Target Device: "7SERIES" 
            .DO_REG(0),                 // Optional output register (0 or 1)
            .INIT( { (READ_WIDTH){1'b0} }), // Initial values on output port
            .INIT_FILE ("NONE"),
            .WRITE_WIDTH(WRITE_WIDTH),  // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
            .READ_WIDTH(READ_WIDTH),    // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
            .SRVAL(  { (READ_WIDTH){1'b0} }), // Set/Reset value for port output
            .WRITE_MODE("WRITE_FIRST")  // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"
          
            )BRAM_SINGLE_MACRO_inst (
              .DO(full_data_o),   // Output data, width defined by READ_WIDTH parameter
              .ADDR(addr_i),      // Input address, width defined by read/write port depth look at the table below
              .CLK(clk),          // 1-bit input clock
              .DI(data_i),        // Input data port, width defined by WRITE_WIDTH parameter
              .EN(valid_i),       // 1-bit input RAM enable
              .REGCE(regce),      // 1-bit input output register enable
              .RST(reset),        // 1-bit input reset
              .WE(full_we)        // Input write enable, width defined by write port depth look at tabel below
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