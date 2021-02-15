module arbitration_logic_fixed_shiftable #(
    parameter N = 8,
    parameter INIT_LOWEST_PRIO = N-1
) (
    input  logic         clk  ,
    input  logic         rst  ,
    input  logic [N-1:0] req  ,
    output logic [N-1:0] grant,
    input  logic         shift
);
// an arbitration logic that allows to change the lowest priority with a shift.
// Example: 
// priority (the higher the higher) :  1  0  2  3 
// request                          :  0  1  1  0
//                                        ^
//                                        |
// one_hot_lowest_prio              :  0  1  0  0
// ------------------------------------------------
// grant                            :  0  0  1  0 


logic [N-1:0] one_hot_lowest_prio     , one_hot_lowest_prio_next;
wire  [N-1:0] mask            ;
wire  [N-1:0] req_masked      ;
wire  [N-1:0] grant_masked    ;
wire  [N-1:0] grant_unmasked  ;


always_ff @(posedge clk)
begin

    if (rst)
    begin
        one_hot_lowest_prio                     <= '0;
        one_hot_lowest_prio[INIT_LOWEST_PRIO]   <= 1'b1;
    end
    else
    begin
        one_hot_lowest_prio <= one_hot_lowest_prio_next;
    end
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
    
    if(shift)   one_hot_lowest_prio_next = {one_hot_lowest_prio[N-2:0], one_hot_lowest_prio[N-1]};
    else        one_hot_lowest_prio_next =  one_hot_lowest_prio;
end

//A fixed priority encoder would pick a req with low index i.
//the idea here is to create a binary mask that would select 
//only requests that are above the index of the previous request.
//     | one_hot_lowest_prio_next  |  mask
// ----|---------------------------|--------
// 0   |             0             |    0
// |   |             1             |    0
// V   |             0             |    1
// n-1 |             0             |    1

assign mask[0    ]       = 1'b0;
assign mask[N-1:1]       = one_hot_lowest_prio[N-2:0] | mask[N-2:0];

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