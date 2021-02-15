module arbiter_rr #(
    parameter DWIDTH      = 16 ,
    parameter PRIORITY_0  = 1
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

logic last_in, last_in_next;

always_ff @( posedge clk ) begin 
    if(rst)
    begin
        last_in     <= ~PRIORITY_0;
    end
    else
    //else if( out_ready && out_valid)
    begin
        last_in    <= last_in_next;
    end
    //else 
    //begin
    //    last_in     <= last_in;
    //end
    
end

always_comb 
begin 
    in_0_ready   = 1'b0;
    in_1_ready   = 1'b0;
    out_valid    = 1'b0;
    out_data     = {(DWIDTH){1'b0}};
    last_in_next = last_in;
    
    if(last_in == 1'b1)
    begin

        if(in_0_valid == 1'b1)
        begin   
            out_valid       = in_0_valid;
            out_data        = in_0_data;
            in_0_ready      = out_ready;
            last_in_next    = 1'b0;
            
        end
        else
        begin
            out_valid       = in_1_valid;
            out_data        = in_1_data;
            in_1_ready      = out_ready;
            last_in_next    = 1'b1;

        end
    end
    else
    begin
        if( in_1_valid == 1'b0)
        begin   
            out_valid       = in_0_valid;
            out_data        = in_0_data;
            in_0_ready      = out_ready;
            last_in_next    = 1'b0;
        end
        else
        begin
            out_valid       = in_1_valid;
            out_data        = in_1_data;
            in_1_ready      = out_ready;
            last_in_next    = 1'b1;
            
        end
    end
    
    
end


    
endmodule