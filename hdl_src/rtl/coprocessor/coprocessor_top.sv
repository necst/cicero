//The regex_coprocessor_nn_bb is in charge of :
// - supplying control signal for the underlying basic clock (e.g. current_character,cur_is_even_character,.. )
// - reading output signals from a basic block  (e.g. running, accepts, )
// - implementing the logic to move from current character to the next character.
// - expose control signals to control the overall logic of the coprocessor
//                      +----------------------------------------------------------------------------------------------------------------+
//                      | Regex_coprocessor                                                                                              |
//                      |   +--------------------------------------------------------------+                                             |
//                      |   |                                                              |                                             |
//                      |   |                                                              |                                             |
//                      |   |                                                              |                                             |
//                      |   |                                                              |                                             |
//                      |   |                                                              |                                             |
//                      |   |                                                              |                                             |
//                      |   |  +-----------------------------------------------------------------------------------------------------+   |
//                      |   |  |                                                        arbiter rr                                   |   |
//                      |   |  +--|------------------------------|----------------------------------------------------------|--------+   |
//                      |   |     |              memory_*_for_bb |                                                          |            |
//                      |   |     |                       +------|-----+                                             +------|-----+      |
//                      |   |     |                       |Basic block |                                             |Basic block |      |
//                      |   |     |                       |            |                                             |            |      |
//                      |   |     |                       +---|-----^--+                                             +---|-----^--+      |
//                      |   |     |                           |     |                                                    |     |         |
//                      |   |     |                           v     |                 +--------------------------+       v     |         |
//                      |   |     |                       +---------|--+              |       +----------------+ |   +---------|--+      |
//                      |   |     |         +--------+    |  I0     O0 |    data      |   /---| fifo    |      ---   |  I0     O0 |      |
//         +----------+ |   |     |   +-----|channel ----->            -------------------    +-------/-|------+ |\-->            ----+  |
//         |          | |   |     |   | +---|        <-----  I1     O1 <--------------<---\   +---------v------+ | ---  I1     O1 <-+ |  |
//         |memory    | |   |     |   | |   +--------+    |   switch   |    latency   |    ---| latency update <--/  |   switch   | | |  |
//         |          ------+     |   | |                 |  (station) |              |channel+----------------+ |   |  (station) | | |  |
//         |          | |         |   | |                 +------------+              +--------------------------+   +------------+ | |  |
//         |          | |         |   | +------------------------------------->-----------------------------------------------------+ |  |
//         |          | |         |   |              +------------+                                                                   |  |
//         +----------+ |         |   |              |  arbiter   |                                                                   |  |
//                      |         |   +---------------  fixed prio<-------------------------------------------------------------------+  |
//                      |         |                  +------------+                                                                      |
//       control signals|         +---------------------+   |                                                                            |
//                 -------------------------------> +---|---+--------+                                                                   |
// done/accept signals|                           |FSM of regex    |                                                                   |
//                 <--------------------------------|coprocessor     |                                                                   |
//                      |                           +----------------+                                                                   |
//                      +----------------------------------------------------------------------------------------------------------------
//
//`include "regex_coprocessor_package.sv"
import coprocessor_package::*;

module coprocessor_top #(
    parameter  PC_WIDTH              = 8 ,
    parameter  LATENCY_COUNT_WIDTH   = 8 ,
    parameter  FIFO_COUNT_WIDTH      = 6 ,
    parameter  CHANNEL_COUNT_WIDTH   = 5 ,
    parameter  CHARACTER_WIDTH       = 8 ,
    parameter  MEMORY_WIDTH          = 16,
    parameter  MEMORY_ADDR_WIDTH     = 11,
    parameter  BB_N                  = 1 ,
    parameter  BB_N_X                = 0,
    parameter  BB_N_Y                = 0,
    parameter  CACHE_WIDTH_BITS      = 5 ,
    parameter  CACHE_BLOCK_WIDTH_BITS= 2 ,
    parameter  BASIC_BLOCK_PIPELINED = 1 ,
    parameter  REG_WIDTH             = 32,
    parameter  CONSIDER_PIPELINE_FIFO= 0,
    parameter  CC_ID_BITS            = 2
)
(
    input   logic                           clk,
    input   logic                           rst,

    input   logic                           memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]    memory_data,
    output  logic                           memory_valid,

    input  logic                            valid,
    output logic                            ready,
    input   logic[REG_WIDTH-1        :0]    start_cc_pointer,
    input   logic[REG_WIDTH-1        :0]    end_cc_pointer,

    output  logic                           done,
    output  logic                           accept,
    output  logic                           error
);
    localparam                       CHAR_ADDR_OFFSET = $clog2(MEMORY_WIDTH/CHARACTER_WIDTH);
    localparam                       WINDOW_SIZE_IN_CHARS= 2**CC_ID_BITS; 
    localparam                       WINDOW_SIZE_IN_BITS= WINDOW_SIZE_IN_CHARS*CHARACTER_WIDTH;

    localparam [PC_WIDTH-1       :0]        start_pc               =  '0;
    //Signals for window management
    logic      [REG_WIDTH-1      :0]        cur_window_pointer_end   , next_window_pointer_end;  // next_window_pointer_end points always at the first char to fetch
    logic      [WINDOW_SIZE_IN_BITS-1:0]    cur_window               , next_window;              // window hold chars that falls in the current window if string ABCD...E -> Window: DCBA -> DCBE -> DCFE ...
    logic      [MEMORY_WIDTH-1   :0]        cur_memory_buffer        , next_memory_buffer;       // the buffer decouples memory bus width and window. So if memory bus is twice the number of chars that can fit in the window the buffer holds the others so that 1 fetch is enough for 2 window
    logic      [WINDOW_SIZE_IN_CHARS-1:0]   cur_window_enable        , next_window_enable;        // bit flag that indicates which chars of the window can be processed.
    logic      [WINDOW_SIZE_IN_CHARS-1:0]   cur_window_is_first      , next_window_is_first;      // bit flag  "       "       "      "   "   "   "    came first in the original string.
    logic      [WINDOW_SIZE_IN_CHARS-1:0]   cur_window_end_of_s      , next_window_end_of_s;      // bit flag  "       "       "      "   "   "   "    corresponds to the EOF of the original string.
    logic      [WINDOW_SIZE_IN_CHARS-1:0]   cur_window_after_end_of_s, next_window_after_end_of_s;// bit flag  "       "       "      "   "   "   "    are after the end of string and do not require to be considered.
    logic                                   move_next_char           ;                           // signal that specifies to the engines that a new char is going to be fetched.
    //Signals MEMORY

    always @(posedge clk) 
    begin //ASSERTIONS MEMORY SIZE AND WINDOW SIZE    
        assert ( WINDOW_SIZE_IN_BITS <= MEMORY_WIDTH ) else $error("MEMORY SIZE AND WINDOW SIZE ARE INCOMPATIBLE!");
    end
    memory_read_iface                   #(.MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), .MEMORY_WIDTH(MEMORY_WIDTH)) memory_for_cc();
    memory_read_iface                   #(.MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), .MEMORY_WIDTH(MEMORY_WIDTH)) memory_muxed();
    //SIgnals channel
    //2 channel interface 0 input 1 output
    channel_iface                       #(.N(PC_WIDTH+CC_ID_BITS), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) override_pc ();
    
    //to fill topology with first instruction and cc_id
    logic [PC_WIDTH-1  :0]              override_pc_pc;
    wire  [CC_ID_BITS-1:0]              override_cc_id;
    assign override_cc_id             = {start_cc_pointer[0+:CC_ID_BITS]};
    assign override_pc.data           = {override_pc_pc, override_cc_id};

    //infos from topology
    logic                               any_bb_accept, any_bb_running, all_bb_full;
    logic                               subcomponent_rst;
    logic [WINDOW_SIZE_IN_CHARS-1:0]    elaborating_chars;
    
    //FSM surpevisioning the topology
    State cur_state, next_state;
    always_ff @( posedge clk ) begin
         
        if(rst)
        begin
            cur_state                   <= CICERO_IDLE;
            cur_memory_buffer           <= '0;
            cur_window_pointer_end      <= '0;
            cur_window                  <= '0;
            cur_window_enable           <= '0;
            cur_window_is_first         <= '0;
            cur_window_end_of_s         <= '0;
            cur_window_after_end_of_s   <= '0;
        end
        else
        begin
            cur_state                   <= next_state;
            cur_memory_buffer           <= next_memory_buffer;
            cur_window_pointer_end      <= next_window_pointer_end;
            cur_window                  <= next_window;
            cur_window_enable           <= next_window_enable;
            cur_window_is_first         <= next_window_is_first;
            cur_window_end_of_s         <= next_window_end_of_s;
            cur_window_after_end_of_s   <= next_window_after_end_of_s;
        end
    end

    always_comb 
    begin
        logic [REG_WIDTH-1:0] tmp_incr_cc_window_pointer_end;
        tmp_incr_cc_window_pointer_end  = cur_window_pointer_end+1;
        //realize next state function
        next_state                      = cur_state;
        next_memory_buffer              = cur_memory_buffer;
        next_window_pointer_end         = cur_window_pointer_end;
        next_window                     = cur_window;
        next_window_enable              = cur_window_enable;
        next_window_is_first            = cur_window_is_first;
        next_window_end_of_s            = cur_window_end_of_s;
        next_window_after_end_of_s      = cur_window_after_end_of_s;
        //default signals value
        //output
        ready                           = 1'b0;
        done                            = 1'b0;
        accept                          = 1'b0;
        error                           = 1'b0;
        //for memory req override
        memory_for_cc.addr              = '0;
        memory_for_cc.valid             = 1'b0;
        //for pc override
        override_pc_pc                  = '0;
        override_pc.valid               = 1'b0;
        //to flush sub components
        if (rst)       subcomponent_rst = 1'b1;
        else           subcomponent_rst = 1'b0; 
        //to move to next cc
        move_next_char = 1'b0;
        case(cur_state)
        CICERO_IDLE:
        begin
            //prepare to fetch first characters at the next clock cycle
            memory_for_cc.addr  = start_cc_pointer[CHAR_ADDR_OFFSET+: MEMORY_ADDR_WIDTH];
            memory_for_cc.valid = 1'b1;
            ready               = memory_for_cc.ready;
         
            if(start_cc_pointer[0+:CC_ID_BITS] != {(CC_ID_BITS){1'b0}})
            begin //assumption * : start_cc pointer bits dedicated to CC_ID are all 0. It simplifies startup! (does not require 2 fetch)
                next_state              = CICERO_ERROR;
            end
            else if(valid && memory_for_cc.ready ) 
            begin //if memory answer affirmatively and start signal is raised start
                next_state              = CICERO_FETCH_1ST;
                next_window_pointer_end= start_cc_pointer;
            end
        end
        CICERO_FETCH_1ST:
        begin
            
            next_memory_buffer             = memory_for_cc.data;
            //thanks to previous assumption * :
            //0. we can load the window in a bunch
            //$display("%d %d \n", cur_window_pointer_end[CHAR_ADDR_OFFSET-1:CC_ID_BITS], cur_window_pointer_end[CHAR_ADDR_OFFSET-1:CC_ID_BITS], cur_window_pointer_end[CHAR_ADDR_OFFSET:CC_ID_BITS]*WINDOW_SIZE_IN_BITS);
            if (CC_ID_BITS == CHAR_ADDR_OFFSET)     next_window             = memory_for_cc.data;
            else                                    next_window             = memory_for_cc.data[cur_window_pointer_end[CHAR_ADDR_OFFSET-1:CC_ID_BITS]*WINDOW_SIZE_IN_BITS+:WINDOW_SIZE_IN_BITS];
                                    
            //1. enable and first char in a fixed position
            next_window_enable             = {1'b0,{(WINDOW_SIZE_IN_CHARS-1){1'b1}}};
            next_window_is_first           = {{(WINDOW_SIZE_IN_CHARS-1){1'b0}}, 1'b1};
            
            //2. next_window_pointer_end
            next_window_pointer_end = cur_window_pointer_end + WINDOW_SIZE_IN_CHARS;
            override_pc_pc              = start_pc; 
            override_pc.valid           = 1'b1;
            if(!override_pc.ready)      next_state      = CICERO_ERROR;
            else                        next_state      = CICERO_EXE;
            
            if ( start_cc_pointer[REG_WIDTH-1:CC_ID_BITS] == end_cc_pointer[REG_WIDTH-1:CC_ID_BITS])
            begin
                next_window_end_of_s		[end_cc_pointer[0+:CC_ID_BITS]]   = 1'b1;
                //for (int i=end_cc_pointer[0+:CC_ID_BITS]; i<2**CC_ID_BITS; i++) begin
				//	next_window_after_end_of_s [i] = 1'b1;

				//end 								  
				next_window_after_end_of_s									  = '0;
				next_window_after_end_of_s [WINDOW_SIZE_IN_CHARS-1:0]	  = {next_window_end_of_s[WINDOW_SIZE_IN_CHARS-1:1], 1'b0} | {next_window_after_end_of_s[WINDOW_SIZE_IN_CHARS-1:1], 1'b0};
				                
            end

            
        end
        CICERO_FETCH_CCS_BUFFER:
        begin
            //at the previous clock cycle the memory has been requested to issue the next
            //current character
            
            next_memory_buffer                     = memory_for_cc.data;
            next_window[0+:CHARACTER_WIDTH]        = memory_for_cc.data[0+:CHARACTER_WIDTH];
            next_window_pointer_end                = tmp_incr_cc_window_pointer_end ;
            
            next_window_end_of_s[cur_window_pointer_end[0+:CC_ID_BITS]] = (cur_window_pointer_end == end_cc_pointer);
            
            //if the engines shows not to have any work to do
            //means that the regular expression does not match the string.
            if(any_bb_accept)        next_state = CICERO_COMPLETED_ACCEPTING;
            else if (any_bb_running) next_state = CICERO_EXE;
            else                     next_state = CICERO_COMPLETED_WITHOUT_ACCEPTING;
              
        end
        CICERO_FETCH_FROM_CCS_BUFFER:
        begin
            //next_window[cur_window_pointer_end[0+:CC_ID_BITS]*CHARACTER_WIDTH+:CHARACTER_WIDTH]  = cur_memory_buffer[cur_window_pointer_end[CHAR_ADDR_OFFSET:CC_ID_BITS]*WINDOW_SIZE_IN_BITS +:CHARACTER_WIDTH];
            next_window[cur_window_pointer_end[0+:CC_ID_BITS]*CHARACTER_WIDTH+:CHARACTER_WIDTH]  = cur_memory_buffer[cur_window_pointer_end[0+:CHAR_ADDR_OFFSET]*CHARACTER_WIDTH +:CHARACTER_WIDTH];
            next_window_pointer_end             = tmp_incr_cc_window_pointer_end ;

            next_window_end_of_s[cur_window_pointer_end[0+:CC_ID_BITS]] = (cur_window_pointer_end == end_cc_pointer);
            
            //if the engines shows not to have any work to do
            //means that the regular expression does not match the string.
            if(any_bb_accept)        next_state = CICERO_COMPLETED_ACCEPTING;
            else if (any_bb_running) next_state = CICERO_EXE;
            else                     next_state = CICERO_COMPLETED_WITHOUT_ACCEPTING;
            
        end
        CICERO_EXE:
        begin
            logic first_window_char_executing   = |(cur_window_is_first & elaborating_chars);
            logic first_window_char_is_end_of_s = |(cur_window_end_of_s & first_window_char_executing);
            logic no_other_work_to_do           = !(|(elaborating_chars));
            logic time_to_fetch_ccs_buffer      = cur_window_pointer_end[CHAR_ADDR_OFFSET-1:0] == 0;
            //basic bock computation enable
            casez({ any_bb_accept, all_bb_full, !first_window_char_executing,  first_window_char_is_end_of_s || no_other_work_to_do , time_to_fetch_ccs_buffer})
            5'b1????:
            begin // if during execution phase one basic block raise accept: end computations!
                next_state  = CICERO_COMPLETED_ACCEPTING;
            end
            5'b01???:
            begin // if there's an instruction that should be saved but no one is able to save it 
                next_state = CICERO_ERROR;
            end  
            5'b0011?:
            begin //if we reach the end of the string (i.e. current char is terminator) 
                next_state = CICERO_COMPLETED_WITHOUT_ACCEPTING;
            end
            5'b00101:
            begin // if all basic blocks have finished to execute instructions related to current char 
                  // then it's time to move to the next character
                memory_for_cc.valid = 1'b1;
                memory_for_cc.addr  = cur_window_pointer_end [CHAR_ADDR_OFFSET+: MEMORY_ADDR_WIDTH];

                if( memory_for_cc.ready)
                begin //if memory answers affirmatively go to state where at next cc memory data is 
                      //latched in current character register. 
                      //update is_even_character ff 
                    next_state                  = CICERO_FETCH_CCS_BUFFER;
                    next_window_after_end_of_s   = cur_window_after_end_of_s | {cur_window_after_end_of_s[WINDOW_SIZE_IN_CHARS-2:0],cur_window_after_end_of_s[WINDOW_SIZE_IN_CHARS-1]} | {cur_window_end_of_s[WINDOW_SIZE_IN_CHARS-2:0],cur_window_end_of_s[WINDOW_SIZE_IN_CHARS-1]};
                    next_window_enable           = { cur_window_enable   [WINDOW_SIZE_IN_CHARS-2:0],cur_window_enable    [WINDOW_SIZE_IN_CHARS-1]} & ~next_window_after_end_of_s;
                    next_window_is_first         = { cur_window_is_first [WINDOW_SIZE_IN_CHARS-2:0],cur_window_is_first  [WINDOW_SIZE_IN_CHARS-1]};
                    move_next_char              = 1'b1;
                end
            end
            5'b00100:
            begin
                next_state                      = CICERO_FETCH_FROM_CCS_BUFFER;
                next_window_after_end_of_s       = cur_window_after_end_of_s | {cur_window_after_end_of_s[WINDOW_SIZE_IN_CHARS-2:0],cur_window_after_end_of_s[WINDOW_SIZE_IN_CHARS-1]} | { cur_window_end_of_s[WINDOW_SIZE_IN_CHARS-2:0],cur_window_end_of_s[WINDOW_SIZE_IN_CHARS-1]};
                next_window_enable               = { cur_window_enable   [WINDOW_SIZE_IN_CHARS-2:0],cur_window_enable    [WINDOW_SIZE_IN_CHARS-1]} & ~next_window_after_end_of_s;
                next_window_is_first             = { cur_window_is_first [WINDOW_SIZE_IN_CHARS-2:0],cur_window_is_first  [WINDOW_SIZE_IN_CHARS-1]};
                move_next_char                  = 1'b1;
            end  
            endcase
        end
        CICERO_COMPLETED_ACCEPTING:
        begin
            done        = 1'b1;
            accept      = 1'b1;
            next_state  = CICERO_IDLE;
            //flush subcomponents (e.g. fifos inside bb)
            subcomponent_rst = 1'b1;
        end
        CICERO_COMPLETED_WITHOUT_ACCEPTING:
        begin
            done        = 1'b1;
            accept      = 1'b0;
            next_state  = CICERO_IDLE;
            //flush subcomponents (e.g. fifos inside bb)
            subcomponent_rst = 1'b1;
        end
        CICERO_ERROR:
        begin
            error = 1'b1;
        end
        endcase
    end

    if( BB_N_X > 0 && BB_N_Y > 0)
    begin
        topology_mesh #(
            .BB_N_X                     (BB_N_X                     ),
            .BB_N_Y                     (BB_N_Y                     ),
            .PC_WIDTH                   (PC_WIDTH                   ),
            .LATENCY_COUNT_WIDTH        (LATENCY_COUNT_WIDTH        ),
            .FIFO_COUNT_WIDTH           (FIFO_COUNT_WIDTH           ),
            .CHARACTER_WIDTH            (CHARACTER_WIDTH            ),
            .MEMORY_WIDTH               (MEMORY_WIDTH               ),
            .MEMORY_ADDR_WIDTH          (MEMORY_ADDR_WIDTH          ),
            .CACHE_WIDTH_BITS           (CACHE_WIDTH_BITS           ), 
            .CACHE_BLOCK_WIDTH_BITS     (CACHE_BLOCK_WIDTH_BITS     ),
            .PIPELINED                  (BASIC_BLOCK_PIPELINED      ),
            .CONSIDER_PIPELINE_FIFO     (CONSIDER_PIPELINE_FIFO     ),
            .CC_ID_BITS                 (CC_ID_BITS                 )
        )a_topology(
            .clk                        (clk                        ),
            .rst                        (subcomponent_rst           ),
            .any_bb_accept              (any_bb_accept              ),
            .any_bb_running             (any_bb_running             ),
            .all_bb_full                (all_bb_full                ),
            .elaborating_chars          (elaborating_chars          ),
            .cur_window_end_of_s        (cur_window_end_of_s        ),
            .cur_window_enable          (cur_window_enable          ),
            .cur_window                 (cur_window                 ),
            .new_char                   (move_next_char             ),
            .memory                     (memory_muxed.out           ),
            .override                   (override_pc                ),
            .memory_cc                  (memory_for_cc              )
        );
    end 
    else
	if(BB_N==1)
    begin
        topology_single #(
            .PC_WIDTH                   (PC_WIDTH                   ),
            .LATENCY_COUNT_WIDTH        (LATENCY_COUNT_WIDTH        ),
            .FIFO_COUNT_WIDTH           (FIFO_COUNT_WIDTH           ),
            .CHARACTER_WIDTH            (CHARACTER_WIDTH            ),
            .MEMORY_WIDTH               (MEMORY_WIDTH               ),
            .MEMORY_ADDR_WIDTH          (MEMORY_ADDR_WIDTH          ),
            .CACHE_WIDTH_BITS           (CACHE_WIDTH_BITS           ), 
            .CACHE_BLOCK_WIDTH_BITS     (CACHE_BLOCK_WIDTH_BITS     ),
            .PIPELINED                  (BASIC_BLOCK_PIPELINED      ),
            .CONSIDER_PIPELINE_FIFO     (CONSIDER_PIPELINE_FIFO     ),
            .CC_ID_BITS                 (CC_ID_BITS                 )
        )a_topology(
            .clk                        (clk                        ),
            .rst                        (subcomponent_rst           ),
            .any_bb_accept              (any_bb_accept              ),
            .any_bb_running             (any_bb_running             ),
            .all_bb_full                (all_bb_full                ),
            .elaborating_chars          (elaborating_chars          ),
            .cur_window_end_of_s        (cur_window_end_of_s        ),
            .cur_window_enable          (cur_window_enable          ),
            .cur_window                 (cur_window                 ),
            .new_char                   (move_next_char             ),
            .memory                     (memory_muxed.out           ),
            .override                   (override_pc                ),
            .memory_cc                  (memory_for_cc              )
        );
    end
    else 
    begin
        topology_token_ring #(
            .BB_N                       (BB_N                       ),
            .PC_WIDTH                   (PC_WIDTH                   ),
            .LATENCY_COUNT_WIDTH        (LATENCY_COUNT_WIDTH        ),
            .FIFO_COUNT_WIDTH           (FIFO_COUNT_WIDTH           ),
            .CHARACTER_WIDTH            (CHARACTER_WIDTH            ),
            .MEMORY_WIDTH               (MEMORY_WIDTH               ),
            .MEMORY_ADDR_WIDTH          (MEMORY_ADDR_WIDTH          ),
            .CACHE_WIDTH_BITS           (CACHE_WIDTH_BITS           ), 
            .CACHE_BLOCK_WIDTH_BITS     (CACHE_BLOCK_WIDTH_BITS     ),
            .PIPELINED                  (BASIC_BLOCK_PIPELINED      ),
            .CONSIDER_PIPELINE_FIFO     (CONSIDER_PIPELINE_FIFO     ),
            .CC_ID_BITS                 (CC_ID_BITS                 )
        )a_topology(
            .clk                        (clk                        ),
            .rst                        (subcomponent_rst           ),
            .any_bb_accept              (any_bb_accept              ),
            .any_bb_running             (any_bb_running             ),
            .all_bb_full                (all_bb_full                ),
            .elaborating_chars          (elaborating_chars          ),
            .cur_window_end_of_s        (cur_window_end_of_s        ),
            .cur_window_enable          (cur_window_enable          ),
            .cur_window                 (cur_window                 ),
            .new_char                   (move_next_char             ),
            .memory                     (memory_muxed.out           ),
            .override                   (override_pc                ),
            .memory_cc                  (memory_for_cc              )
        );
    end

    assign  memory_muxed.ready =    memory_ready;
    assign  memory_addr        =    memory_muxed.addr;
    assign  memory_valid       =    memory_muxed.valid;
    assign  memory_muxed.data  =    memory_data;
    assign  memory_muxed.broadcast_addr  = memory_muxed.addr;
    assign  memory_muxed.broadcast_valid = memory_muxed.valid && memory_muxed.ready &&  ! memory_for_cc.valid;
    
endmodule
