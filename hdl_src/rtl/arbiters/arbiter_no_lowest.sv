/*
Taken from Arbiters: Design Ideas and Coding Styles by Matt Weber
https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.86.550&rep=rep1&type=pdf
*/
module arbiter_no_lowest #(
    parameter DWIDTH      = 16 ,
    parameter N           = 2  ,
    parameter INIT_LOWEST_PRIO = N-1
)(
    input  logic                clk,
    input  logic                rst,
    input  logic                in_valid [N-1:0],
    input  logic [DWIDTH-1:0]   in_data  [N-1:0],
    output logic                in_ready [N-1:0],
    input  logic                shift,
 
    output logic                out_valid,
    output logic [DWIDTH-1:0]   out_data,
    input  logic                out_ready
);

wire [N-1     :0] data_masked   [DWIDTH-1:0];
wire [N-1     :0] req;
wire [N-1     :0] in_ready_packed;
genvar i;
genvar j;
generate 
for (i=0; i<N; i++)
begin : gen_sigs
    assign req		 [i] = in_valid[i];
    assign in_ready  [i] = in_ready_packed[i] & out_ready;
end
endgenerate

assign out_valid         =  | req;

arbitration_logic_no_lowest #(
    .N(N),
    .INIT_LOWEST_PRIO(INIT_LOWEST_PRIO)
) arbitration_logic (
    .clk  ( clk                         ),
    .rst  ( rst                       ),
    .req  ( req         			    ),
    .grant( in_ready_packed             ),
    .shift( shift                       )
);

generate 
for (j=0; j< DWIDTH; j++)
begin : gen_data_outer
    for (i=0; i< N     ; i++)
    begin : gen_data
        assign data_masked[j][i]    = in_data[i][j] & in_ready_packed[i];
    end
    assign out_data   [j]           = |(data_masked [j]);
end
endgenerate

endmodule