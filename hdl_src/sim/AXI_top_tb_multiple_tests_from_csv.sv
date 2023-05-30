`timescale 1ns / 100ps

import AXI_package::*;
import instruction_package::*;

module AXI_top_tb_multiple_tests_from_csv ();
  parameter CLOCK_SEMI_PERIOD = 5;
  parameter CC_ID_BITS = 2;
  parameter BB_N = 1;

  logic                 clk;
  logic                 rst;
  logic [REG_WIDTH-1:0] data_in_register;
  logic [REG_WIDTH-1:0] address_register;
  logic [REG_WIDTH-1:0] start_cc_pointer_register;
  logic [REG_WIDTH-1:0] end_cc_pointer_register;
  logic [REG_WIDTH-1:0] cmd_register;
  logic [REG_WIDTH-1:0] status_register;
  logic [REG_WIDTH-1:0] data_o_register;

  AXI_top #(
      .BB_N(BB_N),
      .CC_ID_BITS(CC_ID_BITS)
  ) dut (
      .clk                      (clk),
      .rst                      (rst),
      .data_in_register         (data_in_register),
      .address_register         (address_register),
      .start_cc_pointer_register(start_cc_pointer_register),
      .end_cc_pointer_register  (end_cc_pointer_register),
      .cmd_register             (cmd_register),
      .status_register          (status_register),
      .data_o_register          (data_o_register)
  );

  // clock generator
  always begin
    #CLOCK_SEMI_PERIOD clk = ~clk;
  end

  task write_code_file_into_memory(int fp, input reg [REG_WIDTH-1:0] start_address,
                                   output reg [REG_WIDTH-1:0] address);
    begin
      int c;
      reg [INSTRUCTION_WIDTH-1:0] instr_0, instr_1;
      reg [REG_WIDTH-1:0] data;
      reg                 issue_write_command;

      issue_write_command    = 1'b1;
      address = start_address;

      while (!$feof(
          fp
      )) begin
        c = $fscanf(fp, "%x\n", instr_0);
        if (!$feof(fp)) begin
          c = $fscanf(fp, "%x\n", instr_1);
        end else begin
          instr_1 = {INSTRUCTION_WIDTH{1'b0}};
        end
        data = {instr_1, instr_0};
        @(posedge clk);
        address_register <= (address >> 2);
        @(posedge clk);
        data_in_register <= data;
        if (issue_write_command) begin
          @(posedge clk);
          cmd_register <= CMD_WRITE;
          issue_write_command = 1'b0;
        end
        address += 4;
      end
      @(posedge clk);
      cmd_register <= CMD_NOP;
    end
  endtask

  task write_string_into_memory(input string str, input reg [REG_WIDTH-1:0] start_address,
                                output reg [REG_WIDTH-1:0] address);
    begin
      reg [REG_WIDTH-1:0] data;
      reg                 issue_write_command;
      int                 address_increment;
      int                 i;

      issue_write_command    = 1'b1;
      address = start_address;

      for (i = 0; i < str.len(); i += 4) begin
        address_increment = 0;
        for (int j = 0; j < 4; j++) begin
          if (i + j < str.len()) begin
            data[j*8+:8] = str[i+j];
            address_increment += 1;
          end else begin
            data[j*8+:8] = 0;
          end
        end

        @(posedge clk);
        address_register <= (address >> 2);
        @(posedge clk);
        data_in_register <= data;
        if (issue_write_command) begin
          @(posedge clk);
          cmd_register <= CMD_WRITE;
          issue_write_command = 1'b0;
        end
        address += address_increment;
      end
      @(posedge clk);
      cmd_register <= CMD_NOP;
    end
  endtask


  task start(input reg [REG_WIDTH-1:0] start_string_address,
             input reg [REG_WIDTH-1:0] end_string_address);
    begin
      @(posedge clk);
      start_cc_pointer_register <= start_string_address;
      @(posedge clk);
      end_cc_pointer_register <= end_string_address;
      @(posedge clk);
      cmd_register <= CMD_START;

      repeat (2) @(posedge clk);

      if (status_register !== STATUS_RUNNING) begin
        $display("status_register not running");
        $stop;
      end
      cmd_register <= CMD_NOP;
    end
  endtask

  task wait_result(output logic accept);
    begin
      while (status_register == STATUS_RUNNING) begin
        @(posedge clk);
      end
      if (status_register !== STATUS_ACCEPTED && status_register !== STATUS_REJECTED) begin
        $display("KO: neither rejected or accepted");
        $stop();
      end
      if (status_register == STATUS_ACCEPTED) accept = 1'b1;
      else accept = 1'b0;
    end
  endtask

  task get_cc_elapsed(output logic [REG_WIDTH-1:0] cc);
    begin
      cmd_register <= CMD_READ_ELAPSED_CLOCK;
      @(posedge clk);
      cc = data_o_register;
      @(posedge clk);
      cmd_register <= CMD_NOP;
    end
  endtask

  initial begin
    int fp_code, fp_csv;
    int ok;
    int comma_count;
    int testNumber = 0;
    reg [REG_WIDTH-1:0] start_code, end_code;
    reg [REG_WIDTH-1:0] start_string, end_string;
    reg [REG_WIDTH-1:0] cc_taken;
    reg                 res;
    string input_str, regex_file_str, expected_output_str, line;

    string base_path = "/home/users/andrea.somaini/src/cicero/scripts/generate_functional_tests/";

    clk = 1'b0;
    rst          <= 1'b0;
    cmd_register <= CMD_NOP;

    $display("-- Starting testbench --");
    @(posedge clk);
    rst <= 1'b1;
    @(posedge clk);
    rst <= 1'b0;
    repeat (30) @(posedge clk);

    fp_csv = $fopen({base_path, "test_data.csv"}, "r");

    if (fp_csv == 0) begin
      $display("Could not open test_data.csv");
      $stop;
    end

    // Skip first line that contains column names
    $fgets(line, fp_csv);

    while (!$feof(
        fp_csv
    )) begin
      testNumber++;
      $fgets(line, fp_csv);
      input_str = "";
      regex_file_str = "";
      expected_output_str = "";

      comma_count = 0;

      for (int i = 0; i < line.len(); i++) begin

        // New line character
        if (line[i] == 10 || line[i] == 13) begin
          break;
        end

        if (line[i] == ",") begin
          comma_count++;
        end else begin
          if (comma_count == 0) input_str = {input_str, line[i]};
          else if (comma_count == 1) regex_file_str = {regex_file_str, line[i]};
          else if (comma_count == 2) expected_output_str = {expected_output_str, line[i]};
        end
      end

      $display("++++ #%d regex_file_str: '%s'; expected_output_str: '%s'; input_str: '%s'",
               testNumber, regex_file_str, expected_output_str, input_str);

      fp_code = $fopen({base_path, "compiled_regexes/", regex_file_str}, "r");
      if (fp_code == 0) begin
        $display("Could not open regex file '%s'", regex_file_str);
        $stop;
      end

      cmd_register <= CMD_NOP;

      @(posedge clk);
      rst <= 1'b1;
      @(posedge clk);
      rst <= 1'b0;
      repeat (30) @(posedge clk);

      start_code = 32'h0000_0000;
      write_code_file_into_memory(fp_code, start_code, end_code);

      start_string = end_code;
      // Align CC_ID_BITS value of the start of the string
      while (start_string[0+: CC_ID_BITS] != 0) begin
        start_string += 1;
      end
      //write string
      write_string_into_memory(input_str, start_string, end_string);

      $fclose(fp_code);

      start(start_string, end_string - 1);

      wait_result(res);
      get_cc_elapsed(cc_taken);
      $display("cc taken: %d", cc_taken);
      if ((res == 1 && expected_output_str == "false") || (res == 0 && expected_output_str == "true")) begin
        $display("\tKO expected '%s', obtained '%d' for input = '%s' and regex = '%s'",
                 expected_output_str, res, input_str, regex_file_str);
        // $stop;
      end

    end

    $fclose(fp_csv);
    $finish(0);
  end
endmodule
