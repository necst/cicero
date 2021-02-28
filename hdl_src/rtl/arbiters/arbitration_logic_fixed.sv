module arbitration_logic_fixed #( 
    parameter N = 8
) (
    input  logic [N-1:0] req   ,
    output logic [N-1:0] grant 
);

//this module encapsulate the combinational 
//logic needed to realize a fixed_priority_arbiter,
//so that req[i] has higher priority than req[i+j] when j > 0
//grant[i] = req[i] & ~ higher_prio_req[i-1]
wire [N-1:0] higher_prio_req;
assign higher_prio_req[0]      = 1'b0;
assign higher_prio_req[N-1:1]  =    higher_prio_req[N-2:0]  | req[N-2:0];
assign grant[N-1:0]            = (~ higher_prio_req[N-1:0]) & req[N-1:0];

endmodule