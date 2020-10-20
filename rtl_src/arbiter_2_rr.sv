`timescale 1ns/1ps
/*
Arbiters: Design Ideas and Coding Styles Matt Weber
*/
module arbiter_2_rr #(
    parameter DWIDTH      = 16 
)(
    input  logic                clk,
    input  logic                reset,
    input  logic                in_0_valid,
    input  logic [DWIDTH-1:0]   in_0_data,
    output logic                in_0_ready,

    input  logic                in_1_valid,
    input  logic [DWIDTH-1:0]   in_1_data,
    output logic                in_1_ready,
 
    output logic                out_valid,
    output logic [DWIDTH-1:0]   out_data,
    input  logic                out_ready
);

wire              in_valid[2-1:0];
wire              in_ready[2-1:0];
wire [DWIDTH-1:0] in_data [2-1:0];
assign in_valid   = {in_1_valid, in_0_valid};
assign in_data[0] = in_0_data;
assign in_data[1] = in_1_data;
assign in_0_ready = in_ready[0];
assign in_1_ready = in_ready[1];

arbiter_rr_n #(
    .N(2),
    .DWIDTH(DWIDTH)
) arbiter (
    .clk      (clk      ),
    .reset    (reset    ),
    .in_valid (in_valid ),
    .in_data  (in_data  ),
    .in_ready (in_ready ),
    .out_valid(out_valid),
    .out_data (out_data ),
    .out_ready(out_ready)
);

endmodule