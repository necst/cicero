`timescale 1ns/1ps

module regex_coprocessor_single_bb #(
    parameter PC_WIDTH          = 8,
    parameter CHARACTER_WIDTH   = 8,
    parameter MEMORY_WIDTH      = 16,
    parameter MEMORY_ADDR_WIDTH = 11
)
(
    input   logic                           clk,
    input   logic                           reset,

    input   logic                           memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]    memory_data,
    output  logic                           memory_valid,

    input   logic                           start_ready,
    //input   logic[PC_WIDTH-1:0]             start_pc,
    input   logic[MEMORY_ADDR_WIDTH-1:0]    start_cc_pointer,
    output  logic                           start_valid,
    output  logic                           finish,
    output  logic                           accept
);
    localparam [MEMORY_ADDR_WIDTH-1:0] start_pc = { MEMORY_ADDR_WIDTH{1'b0} };
    logic  [MEMORY_ADDR_WIDTH:0]   cur_cc_pointer           , next_cc_pointer;
    logic  [CHARACTER_WIDTH-1:0]   cur_cc                   , next_cc;
    logic                          cur_is_even_character   , next_is_even_character;
    localparam logic [CHARACTER_WIDTH-1:0 ] CHARACTER_TERMINATOR = { CHARACTER_WIDTH {1'b0}};
    localparam nr_bits_states = 3;
    typedef enum logic[nr_bits_states-1 : 0] {
                                                S_IDLE                      , S_FETCH_NEXT_CC       , S_EXEC, 
                                                S_COMPLETED_WITHOUT_ACCEPTING , S_COMPLETE_ACCEPTING  , S_ERROR
                                            } State;
    
    //MEMORY
    logic                           memory_ready_for_bb ;
    logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr_for_bb  ;
    logic[MEMORY_WIDTH-1     :0]    memory_data_for_bb  ;
    logic                           memory_valid_for_bb ;
    logic                           memory_ready_for_cc ;
    logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr_for_cc  ;
    logic[MEMORY_WIDTH-1     :0]    memory_data_for_cc  ;
    logic                           memory_valid_for_cc ;
    //FIFO
    
    localparam FIFO_COUNT_WIDTH = 6;
    logic                   fifos_reset                 ;
    logic                   fifo_even_data_in_ready     ;
    logic                   fifo_even_data_in_not_ready ;
    logic [PC_WIDTH-1:0]  fifo_even_data_in           ;
    logic                   fifo_even_data_in_valid     ;
    logic                   fifo_even_data_out_ready    ;
    logic [PC_WIDTH-1:0]  fifo_even_data_out          ;
    logic                   fifo_even_data_out_valid    ;
    logic                   fifo_even_data_out_not_valid;
    //logic [FIFO_COUNT_WIDTH-1:0]fifo_even_data_count    ;
    logic                   fifo_odd_data_in_ready      ;
    logic                   fifo_odd_data_in_not_ready  ;
    logic [PC_WIDTH-1:0]  fifo_odd_data_in            ;
    logic                   fifo_odd_data_in_valid      ;
    logic                   fifo_odd_data_out_ready     ;
    logic [PC_WIDTH-1:0]  fifo_odd_data_out           ;
    logic                   fifo_odd_data_out_valid     ;
    logic                   fifo_odd_data_out_not_valid ;
    //logic [FIFO_COUNT_WIDTH-1:0]fifo_odd_data_count     ;


    logic                   fifo_cur_char_data_in_ready  ;
    logic [PC_WIDTH-1:0]  fifo_cur_char_data_in        ;
    logic                   fifo_cur_char_data_in_valid  ;
    logic                   fifo_cur_char_data_out_ready ;
    logic [PC_WIDTH-1:0]  fifo_cur_char_data_out       ;
    logic                   fifo_cur_char_data_out_valid ;
    logic                   fifo_next_char_data_in_ready ;
    logic [PC_WIDTH-1:0]  fifo_next_char_data_in       ;
    logic                   fifo_next_char_data_in_valid ;
    logic                   fifo_next_char_data_out_ready;
    logic [PC_WIDTH-1:0]  fifo_next_char_data_out      ;
    logic                   fifo_next_char_data_out_valid;
    
    //
    logic                   override_pc_ready;
    logic [PC_WIDTH-1:0]    override_pc;
    logic                   override_pc_valid;

    logic                   input_pc_ready;
    logic [PC_WIDTH-1:0]    input_pc;
    logic                   input_pc_valid;

    logic                   output_pc_ready;
    logic [PC_WIDTH-1:0]    output_pc;
    logic                   output_pc_valid;
    logic                   output_pc_is_directed_to_current;
    logic                   bb_accept;

    State cur_state, next_state;
    always_ff @( posedge clk ) begin
         
        if(reset)
        begin
            cur_state               <= S_IDLE;
            cur_cc_pointer          <= { (PC_WIDTH+1){1'b0} };
            cur_cc                  <= { (CHARACTER_WIDTH){1'b0} };
            cur_is_even_character  <= 1'b1;
        end
        else
        begin
            cur_state               <= next_state;
            cur_cc_pointer          <= next_cc_pointer;
            cur_cc                  <= next_cc;
            cur_is_even_character  <= next_is_even_character;
        end
    end

    always_comb begin 
        next_state              = cur_state;
        next_cc_pointer         = cur_cc_pointer;
        next_cc                 = cur_cc;
        next_is_even_character  = cur_is_even_character;
        //default signal
        start_valid             = 1'b0;
        finish                  = 1'b0;
        accept                  = 1'b0;
        //for memory req override
        memory_addr_for_cc     = { (MEMORY_ADDR_WIDTH) {1'b0} };
        memory_valid_for_cc    = 1'b0;
        //for pc override
        override_pc            = { (PC_WIDTH){1'b0}           };
        override_pc_valid      = 1'b0;
        //fifos
        if (reset == 1'b1)   fifos_reset = 1'b1;
        else                 fifos_reset = 1'b0;
        //default signals fifos
        

        case(cur_state)
        S_IDLE:
        begin
            memory_addr_for_cc  = start_cc_pointer;
            memory_valid_for_cc = 1'b1;
            override_pc         = start_pc;
            
            if(memory_ready_for_cc && start_ready  ) 
            begin
                next_state          = S_FETCH_NEXT_CC;
                next_cc_pointer     = {start_cc_pointer, 1'b0};
                override_pc_valid   = 1'b1;
                start_valid         = 1'b1;
            end
        end
        S_FETCH_NEXT_CC:
        begin
            next_state = S_EXEC;
            if(cur_cc_pointer[0] == 1'b0) next_cc    = memory_data[ 7:0];
            else                          next_cc    = memory_data[15:8];
        end
        S_EXEC:
        begin
            if(bb_accept)
            begin // if one raise accept done!
                next_state  = S_COMPLETE_ACCEPTING;
                //flush fifos
                fifos_reset = 1'b1;
            end
            else if( fifo_cur_char_data_out_valid==1'b0 && input_pc_ready==1'b1)
            begin // if current fifo is void and basic block is not running.

                if( cur_cc == CHARACTER_TERMINATOR || ~fifo_next_char_data_out_valid)
                begin //if current char is terminator or no pc in next char queue
                    next_state = S_COMPLETED_WITHOUT_ACCEPTING;
                end
                else
                begin //supply address to memory asking for new current character
                    logic [MEMORY_ADDR_WIDTH:0] tmp_cur_cc_increment ;
                    tmp_cur_cc_increment= cur_cc_pointer + 1;
                    memory_valid_for_cc = 1'b1;
                    memory_addr_for_cc  = tmp_cur_cc_increment [1+: MEMORY_ADDR_WIDTH];
                   
                    if( memory_ready_for_cc)
                    begin //if memory answers affermatively go to state where at next cc memory data is latched in current character register.
                        next_state              = S_FETCH_NEXT_CC;
                        next_is_even_character  = ~ cur_is_even_character;
                        next_cc_pointer         = tmp_cur_cc_increment;
                    end
                end
                
            end
            else if ( ~fifo_cur_char_data_in_ready && fifo_cur_char_data_in_valid)
            begin // if there's an instruction that should be saved but no one is able to save it 
                next_state = S_ERROR;
            end
        end
        S_COMPLETE_ACCEPTING:
        begin
            finish = 1'b1;
            accept = 1'b1;
            next_state = S_IDLE;
        end
        S_COMPLETED_WITHOUT_ACCEPTING:
        begin
            finish = 1'b1;
            next_state = S_IDLE;
        end
        endcase
    end

    /// Moduleinstances

    arbiter_fixed #(
        .DWIDTH(MEMORY_ADDR_WIDTH),
        .PRIORITY_0(1)
    ) arbiter_for_memory_contention (
        .in_0_valid( memory_valid_for_cc ),
        .in_0_data ( memory_addr_for_cc  ),
        .in_0_ready( memory_ready_for_cc ),
        .in_1_valid( memory_valid_for_bb ),
        .in_1_data ( memory_addr_for_bb  ),
        .in_1_ready( memory_ready_for_bb ),
        .out_valid ( memory_valid        ),
        .out_data  ( memory_addr         ),
        .out_ready ( memory_ready        )
    );
    //memory data are broadcasted but only memory which receives ready 
    //knows that at next cc it would be its turn.
    assign memory_data_for_bb = memory_data;
    assign memory_data_for_cc = memory_data;

    regex_cpu #(
        .PC_WIDTH          (PC_WIDTH            ),
        .CHARACTER_WIDTH   (CHARACTER_WIDTH     ),
        .MEMORY_WIDTH      (MEMORY_WIDTH        ),
        .MEMORY_ADDR_WIDTH (MEMORY_ADDR_WIDTH   )
    ) aregex_cpu (
        .clk                                (clk    ),
        .reset                              (reset  ), 
        .current_character                  (cur_cc ),
        .input_pc_ready                     (input_pc_ready     ), 
        .input_pc                           (input_pc           ), 
        .input_pc_valid                     (input_pc_valid     ),
        .memory_ready                       (memory_ready_for_bb),
        .memory_addr                        (memory_addr_for_bb ),
        .memory_data                        (memory_data        ),   
        .memory_valid                       (memory_valid_for_bb),
        .output_pc_is_directed_to_current   (output_pc_is_directed_to_current),
        .output_pc_ready                    (output_pc_ready),
        .output_pc                          (output_pc),
        .output_pc_valid                    (output_pc_valid),
        .accepts                            (bb_accept)
    );

    assign fifo_even_data_in_ready  = ~ fifo_even_data_in_not_ready ;
    assign fifo_even_data_out_valid = ~ fifo_even_data_out_not_valid;
    //always_comb begin : fifo_even_data_out_valid_comp
    //    if( fifo_even_data_count == {(FIFO_COUNT_WIDTH){1'b0}}) fifo_even_data_out_valid = 1'b0;
    //    else                                                    fifo_even_data_out_valid = 1'b1;
    //end
    fifo #(
        .DWIDTH(PC_WIDTH),
        .COUNT_WIDTH(FIFO_COUNT_WIDTH)
    )fifo_even(
        .clk         (clk), 
        .reset       (fifos_reset                 ), 
        .full        (fifo_even_data_in_not_ready ), //equivalent to not data_in_ready
        .din         (fifo_even_data_in           ),  
        .wr_en       (fifo_even_data_in_valid     ), //equivalent to data_in_valid
        .rd_en       (fifo_even_data_out_ready    ), //equivalent to data_out_ready
        .dout        (fifo_even_data_out          ), 
        //.data_count  (fifo_even_data_count        )
        .empty(fifo_even_data_out_not_valid) //equivalent to not data_out_valid
    );

    assign fifo_odd_data_in_ready  = ~ fifo_odd_data_in_not_ready ;
    assign fifo_odd_data_out_valid = ~ fifo_odd_data_out_not_valid;
    //always_comb begin : fifo_odd_data_out_valid_comp
    //    if( fifo_odd_data_count == {(FIFO_COUNT_WIDTH){1'b0}}) fifo_odd_data_out_valid = 1'b0;
    //    else                                                   fifo_odd_data_out_valid = 1'b1;
    //end
    fifo #(
        .DWIDTH(PC_WIDTH),
        .COUNT_WIDTH(FIFO_COUNT_WIDTH)
    )fifo_odd(
        .clk         (clk), 
        .reset       (fifos_reset                ), 
        .full        (fifo_odd_data_in_not_ready ), //equivalent to not data_in_ready
        .din         (fifo_odd_data_in           ),  
        .wr_en       (fifo_odd_data_in_valid     ), //equivalent to data_in_valid
        .rd_en       (fifo_odd_data_out_ready    ), //equivalent to data_out_ready
        .dout        (fifo_odd_data_out          ), 
        //.data_count  (fifo_odd_data_count        )
        .empty(fifo_odd_data_out_not_valid) //equivalent to not data_out_valid
    );

    //select accordin to cur_is_even_character fifo current and fifo next 
    always_comb begin : selector_fifo_current_fifo_next
        
        if ( cur_is_even_character == 1'b1  )
        begin
            fifo_cur_char_data_in_ready   =  fifo_even_data_in_ready      ;
            fifo_even_data_in             =  fifo_cur_char_data_in        ;
            fifo_even_data_in_valid       =  fifo_cur_char_data_in_valid  ; 
            fifo_even_data_out_ready      =  fifo_cur_char_data_out_ready ;
            fifo_cur_char_data_out        =  fifo_even_data_out           ;
            fifo_cur_char_data_out_valid  =  fifo_even_data_out_valid     ;

            fifo_next_char_data_in_ready  =  fifo_odd_data_in_ready       ;
            fifo_odd_data_in              =  fifo_next_char_data_in       ;
            fifo_odd_data_in_valid        =  fifo_next_char_data_in_valid ; 
            fifo_odd_data_out_ready       =  fifo_next_char_data_out_ready;
            fifo_next_char_data_out       =  fifo_odd_data_out            ;
            fifo_next_char_data_out_valid =  fifo_odd_data_out_valid      ;
        end
        else
        begin
            fifo_cur_char_data_in_ready   =  fifo_odd_data_in_ready       ;
            fifo_odd_data_in              =  fifo_cur_char_data_in        ;
            fifo_odd_data_in_valid        =  fifo_cur_char_data_in_valid  ; 
            fifo_odd_data_out_ready       =  fifo_cur_char_data_out_ready ;
            fifo_cur_char_data_out        =  fifo_odd_data_out            ;
            fifo_cur_char_data_out_valid  =  fifo_odd_data_out_valid      ;

            fifo_next_char_data_in_ready  =  fifo_even_data_in_ready      ;
            fifo_even_data_in             =  fifo_next_char_data_in       ;
            fifo_even_data_in_valid       =  fifo_next_char_data_in_valid ; 
            fifo_even_data_out_ready      =  fifo_next_char_data_out_ready;
            fifo_next_char_data_out       =  fifo_even_data_out           ;
            fifo_next_char_data_out_valid =  fifo_even_data_out_valid     ;

        end                        
    end

    arbiter_fixed #(
        .DWITDH(PC_WIDTH),
        .PRIORITY_0(1)
    ) arbiter_to_ovveride_pc_at_bb_input (
        .in_0_ready( override_pc_ready ),
        .in_0_data ( override_pc ),
        .in_0_valid( override_pc_valid ),
        .in_1_ready( fifo_cur_char_data_out_ready   ),
        .in_1_data ( fifo_cur_char_data_out         ),
        .in_1_valid( fifo_cur_char_data_out_valid   ),
        .out_ready ( input_pc_ready ),
        .out_data  ( input_pc ),
        .out_valid ( input_pc_valid )
    );

    assign fifo_next_char_data_out_ready = 1'b0;

    always_comb begin : demux_for_pc_out 
        fifo_cur_char_data_in  = { PC_WIDTH{1'b0} };
        fifo_next_char_data_in = { PC_WIDTH{1'b0} };

        if(output_pc_is_directed_to_current)
        begin
            output_pc_ready             = fifo_cur_char_data_in_ready;
            fifo_cur_char_data_in       = output_pc ;
            fifo_cur_char_data_in_valid = output_pc_valid ;

            fifo_next_char_data_in_valid= 1'b0;
        end
        else
        begin
            output_pc_ready              = fifo_next_char_data_in_ready;
            fifo_next_char_data_in       = output_pc ;
            fifo_next_char_data_in_valid = output_pc_valid ;

            fifo_cur_char_data_in_valid  = 1'b0;
        end
    end

    

endmodule