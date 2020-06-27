`timescale 1ns/1ps

module switch   #(  
        parameter DWIDTH              = 8 ,
        parameter LATENCY_COUNT_WIDTH = 4 
    )(
        input  logic                            in_0_valid,
        input  logic [DWIDTH-1:0]               in_0_data,
        output logic [LATENCY_COUNT_WIDTH-1:0]  in_0_latency,
        output logic                            in_0_ready,

        input  logic                            in_1_valid,
        input  logic [DWIDTH-1:0]               in_1_data,
        output logic [LATENCY_COUNT_WIDTH-1:0]  in_1_latency,
        output logic                            in_1_ready,
    
        output logic                            out_0_valid,
        output logic [DWIDTH-1:0]               out_0_data,
        input  logic [LATENCY_COUNT_WIDTH-1:0]  out_0_latency,
        input  logic                            out_0_ready,

        output logic                            out_1_valid,
        output logic [DWIDTH-1:0]               out_1_data,
        input  logic [LATENCY_COUNT_WIDTH-1:0]  out_1_latency,
        input  logic                            out_1_ready
    );
    
    logic in_0_out_0;
    logic best_output;

    always_comb 
    begin //select_output
        logic both_inputs_valid;
        both_inputs_valid = in_0_valid && in_1_valid;
        if( both_inputs_valid )
            in_0_out_0 = 1'b0;
        else 
        begin
            //if 0_valid 
            //   best_output = 1 -> in_0_out_0 = 0 : 0->1
            //   best_output = 0 -> in_0_out_0 = 1 : 0->0
            //if 1_valid 
            //   best_output = 1 -> in_0_out_0 = 1 : 1->1
            //   best_output = 1 -> in_0_out_0 = 0 : 1->0
            if( in_0_valid ) in_0_out_0 = ~best_output;
            else             in_0_out_0 =  best_output;
            
        end 
    end

    
    always_comb 
    begin // output_latency
        logic min_latency;
        //this information is supposed to lead the 
        //decision for data movement at next clock cycle.
        //taking minimum we are sure latency does not diverge
        //      -> 1 ---> 2 ---> 3 --  
        //     |   7                 |
        //      -- 6  <--- 5 <--- 4<-

        if( out_1_latency > out_0_latency )
        begin
            min_latency  = 1'b0;
            in_1_latency = out_0_latency;
            in_0_latency = out_0_latency;
        end
        else
        begin
            min_latency  = 1'b1;
            in_1_latency = out_1_latency;
            in_0_latency = out_1_latency;
        end
        
        
        casex ({min_latency, out_0_ready, out_1_ready})
            3'b001 : best_output = 1'b1;
            3'b01x : best_output = 1'b0;
            3'b1x1 : best_output = 1'b1;
            3'b110 : best_output = 1'b0; 
            default: best_output = 1'b0;
        endcase
    end

    always_comb 
    begin // output_data_signal
        if( in_0_out_0 == 1'b1) begin
            out_0_valid = in_0_valid ;
            out_0_data  = in_0_data  ;
            in_0_ready  = out_0_ready;

            out_1_valid = in_1_valid ;
            out_1_data  = in_1_data  ;
            in_1_ready  = out_1_ready;
        end 
        else
        begin
            out_1_valid = in_0_valid ;
            out_1_data  = in_0_data  ;
            in_0_ready  = out_1_ready;
                                      
            out_0_valid = in_1_valid ;
            out_0_data  = in_1_data  ;
            in_1_ready  = out_0_ready;
        end
    end

endmodule