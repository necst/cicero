module arbitration_logic_rr #(
    parameter N = 8
) (
    input  logic         clk  ,
    input  logic         rst  ,
    input  logic [N-1:0] req  ,
    output logic [N-1:0] grant
);

logic [N-1:0] old_grant       ;
wire  [N-1:0] mask            ;
wire  [N-1:0] req_masked      ;
wire  [N-1:0] grant_masked    ;
wire  [N-1:0] grant_unmasked  ;


always_ff @(posedge clk)
begin
    if (rst)
        old_grant <= { N{1'b0}};
    else
        old_grant <= grant     ;
end

always_comb 
begin
    if( |(grant_masked) == 1'b0)    
    begin
        grant = grant_unmasked;
    end
    else
    begin
        grant = grant_masked;
    end
end

//A fixed priority encoder would pick a req with low index i.
//the idea here is to create a binary mask that would select 
//only requests that are above the index of the previous request.
// old grant    mask
// 0    0       0
// |    1       0
// V    0       1
// n-1  0       1
//note in case previous grant = 0,0...0 -> mask = 0,0..0 
//but it's legitimate since it's like previously has been served 
//lowest priority 
assign mask[0    ]       = 1'b0;
assign mask[N-1:1]       = old_grant[N-2:0] | mask[N-2:0];

assign req_masked[N-1:0] = req[N-1:0]       & mask[N-1:0];

arbitration_logic_fixed #(
    .N(N)
) arbiter_fixed_masked (
    .req  ( req_masked    ),
    .grant( grant_masked  )
);

arbitration_logic_fixed #(
    .N(N)
) arbiter_fixed (
    .req  ( req           ),
    .grant( grant_unmasked)
);

endmodule