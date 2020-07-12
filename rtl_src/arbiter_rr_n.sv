`timescale 1ns/1ps

module arbiter_rr_n #(
    parameter DWIDTH      = 16 ,
    parameter N           = 2
)(
    input  logic                clk,
    input  logic                reset,
    input  logic                in_valid [N-1:0],
    input  logic [DWIDTH-1:0]   in_data  [N-1:0],
    output logic                in_ready [N-1:0],

 
    output logic                out_valid,
    output logic [DWIDTH-1:0]   out_data,
    input  logic                out_ready
);

logic tmp_ready [2*N-2:0];
logic tmp_valid [2*N-2:0];

//we have to create a heap of arbiters to regulate access to output                     
//hence for a number of requestor equal to N we need N-1 arbiters                 
// signals related to requerstor will belong to the lowest part of the array [N-1->0]       
// signals related to arbiters will belong to the highest part of the array  [2*N-2->N]
genvar j;
generate    
for (j=0; j < N; j++) 
begin
    assign in_ready [j] = tmp_ready[j];
    assign tmp_valid[j] = in_valid [j];
end

for (j=0; j < N-1; j++) 
begin

    arbiter_rr #(
        .DWIDTH(1),
        .PRIORITY_0(1)
    ) arbiter_tree_to_cope_with_data_o_contention (
        .clk       ( clk                                      ),
        .reset     ( reset                                    ),
        .in_0_ready( tmp_ready           [2*N-2 - j*2-1-1 ]   ),
        .in_0_data (                                          ),
        .in_0_valid( tmp_valid           [2*N-2 - j*2-1-1 ]   ),
        .in_1_ready( tmp_ready           [2*N-2 - j*2-1   ]   ),
        .in_1_data (                                          ),
        .in_1_valid( tmp_valid           [2*N-2 - j*2-1   ]   ),
        .out_ready ( tmp_ready           [2*N-2 - j       ]   ),
        .out_data (                                           ),
        .out_valid ( tmp_valid           [2*N-2 - j       ]   )
    );
end
endgenerate

always_comb begin : select_data_o
    int i;
    
    out_data = {(DWIDTH){1'b0}};
    for (i = 0 ; i < N ; i++ ) 
    begin
        if(tmp_ready[i])
        begin
            out_data = in_data[i];
        end
    end
end

assign tmp_ready[2*N-2] = out_ready   ;
assign out_valid        = tmp_valid[2*N-2]; 

    
endmodule