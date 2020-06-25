`timescale 1ns/1ps

module arbiter_fixed #(
    parameter DWITDH      = 8 ,
    parameter PRIORITY_0  = 1 
)(
    input  logic               in_0_valid,
    input  logic [DWITDH-1:0]  in_0_data,
    output logic               in_0_ready,

    input  logic               in_1_valid,
    input  logic [DWITDH-1:0]  in_1_data,
    output logic               in_1_ready,
 
    output logic              out_valid,
    output logic [DWITDH-1:0] out_data,
    input  logic              out_ready
);

always_comb begin 
    in_0_ready = 1'b0;
    in_1_ready = 1'b0;
    out_valid  = 1'b0;
    out_data   = {(DWITDH){1'b0}};

    
    if(PRIORITY_0 == 1)
    begin

        if(in_0_valid)
        begin   
            out_valid  = in_0_valid;
            out_data   = in_0_data;
            in_0_ready = out_ready;
        end
        else
        begin
            out_valid  = in_1_valid;
            out_data   = in_1_data;
            in_1_ready = out_ready;
        end
    end
    else
    begin
        if( ~ in_1_valid)
        begin   
            out_valid  = in_0_valid;
            out_data   = in_0_data;
            in_0_ready = out_ready;
        end
        else
        begin
            out_valid  = in_1_valid;
            out_data   = in_1_data;
            in_1_ready = out_ready;
        end
    end
    
    
    
end


    
endmodule