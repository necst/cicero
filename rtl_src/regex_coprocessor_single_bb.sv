`timescale 1ns/1ps

//The regex_coprocessor_single_bb is in charge of :
// - supplying control signal for the underlying basic clock (e.g. current_character,cur_is_even_character,.. )
// - reading output signals from a basic block  (e.g. running, accepts, )
// - implementing the logic to move from current character to the next character.
// - expose control signals to control the overal logic of the coprocessor
//                        +-----------------------------------------------------------------------------------------+
//                        | Regex_coprocessor                                                                       |
//                        |                        +-------------------+                                            |
//                        |                        |Basic block        | pc_output_*  override_pc--------+          |
//                        |                    +----                   ----------+     |                 |          |
//                        |                    |   |                   |         |     |                 |          |
//                        |                    |   |                   |         |     |                 |          |
//   +----------+         |      +---------+   |   |                   |      +--------|--+              |          |
//   |          |         |      |         |   |   |                   |      |arbiter    |              |          |
//   |memory    |         |      | arbiter |   |   +----|----|---------+      |with fixed |              |          |
//   |          -----------------| with    ----+        |    |                |priority   |              |          |
//   |          |         |      | fixed   |            |    |                +-----------+              |          |
//   |          |         |      | priority-----+       |    +----------------------+                    |          |
//   |          |         |      |         |    |       |             pc_input_*                         |          |
//   +----------+         |      +---------+    |       |                                                |          |
//                        |                     |       |                           +                    |          |
//                        |                     |  +-------------------+                                 |          |
//                        |                     |  | FSM of regex      |                                 |          |
//                        |                     |  | coprocessor       |                                 |          |
//       control signals  |                     +---                   ----------------------------------+          |
//                 ------------------------------->|                   |                                            |
// finish/accept signals  |                        |                   |                                            |
//                 <--------------------------------                   |                                            |
//                        |                        +-------------------+                                            |
//                        |                                                                                         |
//                        |                                                                                         |
//                        +-----------------------------------------------------------------------------------------+
import Regex_coprocessor_package::*;

module regex_coprocessor_single_bb #(
    parameter PC_WIDTH              = 8,
    parameter FIFO_COUNT_WIDTH      = 6 ,
    parameter CHARACTER_WIDTH       = 8,
    parameter MEMORY_WIDTH          = 16,
    parameter MEMORY_ADDR_WIDTH     = 11,
    parameter BASIC_BLOCK_PIPELINED = 0
)
(
    input   logic                           clk,
    input   logic                           reset,

    input   logic                           memory_ready,
    output  logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr,
    input   logic[MEMORY_WIDTH-1     :0]    memory_data,
    output  logic                           memory_valid,

    input   logic                           start_ready,
    input   logic[MEMORY_ADDR_WIDTH-1:0]    start_cc_pointer,
    output  logic                           start_valid,
    output  logic                           finish,
    output  logic                           accept,
    output  logic                           error
);
    
    localparam [CHARACTER_WIDTH-1:0  ] CHARACTER_TERMINATOR = { CHARACTER_WIDTH {1'b0}};
    localparam [MEMORY_ADDR_WIDTH-1:0] start_pc = { MEMORY_ADDR_WIDTH{1'b0} };
    logic      [MEMORY_ADDR_WIDTH:0]   cur_cc_pointer           , next_cc_pointer;
    logic      [CHARACTER_WIDTH-1:0]   cur_cc                   , next_cc;
    logic                              cur_is_even_character   , next_is_even_character;
    
    
    //MEMORY
    //1. provide memory access for FSM outside the basic block
    logic                           memory_ready_for_cc ;
    logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr_for_cc  ;
    logic[MEMORY_WIDTH-1     :0]    memory_data_for_cc  ;
    logic                           memory_valid_for_cc ;
    //2. provide memory access for BB (note that to create a tree of arbiters are required 2*#BB -1 arbiters)
    logic                           memory_ready_for_bb ;
    logic[MEMORY_ADDR_WIDTH-1:0]    memory_addr_for_bb  ;
    logic[MEMORY_WIDTH-1     :0]    memory_data_for_bb  ;
    logic                           memory_valid_for_bb ;

    //signals for basic block
    logic                           bb_go                   ;
    logic                           bb_running              ;
    logic                           bb_accepts              ;
    logic                           bb_input_pc_valid       ;
    logic[PC_WIDTH:0]               bb_input_pc_and_current ; 
    logic                           bb_input_pc_ready       ;
    logic                           bb_output_pc_valid      ;
    logic[PC_WIDTH:0]               bb_output_pc_and_current;
    logic                           bb_output_pc_ready      ;
    
    //to fill basic block 0 with first instruction
    logic                   override_pc_ready;
    logic [PC_WIDTH-1:0]    override_pc;
    logic                   override_pc_directed_to_current;
    logic [PC_WIDTH  :0]    override_pc_and_current;
    logic                   override_pc_valid;
    assign override_pc_directed_to_current  = 1'b1;
    assign override_pc_and_current          = {override_pc, override_pc_directed_to_current};

    logic                   subcomponent_reset;

    //FSM surpevisioning the basic block
    State cur_state, next_state;
    always_ff @( posedge clk ) begin
         
        if(reset)
        begin
            cur_state               <= REGEX_COPRO_S_IDLE;
            cur_cc_pointer          <= { (PC_WIDTH+1){1'b0}      };
            cur_cc                  <= { (CHARACTER_WIDTH){1'b0} };
            cur_is_even_character   <= 1'b1;
        end
        else
        begin
            cur_state               <= next_state;
            cur_cc_pointer          <= next_cc_pointer;
            cur_cc                  <= next_cc;
            cur_is_even_character   <= next_is_even_character;
        end
    end

    always_comb 
    begin //realize next state function
        next_state              = cur_state;
        next_cc_pointer         = cur_cc_pointer;
        next_cc                 = cur_cc;
        next_is_even_character  = cur_is_even_character;
        //default signal
        start_valid             = 1'b0;
        finish                  = 1'b0;
        accept                  = 1'b0;
        error                   = 1'b0;
        //for memory req override
        memory_addr_for_cc     = { (MEMORY_ADDR_WIDTH) {1'b0} };
        memory_valid_for_cc    = 1'b0;
        //for pc override
        override_pc            = { (PC_WIDTH){1'b0}           };
        override_pc_valid      = 1'b0;
        //reset subcomponents is a reset is given
        if (reset == 1'b1)   subcomponent_reset = 1'b1;
        else                 subcomponent_reset = 1'b0;
        //basic bock computation default disabled
        bb_go                  = 1'b0;
        case(cur_state)
        REGEX_COPRO_S_IDLE:
        begin
            //prepare signals to fetch first character at the next clock cycle
            
            memory_addr_for_cc  = start_cc_pointer;
            memory_valid_for_cc = 1'b1;
            
            //if memory answer affirmatively and start signal is raised start
            if(start_ready && memory_ready_for_cc ) 
            begin
                next_state          = REGEX_COPRO_S_FETCH_1ST_CC;
                //start_cc_pointer is a quad-word address while regex_coprocessor_memory interface handles
                //dual-word address. we have to concatenate a bit. 
                //First char of the string is assumed to be allineated to 32 bits  
                next_cc_pointer     = {start_cc_pointer, 1'b0};
                start_valid         = 1'b1;
            end
        end
        REGEX_COPRO_S_FETCH_1ST_CC:
        begin
            if(cur_cc_pointer[0] == 1'b0) next_cc    = memory_data[ 7:0];
            else                          next_cc    = memory_data[15:8];
            
            override_pc         = start_pc; 
            override_pc_valid   = 1'b1;
            if(override_pc_ready)
            begin
                next_state      = REGEX_COPRO_S_EXEC;
            end
            
        end
        REGEX_COPRO_S_FETCH_NEXT_CC:
        begin
            //at the previous clock cycle the memory has been requested to issue the next
            //current character
            
            //memory is 2B width
            // TODO: parametrize in function of MEMORY_WIDTH
            if(cur_cc_pointer[0] == 1'b0) next_cc    = memory_data[ 7:0];
            else                          next_cc    = memory_data[15:8];
            //if the basic block immediately show not to have any work to do
            //for the current character
            //means that the regular expression does not match the string.
            if(bb_running)  next_state = REGEX_COPRO_S_EXEC;
            else            next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
                   
        end
        REGEX_COPRO_S_EXEC:
        begin
            //basic bock computation enable
            bb_go                  = 1'b1;
            if(bb_accepts)
            begin // if during execution phase one basic block raise accept: end computations!
                next_state  = REGEX_COPRO_S_COMPLETE_ACCEPTING;
            end
            else if( ~ bb_running )
            begin // if basic block has finished to execute instructions related to current char it's time to move to the next character
                if( cur_cc == CHARACTER_TERMINATOR)
                begin //if we reach the end of the string (i.e. current char is terminator) 
                    next_state = REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING;
                end
                else  // otherwise we have still work to do
                begin // ask for new current character
                    //TODO: avoid asking character if tmp_cur_cc[0] == 1
                    logic [MEMORY_ADDR_WIDTH:0] tmp_cur_cc_increment ;
                    tmp_cur_cc_increment= cur_cc_pointer + 1;
                    memory_valid_for_cc = 1'b1;
                    //memory with 2B width support only even aligned adresses
                    memory_addr_for_cc  = tmp_cur_cc_increment [1+: MEMORY_ADDR_WIDTH];
                   
                    if( memory_ready_for_cc)
                    begin //if memory answers affermatively go to state where at next cc memory data is latched in current character register.
                          //update is_even_character ff 
                        next_state              = REGEX_COPRO_S_FETCH_NEXT_CC;
                        next_cc_pointer         = tmp_cur_cc_increment;
                        next_is_even_character  = ~ cur_is_even_character;
                    end
                end
                
            end
            else if ( ~bb_input_pc_ready && bb_output_pc_valid)
            begin // if bb want to produce an isntruction but does not have space to save it
                  // go into an error state
                  // TODO: signal outside error 
                next_state = REGEX_COPRO_S_ERROR;
            end
        end
        REGEX_COPRO_S_COMPLETE_ACCEPTING:
        begin
            finish = 1'b1;
            accept = 1'b1;
            next_state = REGEX_COPRO_S_IDLE;
            //flush subcomponents (e.g. fifos inside bb)
            subcomponent_reset = 1'b1;
        end
        REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING:
        begin
            finish = 1'b1;
            accept = 1'b0;
            next_state = REGEX_COPRO_S_IDLE;
             //flush subcomponents (e.g. fifos inside bb)
            subcomponent_reset = 1'b1;
        end
        REGEX_COPRO_S_ERROR:
        begin
            error = 1'b1;
        end
        endcase
    end

    /// Moduleinstances


    //1. basic block
    basic_block #(
        .PC_WIDTH               (PC_WIDTH                       ),
        //no need of latency
        .FIFO_COUNT_WIDTH       (FIFO_COUNT_WIDTH               ),
        .CHARACTER_WIDTH        (CHARACTER_WIDTH                ),
        .MEMORY_WIDTH           (MEMORY_WIDTH                   ),
        .MEMORY_ADDR_WIDTH      (MEMORY_ADDR_WIDTH              ),
        .CACHE_WIDTH_BITS       (0                              ),
        .PIPELINED              (BASIC_BLOCK_PIPELINED          )
    ) abb (
        .clk                    (clk                            ),
        .reset                  (subcomponent_reset             ), 
        .cur_is_even_character  (cur_is_even_character          ),
        .current_character      (cur_cc                         ),
        .go                     (bb_go                          ),
        .running                (bb_running                     ),
        .accepts                (bb_accepts                     ),
        .memory_ready           (memory_ready_for_bb            ),
        .memory_addr            (memory_addr_for_bb             ),
        .memory_data            (memory_data_for_bb             ),
        .memory_valid           (memory_valid_for_bb            ),
        .input_pc_valid         (bb_input_pc_valid              ),
        .input_pc_and_current   (bb_input_pc_and_current        ), 
        .input_pc_ready         (bb_input_pc_ready              ),
        .input_pc_latency       (),
        .output_pc_valid        (bb_output_pc_valid             ),
        .output_pc_and_current  (bb_output_pc_and_current       ),
        .output_pc_ready        (bb_output_pc_ready             ),
        .output_pc_latency      ( )
    );

    //add a way to supply an instruction
    arbiter_fixed #(
        .DWIDTH(PC_WIDTH+1),
        .PRIORITY_0(1)
    ) arbiter_to_override_pc_at_bb_input (
        .in_0_ready( override_pc_ready             ),
        .in_0_data ( override_pc_and_current       ),
        .in_0_valid( override_pc_valid             ),
        .in_1_ready( bb_output_pc_ready            ),
        .in_1_data ( bb_output_pc_and_current      ),
        .in_1_valid( bb_output_pc_valid            ),
        .out_ready ( bb_input_pc_ready             ),
        .out_data  ( bb_input_pc_and_current       ),
        .out_valid ( bb_input_pc_valid             )
    );

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


endmodule