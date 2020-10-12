`timescale 1ns/1ps
//A cache to decouple memory access between different 
//basic block. 
//Remember that in this context none write the memory 
//hence no synchronization problem can happen.
//1. memory is supplied with an address (filling addr_in,raising addr_in_valid)
//2.a if memory has this content in cache answers positively raising addr_in_ready.
//2.b otherwise memory relays memory request on addr_out using the same protocol.
//
module cache_block_directly_mapped #(          
    parameter DWIDTH                    = 16,
    parameter CACHE_WIDTH_BITS          = 4,
    parameter BLOCK_WIDTH_BITS          = 2,
    parameter ADDR_IN_WIDTH             = 8
)(
  input  logic                          clk,
  input  logic                          reset,

  input  logic                          addr_in_valid,
  input  logic [ADDR_IN_WIDTH-1:0]      addr_in,
  output logic                          addr_in_ready,
  output logic [DWIDTH-1:0]             data_out,

  output logic                                       addr_out_valid,
  output logic [ADDR_IN_WIDTH-BLOCK_WIDTH_BITS-1:0]  addr_out,
  input  logic                                       addr_out_ready,
  input  logic [DWIDTH*(2**BLOCK_WIDTH_BITS)-1:0]    data_in

  );

localparam  CACHE_WIDTH    = 2**CACHE_WIDTH_BITS;
localparam  BLOCK_WIDTH    = 2**BLOCK_WIDTH_BITS;
localparam  OUT_ADDR_WIDTH = ADDR_IN_WIDTH - BLOCK_WIDTH_BITS;
localparam  TAG_WIDTH      = ADDR_IN_WIDTH - BLOCK_WIDTH_BITS - CACHE_WIDTH_BITS ;

(* ram_style="block" *)logic      [DWIDTH-1:0] content  [CACHE_WIDTH-1:0][BLOCK_WIDTH-1:0];

logic [TAG_WIDTH-1:0] tag         [CACHE_WIDTH-1:0];
logic                 is_present  [CACHE_WIDTH-1:0];
logic [DWIDTH-1:0]    data_from_memory ;

typedef enum logic[1:0] { S_IDLE,S_FETCH, S_WRITE } State;
State curState, nextState;

//decompose addr_in in tag and cache_line
logic [BLOCK_WIDTH_BITS-1:0]            block_sel_in , block_sel_saved, block_sel_saved_next;
logic [CACHE_WIDTH_BITS-1:0 ]           cache_line_in, cache_line_saved, cache_line_saved_next ;
logic [TAG_WIDTH-1:0]                   tag_in       , tag_saved       , tag_saved_next        ;

assign block_sel_in  = addr_in[0+:BLOCK_WIDTH_BITS];
assign cache_line_in = addr_in[BLOCK_WIDTH_BITS+:CACHE_WIDTH_BITS];
assign tag_in        = addr_in[ADDR_IN_WIDTH-1-:TAG_WIDTH];
//compute hit signal
logic                                   hit;
assign hit           = (tag[cache_line_in] == tag_in && is_present[cache_line_in]) ;

always_ff @( posedge clk ) begin 
    if(reset == 1'b1)
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
        data_from_memory            <= content[cache_line_in][block_sel_in];
        if(curState == S_WRITE)
        begin
            tag         [cache_line_saved] <= tag_saved;
            is_present  [cache_line_saved] <= 1'b1     ;
            for(int i=0; i<BLOCK_WIDTH; i++)
                content     [cache_line_saved][i] <= data_in[i*DWIDTH+:DWIDTH]  ;
        end
       
    end
end

//next state 
always_comb begin
    //default next state signals
    nextState                = curState            ;
    block_sel_saved_next     = block_sel_saved     ;
    cache_line_saved_next    = cache_line_saved    ;
    tag_saved_next           = tag_saved           ;
    case (curState)
    S_IDLE, S_WRITE:
    begin
        if( addr_in_valid && ~hit)  
            nextState = S_FETCH;
        else
            nextState = S_IDLE;
    end
    S_FETCH:
    begin
        if(addr_out_ready)
        begin
            block_sel_saved_next     = block_sel_in    ;
            cache_line_saved_next    = cache_line_in   ;
            tag_saved_next           = tag_in          ;
            nextState = S_WRITE;
        end
    end
    endcase             
   
   
end

//output function
always_comb begin 
    //default output
    addr_in_ready       = 1'b0;
    addr_out            = {(OUT_ADDR_WIDTH){1'b0}} ;
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
        //take the topmost i bits from addr_in signal
        addr_out          = addr_in[ADDR_IN_WIDTH-1-:OUT_ADDR_WIDTH] ;
        addr_out_valid    = 1'b1    ;
        if(addr_out_ready)
        begin //next cycle the memory would answer
            addr_in_ready = 1'b1 ;
        end
    end
    S_WRITE: 
    begin
        data_out              = data_in[ block_sel_saved*DWIDTH+:DWIDTH] ;
    end
    endcase
    
end

endmodule
