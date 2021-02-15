
//A cache to decouple memory access between different 
//basic block. 
//Remember that in this context none write the memory 
//hence no synchronization problem can happen.
//1. memory is supplied with an address (filling addr_in,raising addr_in_valid)
//2.a if memory has this content in cache answers positively raising addr_in_ready.
//2.b otherwise memory relays memory request on addr_out using the same protocol.
//
module cache_directly_mapped_latency #(          
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

(* ram_style="block" *)logic    [DWIDTH-1:0] content     [2**CACHE_WIDTH_BITS-1:0];
logic [TAG_WIDTH-1:0] tag         [2**CACHE_WIDTH_BITS-1:0];
logic                 is_present  [2**CACHE_WIDTH_BITS-1:0];
logic [DWIDTH-1:0]    data_from_memory                     ;

typedef enum logic[1:0] { S_IDLE,S_FETCH, S_WRITE } State;
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
        tag_in_saved                <= { TAG_WIDTH{1'b0} };
        cache_line_in_saved         <= { CACHE_WIDTH_BITS{1'b0}};

        for(int i=0; i<2**CACHE_WIDTH_BITS; i++)
        begin
            is_present[i]           <= 1'b0;
        end 

    end
    else 
    begin
        curState                    <= nextState;
        cache_line_in_saved         <= cache_line_in_saved_next;
        tag_in_saved                <= tag_in_saved_next;
        data_from_memory            <= content[cache_line_in];
        if(curState == S_WRITE)
        begin
            tag         [cache_line_in_saved] <= tag_in_saved     ;
            is_present  [cache_line_in_saved] <= 1'b1             ;
            content     [cache_line_in_saved] <= data_in          ;
        end
       
    end
end

//next state 
always_comb begin
    //default next state signals
    nextState                = curState            ;
    cache_line_in_saved_next = cache_line_in_saved ;
    tag_in_saved_next        = tag_in_saved        ;

    case (curState)
    S_IDLE:
    begin
        if( addr_in_valid && ~hit)  
        begin
            nextState                = S_FETCH;
            cache_line_in_saved_next = cache_line_in;
            tag_in_saved_next        = tag_in;
        end
    end
    S_FETCH:
    begin
        if(addr_out_ready)
        begin
            nextState = S_WRITE;
        end
    end
    S_WRITE:
    begin
        nextState     = S_IDLE    ;
    end
    endcase             
   
   
end

//output function
always_comb begin 
    //default output
    addr_in_ready       = 1'b0;
    addr_out            = {(ADDR_WIDTH){1'b0}}     ;
    addr_out_valid      = 1'b0                     ;
    data_out            = data_from_memory         ;

    case (curState)
    S_IDLE:
    begin
        if( addr_in_valid == 1'b1)  
            addr_in_ready = hit ;
    end
    S_FETCH:
    begin
        addr_out          = addr_in ;
        addr_out_valid    = 1'b1    ;
        if(addr_out_ready)
        begin //next cycle the memory would answer
            addr_in_ready = 1'b1    ;
        end
    end
    S_WRITE: 
    begin
        data_out              = data_in ;
    end
    endcase
    
end

endmodule
