
//A cache to decouple memory access between different 
//basic block. 
//Remember that in this context none write the memory 
//hence no synchronization problem can happen.
//1. memory is supplied with an address (filling addr_in,raising addr_in_valid)
//2.a if memory has this content in cache answers positively raising addr_in_ready.
//2.b otherwise memory relays memory request on addr_out using the same protocol.
//
module cache_block_directly_mapped_broadcast #(          
    parameter DWIDTH                    = 4,
    parameter CACHE_WIDTH_BITS          = 4,
    parameter BLOCK_WIDTH_BITS          = 4,
    parameter ADDR_IN_WIDTH             = 16
)(
  input  logic                          clk,
  input  logic                          rst,

  input  logic                          addr_in_valid,
  input  logic [ADDR_IN_WIDTH-1:0]      addr_in,
  output logic                          addr_in_ready,
  output logic [DWIDTH-1:0]             data_out,

  output logic                                       addr_out_valid,
  output logic [ADDR_IN_WIDTH-BLOCK_WIDTH_BITS-1:0]  addr_out,
  input  logic                                       addr_out_ready,
  input  logic [ADDR_IN_WIDTH-BLOCK_WIDTH_BITS-1:0]  addr_broadcast,
  input  logic                                       addr_broadcast_valid,
  input  logic [DWIDTH*(2**BLOCK_WIDTH_BITS)-1:0]    data_in
  );

localparam  CACHE_WIDTH    = 2**CACHE_WIDTH_BITS;
localparam  BLOCK_WIDTH    = 2**BLOCK_WIDTH_BITS;
localparam  OUT_ADDR_WIDTH = ADDR_IN_WIDTH - BLOCK_WIDTH_BITS;
localparam  TAG_WIDTH      = ADDR_IN_WIDTH - BLOCK_WIDTH_BITS - CACHE_WIDTH_BITS ;
localparam  RAM_WIDTH      = DWIDTH*BLOCK_WIDTH;

(* ram_style="block" *)logic      [RAM_WIDTH-1:0] content  [CACHE_WIDTH-1:0];

logic [TAG_WIDTH-1:0] tag         [CACHE_WIDTH-1:0];
logic                 is_present  [CACHE_WIDTH-1:0];
logic [RAM_WIDTH-1:0] data_from_memory ;

typedef enum logic[2:0] { S_IDLE,S_FETCH, S_FETCH_BROADCAST } State;
State curState, nextState;

//decompose addr_in in tag and cache_line
logic [BLOCK_WIDTH_BITS-1:0]            block_sel_in , block_sel_saved, block_sel_saved_next  ;
logic [CACHE_WIDTH_BITS-1:0 ]           cache_line_in, cache_line_saved, cache_line_saved_next, broadcast_cache_line_in ;
logic [TAG_WIDTH-1:0]                   tag_in       , tag_saved       , tag_saved_next       , broadcast_tag_in        ;

assign block_sel_in  = addr_in[0+:BLOCK_WIDTH_BITS];
assign cache_line_in = addr_in[BLOCK_WIDTH_BITS+:CACHE_WIDTH_BITS];
assign tag_in        = addr_in[ADDR_IN_WIDTH-1-:TAG_WIDTH];

assign broadcast_cache_line_in = addr_broadcast[0+:CACHE_WIDTH_BITS];
assign broadcast_tag_in        = addr_broadcast[ADDR_IN_WIDTH-BLOCK_WIDTH_BITS-1-:TAG_WIDTH];
//compute hit signal
logic                                   hit;
assign hit           = (tag[cache_line_in] == tag_in && is_present[cache_line_in]) ;

always_ff @( posedge clk ) begin 
    if(rst == 1'b1)
    begin
        curState                    <= S_IDLE;

        for(int i=0; i<CACHE_WIDTH; i++)
        begin
            is_present[i]           <= 1'b0;
        end 

    end
    else 
    begin

        cache_line_saved            <= cache_line_saved_next;
        block_sel_saved             <= block_sel_saved_next ;
        tag_saved                   <= tag_saved_next       ;
        curState                    <= nextState            ;
        data_from_memory            <= content[cache_line_in];
        if(curState == S_FETCH || curState== S_FETCH_BROADCAST)
        begin
            tag         [cache_line_saved] <= tag_saved;
            is_present  [cache_line_saved] <= 1'b1     ;
            content     [cache_line_saved] <= data_in  ;
        end
       
    end
end

//next state 
always_comb 
begin
    //default next state signals
    nextState                = curState            ;
    block_sel_saved_next     = block_sel_saved     ;
    cache_line_saved_next    = cache_line_saved    ;
    tag_saved_next           = tag_saved           ;

    //default output
    addr_in_ready       = 1'b0;
    addr_out            = addr_in[ADDR_IN_WIDTH-1-:OUT_ADDR_WIDTH] ;
    addr_out_valid      = 1'b0                                     ;
    data_out            = data_from_memory[ block_sel_saved*DWIDTH+:DWIDTH ];

    case (curState)
    S_IDLE:
    begin
        logic response_ok = (addr_out_ready || ( addr_broadcast_valid && addr_out == addr_broadcast ));
        block_sel_saved_next     = block_sel_in    ;
        cache_line_saved_next    = cache_line_in   ;
        tag_saved_next           = tag_in          ;

        addr_in_ready            = addr_in_valid && hit ;
        addr_out_valid           = addr_in_valid && ~hit;

        if(addr_in_valid && ~hit && response_ok ) 
        begin
            nextState            = S_FETCH     ;
            //addr_in_ready        = 1'b1;
        end
        else if ( addr_broadcast_valid && !is_present[broadcast_cache_line_in]) 
        begin
            cache_line_saved_next    = broadcast_cache_line_in   ;
            tag_saved_next           = broadcast_tag_in          ;
            nextState                = S_FETCH_BROADCAST     ;
        end
    end
    S_FETCH:
    begin
        nextState           = S_IDLE;
        addr_out_valid      = 1'b0                                     ;
        //data_out            = data_in[ block_sel_saved*DWIDTH+:DWIDTH ];
    end
    S_FETCH_BROADCAST:
    begin
        nextState           = S_IDLE;
        addr_out_valid      = 1'b0  ;
    end
    endcase
    
end

endmodule
