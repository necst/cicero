module vectorial_engine #(
    parameter PC_WIDTH               = 8,
    parameter LATENCY_COUNT_WIDTH    = 8,
    parameter FIFO_COUNT_WIDTH       = 6,
    parameter CHARACTER_WIDTH        = 8,
    parameter MEMORY_WIDTH           = 16,
    parameter MEMORY_ADDR_WIDTH      = 11,
    parameter CACHE_WIDTH_BITS       = 0,
    parameter CACHE_BLOCK_WIDTH_BITS = 2,
    parameter PIPELINED              = 0,
    parameter CONSIDER_PIPELINE_FIFO = 0,
    parameter CONSIDER_BOTH_FIFOS    = 1,
    parameter CC_ID_BITS             = 2
) (
    input  wire                                          clk,
    input  wire                                          rst,
    output logic                                         accepts,              // ok
    output logic                                         running,              // ok
    output logic                                         full,                 // ok
    output wire  [                  (2**CC_ID_BITS)-1:0] elaborating_chars,    // ok
    input  wire  [                  (2**CC_ID_BITS)-1:0] cur_window_end_of_s,  // ok
    input  wire  [                  (2**CC_ID_BITS)-1:0] cur_window_enable,    // ok
    input  wire  [(2**CC_ID_BITS)*CHARACTER_WIDTH-1 : 0] cur_window,           // ok

    // This signal is not needed in vectorial_engine
    input wire new_char,

    input  logic                         memory_ready,
    output logic [MEMORY_ADDR_WIDTH-1:0] memory_addr,
    input  logic [   MEMORY_WIDTH-1 : 0] memory_data,
    output logic                         memory_valid,
    input  logic [MEMORY_ADDR_WIDTH-1:0] memory_broadcast_addr,
    input  logic                         memory_broadcast_valid,

    input logic input_pc_valid,  // ok
    input logic [PC_WIDTH+CC_ID_BITS-1:0] input_pc_and_cc_id,  // ok
    output logic input_pc_ready,  // ok  // The engine is ready to receive a new instruction

    output logic [LATENCY_COUNT_WIDTH-1:0] input_pc_latency,

    output logic output_pc_valid,   // ok
    output logic [PC_WIDTH+CC_ID_BITS-1:0] output_pc_and_cc_id, // ok
    input logic output_pc_ready     // ok
);

  // Number of FIFO (and cores) in this engine
  localparam FIFO_COUNT = 2 ** CC_ID_BITS;
  localparam FIFO_DATA_SIZE = PC_WIDTH + CC_ID_BITS;
  localparam REGEX_CPU_FIFO_WIDTH_POWER_OF_2 = 2;

  // The input of each fifo
  logic [FIFO_COUNT-1:0] fifos_in_write_enable;
  logic [FIFO_COUNT-1:0] fifos_in_read_enable;
  logic [FIFO_DATA_SIZE-1:0] fifos_in_data[FIFO_COUNT-1:0];

  // The output of each fifo
  logic [FIFO_DATA_SIZE-1:0] fifos_out_data[FIFO_COUNT-1:0];
  logic [FIFO_COUNT-1:0] fifos_out_is_full;
  logic [FIFO_COUNT-1:0] fifos_out_is_empty;
  logic [FIFO_COUNT-1:0] fifos_out_valid;
  assign fifos_out_valid = ~fifos_out_is_empty;
  logic [FIFO_COUNT-1:0] fifos_out_ready_to_recv;
  assign fifos_out_ready_to_recv = ~fifos_out_is_full;
  logic [FIFO_COUNT_WIDTH-1:0] fifos_out_data_count[FIFO_COUNT-1:0]; // How many items are in the FIFO

  // The input of each regex_cpu
  logic [PC_WIDTH-1:0] cpu_in_pc[FIFO_COUNT-1:0];
  logic [CC_ID_BITS-1:0] cpu_in_cc_id[FIFO_COUNT-1:0];
  logic [FIFO_COUNT-1:0] cpu_in_pc_valid;  // The input to the CPU is valid
  logic [FIFO_COUNT-1:0] cpu_in_can_send_output;  // Can the CPU send its output?

  // The output of each regex_cpu

  logic [CC_ID_BITS-1:0] cpu_out_elaborating_chars[FIFO_COUNT-1:0];
  logic  cpu_out_ready_to_recv_pc[FIFO_COUNT-1:0]; // The CPU is ready to receive a new instruction

  logic cpu_out_pc_valid[FIFO_COUNT-1:0];  // The output of the CPU is valid
  logic [CC_ID_BITS-1:0] cpu_out_cc_id[FIFO_COUNT-1:0];
  logic [PC_WIDTH-1:0] cpu_out_pc[FIFO_COUNT-1:0];

  logic [FIFO_COUNT-1:0] cpu_out_is_accepting;
  logic [FIFO_COUNT-1:0] cpu_out_is_running;

  // The input of each arbiter
  logic [FIFO_COUNT-1:0] arbiter_in0_valid;
  logic [FIFO_DATA_SIZE-1:0] arbiter_in0_data[FIFO_COUNT-1:0];
  logic [FIFO_COUNT-1:0] arbiter_in1_valid;
  logic [FIFO_DATA_SIZE-1:0] arbiter_in1_data[FIFO_COUNT-1:0];
  logic [FIFO_COUNT-1:0] arbiter_in_can_send_output;  // Can the arbiter send its output?

  // The output of each arbiter
  logic [FIFO_COUNT-1:0] arbiter_out_valid;
  logic [FIFO_DATA_SIZE-1:0] arbiter_out_data[FIFO_COUNT-1:0];
  logic [FIFO_COUNT-1:0] arbiter_out_ready_to_recv_in0;  // Can the arbiter receive from in0?
  logic [FIFO_COUNT-1:0] arbiter_out_ready_to_recv_in1;  // Can the arbiter receive from in1?


  //latency signals
  logic [LATENCY_COUNT_WIDTH-1:0] input_pc_latency_next;

  always_ff @(posedge clk) begin
    if (rst) input_pc_latency <= {{(LATENCY_COUNT_WIDTH - 1) {1'b0}}, 1'b1};
    else input_pc_latency <= input_pc_latency_next;
  end

  always_comb begin
    case ({
      input_pc_valid && input_pc_ready, output_pc_valid && output_pc_ready
    })
      2'b11, 2'b00: begin
        input_pc_latency_next = input_pc_latency;
      end
      2'b10: begin
        input_pc_latency_next = input_pc_latency + 1;
      end
      2'b01: begin
        input_pc_latency_next = input_pc_latency - 1;
      end
    endcase
  end

  /*
    Memory logic
    */

  localparam I_WIDTH = 16;
  localparam OFFSET_I = $clog2(MEMORY_WIDTH / I_WIDTH);
  localparam CPU_MEMORY_ADDR_WIDTH = MEMORY_ADDR_WIDTH + OFFSET_I;

  // Wires to connect the caches to the CPUs
  wire [FIFO_COUNT-1:0] cpu_out_memory_valid;
  wire [CPU_MEMORY_ADDR_WIDTH-1:0] cpu_out_memory_addr[FIFO_COUNT-1:0];
  wire [FIFO_COUNT-1:0] cpu_in_memory_ready;
  logic [I_WIDTH-1:0] cpu_in_memory_data[FIFO_COUNT-1:0];

  // Wires to connect the caches to the memory (through the arbiter)
  logic cache_out_addr_valid[FIFO_COUNT-1:0];
  logic [MEMORY_ADDR_WIDTH-1:0] cache_out_addr[FIFO_COUNT-1:0];
  logic cache_in_ready[FIFO_COUNT-1:0];

  if (CACHE_WIDTH_BITS <= 0) begin
    $fatal(
        "CACHE_WIDTH_BITS must be greater than 0 with this implementation"
    );
  end else begin

    // For each CPU, we have a cache block. We the caches "miss", they need to be arbitrated
    // Before accessing the outer memory.

    for (genvar i = 0; i < FIFO_COUNT; i++) begin
      cache_block_directly_mapped_broadcast #(
          .DWIDTH          (I_WIDTH),
          .CACHE_WIDTH_BITS(CACHE_WIDTH_BITS),
          .BLOCK_WIDTH_BITS(CACHE_BLOCK_WIDTH_BITS),
          .ADDR_IN_WIDTH   (CPU_MEMORY_ADDR_WIDTH)
      ) cpu_cache (
          .clk          (clk),
          .rst          (rst),
          // Wiring the CPU to the cache
          .addr_in_valid(cpu_out_memory_valid[i]),
          .addr_in      (cpu_out_memory_addr[i]),
          .addr_in_ready(cpu_in_memory_ready[i]),
          .data_out     (cpu_in_memory_data[i]),

          // Wiring the cache to the outer memory (through the arbiter)
          .addr_out_valid      (cache_out_addr_valid[i]),
          .addr_out            (cache_out_addr[i]),
          .addr_out_ready      (cache_in_ready[i]),
          .data_in             (memory_data),
          .addr_broadcast_valid(memory_broadcast_valid),
          .addr_broadcast      (memory_broadcast_addr)
      );
    end

    arbiter_rr_n #(
        .DWIDTH(MEMORY_ADDR_WIDTH),
        .N(FIFO_COUNT)
    ) arbiter_tree_to_cope_with_memory_contention (
        .clk      (clk),
        .rst      (rst),
        .in_ready (cache_in_ready),
        .in_data  (cache_out_addr),
        .in_valid (cache_out_addr_valid),
        .out_ready(memory_ready),
        .out_data (memory_addr),
        .out_valid(memory_valid)
    );
  end

  /*
    End Memory Logic
    */

  // Combinatory logic between FIFO out and regex_cpu in
  always_comb begin

    for (int i = 0; i < FIFO_COUNT; i++) begin
      cpu_in_pc[i]    = fifos_out_data[i][CC_ID_BITS+:PC_WIDTH];
      cpu_in_cc_id[i] = fifos_out_data[i][0+:CC_ID_BITS];

      if (cpu_in_pc_valid[i] && (cpu_in_cc_id[i] != i)) begin
        $fatal(
            $sformatf(
                "CPU %d received an instruction with CC ID = %d, but it was expecting CC ID = %d",
                i, cpu_in_cc_id[i], i));
      end

      cpu_in_pc_valid[i]      = fifos_out_valid[i] && cur_window_enable[i];

      fifos_in_read_enable[i] = cpu_out_ready_to_recv_pc[i];
    end
  end

  // Combinatory logic between CPUs outputs and arbiters inputs
  always_comb begin
    // Last CPU output is connected to module-out and its arbiter input
    cpu_in_can_send_output[FIFO_COUNT-1] = 
      (arbiter_out_ready_to_recv_in0[FIFO_COUNT-1] && cpu_out_cc_id[FIFO_COUNT-1] == FIFO_COUNT-1)
    ||
      (output_pc_ready && cpu_out_cc_id[FIFO_COUNT-1] == 0);

    for (int i = 0; i < FIFO_COUNT - 1; i++) begin
      // The output of CPU i is connected to the input of its arbiter on in0 and to the input of the next one on in1
      cpu_in_can_send_output[i] =
        (arbiter_out_ready_to_recv_in0[i] && cpu_out_cc_id[i] == i)
      ||
        (arbiter_out_ready_to_recv_in1[i+1] && cpu_out_cc_id[i] == i+1);
    end
  end

  // Combinatory logic for arbiters input
  always_comb begin
    // First arbiter: input comes from outside and from the first CPU
    arbiter_in0_valid[0] = cpu_out_pc_valid[0] && (cpu_out_cc_id[0] == 0);
    arbiter_in0_data[0]  = {cpu_out_pc[0], cpu_out_cc_id[0]};

    // Assert input to the module hass cc id zero
    if (input_pc_valid && (input_pc_and_cc_id[0+:CC_ID_BITS] != 0)) begin
      $fatal("input_pc_valid while input_cc_id has non-zero CC ID!");
    end
    arbiter_in1_valid[0] = input_pc_valid && (input_pc_and_cc_id[0+:CC_ID_BITS] == 0);
    arbiter_in1_data[0] = input_pc_and_cc_id;
    arbiter_in_can_send_output[0] = fifos_out_ready_to_recv[0];

    for (int i = 1; i < FIFO_COUNT; i++) begin
      // The input of the i-th arbiter is the output of the i-th and (i-1)-th CPUs
      arbiter_in0_valid[i] = cpu_out_pc_valid[i] && (cpu_out_cc_id[i] == i);
      arbiter_in0_data[i] = {cpu_out_pc[i], cpu_out_cc_id[i]};
      arbiter_in1_valid[i] = cpu_out_pc_valid[i-1] && (cpu_out_cc_id[i-1] == i);
      arbiter_in1_data[i] = {cpu_out_pc[i-1], cpu_out_cc_id[i-1]};
      arbiter_in_can_send_output[i] = fifos_out_ready_to_recv[i];
    end

    // Assert output to the module has cc id zero
    if (output_pc_valid && (output_pc_and_cc_id[0+:CC_ID_BITS] != 0)) begin
      $fatal("output_pc_valid while output_pc_and_cc_id has non-zero CC ID!");
    end
  end

  // Combinatory logic between arbiters and FIFOs
  always_comb begin
    for (int i = 0; i < FIFO_COUNT; i++) begin
      // The input of the i-th FIFO is the output of the i-th arbiter
      fifos_in_data[i] = arbiter_out_data[i];
      fifos_in_write_enable[i] = arbiter_out_valid[i];
    end
  end

  // Combinatory logic for outside output
  always_comb begin
    // Output of last CPU is sent to the outside
    output_pc_valid = cpu_out_pc_valid[FIFO_COUNT-1] && (cpu_out_cc_id[FIFO_COUNT-1] == 0);
    output_pc_and_cc_id = {cpu_out_pc[FIFO_COUNT-1], cpu_out_cc_id[FIFO_COUNT-1]};
    assign accepts = |cpu_out_is_accepting;
    assign full = |(fifos_out_is_full & fifos_in_write_enable & ~fifos_in_read_enable);
    assign running = |((fifos_out_valid && cur_window_enable) || cpu_out_is_running);

    // We are ready to receive if the first FIFO can receive
    input_pc_ready = fifos_out_ready_to_recv[0];
  end

  assign elaborating_chars = fifos_out_valid | cpu_out_is_running;

  genvar i;
  for (i = 0; i < FIFO_COUNT; i++) begin
    // Instantiate a regex_cpu with its own FIFO, and interconnect them:
    // The first FIFO takes the input from the outside
    // The last regex_cpu sends the output to the outside
    // Every regex_cpu is connected to its own FIFO and the next CPU's FIFO


    // Arbiter for the input of the FIFOs:
    // * The first arbiter has fixed priority (input 0 has priority over input 1) so that
    // * input from the outside has priority over the output of the first CPU.
    // * This is because we wired input_pc_ready to fifos_out_ready_to_recv[0] and we need the arbiter
    // * to always grant its signal since we cannot stall it (if we instead connected it to the arbiter,
    // * the arbiter would not raise a ready signal until it received a valid output,
    // * which would not be sent by a switch without a ready signal - hence we have a deadlock)

    // * The other arbiters are just round-robin arbiters between the output of the previous CPU and its own one.
    if (i == 0) begin : first_arbiter_block
      arbiter_2_fixed #(
          .DWIDTH(PC_WIDTH + CC_ID_BITS)
      ) arbiter_to_fifo (
          // Note that abiter_*in1 (which comes from the outside) is wired to in_0_* of the arbiter
          // so that it has higher priority
          .in_0_ready(arbiter_out_ready_to_recv_in1[i]),  // ok
          .in_0_data (arbiter_in1_data[i]),               // ok
          .in_0_valid(arbiter_in1_valid[i]),              // ok
          .in_1_ready(arbiter_out_ready_to_recv_in0[i]),  // ok
          .in_1_data (arbiter_in0_data[i]),               // ok
          .in_1_valid(arbiter_in0_valid[i]),              // ok
          .out_ready (arbiter_in_can_send_output[i]),     // ok
          .out_data  (arbiter_out_data[i]),               // ok
          .out_valid (arbiter_out_valid[i])               // ok
      );
    end else begin : normal_arbiter_block
      arbiter_2_rr #(
          .DWIDTH(PC_WIDTH + CC_ID_BITS)
      ) arbiter_to_fifo (
          .clk       (clk),
          .rst       (rst),
          .in_0_ready(arbiter_out_ready_to_recv_in0[i]),  // ok
          .in_0_data (arbiter_in0_data[i]),               // ok
          .in_0_valid(arbiter_in0_valid[i]),              // ok
          .in_1_ready(arbiter_out_ready_to_recv_in1[i]),  // ok
          .in_1_data (arbiter_in1_data[i]),               // ok
          .in_1_valid(arbiter_in1_valid[i]),              // ok
          .out_ready (arbiter_in_can_send_output[i]),     // ok
          .out_data  (arbiter_out_data[i]),               // ok
          .out_valid (arbiter_out_valid[i])               // ok
      );
    end

    fifo #(
        .DWIDTH(PC_WIDTH + CC_ID_BITS),
        .COUNT_WIDTH(FIFO_COUNT_WIDTH)
    ) fifo_cc_id (
        .clk       (clk),
        .rst       (rst),
        .full      (fifos_out_is_full[i]),      // ok
        .din       (fifos_in_data[i]),          // ok
        .wr_en     (fifos_in_write_enable[i]),  // ok
        .rd_en     (fifos_in_read_enable[i]),   // ok
        .dout      (fifos_out_data[i]),         // ok
        .empty     (fifos_out_is_empty[i]),     // ok
        .data_count(fifos_out_data_count[i])
    );

    // Regex CPU
    regex_cpu_pipelined #(
        .PC_WIDTH             (PC_WIDTH),
        .CHARACTER_WIDTH      (CHARACTER_WIDTH),
        .MEMORY_WIDTH         (I_WIDTH),
        .MEMORY_ADDR_WIDTH    (CPU_MEMORY_ADDR_WIDTH),
        .FIFO_WIDTH_POWER_OF_2(REGEX_CPU_FIFO_WIDTH_POWER_OF_2),
        .CC_ID_BITS           (CC_ID_BITS)
    ) a_regex_cpu (
        .clk               (clk),
        .rst               (rst),
        .current_characters(cur_window),          // ok
        .end_of_string     (cur_window_end_of_s), // ok

        .input_pc_ready(cpu_out_ready_to_recv_pc[i]),  // ok
        .input_cc_id   (cpu_in_cc_id[i]),              // ok
        .input_pc      (cpu_in_pc[i]),                 // ok
        .input_pc_valid(cpu_in_pc_valid[i]),           // ok

        .memory_ready(cpu_in_memory_ready[i]),  // ok
        .memory_addr (cpu_out_memory_addr[i]),  // ok
        .memory_data (cpu_in_memory_data[i]),   // ok
        .memory_valid(cpu_out_memory_valid[i]), // ok

        .output_pc_ready(cpu_in_can_send_output[i]),  // ok
        .output_pc      (cpu_out_pc[i]),              // ok
        .output_cc_id   (cpu_out_cc_id[i]),           // ok
        .output_pc_valid(cpu_out_pc_valid[i]),        // ok

        .accepts          (cpu_out_is_accepting[i]),      // ok
        .running          (cpu_out_is_running[i]),        // ok
        // In our case this information is not needed, since if it is running
        // then only the bit corresponding to this CPU will be set
        .elaborating_chars(cpu_out_elaborating_chars[i])  // ok
    );
  end

endmodule
