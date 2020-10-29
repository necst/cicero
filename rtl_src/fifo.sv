`timescale 1ns/1ps
// Author: Daniele Parravicini
// This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
// Furthermore no-copy is allowed without explicit permission of the authors.
module fifo #(
    parameter DWIDTH          = 16,
    parameter COUNT_WIDTH     = 7
)(
  input  logic                  clk,
  input  logic                  reset,
  input  logic [DWIDTH-1:0]     din,
  input  logic                  wr_en,
  input  logic                  rd_en,
  output logic [DWIDTH-1:0]     dout,
  output logic                  full,
  output logic                  empty,
  output logic [COUNT_WIDTH-1:0]data_count
);

logic [2:0]             state_cur, state_next;
//head points to the first valid-element (only in case of an empty fifo heaqd=tail)
logic [COUNT_WIDTH-1:0] head     , head_next ,  head_incremented;
//tail points to the first non-valid element 
logic [COUNT_WIDTH-1:0] tail     , tail_next ,  tail_incremented;
logic [COUNT_WIDTH-1:0] where_to_read;   

(* ram_style = "block" *) logic [DWIDTH-1:0]      content [(2**COUNT_WIDTH)-1:0];
logic write_enable, read_enable;
logic [DWIDTH-1:0] from_memory, from_din, middle, middle_next;


always_ff @( posedge clk ) begin 
    if(reset)
    begin
        state_cur <= 3'b000;
        head      <= {(COUNT_WIDTH) {1'b0} };
        tail      <= {(COUNT_WIDTH) {1'b0} };
    end
    else
    begin
        head      <= head_next;
        tail      <= tail_next;
        state_cur <= state_next;
        middle    <= middle_next;
    end
end

always_ff @(posedge clk)begin

    if(write_enable)
    begin
        content[tail] <= din;
    end

    from_memory  <= content[where_to_read];

   
end
assign from_din = din;

      
always_comb begin 
    data_count            = tail - head;
    head_incremented      = head + 1 ;
    tail_incremented      = tail + 1 ;


    if( head == tail )            empty = 1'b1;
    else                          empty = 1'b0;

    if( head == tail_incremented) full = 1'b1;
    else                          full = 1'b0;


    write_enable     = 1'b0;
    read_enable      = 1'b0;
    tail_next        = tail;
    head_next        = head;

    if(wr_en && ~full )
    begin
        write_enable = 1'b1;
        tail_next    = tail_incremented;
    end

    if(rd_en && ~empty)
    begin
        read_enable = 1'b1;
        head_next   = head_incremented;
    end
    

    state_next    = state_cur;
    middle_next   = middle;
    dout          = middle;

    where_to_read = head_incremented;
    case(state_cur)
    3'b000:
    begin
        if(write_enable) 
        begin
            state_next = 3'b100;  
            middle_next= from_din;  
        end    
    end
    3'b100:
    begin
        dout = middle;
        case({write_enable, read_enable})
            2'b11:
            begin
                state_next = state_cur;
                middle_next= from_din;  
            end
            2'b10:
            begin
                state_next = 3'b101;    

            end    
            2'b01:
            begin
                state_next = 3'b000;

            end
        endcase
    end
    3'b101:
    begin
        dout = middle;
       
        case({write_enable, read_enable})
            2'b11:
            begin
                state_next = 3'b011;

            end
            2'b10:
            begin
                state_next = 3'b111;

            end
            2'b01:
            begin
                state_next = 3'b010;

            end
            default:
            begin
                state_next = 3'b111;

            end
        endcase
    end
    3'b010:
    begin
        dout = from_memory;
        case({write_enable, read_enable})
            2'b11:
            begin
                state_next = 3'b100;
                middle_next= from_din;
            end
            2'b10:
            begin
                state_next = 3'b101;
                middle_next= from_memory;
            end
            2'b01:
            begin
                state_next = 3'b000;

            end
            default:
            begin
                state_next = 3'b100;
                middle_next= from_memory;
            end
        endcase
    end
    3'b011:
    begin
        dout = from_memory;
        case({write_enable, read_enable})
            2'b11:
            begin
                state_next = state_cur;

            end
            2'b10:
            begin
                state_next = 3'b111;
                middle_next= from_memory;
            end
            2'b01:
            begin
                state_next = 3'b010;
                
            end
            default:
            begin
                state_next = 3'b111;
                middle_next= from_memory;
            end
        endcase
    end
    3'b111:
    begin
        dout = middle;
        
        if(read_enable)
        begin 
            middle_next   = from_memory;
            where_to_read = head_incremented +1;
            if(data_count == 2 && ~ write_enable)
            begin
                state_next = 3'b100;
            end
            else if(data_count == 2 && write_enable)
            begin
                state_next = 3'b101;
            end
            
        end
    end
    endcase
end


endmodule
