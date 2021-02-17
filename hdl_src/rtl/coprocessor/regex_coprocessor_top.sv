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
import regex_coprocessor_package::*;

module regex_coprocessor_top #(
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
    parameter  BASIC_BLOCK_PIPELINED = 0 ,
    parameter  REG_WIDTH             = 32,
    parameter  CONSIDER_PIPELINE_FIFO=0
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
    localparam                       C_ADDR_OFFSET = $clog2(MEMORY_WIDTH/CHARACTER_WIDTH);

    localparam [PC_WIDTH-1       :0] start_pc               =  '0;
    logic      [REG_WIDTH-1      :0] cur_cc_pointer           , next_cc_pointer;
    logic      [CHARACTER_WIDTH-1:0] cur_cc                   , next_cc;
    logic      [MEMORY_WIDTH-1   :0] cur_ccs                  , next_ccs;
    logic                            cur_is_even_character    , next_is_even_character;
      
    
    //MEMORY
    memory_read_iface                #(.MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), .MEMORY_WIDTH(MEMORY_WIDTH)) memory_for_cc();
    memory_read_iface                #(.MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), .MEMORY_WIDTH(MEMORY_WIDTH)) memory_muxed();
    //2 channel interface 0 input 1 output
    channel_iface                   #(.N(PC_WIDTH+1), .LATENCY_COUNT_WIDTH(LATENCY_COUNT_WIDTH)) override_pc ();

    //to fill basic block 0 with first instruction
    logic [PC_WIDTH-1:0]            override_pc_pc;
    wire   override_pc_directed_to_current;
    assign override_pc_directed_to_current  = 1'b1;
    assign override_pc.data          = {override_pc_pc, override_pc_directed_to_current};

    logic                           bbs_go, any_bb_accept, any_bb_running, all_bb_full;

    logic                           subcomponent_rst;

    //FSM surpevisioning the basic block
    State cur_state, next_state;
    always_ff @( posedge clk ) begin
         
        if(rst)
        begin
            cur_state               <= REGEX_COPRO_S_IDLE;
            cur_cc_pointer          <= '0;
            cur_ccs                 <= '0;
            cur_is_even_character   <= 1'b1;
        end
        else
        begin
            cur_state               <= next_state;
            cur_cc_pointer          <= next_cc_pointer;
            cur_ccs                 <= next_ccs;
            cur_is_even_character   <= next_is_even_character;
        end
    end

    always_comb 
    begin
        logic [REG_WIDTH-1:0] tmp_cur_cc_increment ;
        tmp_cur_cc_increment    = cur_cc_pointer + 1; 
        //realize next state function
        next_state              = cur_state;
        next_cc_pointer         = cur_cc_pointer;
        
        next_ccs                = cur_ccs;
        next_is_even_character  = cur_is_even_character;
        //default signal
        ready                   = 1'b0;
        done                    = 1'b0;
        accept                  = 1'b0;
        error                   = 1'b0;
        //for memory req override
        memory_for_cc.addr     = '0;
        memory_for_cc.valid    = 1'b0;
        //for pc override
        override_pc_pc         = '0;
        override_pc.valid      = 1'b0;
        //to flush sub components
        if (rst)             subcomponent_rst = 1'b1;
        else                 subcomponent_rst = 1'b0;
        //basic bock computation default disabled
        bbs_go                 = 1'b0;
        cur_cc                 = cur_ccs[CHARACTER_WIDTH*cur_cc_pointer[0+:C_ADDR_OFFSET]+:CHARACTER_WIDTH];
        case(cur_state)
        REGEX_COPRO_S_IDLE:
        begin
            ready = memory_for_cc.ready;
            //prepare signals to fetch first character at the next clock cycle
            
            memory_for_cc.addr  = start_cc_pointer[C_ADDR_OFFSET+: MEMORY_ADDR_WIDTH];
            memory_for_cc.valid = 1'b1;
            
            //if memory answer affirmatively and start signal is raised start
            if(valid && memory_for_cc.ready ) 
            begin
                next_state          = REGEX_COPRO_S_FETCH_1ST_CC;
                //start_cc_pointer is a quad-word address while regex_coprocessor_memory interface handles
                //dual-word address. we have to concatenate a bit. 
                //First char of the string is assumed to be aligned to 32 bits  
                next_cc_pointer     = start_cc_pointer;
            end
        end
        REGEX_COPRO_S_FETCH_1ST_CC:
        begin
            
            next_ccs            = memory_for_cc.data;
            
            override_pc_pc      = start_pc; 
            override_pc.valid   = 1'b1;
            if(override_pc.ready)
            begin
                next_state      = REGEX_COPRO_S_EXEC;
            end
            
        end
        REGEX_COPRO_S_FETCH_NEXT_CC:
        begin
            //at the previous clock cycle the memory has been requested to issue the next
            //current character
            
            next_ccs    = memory_for_cc.data;
            //if the basic block immediately show not to have any work to do
            //for the current character
            //means that the regular expression does not match the string.
            if(any_bb_running)  next_state = REGEX_COPRO_S_EXEC;
            else                next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
              
        end
        REGEX_COPRO_S_NO_FETCH_NEXT_CC:
        begin
            //Differently from REGEX_COPRO_S_FETCH_NEXT_CC basic bock computation enable
            bbs_go                         = 1'b1;
            //if the basic block immediately show not to have any work to do
            //for the current character
            //means that the regular expression does not match the string.
            if(any_bb_running)  next_state = REGEX_COPRO_S_EXEC;
            else                next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
            
        end
        REGEX_COPRO_S_EXEC:
        begin
            //basic bock computation enable
            bbs_go          = 1'b1;
            casez({ any_bb_accept, all_bb_full, ~ any_bb_running,  cur_cc_pointer == end_cc_pointer, cur_cc_pointer[C_ADDR_OFFSET] != tmp_cur_cc_increment[C_ADDR_OFFSET] })
            5'b1????:
            begin // if during execution phase one basic block raise accept: end computations!
                next_state  = REGEX_COPRO_S_COMPLETE_ACCEPTING;
            end
            5'b01???:
            begin // if there's an instruction that should be saved but no one is able to save it 
                next_state = REGEX_COPRO_S_ERROR;
            end  
            5'b0011?:
            begin //if we reach the end of the string (i.e. current char is terminator) 
                next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
            end
            5'b00101:
            begin // if all basic blocks have finished to execute instructions related to current char 
                  // then it's time to move to the next character
                memory_for_cc.valid = 1'b1;
                memory_for_cc.addr  = tmp_cur_cc_increment [C_ADDR_OFFSET+: MEMORY_ADDR_WIDTH];

                if( memory_for_cc.ready)
                begin //if memory answers affirmatively go to state where at next cc memory data is 
                      //latched in current character register. 
                      //update is_even_character ff 
                    next_state              = REGEX_COPRO_S_FETCH_NEXT_CC;
                    next_cc_pointer         = tmp_cur_cc_increment;
                    next_is_even_character  = ~ cur_is_even_character;
                end
            end
            5'b00100:
            begin
                next_state              = REGEX_COPRO_S_NO_FETCH_NEXT_CC;
                next_cc_pointer         = tmp_cur_cc_increment;
                next_is_even_character  = ~ cur_is_even_character;
            end  
            endcase
        end
        REGEX_COPRO_S_COMPLETE_ACCEPTING:
        begin
            done = 1'b1;
            accept = 1'b1;
            next_state = REGEX_COPRO_S_IDLE;
            //flush subcomponents (e.g. fifos inside bb)
            subcomponent_rst = 1'b1;
        end
        REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING:
        begin
            done = 1'b1;
            accept = 1'b0;
            next_state = REGEX_COPRO_S_IDLE;
            //flush subcomponents (e.g. fifos inside bb)
            subcomponent_rst = 1'b1;
        end
        REGEX_COPRO_S_ERROR:
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
            .CONSIDER_PIPELINE_FIFO     (CONSIDER_PIPELINE_FIFO     )
        )a_topology(
            .clk                        (clk                        ),
            .rst                        (rst                        ),
            .cur_cc                     (cur_cc                     ),
            .cur_is_even_character      (cur_is_even_character      ),
            .memory                     (memory_muxed.out           ),
            .override                   (override_pc                ),
            .memory_cc                  (memory_for_cc              ),
            .enable                     (bbs_go                     ),
            .any_bb_accept              (any_bb_accept              ),
            .any_bb_running             (any_bb_running             ),
            .all_bb_full                (all_bb_full                )
        );
    end 
    else if(BB_N==1)
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
            .CONSIDER_PIPELINE_FIFO     (CONSIDER_PIPELINE_FIFO     )
        )a_topology(
            .clk                        (clk                        ),
            .rst                        (rst                        ),
            .cur_cc                     (cur_cc                     ),
            .cur_is_even_character      (cur_is_even_character      ),
            .memory                     (memory_muxed.out           ),
            .override                   (override_pc                ),
            .memory_cc                  (memory_for_cc              ),
            .enable                     (bbs_go                     ),
            .any_bb_accept              (any_bb_accept              ),
            .any_bb_running             (any_bb_running             ),
            .all_bb_full                (all_bb_full                )
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
            .CONSIDER_PIPELINE_FIFO     (CONSIDER_PIPELINE_FIFO     )
        )a_topology(
            .clk                        (clk                        ),
            .rst                        (rst                        ),
            .cur_cc                     (cur_cc                     ),
            .cur_is_even_character      (cur_is_even_character      ),
            .memory                     (memory_muxed.out           ),
            .override                   (override_pc                ),
            .memory_cc                  (memory_for_cc              ),
            .enable                     (bbs_go                     ),
            .any_bb_accept              (any_bb_accept              ),
            .any_bb_running             (any_bb_running             ),
            .all_bb_full                (all_bb_full                )
        );
    end

    assign  memory_muxed.ready =    memory_ready;
    assign  memory_addr        =    memory_muxed.addr;
    assign  memory_valid       =    memory_muxed.valid;
    assign  memory_muxed.data  =    memory_data;
    
endmodule
