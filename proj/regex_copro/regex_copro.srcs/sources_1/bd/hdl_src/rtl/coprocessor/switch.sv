module switch  (
        channel_iface.in                in_0,
        channel_iface.in                in_1,
        channel_iface.out               out_0,
        channel_iface.out               out_1
    );
    
    logic in_0_out_0;
    logic best_output;

    always_comb 
    begin //select_output
        logic both_inputs_valid;
        both_inputs_valid = in_0.valid && in_1.valid;
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
            if( in_0.valid ) in_0_out_0 = ~best_output;
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

        if( out_1.latency > out_0.latency )
        begin
            min_latency  = 1'b0;
            in_1.latency = out_0.latency;
            in_0.latency = out_0.latency;
        end
        else
        begin
            min_latency  = 1'b1;
            in_1.latency = out_1.latency;
            in_0.latency = out_1.latency;
        end
        
        
        casex ({min_latency, out_0.ready, out_1.ready})
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
            out_0.valid = in_0.valid ;
            out_0.data  = in_0.data  ;
            in_0.ready  = out_0.ready;

            out_1.valid = in_1.valid ;
            out_1.data  = in_1.data  ;
            in_1.ready  = out_1.ready;
        end 
        else
        begin
            out_1.valid = in_0.valid ;
            out_1.data  = in_0.data  ;
            in_0.ready  = out_1.ready;
                                      
            out_0.valid = in_1.valid ;
            out_0.data  = in_1.data  ;
            in_1.ready  = out_0.ready;
        end
    end

endmodule