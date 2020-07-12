`timescale 1ns/1ps
//This module implements a parametric queue
//It provides also an output which signals how many values have been 
//stored inside the queue. 
//
//  ------
//  |    |
//  ------
//  | // | <-tail
//  ------
//  | A  |
//  ------
//  | B   | <-head
//  ------
//
module fifoold #(
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

logic [COUNT_WIDTH-1:0] head, head_next,  head_incremented;
logic [COUNT_WIDTH-1:0] tail, tail_next,  tail_incremented;
(* ram_style = "block" *)logic [DWIDTH-1:0]      content [(2**COUNT_WIDTH)-1:0];
logic [DWIDTH-1:0]  data_saved, data_fall_through;
logic write_enable, read_enable;
logic fall_through, fall_through_last;


always_ff @( posedge clk ) begin 
    if(reset)
    begin
        head <= {(COUNT_WIDTH) {1'b0} };
        tail <= {(COUNT_WIDTH) {1'b0} };
    end
    else
    begin
        head <= head_next;
        tail <= tail_next;
    end
end

always_ff @(posedge clk)begin
    if(write_enable)
    begin
        content[tail] <= din;
    end

end

always_ff @( posedge clk ) begin
    
    if( ~fall_through && read_enable)begin
        data_saved          <= content[head_incremented];
        fall_through_last   <= 1'b0;
    end

    if( fall_through ) begin
        data_fall_through   <= din ;
        fall_through_last   <= 1'b1;
    end               
end

always_comb begin //create full empty signals
    data_count       = tail - head;
    head_incremented = head + 1 ;
    tail_incremented = tail + 1 ;
    
    //empty
    if( head == tail )            empty = 1'b1;
    else                          empty = 1'b0;
    //full
    if( head == tail_incremented) full = 1'b1;
    else                          full = 1'b0;
end

always_comb begin //create we,re
    write_enable = 1'b0;
    read_enable  = 1'b0;
    tail_next    = tail;
    head_next    = head;

    

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

 
    fall_through = 1'b0;
    if (write_enable && ( read_enable && head_incremented == tail || empty))
        fall_through = 1'b1;

    if (fall_through_last)   dout = data_fall_through;
    else                    dout = data_saved;
end

endmodule
