`timescale 1ns/1ps
//This module implements a parametric queue
//It provides also an output which signals how many values have been 
//stored inside the queue. 
module fifo #(
    parameter DWIDTH          = 16,
    parameter COUNT_WIDTH     = 5
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

logic [COUNT_WIDTH-1:0] head; 
logic [COUNT_WIDTH-1:0] head_incremented;
logic [COUNT_WIDTH-1:0] tail;
logic [COUNT_WIDTH-1:0] tail_incremented;
logic [DWIDTH-1:0]      content [(1<<COUNT_WIDTH)-1:0];

always_ff @( posedge clk ) begin 
    if(reset)
    begin
        head <= {(COUNT_WIDTH) {1'b0} };
        tail <= {(COUNT_WIDTH) {1'b0} };
    end
    else
    begin

        if(wr_en == 1'b1 && full == 1'b0 )
        begin
            content[tail] <= din; 
            tail          <= tail_incremented;
        end 
        else
        begin
            tail          <= tail;
        end

        if(rd_en == 1'b1 && empty == 1'b0 )
        begin
            //content[head] <= { DWIDTH {1'b0} }; 
            head          <= head_incremented;
        end 
        else
        begin
            head          <= head;
        end

    end
end

always_comb begin 
    data_count       = tail - head;
    head_incremented = head + 1 ;
    tail_incremented = tail + 1 ;
    
    //for fall through
    dout = content[head];
    //empty
    if( head == tail )            empty = 1'b1;
    else                          empty = 1'b0;
    //full
    if( head == tail_incremented) full = 1'b1;
    else                          full = 1'b0;

end

endmodule
