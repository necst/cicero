
//A cache to decouple memory access between different 
//basic block. 
//Remember that in this context none write the memory 
//hence no synchronization problem can happen.
//1. memory is supplied with an address (filling addr_in,raising addr_in_valid)
//2.a if memory has this content in cache answers positively raising addr_in_ready.
//2.b otherwise memory relays memory request on addr_out using the same protocol.
//
module cache_directly_mapped #(          
    parameter DWIDTH                    = 16,
    parameter CACHE_WIDTH_BITS          = 5,
    parameter ADDR_WIDTH                = 16
)(
  input  logic                  clk,
  input  logic                  rst,
  input  logic                  addr_in_valid,
  input  logic [ADDR_WIDTH-1:0] addr_in,
  output logic                  addr_in_ready,
  output logic [DWIDTH-1:0]     data_out,

  output logic                  addr_out_valid,
  output logic [ADDR_WIDTH-1:0] addr_out,
  input  logic                  addr_out_ready,
  input  logic [DWIDTH-1:0]     data_in

  );
localparam            TAG_WIDTH  = ADDR_WIDTH-CACHE_WIDTH_BITS;

(* dont_touch = "true" *) logic    [DWIDTH-1:0] content     [2**CACHE_WIDTH_BITS-1:0];
(* dont_touch = "true" *) logic [TAG_WIDTH-1:0] tag         [2**CACHE_WIDTH_BITS-1:0];
(* dont_touch = "true" *) logic                 is_present  [2**CACHE_WIDTH_BITS-1:0];
logic                 is_present_i_next                    ;
logic [DWIDTH-1:0]    content_i_next                       ;
logic [DWIDTH-1:0]    data_out_saved, data_out_saved_next  ;

typedef enum logic { S_IDLE, S_WRITE } State;
State curState, nextState;

//decompose addr_in in tag and cache_line
logic [CACHE_WIDTH_BITS-1:0 ]           cache_line_in, cache_line_in_saved  , cache_line_in_saved_next;
logic [TAG_WIDTH-1:0]                   tag_in       , tag_in_saved         , tag_in_saved_next       ;
assign cache_line_in = addr_in[0+:CACHE_WIDTH_BITS];
assign tag_in        = addr_in[ADDR_WIDTH-1-:TAG_WIDTH];
//compute hit signal
logic                                   hit;
assign hit           = (tag[cache_line_in] == tag_in && is_present[cache_line_in]) ;

always_ff @( posedge clk ) begin 
    if(rst == 1'b1)
    begin
        curState                    <= S_IDLE;

        for(int i=0; i<2**CACHE_WIDTH_BITS; i++)
        begin
            is_present[i]           <= {1'b0};
        end 

        data_out_saved              <= {(DWIDTH){1'b0}};
    end
    else 
    begin
        curState                    <= nextState;
        cache_line_in_saved         <= cache_line_in_saved_next;
        tag_in_saved                <= tag_in_saved_next;
        if(curState == S_WRITE)
        begin
            tag         [cache_line_in_saved] <= tag_in_saved;
            is_present  [cache_line_in_saved] <= is_present_i_next;
            content     [cache_line_in_saved] <= content_i_next;
        end
        data_out_saved              <= data_out_saved_next;
    end
end

//next state 
always_comb begin
    //default next state signals
    nextState                =  curState           ;
    is_present_i_next        =  1'b0               ;
    content_i_next           =  {(DWIDTH)   {1'b0}};
    data_out_saved_next      =  {(DWIDTH)   {1'b0}};
    cache_line_in_saved_next = cache_line_in_saved ;
    tag_in_saved_next        = tag_in_saved        ;             
    if(curState==S_WRITE)
    begin
        nextState           = S_IDLE    ;
        is_present_i_next   = 1'b1      ;
        content_i_next      = data_in   ;

    end

    data_out_saved_next   =  content[cache_line_in];
    if( addr_in_valid && ~hit)  
    begin

        
        if(addr_out_ready)
        begin
            tag_in_saved_next        = tag_in       ;
            cache_line_in_saved_next = cache_line_in;
            nextState = S_WRITE;
        end
    end
end

//output function
always_comb begin 
    //a response to addr_in_valid
    if( addr_in_valid == 1'b1)  addr_in_ready = hit ;
    else                        addr_in_ready = 1'b0;
    //default output
    addr_out            = {(ADDR_WIDTH){1'b0}}     ;
    addr_out_valid      = 1'b0                     ;
    data_out            = data_out_saved           ;

    if( addr_in_valid && ~hit)  
    begin
        addr_out          = addr_in ;
        addr_out_valid    = 1'b1    ;
        if(addr_out_ready)
        begin
            addr_in_ready = 1'b1    ;
        end
    end

    if(curState==S_WRITE)
    begin
        data_out              = data_in ;
    end
    
end

endmodule
