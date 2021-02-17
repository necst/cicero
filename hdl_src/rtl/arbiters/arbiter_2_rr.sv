/*
Taken from Arbiters: Design Ideas and Coding Styles by Matt Weber
https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.86.550&rep=rep1&type=pdf
*/
module arbiter_2_rr #(
    parameter DWIDTH      = 16 
)(
    input  logic                clk,
    input  logic                rst,
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
assign in_valid[0]= in_0_valid;
assign in_valid[1]= in_1_valid;
assign in_data[0] = in_0_data;
assign in_data[1] = in_1_data;
assign in_0_ready = in_ready[0];
assign in_1_ready = in_ready[1];

arbiter_rr_n #(
    .N(2),
    .DWIDTH(DWIDTH)
) arbiter (
    .clk      (clk      ),
    .rst      (rst    ),
    .in_valid (in_valid ),
    .in_data  (in_data  ),
    .in_ready (in_ready ),
    .out_valid(out_valid),
    .out_data (out_data ),
    .out_ready(out_ready)
);

endmodule