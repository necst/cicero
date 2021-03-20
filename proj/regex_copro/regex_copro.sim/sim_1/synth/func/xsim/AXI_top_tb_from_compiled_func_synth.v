// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Feb 12 17:46:35 2021
// Host        : DESKTOP-K2FOLNH running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/danie/Documents/GitHub/regex_coprocessor_safe/proj/regex_copro/regex_copro.sim/sim_1/synth/func/xsim/AXI_top_tb_from_compiled_func_synth.v
// Design      : AXI_top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* BASIC_BLOCK_PIPELINED = "1" *) (* BB_N = "2" *) (* BRAM_READ_ADDR_WIDTH = "9" *) 
(* BRAM_READ_WIDTH = "64" *) (* BRAM_WE_WIDTH = "4" *) (* BRAM_WRITE_ADDR_WIDTH = "10" *) 
(* BRAM_WRITE_WIDTH = "32" *) (* BYTE_ADDR_OFFSET_IN_REG = "1" *) (* CACHE_BLOCK_WIDTH_BITS = "2" *) 
(* CACHE_WIDTH_BITS = "4" *) (* CHANNEL_COUNT_WIDTH = "4" *) (* CHARACTER_WIDTH = "8" *) 
(* FIFO_COUNT_WIDTH = "5" *) (* LATENCY_COUNT_WIDTH = "7" *) (* PC_WIDTH = "8" *) 
(* NotValidForBitStream *)
module AXI_top
   (clk,
    rst,
    data_in_register,
    address_register,
    start_cc_pointer_register,
    end_cc_pointer_register,
    cmd_register,
    status_register,
    data_o_register);
  input clk;
  input rst;
  input [31:0]data_in_register;
  input [31:0]address_register;
  input [31:0]start_cc_pointer_register;
  input [31:0]end_cc_pointer_register;
  input [31:0]cmd_register;
  output [31:0]status_register;
  output [31:0]data_o_register;

  wire \FSM_sequential_status_register[2]_i_4_n_0 ;
  wire \FSM_sequential_status_register[2]_i_5_n_0 ;
  wire \FSM_sequential_status_register[2]_i_6_n_0 ;
  wire a_regex_coprocessor_n_1;
  wire a_regex_coprocessor_n_11;
  wire a_regex_coprocessor_n_16;
  wire abram_n_100;
  wire abram_n_101;
  wire abram_n_102;
  wire abram_n_103;
  wire abram_n_97;
  wire abram_n_98;
  wire abram_n_99;
  wire [31:0]address_register;
  wire [9:0]address_register_IBUF;
  wire [63:0]bram_r;
  wire [8:0]bram_r_addr;
  wire bram_r_valid;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:0]cmd_register;
  wire [31:0]cmd_register_IBUF;
  wire [31:0]data_in_register;
  wire [31:0]data_in_register_IBUF;
  wire [31:0]data_o_register;
  wire [31:0]data_o_register_OBUF;
  wire \data_o_register_OBUF[31]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_3_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_4_n_0 ;
  wire [31:0]elapsed_cc;
  wire \elapsed_cc[0]_i_1_n_0 ;
  wire \elapsed_cc[10]_i_1_n_0 ;
  wire \elapsed_cc[11]_i_1_n_0 ;
  wire \elapsed_cc[12]_i_1_n_0 ;
  wire \elapsed_cc[13]_i_1_n_0 ;
  wire \elapsed_cc[14]_i_1_n_0 ;
  wire \elapsed_cc[15]_i_1_n_0 ;
  wire \elapsed_cc[16]_i_1_n_0 ;
  wire \elapsed_cc[17]_i_1_n_0 ;
  wire \elapsed_cc[18]_i_1_n_0 ;
  wire \elapsed_cc[19]_i_1_n_0 ;
  wire \elapsed_cc[1]_i_1_n_0 ;
  wire \elapsed_cc[20]_i_1_n_0 ;
  wire \elapsed_cc[21]_i_1_n_0 ;
  wire \elapsed_cc[22]_i_1_n_0 ;
  wire \elapsed_cc[23]_i_1_n_0 ;
  wire \elapsed_cc[24]_i_1_n_0 ;
  wire \elapsed_cc[25]_i_1_n_0 ;
  wire \elapsed_cc[26]_i_1_n_0 ;
  wire \elapsed_cc[27]_i_1_n_0 ;
  wire \elapsed_cc[28]_i_1_n_0 ;
  wire \elapsed_cc[29]_i_1_n_0 ;
  wire \elapsed_cc[2]_i_1_n_0 ;
  wire \elapsed_cc[30]_i_1_n_0 ;
  wire \elapsed_cc[31]_i_10_n_0 ;
  wire \elapsed_cc[31]_i_2_n_0 ;
  wire \elapsed_cc[31]_i_3_n_0 ;
  wire \elapsed_cc[31]_i_4_n_0 ;
  wire \elapsed_cc[31]_i_5_n_0 ;
  wire \elapsed_cc[31]_i_6_n_0 ;
  wire \elapsed_cc[31]_i_7_n_0 ;
  wire \elapsed_cc[31]_i_8_n_0 ;
  wire \elapsed_cc[3]_i_1_n_0 ;
  wire \elapsed_cc[4]_i_1_n_0 ;
  wire \elapsed_cc[5]_i_1_n_0 ;
  wire \elapsed_cc[6]_i_1_n_0 ;
  wire \elapsed_cc[7]_i_1_n_0 ;
  wire \elapsed_cc[8]_i_1_n_0 ;
  wire \elapsed_cc[9]_i_1_n_0 ;
  wire elapsed_cc_next;
  wire \elapsed_cc_reg[16]_i_2_n_0 ;
  wire \elapsed_cc_reg[16]_i_2_n_1 ;
  wire \elapsed_cc_reg[16]_i_2_n_2 ;
  wire \elapsed_cc_reg[16]_i_2_n_3 ;
  wire \elapsed_cc_reg[16]_i_2_n_4 ;
  wire \elapsed_cc_reg[16]_i_2_n_5 ;
  wire \elapsed_cc_reg[16]_i_2_n_6 ;
  wire \elapsed_cc_reg[16]_i_2_n_7 ;
  wire \elapsed_cc_reg[24]_i_2_n_0 ;
  wire \elapsed_cc_reg[24]_i_2_n_1 ;
  wire \elapsed_cc_reg[24]_i_2_n_2 ;
  wire \elapsed_cc_reg[24]_i_2_n_3 ;
  wire \elapsed_cc_reg[24]_i_2_n_4 ;
  wire \elapsed_cc_reg[24]_i_2_n_5 ;
  wire \elapsed_cc_reg[24]_i_2_n_6 ;
  wire \elapsed_cc_reg[24]_i_2_n_7 ;
  wire \elapsed_cc_reg[31]_i_9_n_2 ;
  wire \elapsed_cc_reg[31]_i_9_n_3 ;
  wire \elapsed_cc_reg[31]_i_9_n_4 ;
  wire \elapsed_cc_reg[31]_i_9_n_5 ;
  wire \elapsed_cc_reg[31]_i_9_n_6 ;
  wire \elapsed_cc_reg[31]_i_9_n_7 ;
  wire \elapsed_cc_reg[8]_i_2_n_0 ;
  wire \elapsed_cc_reg[8]_i_2_n_1 ;
  wire \elapsed_cc_reg[8]_i_2_n_2 ;
  wire \elapsed_cc_reg[8]_i_2_n_3 ;
  wire \elapsed_cc_reg[8]_i_2_n_4 ;
  wire \elapsed_cc_reg[8]_i_2_n_5 ;
  wire \elapsed_cc_reg[8]_i_2_n_6 ;
  wire \elapsed_cc_reg[8]_i_2_n_7 ;
  wire [31:0]end_cc_pointer_register;
  wire [31:0]end_cc_pointer_register_IBUF;
  wire [31:1]in6;
  wire memory_addr_from_coprocessor_ready;
  wire rst;
  wire rst_IBUF;
  wire rst_master;
  wire [31:0]start_cc_pointer_register;
  wire [31:0]start_cc_pointer_register_IBUF;
  wire start_valid;
  wire [31:0]status_register;
  wire [2:0]status_register_OBUF;
  wire [2:0]status_register__0;
  wire [2:0]status_register_next;
  wire [7:6]\NLW_elapsed_cc_reg[31]_i_9_CO_UNCONNECTED ;
  wire [7:7]\NLW_elapsed_cc_reg[31]_i_9_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0800000008008000)) 
    \FSM_sequential_status_register[2]_i_4 
       (.I0(cmd_register_IBUF[2]),
        .I1(\FSM_sequential_status_register[2]_i_6_n_0 ),
        .I2(status_register__0[2]),
        .I3(a_regex_coprocessor_n_16),
        .I4(status_register__0[1]),
        .I5(status_register__0[0]),
        .O(\FSM_sequential_status_register[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \FSM_sequential_status_register[2]_i_5 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(status_register__0[1]),
        .O(\FSM_sequential_status_register[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_status_register[2]_i_6 
       (.I0(cmd_register_IBUF[1]),
        .I1(cmd_register_IBUF[0]),
        .O(\FSM_sequential_status_register[2]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "STATUS_IDLE:000,STATUS_RUNNING:001,STATUS_ERROR:010,STATUS_REJECTED:100,STATUS_ACCEPTED:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_status_register_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(a_regex_coprocessor_n_11),
        .D(status_register_next[0]),
        .Q(status_register__0[0]),
        .R(rst_master));
  (* FSM_ENCODED_STATES = "STATUS_IDLE:000,STATUS_RUNNING:001,STATUS_ERROR:010,STATUS_REJECTED:100,STATUS_ACCEPTED:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_status_register_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(a_regex_coprocessor_n_11),
        .D(status_register_next[1]),
        .Q(status_register__0[1]),
        .R(rst_master));
  (* FSM_ENCODED_STATES = "STATUS_IDLE:000,STATUS_RUNNING:001,STATUS_ERROR:010,STATUS_REJECTED:100,STATUS_ACCEPTED:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_status_register_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(a_regex_coprocessor_n_11),
        .D(status_register_next[2]),
        .Q(status_register__0[2]),
        .R(rst_master));
  regex_coprocessor_top a_regex_coprocessor
       (.ADDRARDADDR(bram_r_addr),
        .D(status_register_next),
        .E(a_regex_coprocessor_n_11),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register[2]_i_4_n_0 ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register[2]_i_5_n_0 ),
        .\FSM_sequential_status_register_reg[2] (a_regex_coprocessor_n_1),
        .Q(status_register__0),
        .address_register_IBUF({address_register_IBUF[9:7],address_register_IBUF[1]}),
        .bram_r_valid(bram_r_valid),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .end_cc_pointer_register_IBUF(end_cc_pointer_register_IBUF),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (abram_n_98),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (abram_n_97),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (abram_n_99),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (abram_n_100),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (abram_n_101),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (abram_n_102),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 (a_regex_coprocessor_n_16),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .memory_data(bram_r),
        .rst_IBUF(rst_IBUF),
        .rst_master(rst_master),
        .start_cc_pointer_register_IBUF(start_cc_pointer_register_IBUF));
  bram abram
       (.ADDRARDADDR(bram_r_addr),
        .CLK(clk_IBUF_BUFG),
        .\FSM_sequential_status_register_reg[0] (abram_n_98),
        .\FSM_sequential_status_register_reg[0]_0 (abram_n_103),
        .Q(status_register__0),
        .SR(rst_master),
        .\address_register[2] (abram_n_97),
        .\address_register[3] (abram_n_99),
        .\address_register[4] (abram_n_100),
        .\address_register[5] (abram_n_101),
        .\address_register[6] (abram_n_102),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .cmd_register_IBUF(cmd_register_IBUF[2:0]),
        .data_in_register_IBUF(data_in_register_IBUF),
        .\data_o_register[31] (\data_o_register_OBUF[31]_inst_i_2_n_0 ),
        .\data_o_register[31]_0 (elapsed_cc),
        .\data_o_register[31]_1 (\data_o_register_OBUF[31]_inst_i_3_n_0 ),
        .\data_o_register[31]_2 (\data_o_register_OBUF[31]_inst_i_4_n_0 ),
        .data_o_register_OBUF(data_o_register_OBUF),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (a_regex_coprocessor_n_16),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .memory_data(bram_r));
  IBUF \address_register_IBUF[0]_inst 
       (.I(address_register[0]),
        .O(address_register_IBUF[0]));
  IBUF \address_register_IBUF[1]_inst 
       (.I(address_register[1]),
        .O(address_register_IBUF[1]));
  IBUF \address_register_IBUF[2]_inst 
       (.I(address_register[2]),
        .O(address_register_IBUF[2]));
  IBUF \address_register_IBUF[3]_inst 
       (.I(address_register[3]),
        .O(address_register_IBUF[3]));
  IBUF \address_register_IBUF[4]_inst 
       (.I(address_register[4]),
        .O(address_register_IBUF[4]));
  IBUF \address_register_IBUF[5]_inst 
       (.I(address_register[5]),
        .O(address_register_IBUF[5]));
  IBUF \address_register_IBUF[6]_inst 
       (.I(address_register[6]),
        .O(address_register_IBUF[6]));
  IBUF \address_register_IBUF[7]_inst 
       (.I(address_register[7]),
        .O(address_register_IBUF[7]));
  IBUF \address_register_IBUF[8]_inst 
       (.I(address_register[8]),
        .O(address_register_IBUF[8]));
  IBUF \address_register_IBUF[9]_inst 
       (.I(address_register[9]),
        .O(address_register_IBUF[9]));
  (* XILINX_LEGACY_PRIM = "BUFG" *) 
  BUFGCE #(
    .CE_TYPE("ASYNC"),
    .SIM_DEVICE("ULTRASCALE_PLUS"),
    .STARTUP_SYNC("FALSE")) 
    clk_IBUF_BUFG_inst
       (.CE(1'b1),
        .I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF \cmd_register_IBUF[0]_inst 
       (.I(cmd_register[0]),
        .O(cmd_register_IBUF[0]));
  IBUF \cmd_register_IBUF[10]_inst 
       (.I(cmd_register[10]),
        .O(cmd_register_IBUF[10]));
  IBUF \cmd_register_IBUF[11]_inst 
       (.I(cmd_register[11]),
        .O(cmd_register_IBUF[11]));
  IBUF \cmd_register_IBUF[12]_inst 
       (.I(cmd_register[12]),
        .O(cmd_register_IBUF[12]));
  IBUF \cmd_register_IBUF[13]_inst 
       (.I(cmd_register[13]),
        .O(cmd_register_IBUF[13]));
  IBUF \cmd_register_IBUF[14]_inst 
       (.I(cmd_register[14]),
        .O(cmd_register_IBUF[14]));
  IBUF \cmd_register_IBUF[15]_inst 
       (.I(cmd_register[15]),
        .O(cmd_register_IBUF[15]));
  IBUF \cmd_register_IBUF[16]_inst 
       (.I(cmd_register[16]),
        .O(cmd_register_IBUF[16]));
  IBUF \cmd_register_IBUF[17]_inst 
       (.I(cmd_register[17]),
        .O(cmd_register_IBUF[17]));
  IBUF \cmd_register_IBUF[18]_inst 
       (.I(cmd_register[18]),
        .O(cmd_register_IBUF[18]));
  IBUF \cmd_register_IBUF[19]_inst 
       (.I(cmd_register[19]),
        .O(cmd_register_IBUF[19]));
  IBUF \cmd_register_IBUF[1]_inst 
       (.I(cmd_register[1]),
        .O(cmd_register_IBUF[1]));
  IBUF \cmd_register_IBUF[20]_inst 
       (.I(cmd_register[20]),
        .O(cmd_register_IBUF[20]));
  IBUF \cmd_register_IBUF[21]_inst 
       (.I(cmd_register[21]),
        .O(cmd_register_IBUF[21]));
  IBUF \cmd_register_IBUF[22]_inst 
       (.I(cmd_register[22]),
        .O(cmd_register_IBUF[22]));
  IBUF \cmd_register_IBUF[23]_inst 
       (.I(cmd_register[23]),
        .O(cmd_register_IBUF[23]));
  IBUF \cmd_register_IBUF[24]_inst 
       (.I(cmd_register[24]),
        .O(cmd_register_IBUF[24]));
  IBUF \cmd_register_IBUF[25]_inst 
       (.I(cmd_register[25]),
        .O(cmd_register_IBUF[25]));
  IBUF \cmd_register_IBUF[26]_inst 
       (.I(cmd_register[26]),
        .O(cmd_register_IBUF[26]));
  IBUF \cmd_register_IBUF[27]_inst 
       (.I(cmd_register[27]),
        .O(cmd_register_IBUF[27]));
  IBUF \cmd_register_IBUF[28]_inst 
       (.I(cmd_register[28]),
        .O(cmd_register_IBUF[28]));
  IBUF \cmd_register_IBUF[29]_inst 
       (.I(cmd_register[29]),
        .O(cmd_register_IBUF[29]));
  IBUF \cmd_register_IBUF[2]_inst 
       (.I(cmd_register[2]),
        .O(cmd_register_IBUF[2]));
  IBUF \cmd_register_IBUF[30]_inst 
       (.I(cmd_register[30]),
        .O(cmd_register_IBUF[30]));
  IBUF \cmd_register_IBUF[31]_inst 
       (.I(cmd_register[31]),
        .O(cmd_register_IBUF[31]));
  IBUF \cmd_register_IBUF[3]_inst 
       (.I(cmd_register[3]),
        .O(cmd_register_IBUF[3]));
  IBUF \cmd_register_IBUF[4]_inst 
       (.I(cmd_register[4]),
        .O(cmd_register_IBUF[4]));
  IBUF \cmd_register_IBUF[5]_inst 
       (.I(cmd_register[5]),
        .O(cmd_register_IBUF[5]));
  IBUF \cmd_register_IBUF[6]_inst 
       (.I(cmd_register[6]),
        .O(cmd_register_IBUF[6]));
  IBUF \cmd_register_IBUF[7]_inst 
       (.I(cmd_register[7]),
        .O(cmd_register_IBUF[7]));
  IBUF \cmd_register_IBUF[8]_inst 
       (.I(cmd_register[8]),
        .O(cmd_register_IBUF[8]));
  IBUF \cmd_register_IBUF[9]_inst 
       (.I(cmd_register[9]),
        .O(cmd_register_IBUF[9]));
  IBUF \data_in_register_IBUF[0]_inst 
       (.I(data_in_register[0]),
        .O(data_in_register_IBUF[0]));
  IBUF \data_in_register_IBUF[10]_inst 
       (.I(data_in_register[10]),
        .O(data_in_register_IBUF[10]));
  IBUF \data_in_register_IBUF[11]_inst 
       (.I(data_in_register[11]),
        .O(data_in_register_IBUF[11]));
  IBUF \data_in_register_IBUF[12]_inst 
       (.I(data_in_register[12]),
        .O(data_in_register_IBUF[12]));
  IBUF \data_in_register_IBUF[13]_inst 
       (.I(data_in_register[13]),
        .O(data_in_register_IBUF[13]));
  IBUF \data_in_register_IBUF[14]_inst 
       (.I(data_in_register[14]),
        .O(data_in_register_IBUF[14]));
  IBUF \data_in_register_IBUF[15]_inst 
       (.I(data_in_register[15]),
        .O(data_in_register_IBUF[15]));
  IBUF \data_in_register_IBUF[16]_inst 
       (.I(data_in_register[16]),
        .O(data_in_register_IBUF[16]));
  IBUF \data_in_register_IBUF[17]_inst 
       (.I(data_in_register[17]),
        .O(data_in_register_IBUF[17]));
  IBUF \data_in_register_IBUF[18]_inst 
       (.I(data_in_register[18]),
        .O(data_in_register_IBUF[18]));
  IBUF \data_in_register_IBUF[19]_inst 
       (.I(data_in_register[19]),
        .O(data_in_register_IBUF[19]));
  IBUF \data_in_register_IBUF[1]_inst 
       (.I(data_in_register[1]),
        .O(data_in_register_IBUF[1]));
  IBUF \data_in_register_IBUF[20]_inst 
       (.I(data_in_register[20]),
        .O(data_in_register_IBUF[20]));
  IBUF \data_in_register_IBUF[21]_inst 
       (.I(data_in_register[21]),
        .O(data_in_register_IBUF[21]));
  IBUF \data_in_register_IBUF[22]_inst 
       (.I(data_in_register[22]),
        .O(data_in_register_IBUF[22]));
  IBUF \data_in_register_IBUF[23]_inst 
       (.I(data_in_register[23]),
        .O(data_in_register_IBUF[23]));
  IBUF \data_in_register_IBUF[24]_inst 
       (.I(data_in_register[24]),
        .O(data_in_register_IBUF[24]));
  IBUF \data_in_register_IBUF[25]_inst 
       (.I(data_in_register[25]),
        .O(data_in_register_IBUF[25]));
  IBUF \data_in_register_IBUF[26]_inst 
       (.I(data_in_register[26]),
        .O(data_in_register_IBUF[26]));
  IBUF \data_in_register_IBUF[27]_inst 
       (.I(data_in_register[27]),
        .O(data_in_register_IBUF[27]));
  IBUF \data_in_register_IBUF[28]_inst 
       (.I(data_in_register[28]),
        .O(data_in_register_IBUF[28]));
  IBUF \data_in_register_IBUF[29]_inst 
       (.I(data_in_register[29]),
        .O(data_in_register_IBUF[29]));
  IBUF \data_in_register_IBUF[2]_inst 
       (.I(data_in_register[2]),
        .O(data_in_register_IBUF[2]));
  IBUF \data_in_register_IBUF[30]_inst 
       (.I(data_in_register[30]),
        .O(data_in_register_IBUF[30]));
  IBUF \data_in_register_IBUF[31]_inst 
       (.I(data_in_register[31]),
        .O(data_in_register_IBUF[31]));
  IBUF \data_in_register_IBUF[3]_inst 
       (.I(data_in_register[3]),
        .O(data_in_register_IBUF[3]));
  IBUF \data_in_register_IBUF[4]_inst 
       (.I(data_in_register[4]),
        .O(data_in_register_IBUF[4]));
  IBUF \data_in_register_IBUF[5]_inst 
       (.I(data_in_register[5]),
        .O(data_in_register_IBUF[5]));
  IBUF \data_in_register_IBUF[6]_inst 
       (.I(data_in_register[6]),
        .O(data_in_register_IBUF[6]));
  IBUF \data_in_register_IBUF[7]_inst 
       (.I(data_in_register[7]),
        .O(data_in_register_IBUF[7]));
  IBUF \data_in_register_IBUF[8]_inst 
       (.I(data_in_register[8]),
        .O(data_in_register_IBUF[8]));
  IBUF \data_in_register_IBUF[9]_inst 
       (.I(data_in_register[9]),
        .O(data_in_register_IBUF[9]));
  OBUF \data_o_register_OBUF[0]_inst 
       (.I(data_o_register_OBUF[0]),
        .O(data_o_register[0]));
  OBUF \data_o_register_OBUF[10]_inst 
       (.I(data_o_register_OBUF[10]),
        .O(data_o_register[10]));
  OBUF \data_o_register_OBUF[11]_inst 
       (.I(data_o_register_OBUF[11]),
        .O(data_o_register[11]));
  OBUF \data_o_register_OBUF[12]_inst 
       (.I(data_o_register_OBUF[12]),
        .O(data_o_register[12]));
  OBUF \data_o_register_OBUF[13]_inst 
       (.I(data_o_register_OBUF[13]),
        .O(data_o_register[13]));
  OBUF \data_o_register_OBUF[14]_inst 
       (.I(data_o_register_OBUF[14]),
        .O(data_o_register[14]));
  OBUF \data_o_register_OBUF[15]_inst 
       (.I(data_o_register_OBUF[15]),
        .O(data_o_register[15]));
  OBUF \data_o_register_OBUF[16]_inst 
       (.I(data_o_register_OBUF[16]),
        .O(data_o_register[16]));
  OBUF \data_o_register_OBUF[17]_inst 
       (.I(data_o_register_OBUF[17]),
        .O(data_o_register[17]));
  OBUF \data_o_register_OBUF[18]_inst 
       (.I(data_o_register_OBUF[18]),
        .O(data_o_register[18]));
  OBUF \data_o_register_OBUF[19]_inst 
       (.I(data_o_register_OBUF[19]),
        .O(data_o_register[19]));
  OBUF \data_o_register_OBUF[1]_inst 
       (.I(data_o_register_OBUF[1]),
        .O(data_o_register[1]));
  OBUF \data_o_register_OBUF[20]_inst 
       (.I(data_o_register_OBUF[20]),
        .O(data_o_register[20]));
  OBUF \data_o_register_OBUF[21]_inst 
       (.I(data_o_register_OBUF[21]),
        .O(data_o_register[21]));
  OBUF \data_o_register_OBUF[22]_inst 
       (.I(data_o_register_OBUF[22]),
        .O(data_o_register[22]));
  OBUF \data_o_register_OBUF[23]_inst 
       (.I(data_o_register_OBUF[23]),
        .O(data_o_register[23]));
  OBUF \data_o_register_OBUF[24]_inst 
       (.I(data_o_register_OBUF[24]),
        .O(data_o_register[24]));
  OBUF \data_o_register_OBUF[25]_inst 
       (.I(data_o_register_OBUF[25]),
        .O(data_o_register[25]));
  OBUF \data_o_register_OBUF[26]_inst 
       (.I(data_o_register_OBUF[26]),
        .O(data_o_register[26]));
  OBUF \data_o_register_OBUF[27]_inst 
       (.I(data_o_register_OBUF[27]),
        .O(data_o_register[27]));
  OBUF \data_o_register_OBUF[28]_inst 
       (.I(data_o_register_OBUF[28]),
        .O(data_o_register[28]));
  OBUF \data_o_register_OBUF[29]_inst 
       (.I(data_o_register_OBUF[29]),
        .O(data_o_register[29]));
  OBUF \data_o_register_OBUF[2]_inst 
       (.I(data_o_register_OBUF[2]),
        .O(data_o_register[2]));
  OBUF \data_o_register_OBUF[30]_inst 
       (.I(data_o_register_OBUF[30]),
        .O(data_o_register[30]));
  OBUF \data_o_register_OBUF[31]_inst 
       (.I(data_o_register_OBUF[31]),
        .O(data_o_register[31]));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \data_o_register_OBUF[31]_inst_i_2 
       (.I0(cmd_register_IBUF[2]),
        .I1(cmd_register_IBUF[0]),
        .I2(cmd_register_IBUF[1]),
        .I3(abram_n_103),
        .O(\data_o_register_OBUF[31]_inst_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_o_register_OBUF[31]_inst_i_3 
       (.I0(abram_n_98),
        .I1(address_register_IBUF[0]),
        .O(\data_o_register_OBUF[31]_inst_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_o_register_OBUF[31]_inst_i_4 
       (.I0(abram_n_98),
        .I1(address_register_IBUF[0]),
        .O(\data_o_register_OBUF[31]_inst_i_4_n_0 ));
  OBUF \data_o_register_OBUF[3]_inst 
       (.I(data_o_register_OBUF[3]),
        .O(data_o_register[3]));
  OBUF \data_o_register_OBUF[4]_inst 
       (.I(data_o_register_OBUF[4]),
        .O(data_o_register[4]));
  OBUF \data_o_register_OBUF[5]_inst 
       (.I(data_o_register_OBUF[5]),
        .O(data_o_register[5]));
  OBUF \data_o_register_OBUF[6]_inst 
       (.I(data_o_register_OBUF[6]),
        .O(data_o_register[6]));
  OBUF \data_o_register_OBUF[7]_inst 
       (.I(data_o_register_OBUF[7]),
        .O(data_o_register[7]));
  OBUF \data_o_register_OBUF[8]_inst 
       (.I(data_o_register_OBUF[8]),
        .O(data_o_register[8]));
  OBUF \data_o_register_OBUF[9]_inst 
       (.I(data_o_register_OBUF[9]),
        .O(data_o_register[9]));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \elapsed_cc[0]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(elapsed_cc[0]),
        .O(\elapsed_cc[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[10]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[10]),
        .O(\elapsed_cc[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[11]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[11]),
        .O(\elapsed_cc[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[12]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[12]),
        .O(\elapsed_cc[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[13]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[13]),
        .O(\elapsed_cc[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[14]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[14]),
        .O(\elapsed_cc[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[15]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[15]),
        .O(\elapsed_cc[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[16]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[16]),
        .O(\elapsed_cc[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[17]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[17]),
        .O(\elapsed_cc[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[18]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[18]),
        .O(\elapsed_cc[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[19]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[19]),
        .O(\elapsed_cc[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[1]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[1]),
        .O(\elapsed_cc[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[20]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[20]),
        .O(\elapsed_cc[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[21]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[21]),
        .O(\elapsed_cc[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[22]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[22]),
        .O(\elapsed_cc[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[23]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[23]),
        .O(\elapsed_cc[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[24]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[24]),
        .O(\elapsed_cc[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[25]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[25]),
        .O(\elapsed_cc[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[26]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[26]),
        .O(\elapsed_cc[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[27]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[27]),
        .O(\elapsed_cc[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[28]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[28]),
        .O(\elapsed_cc[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[29]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[29]),
        .O(\elapsed_cc[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[2]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[2]),
        .O(\elapsed_cc[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[30]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[30]),
        .O(\elapsed_cc[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \elapsed_cc[31]_i_1 
       (.I0(\elapsed_cc[31]_i_3_n_0 ),
        .I1(\elapsed_cc[31]_i_4_n_0 ),
        .I2(\elapsed_cc[31]_i_5_n_0 ),
        .I3(\elapsed_cc[31]_i_6_n_0 ),
        .I4(\elapsed_cc[31]_i_7_n_0 ),
        .I5(\elapsed_cc[31]_i_8_n_0 ),
        .O(elapsed_cc_next));
  LUT6 #(
    .INIT(64'h7F00FF00FF00FF00)) 
    \elapsed_cc[31]_i_10 
       (.I0(elapsed_cc[25]),
        .I1(elapsed_cc[28]),
        .I2(elapsed_cc[29]),
        .I3(\FSM_sequential_status_register[2]_i_5_n_0 ),
        .I4(elapsed_cc[27]),
        .I5(elapsed_cc[26]),
        .O(\elapsed_cc[31]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \elapsed_cc[31]_i_11 
       (.I0(cmd_register_IBUF[0]),
        .I1(status_register__0[0]),
        .I2(status_register__0[1]),
        .I3(a_regex_coprocessor_n_1),
        .O(start_valid));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[31]_i_2 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[31]),
        .O(\elapsed_cc[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7F00FF00FF00FF00)) 
    \elapsed_cc[31]_i_3 
       (.I0(elapsed_cc[5]),
        .I1(elapsed_cc[8]),
        .I2(elapsed_cc[9]),
        .I3(\FSM_sequential_status_register[2]_i_5_n_0 ),
        .I4(elapsed_cc[7]),
        .I5(elapsed_cc[6]),
        .O(\elapsed_cc[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7F00FF00FF00FF00)) 
    \elapsed_cc[31]_i_4 
       (.I0(elapsed_cc[10]),
        .I1(elapsed_cc[13]),
        .I2(elapsed_cc[14]),
        .I3(\FSM_sequential_status_register[2]_i_5_n_0 ),
        .I4(elapsed_cc[12]),
        .I5(elapsed_cc[11]),
        .O(\elapsed_cc[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7F00FF00FF00FF00)) 
    \elapsed_cc[31]_i_5 
       (.I0(elapsed_cc[20]),
        .I1(elapsed_cc[23]),
        .I2(elapsed_cc[24]),
        .I3(\FSM_sequential_status_register[2]_i_5_n_0 ),
        .I4(elapsed_cc[22]),
        .I5(elapsed_cc[21]),
        .O(\elapsed_cc[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h7F00FF00FF00FF00)) 
    \elapsed_cc[31]_i_6 
       (.I0(elapsed_cc[15]),
        .I1(elapsed_cc[18]),
        .I2(elapsed_cc[19]),
        .I3(\FSM_sequential_status_register[2]_i_5_n_0 ),
        .I4(elapsed_cc[17]),
        .I5(elapsed_cc[16]),
        .O(\elapsed_cc[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFAEEE)) 
    \elapsed_cc[31]_i_7 
       (.I0(\elapsed_cc[31]_i_10_n_0 ),
        .I1(\FSM_sequential_status_register[2]_i_5_n_0 ),
        .I2(elapsed_cc[30]),
        .I3(elapsed_cc[31]),
        .I4(start_valid),
        .O(\elapsed_cc[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h7F00FF00FF00FF00)) 
    \elapsed_cc[31]_i_8 
       (.I0(elapsed_cc[0]),
        .I1(elapsed_cc[3]),
        .I2(elapsed_cc[4]),
        .I3(\FSM_sequential_status_register[2]_i_5_n_0 ),
        .I4(elapsed_cc[2]),
        .I5(elapsed_cc[1]),
        .O(\elapsed_cc[31]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[3]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[3]),
        .O(\elapsed_cc[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[4]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[4]),
        .O(\elapsed_cc[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[5]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[5]),
        .O(\elapsed_cc[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[6]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[6]),
        .O(\elapsed_cc[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[7]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[7]),
        .O(\elapsed_cc[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[8]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[8]),
        .O(\elapsed_cc[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \elapsed_cc[9]_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[0]),
        .I2(in6[9]),
        .O(\elapsed_cc[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[0]_i_1_n_0 ),
        .Q(elapsed_cc[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[10]_i_1_n_0 ),
        .Q(elapsed_cc[10]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[11]_i_1_n_0 ),
        .Q(elapsed_cc[11]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[12]_i_1_n_0 ),
        .Q(elapsed_cc[12]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[13]_i_1_n_0 ),
        .Q(elapsed_cc[13]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[14]_i_1_n_0 ),
        .Q(elapsed_cc[14]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[15]_i_1_n_0 ),
        .Q(elapsed_cc[15]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[16]_i_1_n_0 ),
        .Q(elapsed_cc[16]),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \elapsed_cc_reg[16]_i_2 
       (.CI(\elapsed_cc_reg[8]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\elapsed_cc_reg[16]_i_2_n_0 ,\elapsed_cc_reg[16]_i_2_n_1 ,\elapsed_cc_reg[16]_i_2_n_2 ,\elapsed_cc_reg[16]_i_2_n_3 ,\elapsed_cc_reg[16]_i_2_n_4 ,\elapsed_cc_reg[16]_i_2_n_5 ,\elapsed_cc_reg[16]_i_2_n_6 ,\elapsed_cc_reg[16]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in6[16:9]),
        .S(elapsed_cc[16:9]));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[17]_i_1_n_0 ),
        .Q(elapsed_cc[17]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[18]_i_1_n_0 ),
        .Q(elapsed_cc[18]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[19]_i_1_n_0 ),
        .Q(elapsed_cc[19]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[1]_i_1_n_0 ),
        .Q(elapsed_cc[1]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[20]_i_1_n_0 ),
        .Q(elapsed_cc[20]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[21]_i_1_n_0 ),
        .Q(elapsed_cc[21]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[22]_i_1_n_0 ),
        .Q(elapsed_cc[22]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[23]_i_1_n_0 ),
        .Q(elapsed_cc[23]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[24]_i_1_n_0 ),
        .Q(elapsed_cc[24]),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \elapsed_cc_reg[24]_i_2 
       (.CI(\elapsed_cc_reg[16]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\elapsed_cc_reg[24]_i_2_n_0 ,\elapsed_cc_reg[24]_i_2_n_1 ,\elapsed_cc_reg[24]_i_2_n_2 ,\elapsed_cc_reg[24]_i_2_n_3 ,\elapsed_cc_reg[24]_i_2_n_4 ,\elapsed_cc_reg[24]_i_2_n_5 ,\elapsed_cc_reg[24]_i_2_n_6 ,\elapsed_cc_reg[24]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in6[24:17]),
        .S(elapsed_cc[24:17]));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[25]_i_1_n_0 ),
        .Q(elapsed_cc[25]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[26]_i_1_n_0 ),
        .Q(elapsed_cc[26]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[27]_i_1_n_0 ),
        .Q(elapsed_cc[27]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[28]_i_1_n_0 ),
        .Q(elapsed_cc[28]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[29]_i_1_n_0 ),
        .Q(elapsed_cc[29]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[2]_i_1_n_0 ),
        .Q(elapsed_cc[2]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[30]_i_1_n_0 ),
        .Q(elapsed_cc[30]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[31]_i_2_n_0 ),
        .Q(elapsed_cc[31]),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \elapsed_cc_reg[31]_i_9 
       (.CI(\elapsed_cc_reg[24]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_elapsed_cc_reg[31]_i_9_CO_UNCONNECTED [7:6],\elapsed_cc_reg[31]_i_9_n_2 ,\elapsed_cc_reg[31]_i_9_n_3 ,\elapsed_cc_reg[31]_i_9_n_4 ,\elapsed_cc_reg[31]_i_9_n_5 ,\elapsed_cc_reg[31]_i_9_n_6 ,\elapsed_cc_reg[31]_i_9_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_elapsed_cc_reg[31]_i_9_O_UNCONNECTED [7],in6[31:25]}),
        .S({1'b0,elapsed_cc[31:25]}));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[3]_i_1_n_0 ),
        .Q(elapsed_cc[3]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[4]_i_1_n_0 ),
        .Q(elapsed_cc[4]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[5]_i_1_n_0 ),
        .Q(elapsed_cc[5]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[6]_i_1_n_0 ),
        .Q(elapsed_cc[6]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[7]_i_1_n_0 ),
        .Q(elapsed_cc[7]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[8]_i_1_n_0 ),
        .Q(elapsed_cc[8]),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \elapsed_cc_reg[8]_i_2 
       (.CI(elapsed_cc[0]),
        .CI_TOP(1'b0),
        .CO({\elapsed_cc_reg[8]_i_2_n_0 ,\elapsed_cc_reg[8]_i_2_n_1 ,\elapsed_cc_reg[8]_i_2_n_2 ,\elapsed_cc_reg[8]_i_2_n_3 ,\elapsed_cc_reg[8]_i_2_n_4 ,\elapsed_cc_reg[8]_i_2_n_5 ,\elapsed_cc_reg[8]_i_2_n_6 ,\elapsed_cc_reg[8]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in6[8:1]),
        .S(elapsed_cc[8:1]));
  FDRE #(
    .INIT(1'b0)) 
    \elapsed_cc_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(elapsed_cc_next),
        .D(\elapsed_cc[9]_i_1_n_0 ),
        .Q(elapsed_cc[9]),
        .R(rst_master));
  IBUF \end_cc_pointer_register_IBUF[0]_inst 
       (.I(end_cc_pointer_register[0]),
        .O(end_cc_pointer_register_IBUF[0]));
  IBUF \end_cc_pointer_register_IBUF[10]_inst 
       (.I(end_cc_pointer_register[10]),
        .O(end_cc_pointer_register_IBUF[10]));
  IBUF \end_cc_pointer_register_IBUF[11]_inst 
       (.I(end_cc_pointer_register[11]),
        .O(end_cc_pointer_register_IBUF[11]));
  IBUF \end_cc_pointer_register_IBUF[12]_inst 
       (.I(end_cc_pointer_register[12]),
        .O(end_cc_pointer_register_IBUF[12]));
  IBUF \end_cc_pointer_register_IBUF[13]_inst 
       (.I(end_cc_pointer_register[13]),
        .O(end_cc_pointer_register_IBUF[13]));
  IBUF \end_cc_pointer_register_IBUF[14]_inst 
       (.I(end_cc_pointer_register[14]),
        .O(end_cc_pointer_register_IBUF[14]));
  IBUF \end_cc_pointer_register_IBUF[15]_inst 
       (.I(end_cc_pointer_register[15]),
        .O(end_cc_pointer_register_IBUF[15]));
  IBUF \end_cc_pointer_register_IBUF[16]_inst 
       (.I(end_cc_pointer_register[16]),
        .O(end_cc_pointer_register_IBUF[16]));
  IBUF \end_cc_pointer_register_IBUF[17]_inst 
       (.I(end_cc_pointer_register[17]),
        .O(end_cc_pointer_register_IBUF[17]));
  IBUF \end_cc_pointer_register_IBUF[18]_inst 
       (.I(end_cc_pointer_register[18]),
        .O(end_cc_pointer_register_IBUF[18]));
  IBUF \end_cc_pointer_register_IBUF[19]_inst 
       (.I(end_cc_pointer_register[19]),
        .O(end_cc_pointer_register_IBUF[19]));
  IBUF \end_cc_pointer_register_IBUF[1]_inst 
       (.I(end_cc_pointer_register[1]),
        .O(end_cc_pointer_register_IBUF[1]));
  IBUF \end_cc_pointer_register_IBUF[20]_inst 
       (.I(end_cc_pointer_register[20]),
        .O(end_cc_pointer_register_IBUF[20]));
  IBUF \end_cc_pointer_register_IBUF[21]_inst 
       (.I(end_cc_pointer_register[21]),
        .O(end_cc_pointer_register_IBUF[21]));
  IBUF \end_cc_pointer_register_IBUF[22]_inst 
       (.I(end_cc_pointer_register[22]),
        .O(end_cc_pointer_register_IBUF[22]));
  IBUF \end_cc_pointer_register_IBUF[23]_inst 
       (.I(end_cc_pointer_register[23]),
        .O(end_cc_pointer_register_IBUF[23]));
  IBUF \end_cc_pointer_register_IBUF[24]_inst 
       (.I(end_cc_pointer_register[24]),
        .O(end_cc_pointer_register_IBUF[24]));
  IBUF \end_cc_pointer_register_IBUF[25]_inst 
       (.I(end_cc_pointer_register[25]),
        .O(end_cc_pointer_register_IBUF[25]));
  IBUF \end_cc_pointer_register_IBUF[26]_inst 
       (.I(end_cc_pointer_register[26]),
        .O(end_cc_pointer_register_IBUF[26]));
  IBUF \end_cc_pointer_register_IBUF[27]_inst 
       (.I(end_cc_pointer_register[27]),
        .O(end_cc_pointer_register_IBUF[27]));
  IBUF \end_cc_pointer_register_IBUF[28]_inst 
       (.I(end_cc_pointer_register[28]),
        .O(end_cc_pointer_register_IBUF[28]));
  IBUF \end_cc_pointer_register_IBUF[29]_inst 
       (.I(end_cc_pointer_register[29]),
        .O(end_cc_pointer_register_IBUF[29]));
  IBUF \end_cc_pointer_register_IBUF[2]_inst 
       (.I(end_cc_pointer_register[2]),
        .O(end_cc_pointer_register_IBUF[2]));
  IBUF \end_cc_pointer_register_IBUF[30]_inst 
       (.I(end_cc_pointer_register[30]),
        .O(end_cc_pointer_register_IBUF[30]));
  IBUF \end_cc_pointer_register_IBUF[31]_inst 
       (.I(end_cc_pointer_register[31]),
        .O(end_cc_pointer_register_IBUF[31]));
  IBUF \end_cc_pointer_register_IBUF[3]_inst 
       (.I(end_cc_pointer_register[3]),
        .O(end_cc_pointer_register_IBUF[3]));
  IBUF \end_cc_pointer_register_IBUF[4]_inst 
       (.I(end_cc_pointer_register[4]),
        .O(end_cc_pointer_register_IBUF[4]));
  IBUF \end_cc_pointer_register_IBUF[5]_inst 
       (.I(end_cc_pointer_register[5]),
        .O(end_cc_pointer_register_IBUF[5]));
  IBUF \end_cc_pointer_register_IBUF[6]_inst 
       (.I(end_cc_pointer_register[6]),
        .O(end_cc_pointer_register_IBUF[6]));
  IBUF \end_cc_pointer_register_IBUF[7]_inst 
       (.I(end_cc_pointer_register[7]),
        .O(end_cc_pointer_register_IBUF[7]));
  IBUF \end_cc_pointer_register_IBUF[8]_inst 
       (.I(end_cc_pointer_register[8]),
        .O(end_cc_pointer_register_IBUF[8]));
  IBUF \end_cc_pointer_register_IBUF[9]_inst 
       (.I(end_cc_pointer_register[9]),
        .O(end_cc_pointer_register_IBUF[9]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF \start_cc_pointer_register_IBUF[0]_inst 
       (.I(start_cc_pointer_register[0]),
        .O(start_cc_pointer_register_IBUF[0]));
  IBUF \start_cc_pointer_register_IBUF[10]_inst 
       (.I(start_cc_pointer_register[10]),
        .O(start_cc_pointer_register_IBUF[10]));
  IBUF \start_cc_pointer_register_IBUF[11]_inst 
       (.I(start_cc_pointer_register[11]),
        .O(start_cc_pointer_register_IBUF[11]));
  IBUF \start_cc_pointer_register_IBUF[12]_inst 
       (.I(start_cc_pointer_register[12]),
        .O(start_cc_pointer_register_IBUF[12]));
  IBUF \start_cc_pointer_register_IBUF[13]_inst 
       (.I(start_cc_pointer_register[13]),
        .O(start_cc_pointer_register_IBUF[13]));
  IBUF \start_cc_pointer_register_IBUF[14]_inst 
       (.I(start_cc_pointer_register[14]),
        .O(start_cc_pointer_register_IBUF[14]));
  IBUF \start_cc_pointer_register_IBUF[15]_inst 
       (.I(start_cc_pointer_register[15]),
        .O(start_cc_pointer_register_IBUF[15]));
  IBUF \start_cc_pointer_register_IBUF[16]_inst 
       (.I(start_cc_pointer_register[16]),
        .O(start_cc_pointer_register_IBUF[16]));
  IBUF \start_cc_pointer_register_IBUF[17]_inst 
       (.I(start_cc_pointer_register[17]),
        .O(start_cc_pointer_register_IBUF[17]));
  IBUF \start_cc_pointer_register_IBUF[18]_inst 
       (.I(start_cc_pointer_register[18]),
        .O(start_cc_pointer_register_IBUF[18]));
  IBUF \start_cc_pointer_register_IBUF[19]_inst 
       (.I(start_cc_pointer_register[19]),
        .O(start_cc_pointer_register_IBUF[19]));
  IBUF \start_cc_pointer_register_IBUF[1]_inst 
       (.I(start_cc_pointer_register[1]),
        .O(start_cc_pointer_register_IBUF[1]));
  IBUF \start_cc_pointer_register_IBUF[20]_inst 
       (.I(start_cc_pointer_register[20]),
        .O(start_cc_pointer_register_IBUF[20]));
  IBUF \start_cc_pointer_register_IBUF[21]_inst 
       (.I(start_cc_pointer_register[21]),
        .O(start_cc_pointer_register_IBUF[21]));
  IBUF \start_cc_pointer_register_IBUF[22]_inst 
       (.I(start_cc_pointer_register[22]),
        .O(start_cc_pointer_register_IBUF[22]));
  IBUF \start_cc_pointer_register_IBUF[23]_inst 
       (.I(start_cc_pointer_register[23]),
        .O(start_cc_pointer_register_IBUF[23]));
  IBUF \start_cc_pointer_register_IBUF[24]_inst 
       (.I(start_cc_pointer_register[24]),
        .O(start_cc_pointer_register_IBUF[24]));
  IBUF \start_cc_pointer_register_IBUF[25]_inst 
       (.I(start_cc_pointer_register[25]),
        .O(start_cc_pointer_register_IBUF[25]));
  IBUF \start_cc_pointer_register_IBUF[26]_inst 
       (.I(start_cc_pointer_register[26]),
        .O(start_cc_pointer_register_IBUF[26]));
  IBUF \start_cc_pointer_register_IBUF[27]_inst 
       (.I(start_cc_pointer_register[27]),
        .O(start_cc_pointer_register_IBUF[27]));
  IBUF \start_cc_pointer_register_IBUF[28]_inst 
       (.I(start_cc_pointer_register[28]),
        .O(start_cc_pointer_register_IBUF[28]));
  IBUF \start_cc_pointer_register_IBUF[29]_inst 
       (.I(start_cc_pointer_register[29]),
        .O(start_cc_pointer_register_IBUF[29]));
  IBUF \start_cc_pointer_register_IBUF[2]_inst 
       (.I(start_cc_pointer_register[2]),
        .O(start_cc_pointer_register_IBUF[2]));
  IBUF \start_cc_pointer_register_IBUF[30]_inst 
       (.I(start_cc_pointer_register[30]),
        .O(start_cc_pointer_register_IBUF[30]));
  IBUF \start_cc_pointer_register_IBUF[31]_inst 
       (.I(start_cc_pointer_register[31]),
        .O(start_cc_pointer_register_IBUF[31]));
  IBUF \start_cc_pointer_register_IBUF[3]_inst 
       (.I(start_cc_pointer_register[3]),
        .O(start_cc_pointer_register_IBUF[3]));
  IBUF \start_cc_pointer_register_IBUF[4]_inst 
       (.I(start_cc_pointer_register[4]),
        .O(start_cc_pointer_register_IBUF[4]));
  IBUF \start_cc_pointer_register_IBUF[5]_inst 
       (.I(start_cc_pointer_register[5]),
        .O(start_cc_pointer_register_IBUF[5]));
  IBUF \start_cc_pointer_register_IBUF[6]_inst 
       (.I(start_cc_pointer_register[6]),
        .O(start_cc_pointer_register_IBUF[6]));
  IBUF \start_cc_pointer_register_IBUF[7]_inst 
       (.I(start_cc_pointer_register[7]),
        .O(start_cc_pointer_register_IBUF[7]));
  IBUF \start_cc_pointer_register_IBUF[8]_inst 
       (.I(start_cc_pointer_register[8]),
        .O(start_cc_pointer_register_IBUF[8]));
  IBUF \start_cc_pointer_register_IBUF[9]_inst 
       (.I(start_cc_pointer_register[9]),
        .O(start_cc_pointer_register_IBUF[9]));
  OBUF \status_register_OBUF[0]_inst 
       (.I(status_register_OBUF[0]),
        .O(status_register[0]));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \status_register_OBUF[0]_inst_i_1 
       (.I0(status_register__0[1]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(status_register_OBUF[0]));
  OBUF \status_register_OBUF[10]_inst 
       (.I(1'b0),
        .O(status_register[10]));
  OBUF \status_register_OBUF[11]_inst 
       (.I(1'b0),
        .O(status_register[11]));
  OBUF \status_register_OBUF[12]_inst 
       (.I(1'b0),
        .O(status_register[12]));
  OBUF \status_register_OBUF[13]_inst 
       (.I(1'b0),
        .O(status_register[13]));
  OBUF \status_register_OBUF[14]_inst 
       (.I(1'b0),
        .O(status_register[14]));
  OBUF \status_register_OBUF[15]_inst 
       (.I(1'b0),
        .O(status_register[15]));
  OBUF \status_register_OBUF[16]_inst 
       (.I(1'b0),
        .O(status_register[16]));
  OBUF \status_register_OBUF[17]_inst 
       (.I(1'b0),
        .O(status_register[17]));
  OBUF \status_register_OBUF[18]_inst 
       (.I(1'b0),
        .O(status_register[18]));
  OBUF \status_register_OBUF[19]_inst 
       (.I(1'b0),
        .O(status_register[19]));
  OBUF \status_register_OBUF[1]_inst 
       (.I(status_register_OBUF[1]),
        .O(status_register[1]));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT3 #(
    .INIT(8'h18)) 
    \status_register_OBUF[1]_inst_i_1 
       (.I0(status_register__0[1]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(status_register_OBUF[1]));
  OBUF \status_register_OBUF[20]_inst 
       (.I(1'b0),
        .O(status_register[20]));
  OBUF \status_register_OBUF[21]_inst 
       (.I(1'b0),
        .O(status_register[21]));
  OBUF \status_register_OBUF[22]_inst 
       (.I(1'b0),
        .O(status_register[22]));
  OBUF \status_register_OBUF[23]_inst 
       (.I(1'b0),
        .O(status_register[23]));
  OBUF \status_register_OBUF[24]_inst 
       (.I(1'b0),
        .O(status_register[24]));
  OBUF \status_register_OBUF[25]_inst 
       (.I(1'b0),
        .O(status_register[25]));
  OBUF \status_register_OBUF[26]_inst 
       (.I(1'b0),
        .O(status_register[26]));
  OBUF \status_register_OBUF[27]_inst 
       (.I(1'b0),
        .O(status_register[27]));
  OBUF \status_register_OBUF[28]_inst 
       (.I(1'b0),
        .O(status_register[28]));
  OBUF \status_register_OBUF[29]_inst 
       (.I(1'b0),
        .O(status_register[29]));
  OBUF \status_register_OBUF[2]_inst 
       (.I(status_register_OBUF[2]),
        .O(status_register[2]));
  LUT3 #(
    .INIT(8'h04)) 
    \status_register_OBUF[2]_inst_i_1 
       (.I0(status_register__0[2]),
        .I1(status_register__0[1]),
        .I2(status_register__0[0]),
        .O(status_register_OBUF[2]));
  OBUF \status_register_OBUF[30]_inst 
       (.I(1'b0),
        .O(status_register[30]));
  OBUF \status_register_OBUF[31]_inst 
       (.I(1'b0),
        .O(status_register[31]));
  OBUF \status_register_OBUF[3]_inst 
       (.I(1'b0),
        .O(status_register[3]));
  OBUF \status_register_OBUF[4]_inst 
       (.I(1'b0),
        .O(status_register[4]));
  OBUF \status_register_OBUF[5]_inst 
       (.I(1'b0),
        .O(status_register[5]));
  OBUF \status_register_OBUF[6]_inst 
       (.I(1'b0),
        .O(status_register[6]));
  OBUF \status_register_OBUF[7]_inst 
       (.I(1'b0),
        .O(status_register[7]));
  OBUF \status_register_OBUF[8]_inst 
       (.I(1'b0),
        .O(status_register[8]));
  OBUF \status_register_OBUF[9]_inst 
       (.I(1'b0),
        .O(status_register[9]));
endmodule

module BRAM_SDP_MACRO_viv_
   (memory_data,
    memory_addr_from_coprocessor_ready,
    data_o_register_OBUF,
    \address_register[2] ,
    \FSM_sequential_status_register_reg[0] ,
    \address_register[3] ,
    \address_register[4] ,
    \address_register[5] ,
    \address_register[6] ,
    \FSM_sequential_status_register_reg[0]_0 ,
    CLK,
    bram_r_valid,
    SR,
    ADDRARDADDR,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    cmd_register_IBUF,
    Q,
    \data_o_register[31] ,
    \data_o_register[31]_0 ,
    \data_o_register[31]_1 ,
    \data_o_register[31]_2 ,
    address_register_IBUF,
    data_in_register_IBUF);
  output [63:0]memory_data;
  output memory_addr_from_coprocessor_ready;
  output [31:0]data_o_register_OBUF;
  output \address_register[2] ;
  output \FSM_sequential_status_register_reg[0] ;
  output \address_register[3] ;
  output \address_register[4] ;
  output \address_register[5] ;
  output \address_register[6] ;
  output \FSM_sequential_status_register_reg[0]_0 ;
  input CLK;
  input bram_r_valid;
  input [0:0]SR;
  input [8:0]ADDRARDADDR;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [2:0]cmd_register_IBUF;
  input [2:0]Q;
  input \data_o_register[31] ;
  input [31:0]\data_o_register[31]_0 ;
  input \data_o_register[31]_1 ;
  input \data_o_register[31]_2 ;
  input [9:0]address_register_IBUF;
  input [31:0]data_in_register_IBUF;

  wire [8:0]ADDRARDADDR;
  wire CLK;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire [2:0]Q;
  wire [0:0]SR;
  wire \address_register[2] ;
  wire \address_register[3] ;
  wire \address_register[4] ;
  wire \address_register[5] ;
  wire \address_register[6] ;
  wire [9:0]address_register_IBUF;
  wire bram_r_valid;
  wire [31:0]bram_w;
  wire [9:0]bram_w_addr;
  wire [3:3]bram_w_valid;
  wire [2:0]cmd_register_IBUF;
  wire [31:0]data_in_register_IBUF;
  wire \data_o_register[31] ;
  wire [31:0]\data_o_register[31]_0 ;
  wire \data_o_register[31]_1 ;
  wire \data_o_register[31]_2 ;
  wire [31:0]data_o_register_OBUF;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_85_n_0 ;
  wire memory_addr_from_coprocessor_ready;
  wire [63:0]memory_data;
  wire \NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_DBITERR_UNCONNECTED ;
  wire \NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASDOUTPB_UNCONNECTED ;
  wire [3:0]\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_RDADDRECC_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[0]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [0]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[0]),
        .I4(memory_data[32]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[0]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[10]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [10]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[10]),
        .I4(memory_data[42]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[11]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [11]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[11]),
        .I4(memory_data[43]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[12]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [12]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[12]),
        .I4(memory_data[44]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[12]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[13]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [13]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[13]),
        .I4(memory_data[45]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[13]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[14]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [14]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[14]),
        .I4(memory_data[46]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[14]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[15]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [15]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[15]),
        .I4(memory_data[47]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[15]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[16]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [16]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[16]),
        .I4(memory_data[48]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[16]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[17]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [17]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[17]),
        .I4(memory_data[49]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[17]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[18]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [18]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[18]),
        .I4(memory_data[50]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[18]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[19]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [19]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[19]),
        .I4(memory_data[51]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[19]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[1]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [1]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[1]),
        .I4(memory_data[33]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[1]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[20]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [20]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[20]),
        .I4(memory_data[52]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[20]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[21]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [21]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[21]),
        .I4(memory_data[53]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[21]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[22]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [22]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[22]),
        .I4(memory_data[54]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[22]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[23]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [23]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[23]),
        .I4(memory_data[55]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[23]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[24]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [24]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[24]),
        .I4(memory_data[56]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[24]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[25]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [25]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[25]),
        .I4(memory_data[57]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[25]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[26]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [26]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[26]),
        .I4(memory_data[58]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[26]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[27]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [27]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[27]),
        .I4(memory_data[59]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[27]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[28]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [28]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[28]),
        .I4(memory_data[60]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[28]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[29]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [29]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[29]),
        .I4(memory_data[61]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[29]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[2]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [2]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[2]),
        .I4(memory_data[34]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[30]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [30]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[30]),
        .I4(memory_data[62]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[30]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[31]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [31]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[31]),
        .I4(memory_data[63]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[31]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[3]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [3]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[3]),
        .I4(memory_data[35]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[4]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [4]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[4]),
        .I4(memory_data[36]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[4]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[5]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [5]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[5]),
        .I4(memory_data[37]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[6]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [6]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[6]),
        .I4(memory_data[38]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[7]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [7]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[7]),
        .I4(memory_data[39]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[8]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [8]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[8]),
        .I4(memory_data[40]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \data_o_register_OBUF[9]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register[31]_0 [9]),
        .I2(\data_o_register[31]_1 ),
        .I3(memory_data[9]),
        .I4(memory_data[41]),
        .I5(\data_o_register[31]_2 ),
        .O(data_o_register_OBUF[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "RAMB36E1" *) 
  (* XILINX_TRANSFORM_PINMAP = "CASCADEINA:CASDINA[0] CASCADEINB:CASDINB[0] CASCADEOUTA:CASDOUTA[0] CASCADEOUTB:CASDOUTB[0] DIADI[0]:DINADIN[0] DIADI[10]:DINADIN[10] DIADI[11]:DINADIN[11] DIADI[12]:DINADIN[12] DIADI[13]:DINADIN[13] DIADI[14]:DINADIN[14] DIADI[15]:DINADIN[15] DIADI[16]:DINADIN[16] DIADI[17]:DINADIN[17] DIADI[18]:DINADIN[18] DIADI[19]:DINADIN[19] DIADI[1]:DINADIN[1] DIADI[20]:DINADIN[20] DIADI[21]:DINADIN[21] DIADI[22]:DINADIN[22] DIADI[23]:DINADIN[23] DIADI[24]:DINADIN[24] DIADI[25]:DINADIN[25] DIADI[26]:DINADIN[26] DIADI[27]:DINADIN[27] DIADI[28]:DINADIN[28] DIADI[29]:DINADIN[29] DIADI[2]:DINADIN[2] DIADI[30]:DINADIN[30] DIADI[31]:DINADIN[31] DIADI[3]:DINADIN[3] DIADI[4]:DINADIN[4] DIADI[5]:DINADIN[5] DIADI[6]:DINADIN[6] DIADI[7]:DINADIN[7] DIADI[8]:DINADIN[8] DIADI[9]:DINADIN[9] DIBDI[0]:DINBDIN[0] DIBDI[10]:DINBDIN[10] DIBDI[11]:DINBDIN[11] DIBDI[12]:DINBDIN[12] DIBDI[13]:DINBDIN[13] DIBDI[14]:DINBDIN[14] DIBDI[15]:DINBDIN[15] DIBDI[16]:DINBDIN[16] DIBDI[17]:DINBDIN[17] DIBDI[18]:DINBDIN[18] DIBDI[19]:DINBDIN[19] DIBDI[1]:DINBDIN[1] DIBDI[20]:DINBDIN[20] DIBDI[21]:DINBDIN[21] DIBDI[22]:DINBDIN[22] DIBDI[23]:DINBDIN[23] DIBDI[24]:DINBDIN[24] DIBDI[25]:DINBDIN[25] DIBDI[26]:DINBDIN[26] DIBDI[27]:DINBDIN[27] DIBDI[28]:DINBDIN[28] DIBDI[29]:DINBDIN[29] DIBDI[2]:DINBDIN[2] DIBDI[30]:DINBDIN[30] DIBDI[31]:DINBDIN[31] DIBDI[3]:DINBDIN[3] DIBDI[4]:DINBDIN[4] DIBDI[5]:DINBDIN[5] DIBDI[6]:DINBDIN[6] DIBDI[7]:DINBDIN[7] DIBDI[8]:DINBDIN[8] DIBDI[9]:DINBDIN[9] DIPADIP[0]:DINPADINP[0] DIPADIP[1]:DINPADINP[1] DIPADIP[2]:DINPADINP[2] DIPADIP[3]:DINPADINP[3] DIPBDIP[0]:DINPBDINP[0] DIPBDIP[1]:DINPBDINP[1] DIPBDIP[2]:DINPBDINP[2] DIPBDIP[3]:DINPBDINP[3] DOADO[0]:DOUTADOUT[0] DOADO[10]:DOUTADOUT[10] DOADO[11]:DOUTADOUT[11] DOADO[12]:DOUTADOUT[12] DOADO[13]:DOUTADOUT[13] DOADO[14]:DOUTADOUT[14] DOADO[15]:DOUTADOUT[15] DOADO[16]:DOUTADOUT[16] DOADO[17]:DOUTADOUT[17] DOADO[18]:DOUTADOUT[18] DOADO[19]:DOUTADOUT[19] DOADO[1]:DOUTADOUT[1] DOADO[20]:DOUTADOUT[20] DOADO[21]:DOUTADOUT[21] DOADO[22]:DOUTADOUT[22] DOADO[23]:DOUTADOUT[23] DOADO[24]:DOUTADOUT[24] DOADO[25]:DOUTADOUT[25] DOADO[26]:DOUTADOUT[26] DOADO[27]:DOUTADOUT[27] DOADO[28]:DOUTADOUT[28] DOADO[29]:DOUTADOUT[29] DOADO[2]:DOUTADOUT[2] DOADO[30]:DOUTADOUT[30] DOADO[31]:DOUTADOUT[31] DOADO[3]:DOUTADOUT[3] DOADO[4]:DOUTADOUT[4] DOADO[5]:DOUTADOUT[5] DOADO[6]:DOUTADOUT[6] DOADO[7]:DOUTADOUT[7] DOADO[8]:DOUTADOUT[8] DOADO[9]:DOUTADOUT[9] DOBDO[0]:DOUTBDOUT[0] DOBDO[10]:DOUTBDOUT[10] DOBDO[11]:DOUTBDOUT[11] DOBDO[12]:DOUTBDOUT[12] DOBDO[13]:DOUTBDOUT[13] DOBDO[14]:DOUTBDOUT[14] DOBDO[15]:DOUTBDOUT[15] DOBDO[16]:DOUTBDOUT[16] DOBDO[17]:DOUTBDOUT[17] DOBDO[18]:DOUTBDOUT[18] DOBDO[19]:DOUTBDOUT[19] DOBDO[1]:DOUTBDOUT[1] DOBDO[20]:DOUTBDOUT[20] DOBDO[21]:DOUTBDOUT[21] DOBDO[22]:DOUTBDOUT[22] DOBDO[23]:DOUTBDOUT[23] DOBDO[24]:DOUTBDOUT[24] DOBDO[25]:DOUTBDOUT[25] DOBDO[26]:DOUTBDOUT[26] DOBDO[27]:DOUTBDOUT[27] DOBDO[28]:DOUTBDOUT[28] DOBDO[29]:DOUTBDOUT[29] DOBDO[2]:DOUTBDOUT[2] DOBDO[30]:DOUTBDOUT[30] DOBDO[31]:DOUTBDOUT[31] DOBDO[3]:DOUTBDOUT[3] DOBDO[4]:DOUTBDOUT[4] DOBDO[5]:DOUTBDOUT[5] DOBDO[6]:DOUTBDOUT[6] DOBDO[7]:DOUTBDOUT[7] DOBDO[8]:DOUTBDOUT[8] DOBDO[9]:DOUTBDOUT[9] DOPADOP[0]:DOUTPADOUTP[0] DOPADOP[1]:DOUTPADOUTP[1] DOPADOP[2]:DOUTPADOUTP[2] DOPADOP[3]:DOUTPADOUTP[3] DOPBDOP[0]:DOUTPBDOUTP[0] DOPBDOP[1]:DOUTPBDOUTP[1] DOPBDOP[2]:DOUTPBDOUTP[2] DOPBDOP[3]:DOUTPBDOUTP[3] ADDRARDADDR[15]:CASDOMUXEN_A ADDRBWRADDR[15]:CASDOMUXEN_B" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 
       (.ADDRARDADDR({ADDRARDADDR,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({bram_w_addr,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(CLK),
        .CLKBWRCLK(CLK),
        .DBITERR(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DINBDIN(bram_w),
        .DINPADINP({1'b0,1'b0,1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(memory_data[31:0]),
        .DOUTBDOUT(memory_data[63:32]),
        .DOUTPADOUTP(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(bram_r_valid),
        .ENBWREN(bram_w_valid),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(SR),
        .RSTRAMB(SR),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({bram_w_valid,bram_w_valid,bram_w_valid,bram_w_valid,bram_w_valid,bram_w_valid,bram_w_valid,bram_w_valid}));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_13 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[9]),
        .O(bram_w_addr[9]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_14 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[8]),
        .O(bram_w_addr[8]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_15 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[7]),
        .O(bram_w_addr[7]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_16 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[6]),
        .O(bram_w_addr[6]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_17 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[5]),
        .O(bram_w_addr[5]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_18 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[4]),
        .O(bram_w_addr[4]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_19 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[3]),
        .O(bram_w_addr[3]));
  LUT4 #(
    .INIT(16'h0200)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_2 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .O(bram_w_valid));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_20 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[2]),
        .O(bram_w_addr[2]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_21 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[1]),
        .O(bram_w_addr[1]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_22 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[0]),
        .O(bram_w_addr[0]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_23 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[31]),
        .O(bram_w[31]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_24 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[30]),
        .O(bram_w[30]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_25 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[29]),
        .O(bram_w[29]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_26 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[28]),
        .O(bram_w[28]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_27 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[27]),
        .O(bram_w[27]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_28 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[26]),
        .O(bram_w[26]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_29 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[25]),
        .O(bram_w[25]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_30 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[24]),
        .O(bram_w[24]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_31 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[23]),
        .O(bram_w[23]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_32 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[22]),
        .O(bram_w[22]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_33 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[21]),
        .O(bram_w[21]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_34 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[20]),
        .O(bram_w[20]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_35 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[19]),
        .O(bram_w[19]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_36 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[18]),
        .O(bram_w[18]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_37 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[17]),
        .O(bram_w[17]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_38 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[16]),
        .O(bram_w[16]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_39 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[15]),
        .O(bram_w[15]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_40 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[14]),
        .O(bram_w[14]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_41 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[13]),
        .O(bram_w[13]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_42 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[12]),
        .O(bram_w[12]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_43 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[11]),
        .O(bram_w[11]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_44 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[10]),
        .O(bram_w[10]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_45 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[9]),
        .O(bram_w[9]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_46 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[8]),
        .O(bram_w[8]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_47 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[7]),
        .O(bram_w[7]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_48 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[6]),
        .O(bram_w[6]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_49 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[5]),
        .O(bram_w[5]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_50 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[4]),
        .O(bram_w[4]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_51 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[3]),
        .O(bram_w[3]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_52 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[2]),
        .O(bram_w[2]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_53 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[1]),
        .O(bram_w[1]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_54 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[1]),
        .I3(cmd_register_IBUF[0]),
        .I4(data_in_register_IBUF[0]),
        .O(bram_w[0]));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_55 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(cmd_register_IBUF[2]),
        .I2(cmd_register_IBUF[0]),
        .I3(cmd_register_IBUF[1]),
        .O(\FSM_sequential_status_register_reg[0] ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_58 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(\FSM_sequential_status_register_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000000000FF0080)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_61 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I1(cmd_register_IBUF[0]),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_85_n_0 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(memory_addr_from_coprocessor_ready));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62 
       (.I0(\FSM_sequential_status_register_reg[0] ),
        .I1(address_register_IBUF[6]),
        .O(\address_register[6] ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_66 
       (.I0(\FSM_sequential_status_register_reg[0] ),
        .I1(address_register_IBUF[5]),
        .O(\address_register[5] ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_69 
       (.I0(\FSM_sequential_status_register_reg[0] ),
        .I1(address_register_IBUF[4]),
        .O(\address_register[4] ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_72 
       (.I0(\FSM_sequential_status_register_reg[0] ),
        .I1(address_register_IBUF[3]),
        .O(\address_register[3] ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_75 
       (.I0(\FSM_sequential_status_register_reg[0] ),
        .I1(address_register_IBUF[2]),
        .O(\address_register[2] ));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_85 
       (.I0(cmd_register_IBUF[1]),
        .I1(cmd_register_IBUF[2]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_85_n_0 ));
endmodule

module arbiter_2_rr
   (bram_r_valid,
    ADDRARDADDR,
    \old_grant_reg[0] ,
    \curState_reg[0] ,
    cur_is_even_character_reg,
    fifo_even_data_in_valid,
    E,
    \curState_reg[0]_0 ,
    EXE1_Instr_valid_reg,
    FETCH_REC_Instr_valid_reg,
    in_ready_packed,
    cur_is_even_character_reg_0,
    DINADIN,
    \EXE1_Pc_reg[0] ,
    cur_is_even_character_reg_1,
    \EXE1_Instr_reg[1] ,
    \EXE1_Instr_reg[2] ,
    \EXE1_Instr_reg[3] ,
    \EXE1_Instr_reg[4] ,
    \EXE1_Instr_reg[5] ,
    \EXE1_Instr_reg[6] ,
    \EXE1_Pc_reg[6] ,
    \EXE1_Instr_reg[10] ,
    \EXE1_Instr_reg[8] ,
    FETCH_REC_Instr_valid_reg_0,
    EXE2_Instr_valid_reg,
    \old_grant_reg[0]_0 ,
    clk_IBUF_BUFG,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    D,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ,
    curState,
    FETCH_REC_Instr_valid_reg_1,
    EXE1_Instr_valid_1,
    FETCH_REC_Instr_valid_0,
    \old_grant_reg[0]_1 ,
    \tail_reg[4] ,
    \tail_reg[4]_0 ,
    content_reg_bram_0,
    \tail_reg[4]_1 ,
    cur_is_even_character,
    FETCH_REC_Instr_valid_reg_2,
    FETCH_REC_Instr_valid_reg_3,
    FETCH_REC_Instr_valid_reg_4,
    \old_grant_reg[0]_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ,
    old_grant,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    \tail_reg[4]_2 ,
    \EXE2_Instr_reg[15] ,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    content_reg_bram_0_20,
    content_reg_bram_0_21,
    content_reg_bram_0_22,
    content_reg_bram_0_23,
    content_reg_bram_0_24,
    \EXE2_Instr_reg[15]_0 ,
    \old_grant_reg[0]_3 ,
    FETCH_REC_Instr_valid_reg_5,
    FETCH_REC_Instr_valid_reg_6,
    FETCH_REC_Instr_valid_reg_7,
    WEA,
    \old_grant_reg[0]_4 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid_2);
  output bram_r_valid;
  output [4:0]ADDRARDADDR;
  output \old_grant_reg[0] ;
  output \curState_reg[0] ;
  output cur_is_even_character_reg;
  output fifo_even_data_in_valid;
  output [0:0]E;
  output \curState_reg[0]_0 ;
  output EXE1_Instr_valid_reg;
  output FETCH_REC_Instr_valid_reg;
  output [0:0]in_ready_packed;
  output [0:0]cur_is_even_character_reg_0;
  output [7:0]DINADIN;
  output \EXE1_Pc_reg[0] ;
  output [7:0]cur_is_even_character_reg_1;
  output \EXE1_Instr_reg[1] ;
  output \EXE1_Instr_reg[2] ;
  output \EXE1_Instr_reg[3] ;
  output \EXE1_Instr_reg[4] ;
  output \EXE1_Instr_reg[5] ;
  output \EXE1_Instr_reg[6] ;
  output \EXE1_Pc_reg[6] ;
  output \EXE1_Instr_reg[10] ;
  output [0:0]\EXE1_Instr_reg[8] ;
  output [0:0]FETCH_REC_Instr_valid_reg_0;
  output EXE2_Instr_valid_reg;
  input \old_grant_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input [4:0]D;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ;
  input [0:0]curState;
  input FETCH_REC_Instr_valid_reg_1;
  input EXE1_Instr_valid_1;
  input FETCH_REC_Instr_valid_0;
  input \old_grant_reg[0]_1 ;
  input \tail_reg[4] ;
  input \tail_reg[4]_0 ;
  input content_reg_bram_0;
  input \tail_reg[4]_1 ;
  input cur_is_even_character;
  input FETCH_REC_Instr_valid_reg_2;
  input FETCH_REC_Instr_valid_reg_3;
  input FETCH_REC_Instr_valid_reg_4;
  input \old_grant_reg[0]_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ;
  input [0:0]old_grant;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input \tail_reg[4]_2 ;
  input [5:0]\EXE2_Instr_reg[15] ;
  input [0:0]content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input content_reg_bram_0_20;
  input content_reg_bram_0_21;
  input content_reg_bram_0_22;
  input content_reg_bram_0_23;
  input content_reg_bram_0_24;
  input \EXE2_Instr_reg[15]_0 ;
  input \old_grant_reg[0]_3 ;
  input FETCH_REC_Instr_valid_reg_5;
  input FETCH_REC_Instr_valid_reg_6;
  input FETCH_REC_Instr_valid_reg_7;
  input [0:0]WEA;
  input \old_grant_reg[0]_4 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid_2;

  wire [4:0]ADDRARDADDR;
  wire [4:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[10] ;
  wire \EXE1_Instr_reg[1] ;
  wire \EXE1_Instr_reg[2] ;
  wire \EXE1_Instr_reg[3] ;
  wire \EXE1_Instr_reg[4] ;
  wire \EXE1_Instr_reg[5] ;
  wire \EXE1_Instr_reg[6] ;
  wire [0:0]\EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid_1;
  wire EXE1_Instr_valid_reg;
  wire \EXE1_Pc_reg[0] ;
  wire \EXE1_Pc_reg[6] ;
  wire [5:0]\EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[15]_0 ;
  wire EXE2_Instr_valid_2;
  wire EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_0;
  wire FETCH_REC_Instr_valid_reg;
  wire [0:0]FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire FETCH_REC_Instr_valid_reg_3;
  wire FETCH_REC_Instr_valid_reg_4;
  wire FETCH_REC_Instr_valid_reg_5;
  wire FETCH_REC_Instr_valid_reg_6;
  wire FETCH_REC_Instr_valid_reg_7;
  wire [2:0]Q;
  wire [0:0]WEA;
  wire bram_r_valid;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_20;
  wire content_reg_bram_0_21;
  wire content_reg_bram_0_22;
  wire content_reg_bram_0_23;
  wire content_reg_bram_0_24;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire [0:0]content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \curState_reg[0]_0 ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire [0:0]cur_is_even_character_reg_0;
  wire [7:0]cur_is_even_character_reg_1;
  wire fifo_even_data_in_valid;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]old_grant;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire \tail_reg[4] ;
  wire \tail_reg[4]_0 ;
  wire \tail_reg[4]_1 ;
  wire \tail_reg[4]_2 ;

  arbiter_rr_n arbiter
       (.ADDRARDADDR(ADDRARDADDR),
        .D(D),
        .DINADIN(DINADIN),
        .E(E),
        .\EXE1_Instr_reg[10] (\EXE1_Instr_reg[10] ),
        .\EXE1_Instr_reg[1] (\EXE1_Instr_reg[1] ),
        .\EXE1_Instr_reg[2] (\EXE1_Instr_reg[2] ),
        .\EXE1_Instr_reg[3] (\EXE1_Instr_reg[3] ),
        .\EXE1_Instr_reg[4] (\EXE1_Instr_reg[4] ),
        .\EXE1_Instr_reg[5] (\EXE1_Instr_reg[5] ),
        .\EXE1_Instr_reg[6] (\EXE1_Instr_reg[6] ),
        .\EXE1_Instr_reg[8] (\EXE1_Instr_reg[8] ),
        .EXE1_Instr_valid_1(EXE1_Instr_valid_1),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg),
        .\EXE1_Pc_reg[0] (\EXE1_Pc_reg[0] ),
        .\EXE1_Pc_reg[6] (\EXE1_Pc_reg[6] ),
        .\EXE2_Instr_reg[15] (\EXE2_Instr_reg[15] ),
        .\EXE2_Instr_reg[15]_0 (\EXE2_Instr_reg[15]_0 ),
        .EXE2_Instr_valid_2(EXE2_Instr_valid_2),
        .EXE2_Instr_valid_reg(EXE2_Instr_valid_reg),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_0(FETCH_REC_Instr_valid_0),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg_1(FETCH_REC_Instr_valid_reg_1),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid_reg_2),
        .FETCH_REC_Instr_valid_reg_3(FETCH_REC_Instr_valid_reg_3),
        .FETCH_REC_Instr_valid_reg_4(FETCH_REC_Instr_valid_reg_4),
        .FETCH_REC_Instr_valid_reg_5(FETCH_REC_Instr_valid_reg_5),
        .FETCH_REC_Instr_valid_reg_6(FETCH_REC_Instr_valid_reg_6),
        .FETCH_REC_Instr_valid_reg_7(FETCH_REC_Instr_valid_reg_7),
        .Q(Q),
        .WEA(WEA),
        .bram_r_valid(bram_r_valid),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .content_reg_bram_0_1(content_reg_bram_0_1),
        .content_reg_bram_0_10(content_reg_bram_0_10),
        .content_reg_bram_0_11(content_reg_bram_0_11),
        .content_reg_bram_0_12(content_reg_bram_0_12),
        .content_reg_bram_0_13(content_reg_bram_0_13),
        .content_reg_bram_0_14(content_reg_bram_0_14),
        .content_reg_bram_0_15(content_reg_bram_0_15),
        .content_reg_bram_0_16(content_reg_bram_0_16),
        .content_reg_bram_0_17(content_reg_bram_0_17),
        .content_reg_bram_0_18(content_reg_bram_0_18),
        .content_reg_bram_0_19(content_reg_bram_0_19),
        .content_reg_bram_0_2(content_reg_bram_0_2),
        .content_reg_bram_0_20(content_reg_bram_0_20),
        .content_reg_bram_0_21(content_reg_bram_0_21),
        .content_reg_bram_0_22(content_reg_bram_0_22),
        .content_reg_bram_0_23(content_reg_bram_0_23),
        .content_reg_bram_0_24(content_reg_bram_0_24),
        .content_reg_bram_0_3(content_reg_bram_0_3),
        .content_reg_bram_0_4(content_reg_bram_0_4),
        .content_reg_bram_0_5(content_reg_bram_0_5),
        .content_reg_bram_0_6(content_reg_bram_0_6),
        .content_reg_bram_0_7(content_reg_bram_0_7),
        .content_reg_bram_0_8(content_reg_bram_0_8),
        .content_reg_bram_0_9(content_reg_bram_0_9),
        .curState(curState),
        .\curState_reg[0] (\curState_reg[0] ),
        .\curState_reg[0]_0 (\curState_reg[0]_0 ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .fifo_even_data_in_valid(fifo_even_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .old_grant(old_grant),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_3 ),
        .\old_grant_reg[0]_4 (\old_grant_reg[0]_4 ),
        .\tail_reg[4] (\tail_reg[4] ),
        .\tail_reg[4]_0 (\tail_reg[4]_0 ),
        .\tail_reg[4]_1 (\tail_reg[4]_1 ),
        .\tail_reg[4]_2 (\tail_reg[4]_2 ));
endmodule

(* ORIG_REF_NAME = "arbiter_2_rr" *) 
module arbiter_2_rr_9
   (SR,
    in_ready_packed,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ,
    \old_grant_reg[0] ,
    EXE1_Instr_valid_reg,
    E,
    EXE1_Instr_valid_reg_0,
    EXE1_Instr_valid_reg_1,
    EXE1_Instr_valid_reg_2,
    DINADIN,
    \EXE2_Instr_reg[0] ,
    cur_is_even_character_reg,
    \EXE2_Instr_reg[1] ,
    \EXE2_Instr_reg[2] ,
    \EXE2_Instr_reg[3] ,
    \EXE2_Instr_reg[4] ,
    \EXE2_Instr_reg[5] ,
    \EXE2_Instr_reg[6] ,
    \EXE2_Pc_reg[7] ,
    fifo_odd_data_in_valid,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    \EXE1_Instr_reg[10] ,
    \EXE1_Instr_reg[8] ,
    FETCH_REC_Instr_valid_reg,
    EXE2_Instr_valid_reg,
    clk_IBUF_BUFG,
    cmd_register_IBUF,
    rst_IBUF,
    memory_addr_from_coprocessor_ready,
    old_grant,
    \curState_reg[0] ,
    curState,
    EXE1_Instr_valid_reg_3,
    EXE1_Instr_valid_reg_4,
    fifo_even_data_in_ready,
    content_reg_bram_0,
    \switch2channel\.ready_0 ,
    content_reg_bram_0_0,
    \old_grant_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_0,
    \curState_reg[0]_0 ,
    \curState_reg[0]_1 ,
    cur_is_even_character,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    \tail_reg[4] ,
    Q,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    content_reg_bram_0_20,
    content_reg_bram_0_21,
    \EXE2_Instr_reg[15] ,
    \head_reg[0] ,
    \head_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_1,
    FETCH_REC_Instr_valid_reg_2,
    \old_grant_reg[0]_1 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid);
  output [0:0]SR;
  output [0:0]in_ready_packed;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  output \old_grant_reg[0] ;
  output EXE1_Instr_valid_reg;
  output [0:0]E;
  output [0:0]EXE1_Instr_valid_reg_0;
  output EXE1_Instr_valid_reg_1;
  output EXE1_Instr_valid_reg_2;
  output [7:0]DINADIN;
  output \EXE2_Instr_reg[0] ;
  output [7:0]cur_is_even_character_reg;
  output \EXE2_Instr_reg[1] ;
  output \EXE2_Instr_reg[2] ;
  output \EXE2_Instr_reg[3] ;
  output \EXE2_Instr_reg[4] ;
  output \EXE2_Instr_reg[5] ;
  output \EXE2_Instr_reg[6] ;
  output \EXE2_Pc_reg[7] ;
  output fifo_odd_data_in_valid;
  output [0:0]cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output [0:0]\EXE1_Instr_reg[10] ;
  output [0:0]\EXE1_Instr_reg[8] ;
  output FETCH_REC_Instr_valid_reg;
  output EXE2_Instr_valid_reg;
  input clk_IBUF_BUFG;
  input [31:0]cmd_register_IBUF;
  input rst_IBUF;
  input memory_addr_from_coprocessor_ready;
  input [0:0]old_grant;
  input \curState_reg[0] ;
  input [0:0]curState;
  input EXE1_Instr_valid_reg_3;
  input EXE1_Instr_valid_reg_4;
  input fifo_even_data_in_ready;
  input content_reg_bram_0;
  input \switch2channel\.ready_0 ;
  input content_reg_bram_0_0;
  input \old_grant_reg[0]_0 ;
  input FETCH_REC_Instr_valid_reg_0;
  input \curState_reg[0]_0 ;
  input \curState_reg[0]_1 ;
  input cur_is_even_character;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input \tail_reg[4] ;
  input [2:0]Q;
  input content_reg_bram_0_10;
  input [5:0]content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input content_reg_bram_0_20;
  input content_reg_bram_0_21;
  input \EXE2_Instr_reg[15] ;
  input \head_reg[0] ;
  input \head_reg[0]_0 ;
  input FETCH_REC_Instr_valid_reg_1;
  input FETCH_REC_Instr_valid_reg_2;
  input \old_grant_reg[0]_1 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid;

  wire [7:0]DINADIN;
  wire [0:0]E;
  wire [0:0]\EXE1_Instr_reg[10] ;
  wire [0:0]\EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid_reg;
  wire [0:0]EXE1_Instr_valid_reg_0;
  wire EXE1_Instr_valid_reg_1;
  wire EXE1_Instr_valid_reg_2;
  wire EXE1_Instr_valid_reg_3;
  wire EXE1_Instr_valid_reg_4;
  wire \EXE2_Instr_reg[0] ;
  wire \EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[1] ;
  wire \EXE2_Instr_reg[2] ;
  wire \EXE2_Instr_reg[3] ;
  wire \EXE2_Instr_reg[4] ;
  wire \EXE2_Instr_reg[5] ;
  wire \EXE2_Instr_reg[6] ;
  wire EXE2_Instr_valid;
  wire EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire \EXE2_Pc_reg[7] ;
  wire FETCH_REC_Instr_valid_reg;
  wire FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire [2:0]Q;
  wire [0:0]SR;
  wire clk_IBUF_BUFG;
  wire [31:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire [5:0]content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_20;
  wire content_reg_bram_0_21;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \curState_reg[0]_0 ;
  wire \curState_reg[0]_1 ;
  wire cur_is_even_character;
  wire [7:0]cur_is_even_character_reg;
  wire [0:0]cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire fifo_even_data_in_ready;
  wire fifo_odd_data_in_valid;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  wire \head_reg[0] ;
  wire \head_reg[0]_0 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]old_grant;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire rst_IBUF;
  wire \switch2channel\.ready_0 ;
  wire \tail_reg[4] ;

  arbiter_rr_n_10 arbiter
       (.DINADIN(DINADIN),
        .E(E),
        .\EXE1_Instr_reg[10] (\EXE1_Instr_reg[10] ),
        .\EXE1_Instr_reg[8] (\EXE1_Instr_reg[8] ),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg),
        .EXE1_Instr_valid_reg_0(EXE1_Instr_valid_reg_0),
        .EXE1_Instr_valid_reg_1(EXE1_Instr_valid_reg_1),
        .EXE1_Instr_valid_reg_2(EXE1_Instr_valid_reg_2),
        .EXE1_Instr_valid_reg_3(EXE1_Instr_valid_reg_3),
        .EXE1_Instr_valid_reg_4(EXE1_Instr_valid_reg_4),
        .\EXE2_Instr_reg[0] (\EXE2_Instr_reg[0] ),
        .\EXE2_Instr_reg[15] (\EXE2_Instr_reg[15] ),
        .\EXE2_Instr_reg[1] (\EXE2_Instr_reg[1] ),
        .\EXE2_Instr_reg[2] (\EXE2_Instr_reg[2] ),
        .\EXE2_Instr_reg[3] (\EXE2_Instr_reg[3] ),
        .\EXE2_Instr_reg[4] (\EXE2_Instr_reg[4] ),
        .\EXE2_Instr_reg[5] (\EXE2_Instr_reg[5] ),
        .\EXE2_Instr_reg[6] (\EXE2_Instr_reg[6] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg(EXE2_Instr_valid_reg),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg_0),
        .\EXE2_Pc_reg[7] (\EXE2_Pc_reg[7] ),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg_1(FETCH_REC_Instr_valid_reg_1),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid_reg_2),
        .Q(Q),
        .SR(SR),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .content_reg_bram_0_1(content_reg_bram_0_1),
        .content_reg_bram_0_10(content_reg_bram_0_10),
        .content_reg_bram_0_11(content_reg_bram_0_11),
        .content_reg_bram_0_12(content_reg_bram_0_12),
        .content_reg_bram_0_13(content_reg_bram_0_13),
        .content_reg_bram_0_14(content_reg_bram_0_14),
        .content_reg_bram_0_15(content_reg_bram_0_15),
        .content_reg_bram_0_16(content_reg_bram_0_16),
        .content_reg_bram_0_17(content_reg_bram_0_17),
        .content_reg_bram_0_18(content_reg_bram_0_18),
        .content_reg_bram_0_19(content_reg_bram_0_19),
        .content_reg_bram_0_2(content_reg_bram_0_2),
        .content_reg_bram_0_20(content_reg_bram_0_20),
        .content_reg_bram_0_21(content_reg_bram_0_21),
        .content_reg_bram_0_3(content_reg_bram_0_3),
        .content_reg_bram_0_4(content_reg_bram_0_4),
        .content_reg_bram_0_5(content_reg_bram_0_5),
        .content_reg_bram_0_6(content_reg_bram_0_6),
        .content_reg_bram_0_7(content_reg_bram_0_7),
        .content_reg_bram_0_8(content_reg_bram_0_8),
        .content_reg_bram_0_9(content_reg_bram_0_9),
        .curState(curState),
        .\curState_reg[0] (\curState_reg[0] ),
        .\curState_reg[0]_0 (\curState_reg[0]_0 ),
        .\curState_reg[0]_1 (\curState_reg[0]_1 ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .fifo_even_data_in_ready(fifo_even_data_in_ready),
        .fifo_odd_data_in_valid(fifo_odd_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .\head_reg[0] (\head_reg[0] ),
        .\head_reg[0]_0 (\head_reg[0]_0 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .old_grant(old_grant),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_1 ),
        .rst_IBUF(rst_IBUF),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\tail_reg[4] (\tail_reg[4] ));
endmodule

module arbiter_rr_n
   (bram_r_valid,
    ADDRARDADDR,
    \old_grant_reg[0] ,
    \curState_reg[0] ,
    cur_is_even_character_reg,
    fifo_even_data_in_valid,
    E,
    \curState_reg[0]_0 ,
    EXE1_Instr_valid_reg,
    FETCH_REC_Instr_valid_reg,
    in_ready_packed,
    cur_is_even_character_reg_0,
    DINADIN,
    \EXE1_Pc_reg[0] ,
    cur_is_even_character_reg_1,
    \EXE1_Instr_reg[1] ,
    \EXE1_Instr_reg[2] ,
    \EXE1_Instr_reg[3] ,
    \EXE1_Instr_reg[4] ,
    \EXE1_Instr_reg[5] ,
    \EXE1_Instr_reg[6] ,
    \EXE1_Pc_reg[6] ,
    \EXE1_Instr_reg[10] ,
    \EXE1_Instr_reg[8] ,
    FETCH_REC_Instr_valid_reg_0,
    EXE2_Instr_valid_reg,
    \old_grant_reg[0]_0 ,
    clk_IBUF_BUFG,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    D,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ,
    curState,
    FETCH_REC_Instr_valid_reg_1,
    EXE1_Instr_valid_1,
    FETCH_REC_Instr_valid_0,
    \old_grant_reg[0]_1 ,
    \tail_reg[4] ,
    \tail_reg[4]_0 ,
    content_reg_bram_0,
    \tail_reg[4]_1 ,
    cur_is_even_character,
    FETCH_REC_Instr_valid_reg_2,
    FETCH_REC_Instr_valid_reg_3,
    FETCH_REC_Instr_valid_reg_4,
    \old_grant_reg[0]_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ,
    old_grant,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    \tail_reg[4]_2 ,
    \EXE2_Instr_reg[15] ,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    content_reg_bram_0_20,
    content_reg_bram_0_21,
    content_reg_bram_0_22,
    content_reg_bram_0_23,
    content_reg_bram_0_24,
    \EXE2_Instr_reg[15]_0 ,
    \old_grant_reg[0]_3 ,
    FETCH_REC_Instr_valid_reg_5,
    FETCH_REC_Instr_valid_reg_6,
    FETCH_REC_Instr_valid_reg_7,
    WEA,
    \old_grant_reg[0]_4 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid_2);
  output bram_r_valid;
  output [4:0]ADDRARDADDR;
  output \old_grant_reg[0] ;
  output \curState_reg[0] ;
  output cur_is_even_character_reg;
  output fifo_even_data_in_valid;
  output [0:0]E;
  output \curState_reg[0]_0 ;
  output EXE1_Instr_valid_reg;
  output FETCH_REC_Instr_valid_reg;
  output [0:0]in_ready_packed;
  output [0:0]cur_is_even_character_reg_0;
  output [7:0]DINADIN;
  output \EXE1_Pc_reg[0] ;
  output [7:0]cur_is_even_character_reg_1;
  output \EXE1_Instr_reg[1] ;
  output \EXE1_Instr_reg[2] ;
  output \EXE1_Instr_reg[3] ;
  output \EXE1_Instr_reg[4] ;
  output \EXE1_Instr_reg[5] ;
  output \EXE1_Instr_reg[6] ;
  output \EXE1_Pc_reg[6] ;
  output \EXE1_Instr_reg[10] ;
  output [0:0]\EXE1_Instr_reg[8] ;
  output [0:0]FETCH_REC_Instr_valid_reg_0;
  output EXE2_Instr_valid_reg;
  input \old_grant_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input [4:0]D;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ;
  input [0:0]curState;
  input FETCH_REC_Instr_valid_reg_1;
  input EXE1_Instr_valid_1;
  input FETCH_REC_Instr_valid_0;
  input \old_grant_reg[0]_1 ;
  input \tail_reg[4] ;
  input \tail_reg[4]_0 ;
  input content_reg_bram_0;
  input \tail_reg[4]_1 ;
  input cur_is_even_character;
  input FETCH_REC_Instr_valid_reg_2;
  input FETCH_REC_Instr_valid_reg_3;
  input FETCH_REC_Instr_valid_reg_4;
  input \old_grant_reg[0]_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ;
  input [0:0]old_grant;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input \tail_reg[4]_2 ;
  input [5:0]\EXE2_Instr_reg[15] ;
  input [0:0]content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input content_reg_bram_0_20;
  input content_reg_bram_0_21;
  input content_reg_bram_0_22;
  input content_reg_bram_0_23;
  input content_reg_bram_0_24;
  input \EXE2_Instr_reg[15]_0 ;
  input \old_grant_reg[0]_3 ;
  input FETCH_REC_Instr_valid_reg_5;
  input FETCH_REC_Instr_valid_reg_6;
  input FETCH_REC_Instr_valid_reg_7;
  input [0:0]WEA;
  input \old_grant_reg[0]_4 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid_2;

  wire [4:0]ADDRARDADDR;
  wire [4:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[10] ;
  wire \EXE1_Instr_reg[1] ;
  wire \EXE1_Instr_reg[2] ;
  wire \EXE1_Instr_reg[3] ;
  wire \EXE1_Instr_reg[4] ;
  wire \EXE1_Instr_reg[5] ;
  wire \EXE1_Instr_reg[6] ;
  wire [0:0]\EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid_1;
  wire EXE1_Instr_valid_reg;
  wire \EXE1_Pc_reg[0] ;
  wire \EXE1_Pc_reg[6] ;
  wire [5:0]\EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[15]_0 ;
  wire EXE2_Instr_valid_2;
  wire EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_0;
  wire FETCH_REC_Instr_valid_reg;
  wire [0:0]FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire FETCH_REC_Instr_valid_reg_3;
  wire FETCH_REC_Instr_valid_reg_4;
  wire FETCH_REC_Instr_valid_reg_5;
  wire FETCH_REC_Instr_valid_reg_6;
  wire FETCH_REC_Instr_valid_reg_7;
  wire [2:0]Q;
  wire [0:0]WEA;
  wire bram_r_valid;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_20;
  wire content_reg_bram_0_21;
  wire content_reg_bram_0_22;
  wire content_reg_bram_0_23;
  wire content_reg_bram_0_24;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire [0:0]content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \curState_reg[0]_0 ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire [0:0]cur_is_even_character_reg_0;
  wire [7:0]cur_is_even_character_reg_1;
  wire fifo_even_data_in_valid;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]old_grant;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire \tail_reg[4] ;
  wire \tail_reg[4]_0 ;
  wire \tail_reg[4]_1 ;
  wire \tail_reg[4]_2 ;

  arbitration_logic_rr arbitration_logic
       (.ADDRARDADDR(ADDRARDADDR),
        .D(D),
        .DINADIN(DINADIN),
        .E(E),
        .\EXE1_Instr_reg[10] (\EXE1_Instr_reg[10] ),
        .\EXE1_Instr_reg[1] (\EXE1_Instr_reg[1] ),
        .\EXE1_Instr_reg[2] (\EXE1_Instr_reg[2] ),
        .\EXE1_Instr_reg[3] (\EXE1_Instr_reg[3] ),
        .\EXE1_Instr_reg[4] (\EXE1_Instr_reg[4] ),
        .\EXE1_Instr_reg[5] (\EXE1_Instr_reg[5] ),
        .\EXE1_Instr_reg[6] (\EXE1_Instr_reg[6] ),
        .\EXE1_Instr_reg[8] (\EXE1_Instr_reg[8] ),
        .EXE1_Instr_valid_1(EXE1_Instr_valid_1),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg),
        .\EXE1_Pc_reg[0] (\EXE1_Pc_reg[0] ),
        .\EXE1_Pc_reg[6] (\EXE1_Pc_reg[6] ),
        .\EXE2_Instr_reg[15] (\EXE2_Instr_reg[15] ),
        .\EXE2_Instr_reg[15]_0 (\EXE2_Instr_reg[15]_0 ),
        .EXE2_Instr_valid_2(EXE2_Instr_valid_2),
        .EXE2_Instr_valid_reg(EXE2_Instr_valid_reg),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_0(FETCH_REC_Instr_valid_0),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg_1(FETCH_REC_Instr_valid_reg_1),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid_reg_2),
        .FETCH_REC_Instr_valid_reg_3(FETCH_REC_Instr_valid_reg_3),
        .FETCH_REC_Instr_valid_reg_4(FETCH_REC_Instr_valid_reg_4),
        .FETCH_REC_Instr_valid_reg_5(FETCH_REC_Instr_valid_reg_5),
        .FETCH_REC_Instr_valid_reg_6(FETCH_REC_Instr_valid_reg_6),
        .FETCH_REC_Instr_valid_reg_7(FETCH_REC_Instr_valid_reg_7),
        .Q(Q),
        .WEA(WEA),
        .bram_r_valid(bram_r_valid),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .content_reg_bram_0_1(content_reg_bram_0_1),
        .content_reg_bram_0_10(content_reg_bram_0_10),
        .content_reg_bram_0_11(content_reg_bram_0_11),
        .content_reg_bram_0_12(content_reg_bram_0_12),
        .content_reg_bram_0_13(content_reg_bram_0_13),
        .content_reg_bram_0_14(content_reg_bram_0_14),
        .content_reg_bram_0_15(content_reg_bram_0_15),
        .content_reg_bram_0_16(content_reg_bram_0_16),
        .content_reg_bram_0_17(content_reg_bram_0_17),
        .content_reg_bram_0_18(content_reg_bram_0_18),
        .content_reg_bram_0_19(content_reg_bram_0_19),
        .content_reg_bram_0_2(content_reg_bram_0_2),
        .content_reg_bram_0_20(content_reg_bram_0_20),
        .content_reg_bram_0_21(content_reg_bram_0_21),
        .content_reg_bram_0_22(content_reg_bram_0_22),
        .content_reg_bram_0_23(content_reg_bram_0_23),
        .content_reg_bram_0_24(content_reg_bram_0_24),
        .content_reg_bram_0_3(content_reg_bram_0_3),
        .content_reg_bram_0_4(content_reg_bram_0_4),
        .content_reg_bram_0_5(content_reg_bram_0_5),
        .content_reg_bram_0_6(content_reg_bram_0_6),
        .content_reg_bram_0_7(content_reg_bram_0_7),
        .content_reg_bram_0_8(content_reg_bram_0_8),
        .content_reg_bram_0_9(content_reg_bram_0_9),
        .curState(curState),
        .\curState_reg[0] (\curState_reg[0] ),
        .\curState_reg[0]_0 (\curState_reg[0]_0 ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .fifo_even_data_in_valid(fifo_even_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .old_grant(old_grant),
        .\old_grant_reg[0]_0 (\old_grant_reg[0] ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_4 (\old_grant_reg[0]_3 ),
        .\old_grant_reg[0]_5 (\old_grant_reg[0]_4 ),
        .\tail_reg[4] (\tail_reg[4] ),
        .\tail_reg[4]_0 (\tail_reg[4]_0 ),
        .\tail_reg[4]_1 (\tail_reg[4]_1 ),
        .\tail_reg[4]_2 (\tail_reg[4]_2 ));
endmodule

(* ORIG_REF_NAME = "arbiter_rr_n" *) 
module arbiter_rr_n_10
   (SR,
    in_ready_packed,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ,
    \old_grant_reg[0] ,
    EXE1_Instr_valid_reg,
    E,
    EXE1_Instr_valid_reg_0,
    EXE1_Instr_valid_reg_1,
    EXE1_Instr_valid_reg_2,
    DINADIN,
    \EXE2_Instr_reg[0] ,
    cur_is_even_character_reg,
    \EXE2_Instr_reg[1] ,
    \EXE2_Instr_reg[2] ,
    \EXE2_Instr_reg[3] ,
    \EXE2_Instr_reg[4] ,
    \EXE2_Instr_reg[5] ,
    \EXE2_Instr_reg[6] ,
    \EXE2_Pc_reg[7] ,
    fifo_odd_data_in_valid,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    \EXE1_Instr_reg[10] ,
    \EXE1_Instr_reg[8] ,
    FETCH_REC_Instr_valid_reg,
    EXE2_Instr_valid_reg,
    clk_IBUF_BUFG,
    cmd_register_IBUF,
    rst_IBUF,
    memory_addr_from_coprocessor_ready,
    old_grant,
    \curState_reg[0] ,
    curState,
    EXE1_Instr_valid_reg_3,
    EXE1_Instr_valid_reg_4,
    fifo_even_data_in_ready,
    content_reg_bram_0,
    \switch2channel\.ready_0 ,
    content_reg_bram_0_0,
    \old_grant_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_0,
    \curState_reg[0]_0 ,
    \curState_reg[0]_1 ,
    cur_is_even_character,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    \tail_reg[4] ,
    Q,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    content_reg_bram_0_20,
    content_reg_bram_0_21,
    \EXE2_Instr_reg[15] ,
    \head_reg[0] ,
    \head_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_1,
    FETCH_REC_Instr_valid_reg_2,
    \old_grant_reg[0]_1 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid);
  output [0:0]SR;
  output [0:0]in_ready_packed;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  output \old_grant_reg[0] ;
  output EXE1_Instr_valid_reg;
  output [0:0]E;
  output [0:0]EXE1_Instr_valid_reg_0;
  output EXE1_Instr_valid_reg_1;
  output EXE1_Instr_valid_reg_2;
  output [7:0]DINADIN;
  output \EXE2_Instr_reg[0] ;
  output [7:0]cur_is_even_character_reg;
  output \EXE2_Instr_reg[1] ;
  output \EXE2_Instr_reg[2] ;
  output \EXE2_Instr_reg[3] ;
  output \EXE2_Instr_reg[4] ;
  output \EXE2_Instr_reg[5] ;
  output \EXE2_Instr_reg[6] ;
  output \EXE2_Pc_reg[7] ;
  output fifo_odd_data_in_valid;
  output [0:0]cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output [0:0]\EXE1_Instr_reg[10] ;
  output [0:0]\EXE1_Instr_reg[8] ;
  output FETCH_REC_Instr_valid_reg;
  output EXE2_Instr_valid_reg;
  input clk_IBUF_BUFG;
  input [31:0]cmd_register_IBUF;
  input rst_IBUF;
  input memory_addr_from_coprocessor_ready;
  input [0:0]old_grant;
  input \curState_reg[0] ;
  input [0:0]curState;
  input EXE1_Instr_valid_reg_3;
  input EXE1_Instr_valid_reg_4;
  input fifo_even_data_in_ready;
  input content_reg_bram_0;
  input \switch2channel\.ready_0 ;
  input content_reg_bram_0_0;
  input \old_grant_reg[0]_0 ;
  input FETCH_REC_Instr_valid_reg_0;
  input \curState_reg[0]_0 ;
  input \curState_reg[0]_1 ;
  input cur_is_even_character;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input \tail_reg[4] ;
  input [2:0]Q;
  input content_reg_bram_0_10;
  input [5:0]content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input content_reg_bram_0_20;
  input content_reg_bram_0_21;
  input \EXE2_Instr_reg[15] ;
  input \head_reg[0] ;
  input \head_reg[0]_0 ;
  input FETCH_REC_Instr_valid_reg_1;
  input FETCH_REC_Instr_valid_reg_2;
  input \old_grant_reg[0]_1 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid;

  wire [7:0]DINADIN;
  wire [0:0]E;
  wire [0:0]\EXE1_Instr_reg[10] ;
  wire [0:0]\EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid_reg;
  wire [0:0]EXE1_Instr_valid_reg_0;
  wire EXE1_Instr_valid_reg_1;
  wire EXE1_Instr_valid_reg_2;
  wire EXE1_Instr_valid_reg_3;
  wire EXE1_Instr_valid_reg_4;
  wire \EXE2_Instr_reg[0] ;
  wire \EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[1] ;
  wire \EXE2_Instr_reg[2] ;
  wire \EXE2_Instr_reg[3] ;
  wire \EXE2_Instr_reg[4] ;
  wire \EXE2_Instr_reg[5] ;
  wire \EXE2_Instr_reg[6] ;
  wire EXE2_Instr_valid;
  wire EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire \EXE2_Pc_reg[7] ;
  wire FETCH_REC_Instr_valid_reg;
  wire FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire [2:0]Q;
  wire [0:0]SR;
  wire clk_IBUF_BUFG;
  wire [31:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire [5:0]content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_20;
  wire content_reg_bram_0_21;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \curState_reg[0]_0 ;
  wire \curState_reg[0]_1 ;
  wire cur_is_even_character;
  wire [7:0]cur_is_even_character_reg;
  wire [0:0]cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire fifo_even_data_in_ready;
  wire fifo_odd_data_in_valid;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  wire \head_reg[0] ;
  wire \head_reg[0]_0 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]old_grant;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire rst_IBUF;
  wire \switch2channel\.ready_0 ;
  wire \tail_reg[4] ;

  arbitration_logic_rr_11 arbitration_logic
       (.DINADIN(DINADIN),
        .E(E),
        .\EXE1_Instr_reg[10] (\EXE1_Instr_reg[10] ),
        .\EXE1_Instr_reg[8] (\EXE1_Instr_reg[8] ),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg),
        .EXE1_Instr_valid_reg_0(EXE1_Instr_valid_reg_0),
        .EXE1_Instr_valid_reg_1(EXE1_Instr_valid_reg_1),
        .EXE1_Instr_valid_reg_2(EXE1_Instr_valid_reg_2),
        .EXE1_Instr_valid_reg_3(EXE1_Instr_valid_reg_3),
        .EXE1_Instr_valid_reg_4(EXE1_Instr_valid_reg_4),
        .\EXE2_Instr_reg[0] (\EXE2_Instr_reg[0] ),
        .\EXE2_Instr_reg[15] (\EXE2_Instr_reg[15] ),
        .\EXE2_Instr_reg[1] (\EXE2_Instr_reg[1] ),
        .\EXE2_Instr_reg[2] (\EXE2_Instr_reg[2] ),
        .\EXE2_Instr_reg[3] (\EXE2_Instr_reg[3] ),
        .\EXE2_Instr_reg[4] (\EXE2_Instr_reg[4] ),
        .\EXE2_Instr_reg[5] (\EXE2_Instr_reg[5] ),
        .\EXE2_Instr_reg[6] (\EXE2_Instr_reg[6] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg(EXE2_Instr_valid_reg),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg_0),
        .\EXE2_Pc_reg[7] (\EXE2_Pc_reg[7] ),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg_1(FETCH_REC_Instr_valid_reg_1),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid_reg_2),
        .Q(Q),
        .SR(SR),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .content_reg_bram_0_1(content_reg_bram_0_1),
        .content_reg_bram_0_10(content_reg_bram_0_10),
        .content_reg_bram_0_11(content_reg_bram_0_11),
        .content_reg_bram_0_12(content_reg_bram_0_12),
        .content_reg_bram_0_13(content_reg_bram_0_13),
        .content_reg_bram_0_14(content_reg_bram_0_14),
        .content_reg_bram_0_15(content_reg_bram_0_15),
        .content_reg_bram_0_16(content_reg_bram_0_16),
        .content_reg_bram_0_17(content_reg_bram_0_17),
        .content_reg_bram_0_18(content_reg_bram_0_18),
        .content_reg_bram_0_19(content_reg_bram_0_19),
        .content_reg_bram_0_2(content_reg_bram_0_2),
        .content_reg_bram_0_20(content_reg_bram_0_20),
        .content_reg_bram_0_21(content_reg_bram_0_21),
        .content_reg_bram_0_3(content_reg_bram_0_3),
        .content_reg_bram_0_4(content_reg_bram_0_4),
        .content_reg_bram_0_5(content_reg_bram_0_5),
        .content_reg_bram_0_6(content_reg_bram_0_6),
        .content_reg_bram_0_7(content_reg_bram_0_7),
        .content_reg_bram_0_8(content_reg_bram_0_8),
        .content_reg_bram_0_9(content_reg_bram_0_9),
        .curState(curState),
        .\curState_reg[0] (\curState_reg[0] ),
        .\curState_reg[0]_0 (\curState_reg[0]_0 ),
        .\curState_reg[0]_1 (\curState_reg[0]_1 ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .fifo_even_data_in_ready(fifo_even_data_in_ready),
        .fifo_odd_data_in_valid(fifo_odd_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .\head_reg[0] (\head_reg[0] ),
        .\head_reg[0]_0 (\head_reg[0]_0 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .old_grant(old_grant),
        .\old_grant_reg[0]_0 (\old_grant_reg[0] ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_1 ),
        .rst_IBUF(rst_IBUF),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\tail_reg[4] (\tail_reg[4] ));
endmodule

(* ORIG_REF_NAME = "arbiter_rr_n" *) 
module arbiter_rr_n__parameterized0
   (old_grant,
    \old_grant_reg[0] ,
    in_ready_packed,
    clk_IBUF_BUFG);
  output [0:0]old_grant;
  input \old_grant_reg[0] ;
  input [0:0]in_ready_packed;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire [0:0]in_ready_packed;
  wire [0:0]old_grant;
  wire \old_grant_reg[0] ;

  arbitration_logic_rr__parameterized0 arbitration_logic
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .in_ready_packed(in_ready_packed),
        .old_grant(old_grant),
        .\old_grant_reg[0]_0 (\old_grant_reg[0] ));
endmodule

module arbitration_logic_rr
   (bram_r_valid,
    ADDRARDADDR,
    \old_grant_reg[0]_0 ,
    \curState_reg[0] ,
    cur_is_even_character_reg,
    fifo_even_data_in_valid,
    E,
    \curState_reg[0]_0 ,
    EXE1_Instr_valid_reg,
    FETCH_REC_Instr_valid_reg,
    in_ready_packed,
    cur_is_even_character_reg_0,
    DINADIN,
    \EXE1_Pc_reg[0] ,
    cur_is_even_character_reg_1,
    \EXE1_Instr_reg[1] ,
    \EXE1_Instr_reg[2] ,
    \EXE1_Instr_reg[3] ,
    \EXE1_Instr_reg[4] ,
    \EXE1_Instr_reg[5] ,
    \EXE1_Instr_reg[6] ,
    \EXE1_Pc_reg[6] ,
    \EXE1_Instr_reg[10] ,
    \EXE1_Instr_reg[8] ,
    FETCH_REC_Instr_valid_reg_0,
    EXE2_Instr_valid_reg,
    \old_grant_reg[0]_1 ,
    clk_IBUF_BUFG,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    D,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ,
    curState,
    FETCH_REC_Instr_valid_reg_1,
    EXE1_Instr_valid_1,
    FETCH_REC_Instr_valid_0,
    \old_grant_reg[0]_2 ,
    \tail_reg[4] ,
    \tail_reg[4]_0 ,
    content_reg_bram_0,
    \tail_reg[4]_1 ,
    cur_is_even_character,
    FETCH_REC_Instr_valid_reg_2,
    FETCH_REC_Instr_valid_reg_3,
    FETCH_REC_Instr_valid_reg_4,
    \old_grant_reg[0]_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ,
    old_grant,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    \tail_reg[4]_2 ,
    \EXE2_Instr_reg[15] ,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    content_reg_bram_0_20,
    content_reg_bram_0_21,
    content_reg_bram_0_22,
    content_reg_bram_0_23,
    content_reg_bram_0_24,
    \EXE2_Instr_reg[15]_0 ,
    \old_grant_reg[0]_4 ,
    FETCH_REC_Instr_valid_reg_5,
    FETCH_REC_Instr_valid_reg_6,
    FETCH_REC_Instr_valid_reg_7,
    WEA,
    \old_grant_reg[0]_5 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid_2);
  output bram_r_valid;
  output [4:0]ADDRARDADDR;
  output \old_grant_reg[0]_0 ;
  output \curState_reg[0] ;
  output cur_is_even_character_reg;
  output fifo_even_data_in_valid;
  output [0:0]E;
  output \curState_reg[0]_0 ;
  output EXE1_Instr_valid_reg;
  output FETCH_REC_Instr_valid_reg;
  output [0:0]in_ready_packed;
  output [0:0]cur_is_even_character_reg_0;
  output [7:0]DINADIN;
  output \EXE1_Pc_reg[0] ;
  output [7:0]cur_is_even_character_reg_1;
  output \EXE1_Instr_reg[1] ;
  output \EXE1_Instr_reg[2] ;
  output \EXE1_Instr_reg[3] ;
  output \EXE1_Instr_reg[4] ;
  output \EXE1_Instr_reg[5] ;
  output \EXE1_Instr_reg[6] ;
  output \EXE1_Pc_reg[6] ;
  output \EXE1_Instr_reg[10] ;
  output [0:0]\EXE1_Instr_reg[8] ;
  output [0:0]FETCH_REC_Instr_valid_reg_0;
  output EXE2_Instr_valid_reg;
  input \old_grant_reg[0]_1 ;
  input clk_IBUF_BUFG;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input [4:0]D;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ;
  input [0:0]curState;
  input FETCH_REC_Instr_valid_reg_1;
  input EXE1_Instr_valid_1;
  input FETCH_REC_Instr_valid_0;
  input \old_grant_reg[0]_2 ;
  input \tail_reg[4] ;
  input \tail_reg[4]_0 ;
  input content_reg_bram_0;
  input \tail_reg[4]_1 ;
  input cur_is_even_character;
  input FETCH_REC_Instr_valid_reg_2;
  input FETCH_REC_Instr_valid_reg_3;
  input FETCH_REC_Instr_valid_reg_4;
  input \old_grant_reg[0]_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ;
  input [0:0]old_grant;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input \tail_reg[4]_2 ;
  input [5:0]\EXE2_Instr_reg[15] ;
  input [0:0]content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input content_reg_bram_0_20;
  input content_reg_bram_0_21;
  input content_reg_bram_0_22;
  input content_reg_bram_0_23;
  input content_reg_bram_0_24;
  input \EXE2_Instr_reg[15]_0 ;
  input \old_grant_reg[0]_4 ;
  input FETCH_REC_Instr_valid_reg_5;
  input FETCH_REC_Instr_valid_reg_6;
  input FETCH_REC_Instr_valid_reg_7;
  input [0:0]WEA;
  input \old_grant_reg[0]_5 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid_2;

  wire [4:0]ADDRARDADDR;
  wire [4:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[10] ;
  wire \EXE1_Instr_reg[1] ;
  wire \EXE1_Instr_reg[2] ;
  wire \EXE1_Instr_reg[3] ;
  wire \EXE1_Instr_reg[4] ;
  wire \EXE1_Instr_reg[5] ;
  wire \EXE1_Instr_reg[6] ;
  wire [0:0]\EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid_1;
  wire EXE1_Instr_valid_reg;
  wire \EXE1_Pc_reg[0] ;
  wire \EXE1_Pc_reg[6] ;
  wire [5:0]\EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[15]_0 ;
  wire EXE2_Instr_valid_2;
  wire EXE2_Instr_valid_i_3_n_0;
  wire EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire \FETCH_REC_Instr[15]_i_3__0_n_0 ;
  wire FETCH_REC_Instr_valid_0;
  wire FETCH_REC_Instr_valid_reg;
  wire [0:0]FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire FETCH_REC_Instr_valid_reg_3;
  wire FETCH_REC_Instr_valid_reg_4;
  wire FETCH_REC_Instr_valid_reg_5;
  wire FETCH_REC_Instr_valid_reg_6;
  wire FETCH_REC_Instr_valid_reg_7;
  wire [2:0]Q;
  wire [0:0]WEA;
  wire bram_r_valid;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_20;
  wire content_reg_bram_0_21;
  wire content_reg_bram_0_22;
  wire content_reg_bram_0_23;
  wire content_reg_bram_0_24;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire [0:0]content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire content_reg_bram_0_i_20__0_n_0;
  wire content_reg_bram_0_i_47__0_n_0;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \curState_reg[0]_0 ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire [0:0]cur_is_even_character_reg_0;
  wire [7:0]cur_is_even_character_reg_1;
  wire fifo_even_data_in_valid;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire [0:0]in_ready_packed;
  wire [0:0]in_ready_packed_0;
  wire [1:1]mask;
  wire memory_addr_from_coprocessor_ready;
  wire memory_addr_from_coprocessor_valid;
  wire [0:0]old_grant;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire \old_grant_reg[0]_5 ;
  wire \tail_reg[4] ;
  wire \tail_reg[4]_0 ;
  wire \tail_reg[4]_1 ;
  wire \tail_reg[4]_2 ;

  LUT3 #(
    .INIT(8'h2A)) 
    \EXE1_Instr[15]_i_1 
       (.I0(FETCH_REC_Instr_valid_0),
        .I1(\FETCH_REC_Instr[15]_i_3__0_n_0 ),
        .I2(EXE1_Instr_valid_1),
        .O(FETCH_REC_Instr_valid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT4 #(
    .INIT(16'h00EA)) 
    EXE1_Instr_valid_i_1__0
       (.I0(FETCH_REC_Instr_valid_0),
        .I1(\FETCH_REC_Instr[15]_i_3__0_n_0 ),
        .I2(EXE1_Instr_valid_1),
        .I3(\old_grant_reg[0]_1 ),
        .O(FETCH_REC_Instr_valid_reg));
  LUT5 #(
    .INIT(32'h00000200)) 
    \EXE2_Instr[15]_i_1__0 
       (.I0(\EXE2_Instr_reg[15] [3]),
        .I1(\EXE2_Instr_reg[15] [4]),
        .I2(\EXE2_Instr_reg[15] [5]),
        .I3(\EXE2_Instr_reg[15]_0 ),
        .I4(\FETCH_REC_Instr[15]_i_3__0_n_0 ),
        .O(\EXE1_Instr_reg[8] ));
  LUT4 #(
    .INIT(16'hFF20)) 
    EXE2_Instr_valid_i_1__0
       (.I0(EXE2_Instr_valid_reg_0),
        .I1(EXE2_Instr_valid_i_3_n_0),
        .I2(EXE2_Instr_valid_2),
        .I3(\EXE1_Instr_reg[8] ),
        .O(EXE2_Instr_valid_reg));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT5 #(
    .INIT(32'h0000D100)) 
    EXE2_Instr_valid_i_3
       (.I0(\tail_reg[4] ),
        .I1(content_reg_bram_0),
        .I2(WEA),
        .I3(\old_grant_reg[0]_4 ),
        .I4(in_ready_packed_0),
        .O(EXE2_Instr_valid_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hD5)) 
    \FETCH_REC_Instr[15]_i_1 
       (.I0(FETCH_REC_Instr_valid_0),
        .I1(\FETCH_REC_Instr[15]_i_3__0_n_0 ),
        .I2(EXE1_Instr_valid_1),
        .O(E));
  LUT6 #(
    .INIT(64'h8FFF8088FFFFFFFF)) 
    \FETCH_REC_Instr[15]_i_3__0 
       (.I0(\old_grant_reg[0]_4 ),
        .I1(FETCH_REC_Instr_valid_reg_5),
        .I2(in_ready_packed_0),
        .I3(FETCH_REC_Instr_valid_reg_6),
        .I4(FETCH_REC_Instr_valid_reg_7),
        .I5(EXE1_Instr_valid_1),
        .O(\FETCH_REC_Instr[15]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF01010101010101)) 
    FETCH_REC_Instr_valid_i_1
       (.I0(EXE1_Instr_valid_reg),
        .I1(FETCH_REC_Instr_valid_reg_1),
        .I2(curState),
        .I3(FETCH_REC_Instr_valid_0),
        .I4(\FETCH_REC_Instr[15]_i_3__0_n_0 ),
        .I5(EXE1_Instr_valid_1),
        .O(\curState_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF1111111)) 
    FETCH_REC_has_to_save_i_2
       (.I0(FETCH_REC_Instr_valid_reg_2),
        .I1(FETCH_REC_Instr_valid_reg_3),
        .I2(EXE1_Instr_valid_1),
        .I3(\FETCH_REC_Instr[15]_i_3__0_n_0 ),
        .I4(FETCH_REC_Instr_valid_0),
        .I5(FETCH_REC_Instr_valid_reg_4),
        .O(EXE1_Instr_valid_reg));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT5 #(
    .INIT(32'h60660006)) 
    content_reg_bram_0_i_10__2
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[4] ),
        .I4(content_reg_bram_0_4),
        .O(DINADIN[4]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT5 #(
    .INIT(32'h90990009)) 
    content_reg_bram_0_i_10__3
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[4] ),
        .I4(content_reg_bram_0_4),
        .O(cur_is_even_character_reg_1[4]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT5 #(
    .INIT(32'h60660006)) 
    content_reg_bram_0_i_11__2
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[3] ),
        .I4(content_reg_bram_0_3),
        .O(DINADIN[3]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT5 #(
    .INIT(32'h90990009)) 
    content_reg_bram_0_i_11__3
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[3] ),
        .I4(content_reg_bram_0_3),
        .O(cur_is_even_character_reg_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT5 #(
    .INIT(32'h60660006)) 
    content_reg_bram_0_i_12__2
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[2] ),
        .I4(content_reg_bram_0_2),
        .O(DINADIN[2]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT5 #(
    .INIT(32'h90990009)) 
    content_reg_bram_0_i_12__3
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[2] ),
        .I4(content_reg_bram_0_2),
        .O(cur_is_even_character_reg_1[2]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT5 #(
    .INIT(32'h60660006)) 
    content_reg_bram_0_i_13__2
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[1] ),
        .I4(content_reg_bram_0_1),
        .O(DINADIN[1]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT5 #(
    .INIT(32'h90990009)) 
    content_reg_bram_0_i_13__3
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[1] ),
        .I4(content_reg_bram_0_1),
        .O(cur_is_even_character_reg_1[1]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT5 #(
    .INIT(32'h60660006)) 
    content_reg_bram_0_i_14__2
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Pc_reg[0] ),
        .I4(content_reg_bram_0_0),
        .O(DINADIN[0]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT5 #(
    .INIT(32'h90990009)) 
    content_reg_bram_0_i_14__3
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Pc_reg[0] ),
        .I4(content_reg_bram_0_0),
        .O(cur_is_even_character_reg_1[0]));
  LUT6 #(
    .INIT(64'hFEAEFFFFFFFFFEAE)) 
    content_reg_bram_0_i_16__3
       (.I0(\tail_reg[4] ),
        .I1(\tail_reg[4]_0 ),
        .I2(content_reg_bram_0),
        .I3(\tail_reg[4]_1 ),
        .I4(content_reg_bram_0_i_20__0_n_0),
        .I5(cur_is_even_character),
        .O(cur_is_even_character_reg));
  LUT1 #(
    .INIT(2'h1)) 
    content_reg_bram_0_i_1__2
       (.I0(cur_is_even_character_reg),
        .O(cur_is_even_character_reg_0));
  LUT6 #(
    .INIT(64'h0000015101510000)) 
    content_reg_bram_0_i_1__4
       (.I0(\tail_reg[4] ),
        .I1(\tail_reg[4]_0 ),
        .I2(content_reg_bram_0),
        .I3(\tail_reg[4]_1 ),
        .I4(cur_is_even_character),
        .I5(content_reg_bram_0_i_20__0_n_0),
        .O(fifo_even_data_in_valid));
  LUT6 #(
    .INIT(64'h5555555530333333)) 
    content_reg_bram_0_i_20__0
       (.I0(\tail_reg[4]_2 ),
        .I1(EXE2_Instr_valid_i_3_n_0),
        .I2(\EXE2_Instr_reg[15] [5]),
        .I3(\EXE2_Instr_reg[15] [3]),
        .I4(content_reg_bram_0_i_47__0_n_0),
        .I5(content_reg_bram_0),
        .O(content_reg_bram_0_i_20__0_n_0));
  LUT4 #(
    .INIT(16'hB0BB)) 
    content_reg_bram_0_i_24__0
       (.I0(content_reg_bram_0_23),
        .I1(content_reg_bram_0_i_47__0_n_0),
        .I2(content_reg_bram_0_24),
        .I3(EXE2_Instr_valid_i_3_n_0),
        .O(\EXE1_Pc_reg[6] ));
  LUT4 #(
    .INIT(16'hBAAA)) 
    content_reg_bram_0_i_24__1
       (.I0(EXE2_Instr_valid_i_3_n_0),
        .I1(\EXE2_Instr_reg[15] [5]),
        .I2(\EXE2_Instr_reg[15] [3]),
        .I3(content_reg_bram_0_i_47__0_n_0),
        .O(\EXE1_Instr_reg[10] ));
  LUT4 #(
    .INIT(16'hB0BB)) 
    content_reg_bram_0_i_26__0
       (.I0(content_reg_bram_0_21),
        .I1(content_reg_bram_0_i_47__0_n_0),
        .I2(content_reg_bram_0_22),
        .I3(EXE2_Instr_valid_i_3_n_0),
        .O(\EXE1_Instr_reg[6] ));
  LUT6 #(
    .INIT(64'h5CFF00005CFF5CFF)) 
    content_reg_bram_0_i_28__0
       (.I0(\EXE2_Instr_reg[15] [2]),
        .I1(content_reg_bram_0_19),
        .I2(content_reg_bram_0_9),
        .I3(content_reg_bram_0_i_47__0_n_0),
        .I4(content_reg_bram_0_20),
        .I5(EXE2_Instr_valid_i_3_n_0),
        .O(\EXE1_Instr_reg[5] ));
  LUT6 #(
    .INIT(64'h00005CFF5CFF5CFF)) 
    content_reg_bram_0_i_30__0
       (.I0(\EXE2_Instr_reg[15] [1]),
        .I1(content_reg_bram_0_17),
        .I2(content_reg_bram_0_9),
        .I3(content_reg_bram_0_i_47__0_n_0),
        .I4(content_reg_bram_0_18),
        .I5(EXE2_Instr_valid_i_3_n_0),
        .O(\EXE1_Instr_reg[4] ));
  LUT4 #(
    .INIT(16'hB0BB)) 
    content_reg_bram_0_i_32__0
       (.I0(content_reg_bram_0_15),
        .I1(content_reg_bram_0_i_47__0_n_0),
        .I2(content_reg_bram_0_16),
        .I3(EXE2_Instr_valid_i_3_n_0),
        .O(\EXE1_Instr_reg[3] ));
  LUT4 #(
    .INIT(16'h0BBB)) 
    content_reg_bram_0_i_34__0
       (.I0(content_reg_bram_0_13),
        .I1(content_reg_bram_0_i_47__0_n_0),
        .I2(content_reg_bram_0_14),
        .I3(EXE2_Instr_valid_i_3_n_0),
        .O(\EXE1_Instr_reg[2] ));
  LUT4 #(
    .INIT(16'h7077)) 
    content_reg_bram_0_i_36__0
       (.I0(content_reg_bram_0_11),
        .I1(content_reg_bram_0_i_47__0_n_0),
        .I2(content_reg_bram_0_12),
        .I3(EXE2_Instr_valid_i_3_n_0),
        .O(\EXE1_Instr_reg[1] ));
  LUT6 #(
    .INIT(64'h3AFF00003AFF3AFF)) 
    content_reg_bram_0_i_38
       (.I0(content_reg_bram_0_8),
        .I1(\EXE2_Instr_reg[15] [0]),
        .I2(content_reg_bram_0_9),
        .I3(content_reg_bram_0_i_47__0_n_0),
        .I4(content_reg_bram_0_10),
        .I5(EXE2_Instr_valid_i_3_n_0),
        .O(\EXE1_Pc_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT4 #(
    .INIT(16'hD100)) 
    content_reg_bram_0_i_47__0
       (.I0(\tail_reg[4] ),
        .I1(content_reg_bram_0),
        .I2(WEA),
        .I3(in_ready_packed_0),
        .O(content_reg_bram_0_i_47__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT5 #(
    .INIT(32'h60660006)) 
    content_reg_bram_0_i_7__2
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Pc_reg[6] ),
        .I4(content_reg_bram_0_7),
        .O(DINADIN[7]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT5 #(
    .INIT(32'h90990009)) 
    content_reg_bram_0_i_7__3
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Pc_reg[6] ),
        .I4(content_reg_bram_0_7),
        .O(cur_is_even_character_reg_1[7]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT5 #(
    .INIT(32'h60660006)) 
    content_reg_bram_0_i_8__1
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[6] ),
        .I4(content_reg_bram_0_6),
        .O(DINADIN[6]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT5 #(
    .INIT(32'h90990009)) 
    content_reg_bram_0_i_8__2
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[6] ),
        .I4(content_reg_bram_0_6),
        .O(cur_is_even_character_reg_1[6]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT5 #(
    .INIT(32'h60660006)) 
    content_reg_bram_0_i_9__2
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[5] ),
        .I4(content_reg_bram_0_5),
        .O(DINADIN[5]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT5 #(
    .INIT(32'h90990009)) 
    content_reg_bram_0_i_9__3
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_20__0_n_0),
        .I2(content_reg_bram_0),
        .I3(\EXE1_Instr_reg[5] ),
        .I4(content_reg_bram_0_5),
        .O(cur_is_even_character_reg_1[5]));
  LUT6 #(
    .INIT(64'hAAAAAAAAFFAEAAAA)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_1 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I4(memory_addr_from_coprocessor_valid),
        .I5(Q[1]),
        .O(bram_r_valid));
  LUT6 #(
    .INIT(64'hFFFFFFBAAAAAAAAA)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_10 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .I1(\old_grant_reg[0]_0 ),
        .I2(D[1]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .I5(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[1]));
  LUT6 #(
    .INIT(64'hFFFFFFBAAAAAAAAA)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_11 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I1(\old_grant_reg[0]_0 ),
        .I2(D[0]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .I5(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[0]));
  LUT3 #(
    .INIT(8'hDF)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_57 
       (.I0(\old_grant_reg[0]_3 ),
        .I1(\curState_reg[0] ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 ),
        .O(memory_addr_from_coprocessor_valid));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT4 #(
    .INIT(16'h777F)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_63 
       (.I0(memory_addr_from_coprocessor_ready),
        .I1(\curState_reg[0] ),
        .I2(\old_grant_reg[0]_3 ),
        .I3(old_grant),
        .O(\old_grant_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBAAAAAAAAA)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_7 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ),
        .I1(\old_grant_reg[0]_0 ),
        .I2(D[4]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 ),
        .I5(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[4]));
  LUT6 #(
    .INIT(64'hFFFFFFBAAAAAAAAA)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_8 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .I1(\old_grant_reg[0]_0 ),
        .I2(D[3]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .I5(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[3]));
  LUT6 #(
    .INIT(64'hFFFFFFBAAAAAAAAA)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_9 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .I1(\old_grant_reg[0]_0 ),
        .I2(D[2]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .I5(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[2]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'h07)) 
    \old_grant[0]_i_1 
       (.I0(\curState_reg[0] ),
        .I1(old_grant),
        .I2(\old_grant_reg[0]_3 ),
        .O(in_ready_packed));
  LUT4 #(
    .INIT(16'h0888)) 
    \old_grant[0]_i_1__1 
       (.I0(\EXE2_Instr_reg[15]_0 ),
        .I1(\old_grant_reg[0]_5 ),
        .I2(\old_grant_reg[0]_4 ),
        .I3(mask),
        .O(in_ready_packed_0));
  LUT6 #(
    .INIT(64'h0000000004444444)) 
    \old_grant[0]_i_2__1 
       (.I0(curState),
        .I1(FETCH_REC_Instr_valid_reg_1),
        .I2(EXE1_Instr_valid_1),
        .I3(\FETCH_REC_Instr[15]_i_3__0_n_0 ),
        .I4(FETCH_REC_Instr_valid_0),
        .I5(\old_grant_reg[0]_2 ),
        .O(\curState_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \old_grant_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(in_ready_packed_0),
        .Q(mask),
        .R(\old_grant_reg[0]_1 ));
endmodule

(* ORIG_REF_NAME = "arbitration_logic_rr" *) 
module arbitration_logic_rr_11
   (SR,
    in_ready_packed,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_0 ,
    \old_grant_reg[0]_0 ,
    EXE1_Instr_valid_reg,
    E,
    EXE1_Instr_valid_reg_0,
    EXE1_Instr_valid_reg_1,
    EXE1_Instr_valid_reg_2,
    DINADIN,
    \EXE2_Instr_reg[0] ,
    cur_is_even_character_reg,
    \EXE2_Instr_reg[1] ,
    \EXE2_Instr_reg[2] ,
    \EXE2_Instr_reg[3] ,
    \EXE2_Instr_reg[4] ,
    \EXE2_Instr_reg[5] ,
    \EXE2_Instr_reg[6] ,
    \EXE2_Pc_reg[7] ,
    fifo_odd_data_in_valid,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    \EXE1_Instr_reg[10] ,
    \EXE1_Instr_reg[8] ,
    FETCH_REC_Instr_valid_reg,
    EXE2_Instr_valid_reg,
    clk_IBUF_BUFG,
    cmd_register_IBUF,
    rst_IBUF,
    memory_addr_from_coprocessor_ready,
    old_grant,
    \curState_reg[0] ,
    curState,
    EXE1_Instr_valid_reg_3,
    EXE1_Instr_valid_reg_4,
    fifo_even_data_in_ready,
    content_reg_bram_0,
    \switch2channel\.ready_0 ,
    content_reg_bram_0_0,
    \old_grant_reg[0]_1 ,
    FETCH_REC_Instr_valid_reg_0,
    \curState_reg[0]_0 ,
    \curState_reg[0]_1 ,
    cur_is_even_character,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    \tail_reg[4] ,
    Q,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    content_reg_bram_0_20,
    content_reg_bram_0_21,
    \EXE2_Instr_reg[15] ,
    \head_reg[0] ,
    \head_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_1,
    FETCH_REC_Instr_valid_reg_2,
    \old_grant_reg[0]_2 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid);
  output [0:0]SR;
  output [0:0]in_ready_packed;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_0 ;
  output \old_grant_reg[0]_0 ;
  output EXE1_Instr_valid_reg;
  output [0:0]E;
  output [0:0]EXE1_Instr_valid_reg_0;
  output EXE1_Instr_valid_reg_1;
  output EXE1_Instr_valid_reg_2;
  output [7:0]DINADIN;
  output \EXE2_Instr_reg[0] ;
  output [7:0]cur_is_even_character_reg;
  output \EXE2_Instr_reg[1] ;
  output \EXE2_Instr_reg[2] ;
  output \EXE2_Instr_reg[3] ;
  output \EXE2_Instr_reg[4] ;
  output \EXE2_Instr_reg[5] ;
  output \EXE2_Instr_reg[6] ;
  output \EXE2_Pc_reg[7] ;
  output fifo_odd_data_in_valid;
  output [0:0]cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output [0:0]\EXE1_Instr_reg[10] ;
  output [0:0]\EXE1_Instr_reg[8] ;
  output FETCH_REC_Instr_valid_reg;
  output EXE2_Instr_valid_reg;
  input clk_IBUF_BUFG;
  input [31:0]cmd_register_IBUF;
  input rst_IBUF;
  input memory_addr_from_coprocessor_ready;
  input [0:0]old_grant;
  input \curState_reg[0] ;
  input [0:0]curState;
  input EXE1_Instr_valid_reg_3;
  input EXE1_Instr_valid_reg_4;
  input fifo_even_data_in_ready;
  input content_reg_bram_0;
  input \switch2channel\.ready_0 ;
  input content_reg_bram_0_0;
  input \old_grant_reg[0]_1 ;
  input FETCH_REC_Instr_valid_reg_0;
  input \curState_reg[0]_0 ;
  input \curState_reg[0]_1 ;
  input cur_is_even_character;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input \tail_reg[4] ;
  input [2:0]Q;
  input content_reg_bram_0_10;
  input [5:0]content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input content_reg_bram_0_20;
  input content_reg_bram_0_21;
  input \EXE2_Instr_reg[15] ;
  input \head_reg[0] ;
  input \head_reg[0]_0 ;
  input FETCH_REC_Instr_valid_reg_1;
  input FETCH_REC_Instr_valid_reg_2;
  input \old_grant_reg[0]_2 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid;

  wire [7:0]DINADIN;
  wire [0:0]E;
  wire [0:0]\EXE1_Instr_reg[10] ;
  wire [0:0]\EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid_reg;
  wire [0:0]EXE1_Instr_valid_reg_0;
  wire EXE1_Instr_valid_reg_1;
  wire EXE1_Instr_valid_reg_2;
  wire EXE1_Instr_valid_reg_3;
  wire EXE1_Instr_valid_reg_4;
  wire \EXE2_Instr_reg[0] ;
  wire \EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[1] ;
  wire \EXE2_Instr_reg[2] ;
  wire \EXE2_Instr_reg[3] ;
  wire \EXE2_Instr_reg[4] ;
  wire \EXE2_Instr_reg[5] ;
  wire \EXE2_Instr_reg[6] ;
  wire EXE2_Instr_valid;
  wire EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire \EXE2_Pc_reg[7] ;
  wire \FETCH_REC_Instr[15]_i_3_n_0 ;
  wire FETCH_REC_Instr_valid_reg;
  wire FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire [2:0]Q;
  wire [0:0]SR;
  wire clk_IBUF_BUFG;
  wire [31:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire [5:0]content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_20;
  wire content_reg_bram_0_21;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire content_reg_bram_0_i_19__0_n_0;
  wire content_reg_bram_0_i_29__2_n_0;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \curState_reg[0]_0 ;
  wire \curState_reg[0]_1 ;
  wire cur_is_even_character;
  wire [7:0]cur_is_even_character_reg;
  wire [0:0]cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire fifo_even_data_in_ready;
  wire fifo_odd_data_in_valid;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_81_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_82_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_86_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_87_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_88_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_89_n_0 ;
  wire \head_reg[0] ;
  wire \head_reg[0]_0 ;
  wire [0:0]in_ready_packed;
  wire [1:1]mask;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]old_grant;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire rst_IBUF;
  wire \switch2channel\.ready_0 ;
  wire \tail_reg[4] ;

  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h70)) 
    \EXE1_Instr[15]_i_1__0 
       (.I0(EXE1_Instr_valid_reg_3),
        .I1(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .I2(EXE1_Instr_valid_reg_4),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h00F8)) 
    EXE1_Instr_valid_i_1
       (.I0(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .I1(EXE1_Instr_valid_reg_3),
        .I2(EXE1_Instr_valid_reg_4),
        .I3(SR),
        .O(EXE1_Instr_valid_reg_2));
  LUT5 #(
    .INIT(32'h00000002)) 
    \EXE2_Instr[15]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\EXE2_Instr_reg[15] ),
        .I4(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .O(\EXE1_Instr_reg[8] ));
  LUT4 #(
    .INIT(16'hFF20)) 
    EXE2_Instr_valid_i_1
       (.I0(EXE2_Instr_valid_reg_0),
        .I1(content_reg_bram_0_i_29__2_n_0),
        .I2(EXE2_Instr_valid),
        .I3(\EXE1_Instr_reg[8] ),
        .O(EXE2_Instr_valid_reg));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    \FETCH_REC_Instr[15]_i_1__0 
       (.I0(EXE1_Instr_valid_reg_3),
        .I1(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .I2(EXE1_Instr_valid_reg_4),
        .O(EXE1_Instr_valid_reg_0));
  LUT6 #(
    .INIT(64'h2200FFFFFB33FFFF)) 
    \FETCH_REC_Instr[15]_i_3 
       (.I0(FETCH_REC_Instr_valid_reg_1),
        .I1(FETCH_REC_Instr_valid_reg_2),
        .I2(mask),
        .I3(\old_grant_reg[0]_1 ),
        .I4(EXE1_Instr_valid_reg_3),
        .I5(\old_grant_reg[0]_2 ),
        .O(\FETCH_REC_Instr[15]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h80FF)) 
    FETCH_REC_Instr_valid_i_1__0
       (.I0(EXE1_Instr_valid_reg_3),
        .I1(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .I2(EXE1_Instr_valid_reg_4),
        .I3(FETCH_REC_Instr_valid_reg_0),
        .O(EXE1_Instr_valid_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h33443434)) 
    content_reg_bram_0_i_1
       (.I0(\tail_reg[4] ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_i_19__0_n_0),
        .I4(content_reg_bram_0_0),
        .O(fifo_odd_data_in_valid));
  LUT6 #(
    .INIT(64'h0000A5009999A500)) 
    content_reg_bram_0_i_10
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_6),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[4] ),
        .O(DINADIN[4]));
  LUT6 #(
    .INIT(64'h00005A0066665A00)) 
    content_reg_bram_0_i_10__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_6),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[4] ),
        .O(cur_is_even_character_reg[4]));
  LUT6 #(
    .INIT(64'h0000A5009999A500)) 
    content_reg_bram_0_i_11
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_5),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[3] ),
        .O(DINADIN[3]));
  LUT6 #(
    .INIT(64'h00005A0066665A00)) 
    content_reg_bram_0_i_11__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_5),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[3] ),
        .O(cur_is_even_character_reg[3]));
  LUT6 #(
    .INIT(64'h0000A5009999A500)) 
    content_reg_bram_0_i_12
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_4),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[2] ),
        .O(DINADIN[2]));
  LUT6 #(
    .INIT(64'h00005A0066665A00)) 
    content_reg_bram_0_i_12__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_4),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[2] ),
        .O(cur_is_even_character_reg[2]));
  LUT6 #(
    .INIT(64'h0000A5009999A500)) 
    content_reg_bram_0_i_13
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_3),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[1] ),
        .O(DINADIN[1]));
  LUT6 #(
    .INIT(64'h00005A0066665A00)) 
    content_reg_bram_0_i_13__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_3),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[1] ),
        .O(cur_is_even_character_reg[1]));
  LUT6 #(
    .INIT(64'h0000A5009999A500)) 
    content_reg_bram_0_i_14
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_2),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[0] ),
        .O(DINADIN[0]));
  LUT6 #(
    .INIT(64'h00005A0066665A00)) 
    content_reg_bram_0_i_14__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_2),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[0] ),
        .O(cur_is_even_character_reg[0]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h5D7F596A)) 
    content_reg_bram_0_i_16
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_0),
        .I2(content_reg_bram_0_i_19__0_n_0),
        .I3(content_reg_bram_0_1),
        .I4(\tail_reg[4] ),
        .O(cur_is_even_character_reg_1));
  LUT6 #(
    .INIT(64'hB8BBB8B8B8B8B8B8)) 
    content_reg_bram_0_i_17
       (.I0(content_reg_bram_0_1),
        .I1(content_reg_bram_0_0),
        .I2(content_reg_bram_0_i_29__2_n_0),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(content_reg_bram_0_10),
        .O(\EXE1_Instr_reg[10] ));
  LUT4 #(
    .INIT(16'hBAAA)) 
    content_reg_bram_0_i_19__0
       (.I0(content_reg_bram_0_i_29__2_n_0),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(content_reg_bram_0_10),
        .O(content_reg_bram_0_i_19__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    content_reg_bram_0_i_1__0
       (.I0(cur_is_even_character_reg_1),
        .O(cur_is_even_character_reg_0));
  LUT4 #(
    .INIT(16'hB0BB)) 
    content_reg_bram_0_i_23
       (.I0(content_reg_bram_0_20),
        .I1(content_reg_bram_0_i_29__2_n_0),
        .I2(content_reg_bram_0_21),
        .I3(content_reg_bram_0_10),
        .O(\EXE2_Pc_reg[7] ));
  LUT5 #(
    .INIT(32'h00B0BBBB)) 
    content_reg_bram_0_i_25
       (.I0(content_reg_bram_0_19),
        .I1(content_reg_bram_0_10),
        .I2(\old_grant_reg[0]_1 ),
        .I3(content_reg_bram_0_11[5]),
        .I4(content_reg_bram_0_i_29__2_n_0),
        .O(\EXE2_Instr_reg[6] ));
  LUT5 #(
    .INIT(32'h2F002F2F)) 
    content_reg_bram_0_i_27__0
       (.I0(\old_grant_reg[0]_1 ),
        .I1(content_reg_bram_0_11[4]),
        .I2(content_reg_bram_0_i_29__2_n_0),
        .I3(content_reg_bram_0_18),
        .I4(content_reg_bram_0_10),
        .O(\EXE2_Instr_reg[5] ));
  LUT5 #(
    .INIT(32'h00B0BBBB)) 
    content_reg_bram_0_i_29
       (.I0(content_reg_bram_0_17),
        .I1(content_reg_bram_0_10),
        .I2(\old_grant_reg[0]_1 ),
        .I3(content_reg_bram_0_11[3]),
        .I4(content_reg_bram_0_i_29__2_n_0),
        .O(\EXE2_Instr_reg[4] ));
  LUT6 #(
    .INIT(64'h0000000022F00000)) 
    content_reg_bram_0_i_29__2
       (.I0(fifo_even_data_in_ready),
        .I1(content_reg_bram_0),
        .I2(\switch2channel\.ready_0 ),
        .I3(content_reg_bram_0_0),
        .I4(\old_grant_reg[0]_1 ),
        .I5(in_ready_packed),
        .O(content_reg_bram_0_i_29__2_n_0));
  LUT4 #(
    .INIT(16'hB0BB)) 
    content_reg_bram_0_i_31
       (.I0(content_reg_bram_0_15),
        .I1(content_reg_bram_0_i_29__2_n_0),
        .I2(content_reg_bram_0_16),
        .I3(content_reg_bram_0_10),
        .O(\EXE2_Instr_reg[3] ));
  LUT5 #(
    .INIT(32'h2F002F2F)) 
    content_reg_bram_0_i_33
       (.I0(\old_grant_reg[0]_1 ),
        .I1(content_reg_bram_0_11[2]),
        .I2(content_reg_bram_0_i_29__2_n_0),
        .I3(content_reg_bram_0_14),
        .I4(content_reg_bram_0_10),
        .O(\EXE2_Instr_reg[2] ));
  LUT5 #(
    .INIT(32'h00B0BBBB)) 
    content_reg_bram_0_i_35
       (.I0(content_reg_bram_0_13),
        .I1(content_reg_bram_0_10),
        .I2(\old_grant_reg[0]_1 ),
        .I3(content_reg_bram_0_11[1]),
        .I4(content_reg_bram_0_i_29__2_n_0),
        .O(\EXE2_Instr_reg[1] ));
  LUT5 #(
    .INIT(32'h2F002F2F)) 
    content_reg_bram_0_i_37
       (.I0(\old_grant_reg[0]_1 ),
        .I1(content_reg_bram_0_11[0]),
        .I2(content_reg_bram_0_i_29__2_n_0),
        .I3(content_reg_bram_0_12),
        .I4(content_reg_bram_0_10),
        .O(\EXE2_Instr_reg[0] ));
  LUT6 #(
    .INIT(64'h0000A5009999A500)) 
    content_reg_bram_0_i_7
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_9),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Pc_reg[7] ),
        .O(DINADIN[7]));
  LUT6 #(
    .INIT(64'h00005A0066665A00)) 
    content_reg_bram_0_i_7__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_9),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Pc_reg[7] ),
        .O(cur_is_even_character_reg[7]));
  LUT6 #(
    .INIT(64'h0000A5009999A500)) 
    content_reg_bram_0_i_8
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_8),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[6] ),
        .O(DINADIN[6]));
  LUT6 #(
    .INIT(64'h00005A0066665A00)) 
    content_reg_bram_0_i_8__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_8),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[6] ),
        .O(cur_is_even_character_reg[6]));
  LUT6 #(
    .INIT(64'h0000A5009999A500)) 
    content_reg_bram_0_i_9
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_7),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[5] ),
        .O(DINADIN[5]));
  LUT6 #(
    .INIT(64'h00005A0066665A00)) 
    content_reg_bram_0_i_9__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_19__0_n_0),
        .I2(content_reg_bram_0_1),
        .I3(content_reg_bram_0_7),
        .I4(content_reg_bram_0_0),
        .I5(\EXE2_Instr_reg[5] ),
        .O(cur_is_even_character_reg[5]));
  LUT5 #(
    .INIT(32'h00000222)) 
    \curState[0]_i_1 
       (.I0(memory_addr_from_coprocessor_ready),
        .I1(EXE1_Instr_valid_reg),
        .I2(old_grant),
        .I3(\curState_reg[0] ),
        .I4(curState),
        .O(\old_grant_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hFFFF0020)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_3 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_0 ),
        .I1(cmd_register_IBUF[1]),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[0]),
        .I4(rst_IBUF),
        .O(SR));
  LUT3 #(
    .INIT(8'h80)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_59 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_81_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_82_n_0 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_n_0 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_81 
       (.I0(cmd_register_IBUF[3]),
        .I1(cmd_register_IBUF[4]),
        .I2(cmd_register_IBUF[5]),
        .I3(cmd_register_IBUF[6]),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_86_n_0 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_81_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_82 
       (.I0(cmd_register_IBUF[11]),
        .I1(cmd_register_IBUF[12]),
        .I2(cmd_register_IBUF[13]),
        .I3(cmd_register_IBUF[14]),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_87_n_0 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_82_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_88_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_89_n_0 ),
        .I2(cmd_register_IBUF[22]),
        .I3(cmd_register_IBUF[21]),
        .I4(cmd_register_IBUF[20]),
        .I5(cmd_register_IBUF[19]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_86 
       (.I0(cmd_register_IBUF[10]),
        .I1(cmd_register_IBUF[9]),
        .I2(cmd_register_IBUF[8]),
        .I3(cmd_register_IBUF[7]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_86_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_87 
       (.I0(cmd_register_IBUF[18]),
        .I1(cmd_register_IBUF[17]),
        .I2(cmd_register_IBUF[16]),
        .I3(cmd_register_IBUF[15]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_87_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_88 
       (.I0(cmd_register_IBUF[27]),
        .I1(cmd_register_IBUF[28]),
        .I2(cmd_register_IBUF[29]),
        .I3(cmd_register_IBUF[30]),
        .I4(cmd_register_IBUF[31]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_88_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_89 
       (.I0(cmd_register_IBUF[26]),
        .I1(cmd_register_IBUF[25]),
        .I2(cmd_register_IBUF[24]),
        .I3(cmd_register_IBUF[23]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_89_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'hFEEEEEEE)) 
    \head[4]_i_4 
       (.I0(\head_reg[0] ),
        .I1(\head_reg[0]_0 ),
        .I2(EXE1_Instr_valid_reg_4),
        .I3(EXE1_Instr_valid_reg_3),
        .I4(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .O(FETCH_REC_Instr_valid_reg));
  LUT4 #(
    .INIT(16'h0444)) 
    \old_grant[0]_i_1__0 
       (.I0(\old_grant_reg[0]_2 ),
        .I1(EXE1_Instr_valid_reg_3),
        .I2(\old_grant_reg[0]_1 ),
        .I3(mask),
        .O(in_ready_packed));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF80)) 
    \old_grant[0]_i_3 
       (.I0(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .I1(EXE1_Instr_valid_reg_3),
        .I2(EXE1_Instr_valid_reg_4),
        .I3(\curState_reg[0]_0 ),
        .I4(\curState_reg[0]_1 ),
        .I5(curState),
        .O(EXE1_Instr_valid_reg));
  FDRE #(
    .INIT(1'b0)) 
    \old_grant_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(in_ready_packed),
        .Q(mask),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "arbitration_logic_rr" *) 
module arbitration_logic_rr__parameterized0
   (old_grant,
    \old_grant_reg[0]_0 ,
    in_ready_packed,
    clk_IBUF_BUFG);
  output [0:0]old_grant;
  input \old_grant_reg[0]_0 ;
  input [0:0]in_ready_packed;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire [0:0]in_ready_packed;
  wire [0:0]old_grant;
  wire \old_grant_reg[0]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \old_grant_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(in_ready_packed),
        .Q(old_grant),
        .R(\old_grant_reg[0]_0 ));
endmodule

module bram
   (memory_data,
    memory_addr_from_coprocessor_ready,
    data_o_register_OBUF,
    \address_register[2] ,
    \FSM_sequential_status_register_reg[0] ,
    \address_register[3] ,
    \address_register[4] ,
    \address_register[5] ,
    \address_register[6] ,
    \FSM_sequential_status_register_reg[0]_0 ,
    CLK,
    bram_r_valid,
    SR,
    ADDRARDADDR,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    cmd_register_IBUF,
    Q,
    \data_o_register[31] ,
    \data_o_register[31]_0 ,
    \data_o_register[31]_1 ,
    \data_o_register[31]_2 ,
    address_register_IBUF,
    data_in_register_IBUF);
  output [63:0]memory_data;
  output memory_addr_from_coprocessor_ready;
  output [31:0]data_o_register_OBUF;
  output \address_register[2] ;
  output \FSM_sequential_status_register_reg[0] ;
  output \address_register[3] ;
  output \address_register[4] ;
  output \address_register[5] ;
  output \address_register[6] ;
  output \FSM_sequential_status_register_reg[0]_0 ;
  input CLK;
  input bram_r_valid;
  input [0:0]SR;
  input [8:0]ADDRARDADDR;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]cmd_register_IBUF;
  input [2:0]Q;
  input \data_o_register[31] ;
  input [31:0]\data_o_register[31]_0 ;
  input \data_o_register[31]_1 ;
  input \data_o_register[31]_2 ;
  input [9:0]address_register_IBUF;
  input [31:0]data_in_register_IBUF;

  wire [8:0]ADDRARDADDR;
  wire CLK;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire [2:0]Q;
  wire [0:0]SR;
  wire \address_register[2] ;
  wire \address_register[3] ;
  wire \address_register[4] ;
  wire \address_register[5] ;
  wire \address_register[6] ;
  wire [9:0]address_register_IBUF;
  wire bram_r_valid;
  wire [2:0]cmd_register_IBUF;
  wire [31:0]data_in_register_IBUF;
  wire \data_o_register[31] ;
  wire [31:0]\data_o_register[31]_0 ;
  wire \data_o_register[31]_1 ;
  wire \data_o_register[31]_2 ;
  wire [31:0]data_o_register_OBUF;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire memory_addr_from_coprocessor_ready;
  wire [63:0]memory_data;

  BRAM_SDP_MACRO_viv_ BRAM_SDP_MACRO_inst
       (.ADDRARDADDR(ADDRARDADDR),
        .CLK(CLK),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0]_0 ),
        .Q(Q),
        .SR(SR),
        .\address_register[2] (\address_register[2] ),
        .\address_register[3] (\address_register[3] ),
        .\address_register[4] (\address_register[4] ),
        .\address_register[5] (\address_register[5] ),
        .\address_register[6] (\address_register[6] ),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .cmd_register_IBUF(cmd_register_IBUF),
        .data_in_register_IBUF(data_in_register_IBUF),
        .\data_o_register[31] (\data_o_register[31] ),
        .\data_o_register[31]_0 (\data_o_register[31]_0 ),
        .\data_o_register[31]_1 (\data_o_register[31]_1 ),
        .\data_o_register[31]_2 (\data_o_register[31]_2 ),
        .data_o_register_OBUF(data_o_register_OBUF),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .memory_data(memory_data));
endmodule

module cache_block_directly_mapped
   (curState,
    E,
    \tag_saved_reg[1]_0 ,
    \curState_reg[0]_0 ,
    p_0_in,
    p_0_in_0,
    content_reg_0,
    content_reg_1,
    content_reg_2,
    content_reg_3,
    content_reg_4,
    content_reg_5,
    content_reg_6,
    content_reg_7,
    content_reg_8,
    content_reg_9,
    content_reg_10,
    content_reg_11,
    content_reg_12,
    content_reg_13,
    content_reg_14,
    content_reg_15,
    clk_IBUF_BUFG,
    WEBWE,
    \memory_bb\.addr ,
    D,
    memory_data,
    \curState_reg[0]_1 ,
    \head_reg[0] ,
    \head_reg[0]_0 ,
    \head_reg[0]_1 ,
    \curState_reg[0]_2 );
  output [0:0]curState;
  output [0:0]E;
  output \tag_saved_reg[1]_0 ;
  output \curState_reg[0]_0 ;
  output [0:0]p_0_in;
  output [0:0]p_0_in_0;
  output content_reg_0;
  output content_reg_1;
  output content_reg_2;
  output content_reg_3;
  output content_reg_4;
  output content_reg_5;
  output content_reg_6;
  output content_reg_7;
  output content_reg_8;
  output content_reg_9;
  output content_reg_10;
  output content_reg_11;
  output content_reg_12;
  output content_reg_13;
  output content_reg_14;
  output content_reg_15;
  input clk_IBUF_BUFG;
  input [0:0]WEBWE;
  input [4:0]\memory_bb\.addr ;
  input [2:0]D;
  input [63:0]memory_data;
  input \curState_reg[0]_1 ;
  input \head_reg[0] ;
  input \head_reg[0]_0 ;
  input \head_reg[0]_1 ;
  input \curState_reg[0]_2 ;

  wire [2:0]D;
  wire [0:0]E;
  wire FETCH_REC_has_to_save_i_10_n_0;
  wire FETCH_REC_has_to_save_i_5_n_0;
  wire FETCH_REC_has_to_save_i_6_n_0;
  wire FETCH_REC_has_to_save_i_7_n_0;
  wire FETCH_REC_has_to_save_i_8_n_0;
  wire FETCH_REC_has_to_save_i_9_n_0;
  wire [0:0]WEBWE;
  wire [1:0]block_sel_saved;
  wire [3:0]cache_line_saved;
  wire cache_line_saved__0;
  wire clk_IBUF_BUFG;
  wire content_reg_0;
  wire content_reg_1;
  wire content_reg_10;
  wire content_reg_11;
  wire content_reg_12;
  wire content_reg_13;
  wire content_reg_14;
  wire content_reg_15;
  wire content_reg_2;
  wire content_reg_3;
  wire content_reg_4;
  wire content_reg_5;
  wire content_reg_6;
  wire content_reg_7;
  wire content_reg_8;
  wire content_reg_9;
  wire [0:0]curState;
  wire \curState[0]_i_1_n_0 ;
  wire \curState_reg[0]_0 ;
  wire \curState_reg[0]_1 ;
  wire \curState_reg[0]_2 ;
  wire [63:0]data_from_memory;
  wire \head_reg[0] ;
  wire \head_reg[0]_0 ;
  wire \head_reg[0]_1 ;
  wire [4:0]hit1;
  wire \is_present[0]_i_1__0_n_0 ;
  wire \is_present[10]_i_1__0_n_0 ;
  wire \is_present[11]_i_1__0_n_0 ;
  wire \is_present[12]_i_1__0_n_0 ;
  wire \is_present[13]_i_1__0_n_0 ;
  wire \is_present[14]_i_1__0_n_0 ;
  wire \is_present[15]_i_1__0_n_0 ;
  wire \is_present[1]_i_1__0_n_0 ;
  wire \is_present[2]_i_1__0_n_0 ;
  wire \is_present[3]_i_1__0_n_0 ;
  wire \is_present[4]_i_1__0_n_0 ;
  wire \is_present[5]_i_1__0_n_0 ;
  wire \is_present[6]_i_1__0_n_0 ;
  wire \is_present[7]_i_1__0_n_0 ;
  wire \is_present[8]_i_1__0_n_0 ;
  wire \is_present[9]_i_1__0_n_0 ;
  wire \is_present_reg[0]_31 ;
  wire \is_present_reg[10]_21 ;
  wire \is_present_reg[11]_20 ;
  wire \is_present_reg[12]_19 ;
  wire \is_present_reg[13]_18 ;
  wire \is_present_reg[14]_17 ;
  wire \is_present_reg[15]_16 ;
  wire \is_present_reg[1]_30 ;
  wire \is_present_reg[2]_29 ;
  wire \is_present_reg[3]_28 ;
  wire \is_present_reg[4]_27 ;
  wire \is_present_reg[5]_26 ;
  wire \is_present_reg[6]_25 ;
  wire \is_present_reg[7]_24 ;
  wire \is_present_reg[8]_23 ;
  wire \is_present_reg[9]_22 ;
  wire [4:0]\memory_bb\.addr ;
  wire [63:0]memory_data;
  wire [0:0]p_0_in;
  wire [0:0]p_0_in_0;
  wire tag_reg_0_15_0_4_i_1__0_n_0;
  wire [1:0]tag_saved;
  wire \tag_saved_reg[1]_0 ;
  wire NLW_content_reg_CASOUTDBITERR_UNCONNECTED;
  wire NLW_content_reg_CASOUTSBITERR_UNCONNECTED;
  wire NLW_content_reg_DBITERR_UNCONNECTED;
  wire NLW_content_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_content_reg_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_content_reg_CASDOUTB_UNCONNECTED;
  wire [3:0]NLW_content_reg_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_content_reg_CASDOUTPB_UNCONNECTED;
  wire [3:0]NLW_content_reg_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_content_reg_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_content_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_content_reg_RDADDRECC_UNCONNECTED;
  wire [1:1]NLW_tag_reg_0_15_0_4_DOC_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOD_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOE_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOF_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOG_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOH_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[0]_i_2__0 
       (.I0(data_from_memory[0]),
        .I1(data_from_memory[16]),
        .I2(data_from_memory[32]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[48]),
        .O(content_reg_0));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[10]_i_2__0 
       (.I0(data_from_memory[10]),
        .I1(data_from_memory[26]),
        .I2(data_from_memory[42]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[58]),
        .O(content_reg_10));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[11]_i_2__0 
       (.I0(data_from_memory[11]),
        .I1(data_from_memory[27]),
        .I2(data_from_memory[43]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[59]),
        .O(content_reg_11));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[12]_i_2__0 
       (.I0(data_from_memory[12]),
        .I1(data_from_memory[28]),
        .I2(data_from_memory[44]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[60]),
        .O(content_reg_12));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[13]_i_2__0 
       (.I0(data_from_memory[13]),
        .I1(data_from_memory[29]),
        .I2(data_from_memory[45]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[61]),
        .O(content_reg_13));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[14]_i_2__0 
       (.I0(data_from_memory[14]),
        .I1(data_from_memory[30]),
        .I2(data_from_memory[46]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[62]),
        .O(content_reg_14));
  LUT6 #(
    .INIT(64'hF0FFCCAAF000CCAA)) 
    \FETCH_REC_Instr[15]_i_4__0 
       (.I0(data_from_memory[15]),
        .I1(data_from_memory[31]),
        .I2(data_from_memory[63]),
        .I3(block_sel_saved[0]),
        .I4(block_sel_saved[1]),
        .I5(data_from_memory[47]),
        .O(content_reg_15));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[1]_i_2__0 
       (.I0(data_from_memory[1]),
        .I1(data_from_memory[17]),
        .I2(data_from_memory[33]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[49]),
        .O(content_reg_1));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[2]_i_2__0 
       (.I0(data_from_memory[2]),
        .I1(data_from_memory[18]),
        .I2(data_from_memory[34]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[50]),
        .O(content_reg_2));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[3]_i_2__0 
       (.I0(data_from_memory[3]),
        .I1(data_from_memory[19]),
        .I2(data_from_memory[35]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[51]),
        .O(content_reg_3));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[4]_i_2__0 
       (.I0(data_from_memory[4]),
        .I1(data_from_memory[20]),
        .I2(data_from_memory[36]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[52]),
        .O(content_reg_4));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[5]_i_2__0 
       (.I0(data_from_memory[5]),
        .I1(data_from_memory[21]),
        .I2(data_from_memory[37]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[53]),
        .O(content_reg_5));
  LUT6 #(
    .INIT(64'hF0FFCCAAF000CCAA)) 
    \FETCH_REC_Instr[6]_i_2__0 
       (.I0(data_from_memory[6]),
        .I1(data_from_memory[22]),
        .I2(data_from_memory[54]),
        .I3(block_sel_saved[0]),
        .I4(block_sel_saved[1]),
        .I5(data_from_memory[38]),
        .O(content_reg_6));
  LUT6 #(
    .INIT(64'hF0FFCCAAF000CCAA)) 
    \FETCH_REC_Instr[7]_i_2__0 
       (.I0(data_from_memory[7]),
        .I1(data_from_memory[23]),
        .I2(data_from_memory[55]),
        .I3(block_sel_saved[0]),
        .I4(block_sel_saved[1]),
        .I5(data_from_memory[39]),
        .O(content_reg_7));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[8]_i_2__0 
       (.I0(data_from_memory[8]),
        .I1(data_from_memory[24]),
        .I2(data_from_memory[40]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[56]),
        .O(content_reg_8));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[9]_i_2__0 
       (.I0(data_from_memory[9]),
        .I1(data_from_memory[25]),
        .I2(data_from_memory[41]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[57]),
        .O(content_reg_9));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    FETCH_REC_has_to_save_i_10
       (.I0(\is_present_reg[7]_24 ),
        .I1(\is_present_reg[6]_25 ),
        .I2(\memory_bb\.addr [0]),
        .I3(\is_present_reg[5]_26 ),
        .I4(D[2]),
        .I5(\is_present_reg[4]_27 ),
        .O(FETCH_REC_has_to_save_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h01)) 
    FETCH_REC_has_to_save_i_1__0
       (.I0(\head_reg[0] ),
        .I1(\tag_saved_reg[1]_0 ),
        .I2(curState),
        .O(E));
  LUT3 #(
    .INIT(8'hFE)) 
    FETCH_REC_has_to_save_i_3
       (.I0(FETCH_REC_has_to_save_i_5_n_0),
        .I1(hit1[3]),
        .I2(FETCH_REC_has_to_save_i_6_n_0),
        .O(\tag_saved_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hEFFEFFFFFFFFEFFE)) 
    FETCH_REC_has_to_save_i_5
       (.I0(hit1[4]),
        .I1(hit1[2]),
        .I2(\memory_bb\.addr [4]),
        .I3(hit1[1]),
        .I4(hit1[0]),
        .I5(\memory_bb\.addr [3]),
        .O(FETCH_REC_has_to_save_i_5_n_0));
  LUT6 #(
    .INIT(64'h30303F3F505F505F)) 
    FETCH_REC_has_to_save_i_6
       (.I0(FETCH_REC_has_to_save_i_7_n_0),
        .I1(FETCH_REC_has_to_save_i_8_n_0),
        .I2(\memory_bb\.addr [2]),
        .I3(FETCH_REC_has_to_save_i_9_n_0),
        .I4(FETCH_REC_has_to_save_i_10_n_0),
        .I5(\memory_bb\.addr [1]),
        .O(FETCH_REC_has_to_save_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    FETCH_REC_has_to_save_i_7
       (.I0(\is_present_reg[11]_20 ),
        .I1(\is_present_reg[10]_21 ),
        .I2(\memory_bb\.addr [0]),
        .I3(\is_present_reg[9]_22 ),
        .I4(D[2]),
        .I5(\is_present_reg[8]_23 ),
        .O(FETCH_REC_has_to_save_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    FETCH_REC_has_to_save_i_8
       (.I0(\is_present_reg[15]_16 ),
        .I1(\is_present_reg[14]_17 ),
        .I2(\memory_bb\.addr [0]),
        .I3(\is_present_reg[13]_18 ),
        .I4(D[2]),
        .I5(\is_present_reg[12]_19 ),
        .O(FETCH_REC_has_to_save_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    FETCH_REC_has_to_save_i_9
       (.I0(\is_present_reg[3]_28 ),
        .I1(\is_present_reg[2]_29 ),
        .I2(\memory_bb\.addr [0]),
        .I3(\is_present_reg[1]_30 ),
        .I4(D[2]),
        .I5(\is_present_reg[0]_31 ),
        .O(FETCH_REC_has_to_save_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \block_sel_saved_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(D[0]),
        .Q(block_sel_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \block_sel_saved_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(D[1]),
        .Q(block_sel_saved[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \cache_line_saved[3]_i_1__0 
       (.I0(\curState_reg[0]_1 ),
        .I1(curState),
        .O(cache_line_saved__0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(D[2]),
        .Q(cache_line_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [0]),
        .Q(cache_line_saved[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [1]),
        .Q(cache_line_saved[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [2]),
        .Q(cache_line_saved[3]),
        .R(1'b0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[1].engine_and_station_i/anEngine/anEngine/a_cache/content" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "511" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "63" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "496" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "63" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    content_reg
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,\memory_bb\.addr [2:0],D[2],1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,cache_line_saved,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_content_reg_CASDOUTA_UNCONNECTED[31:0]),
        .CASDOUTB(NLW_content_reg_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA(NLW_content_reg_CASDOUTPA_UNCONNECTED[3:0]),
        .CASDOUTPB(NLW_content_reg_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_content_reg_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_content_reg_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DBITERR(NLW_content_reg_DBITERR_UNCONNECTED),
        .DINADIN(memory_data[31:0]),
        .DINBDIN(memory_data[63:32]),
        .DINPADINP({1'b1,1'b1,1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(data_from_memory[31:0]),
        .DOUTBDOUT(data_from_memory[63:32]),
        .DOUTPADOUTP(NLW_content_reg_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_content_reg_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_content_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(WEBWE),
        .ENBWREN(curState),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_content_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_content_reg_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE}));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    content_reg_bram_0_i_23__0
       (.I0(curState),
        .I1(\head_reg[0] ),
        .I2(\tag_saved_reg[1]_0 ),
        .O(\curState_reg[0]_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \curState[0]_i_1 
       (.I0(\curState_reg[0]_2 ),
        .I1(curState),
        .O(\curState[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \curState_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\curState[0]_i_1_n_0 ),
        .Q(curState),
        .R(\curState_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \head[4]_i_1__1 
       (.I0(\head_reg[0]_0 ),
        .I1(curState),
        .I2(\tag_saved_reg[1]_0 ),
        .I3(\head_reg[0] ),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \head[4]_i_1__2 
       (.I0(\head_reg[0]_1 ),
        .I1(curState),
        .I2(\tag_saved_reg[1]_0 ),
        .I3(\head_reg[0] ),
        .O(p_0_in_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000100)) 
    \is_present[0]_i_1__0 
       (.I0(cache_line_saved[1]),
        .I1(cache_line_saved[2]),
        .I2(cache_line_saved[0]),
        .I3(curState),
        .I4(cache_line_saved[3]),
        .I5(\is_present_reg[0]_31 ),
        .O(\is_present[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002000)) 
    \is_present[10]_i_1__0 
       (.I0(cache_line_saved[1]),
        .I1(cache_line_saved[2]),
        .I2(cache_line_saved[3]),
        .I3(curState),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[10]_21 ),
        .O(\is_present[10]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
    \is_present[11]_i_1__0 
       (.I0(cache_line_saved[2]),
        .I1(cache_line_saved[3]),
        .I2(curState),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[11]_20 ),
        .O(\is_present[11]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    \is_present[12]_i_1__0 
       (.I0(cache_line_saved[0]),
        .I1(cache_line_saved[1]),
        .I2(cache_line_saved[2]),
        .I3(curState),
        .I4(cache_line_saved[3]),
        .I5(\is_present_reg[12]_19 ),
        .O(\is_present[12]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF20000000)) 
    \is_present[13]_i_1__0 
       (.I0(cache_line_saved[2]),
        .I1(cache_line_saved[1]),
        .I2(cache_line_saved[0]),
        .I3(curState),
        .I4(cache_line_saved[3]),
        .I5(\is_present_reg[13]_18 ),
        .O(\is_present[13]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00008000)) 
    \is_present[14]_i_1__0 
       (.I0(cache_line_saved[1]),
        .I1(cache_line_saved[2]),
        .I2(cache_line_saved[3]),
        .I3(curState),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[14]_17 ),
        .O(\is_present[14]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
    \is_present[15]_i_1__0 
       (.I0(cache_line_saved[3]),
        .I1(cache_line_saved[2]),
        .I2(curState),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[15]_16 ),
        .O(\is_present[15]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00001000)) 
    \is_present[1]_i_1__0 
       (.I0(cache_line_saved[1]),
        .I1(cache_line_saved[2]),
        .I2(cache_line_saved[0]),
        .I3(curState),
        .I4(cache_line_saved[3]),
        .I5(\is_present_reg[1]_30 ),
        .O(\is_present[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000400)) 
    \is_present[2]_i_1__0 
       (.I0(cache_line_saved[0]),
        .I1(curState),
        .I2(cache_line_saved[3]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[2]),
        .I5(\is_present_reg[2]_29 ),
        .O(\is_present[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000800)) 
    \is_present[3]_i_1__0 
       (.I0(cache_line_saved[0]),
        .I1(curState),
        .I2(cache_line_saved[3]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[2]),
        .I5(\is_present_reg[3]_28 ),
        .O(\is_present[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00040000)) 
    \is_present[4]_i_1__0 
       (.I0(cache_line_saved[3]),
        .I1(curState),
        .I2(cache_line_saved[0]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[2]),
        .I5(\is_present_reg[4]_27 ),
        .O(\is_present[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002000)) 
    \is_present[5]_i_1__0 
       (.I0(curState),
        .I1(cache_line_saved[3]),
        .I2(cache_line_saved[2]),
        .I3(cache_line_saved[0]),
        .I4(cache_line_saved[1]),
        .I5(\is_present_reg[5]_26 ),
        .O(\is_present[5]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF04000000)) 
    \is_present[6]_i_1__0 
       (.I0(cache_line_saved[0]),
        .I1(curState),
        .I2(cache_line_saved[3]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[2]),
        .I5(\is_present_reg[6]_25 ),
        .O(\is_present[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF20000000)) 
    \is_present[7]_i_1__0 
       (.I0(curState),
        .I1(cache_line_saved[3]),
        .I2(cache_line_saved[2]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[7]_24 ),
        .O(\is_present[7]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000040)) 
    \is_present[8]_i_1__0 
       (.I0(cache_line_saved[2]),
        .I1(cache_line_saved[3]),
        .I2(curState),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[8]_23 ),
        .O(\is_present[8]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00004000)) 
    \is_present[9]_i_1__0 
       (.I0(cache_line_saved[2]),
        .I1(cache_line_saved[3]),
        .I2(curState),
        .I3(cache_line_saved[0]),
        .I4(cache_line_saved[1]),
        .I5(\is_present_reg[9]_22 ),
        .O(\is_present[9]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[0]_i_1__0_n_0 ),
        .Q(\is_present_reg[0]_31 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[10]_i_1__0_n_0 ),
        .Q(\is_present_reg[10]_21 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[11]_i_1__0_n_0 ),
        .Q(\is_present_reg[11]_20 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[12]_i_1__0_n_0 ),
        .Q(\is_present_reg[12]_19 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[13]_i_1__0_n_0 ),
        .Q(\is_present_reg[13]_18 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[14]_i_1__0_n_0 ),
        .Q(\is_present_reg[14]_17 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[15]_i_1__0_n_0 ),
        .Q(\is_present_reg[15]_16 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[1]_i_1__0_n_0 ),
        .Q(\is_present_reg[1]_30 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[2]_i_1__0_n_0 ),
        .Q(\is_present_reg[2]_29 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[3]_i_1__0_n_0 ),
        .Q(\is_present_reg[3]_28 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[4]_i_1__0_n_0 ),
        .Q(\is_present_reg[4]_27 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[5]_i_1__0_n_0 ),
        .Q(\is_present_reg[5]_26 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[6]_i_1__0_n_0 ),
        .Q(\is_present_reg[6]_25 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[7]_i_1__0_n_0 ),
        .Q(\is_present_reg[7]_24 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[8]_i_1__0_n_0 ),
        .Q(\is_present_reg[8]_23 ),
        .R(\curState_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[9]_i_1__0_n_0 ),
        .Q(\is_present_reg[9]_22 ),
        .R(\curState_reg[0]_1 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "80" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[1].engine_and_station_i/anEngine/anEngine/a_cache/tag" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "4" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    tag_reg_0_15_0_4
       (.ADDRA({1'b0,\memory_bb\.addr [2:0],D[2]}),
        .ADDRB({1'b0,\memory_bb\.addr [2:0],D[2]}),
        .ADDRC({1'b0,\memory_bb\.addr [2:0],D[2]}),
        .ADDRD({1'b0,\memory_bb\.addr [2:0],D[2]}),
        .ADDRE({1'b0,\memory_bb\.addr [2:0],D[2]}),
        .ADDRF({1'b0,\memory_bb\.addr [2:0],D[2]}),
        .ADDRG({1'b0,\memory_bb\.addr [2:0],D[2]}),
        .ADDRH({1'b0,cache_line_saved}),
        .DIA(tag_saved),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DIE({1'b0,1'b0}),
        .DIF({1'b0,1'b0}),
        .DIG({1'b0,1'b0}),
        .DIH({1'b0,1'b0}),
        .DOA(hit1[1:0]),
        .DOB(hit1[3:2]),
        .DOC({NLW_tag_reg_0_15_0_4_DOC_UNCONNECTED[1],hit1[4]}),
        .DOD(NLW_tag_reg_0_15_0_4_DOD_UNCONNECTED[1:0]),
        .DOE(NLW_tag_reg_0_15_0_4_DOE_UNCONNECTED[1:0]),
        .DOF(NLW_tag_reg_0_15_0_4_DOF_UNCONNECTED[1:0]),
        .DOG(NLW_tag_reg_0_15_0_4_DOG_UNCONNECTED[1:0]),
        .DOH(NLW_tag_reg_0_15_0_4_DOH_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(tag_reg_0_15_0_4_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    tag_reg_0_15_0_4_i_1__0
       (.I0(curState),
        .I1(\curState_reg[0]_1 ),
        .O(tag_reg_0_15_0_4_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \tag_saved_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [3]),
        .Q(tag_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tag_saved_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [4]),
        .Q(tag_saved[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cache_block_directly_mapped" *) 
module cache_block_directly_mapped_6
   (WEBWE,
    curState,
    cur_is_even_character_reg,
    \tag_saved_reg[1]_0 ,
    p_0_in,
    p_0_in_0,
    E,
    \curState_reg[0]_0 ,
    content_reg_0,
    content_reg_1,
    content_reg_2,
    content_reg_3,
    content_reg_4,
    content_reg_5,
    content_reg_6,
    content_reg_7,
    content_reg_8,
    content_reg_9,
    content_reg_10,
    content_reg_11,
    content_reg_12,
    content_reg_13,
    content_reg_14,
    content_reg_15,
    clk_IBUF_BUFG,
    p_21_out,
    memory_data,
    \is_present_reg[0]_0 ,
    \curState_reg[0]_1 ,
    cur_is_even_character,
    \head_reg[0] ,
    \head_reg[0]_0 ,
    D);
  output [0:0]WEBWE;
  output [0:0]curState;
  output cur_is_even_character_reg;
  output \tag_saved_reg[1]_0 ;
  output [0:0]p_0_in;
  output [0:0]p_0_in_0;
  output [0:0]E;
  output \curState_reg[0]_0 ;
  output content_reg_0;
  output content_reg_1;
  output content_reg_2;
  output content_reg_3;
  output content_reg_4;
  output content_reg_5;
  output content_reg_6;
  output content_reg_7;
  output content_reg_8;
  output content_reg_9;
  output content_reg_10;
  output content_reg_11;
  output content_reg_12;
  output content_reg_13;
  output content_reg_14;
  output content_reg_15;
  input clk_IBUF_BUFG;
  input [5:0]p_21_out;
  input [63:0]memory_data;
  input \is_present_reg[0]_0 ;
  input \curState_reg[0]_1 ;
  input cur_is_even_character;
  input \head_reg[0] ;
  input \head_reg[0]_0 ;
  input [1:0]D;

  wire [1:0]D;
  wire [0:0]E;
  wire [0:0]WEBWE;
  wire [1:0]block_sel_saved;
  wire [3:0]cache_line_saved;
  wire cache_line_saved__0;
  wire clk_IBUF_BUFG;
  wire content_reg_0;
  wire content_reg_1;
  wire content_reg_10;
  wire content_reg_11;
  wire content_reg_12;
  wire content_reg_13;
  wire content_reg_14;
  wire content_reg_15;
  wire content_reg_2;
  wire content_reg_3;
  wire content_reg_4;
  wire content_reg_5;
  wire content_reg_6;
  wire content_reg_7;
  wire content_reg_8;
  wire content_reg_9;
  wire [0:0]curState;
  wire \curState_reg[0]_0 ;
  wire \curState_reg[0]_1 ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire [63:0]data_from_memory;
  wire \head[4]_i_10_n_0 ;
  wire \head[4]_i_5_n_0 ;
  wire \head[4]_i_6_n_0 ;
  wire \head[4]_i_7_n_0 ;
  wire \head[4]_i_8_n_0 ;
  wire \head[4]_i_9_n_0 ;
  wire \head_reg[0] ;
  wire \head_reg[0]_0 ;
  wire [4:0]hit1;
  wire \is_present[0]_i_1_n_0 ;
  wire \is_present[10]_i_1_n_0 ;
  wire \is_present[11]_i_1_n_0 ;
  wire \is_present[12]_i_1_n_0 ;
  wire \is_present[13]_i_1_n_0 ;
  wire \is_present[14]_i_1_n_0 ;
  wire \is_present[15]_i_1_n_0 ;
  wire \is_present[1]_i_1_n_0 ;
  wire \is_present[2]_i_1_n_0 ;
  wire \is_present[3]_i_1_n_0 ;
  wire \is_present[4]_i_1_n_0 ;
  wire \is_present[5]_i_1_n_0 ;
  wire \is_present[6]_i_1_n_0 ;
  wire \is_present[7]_i_1_n_0 ;
  wire \is_present[8]_i_1_n_0 ;
  wire \is_present[9]_i_1_n_0 ;
  wire \is_present_reg[0]_0 ;
  wire \is_present_reg[0]_15 ;
  wire \is_present_reg[10]_5 ;
  wire \is_present_reg[11]_4 ;
  wire \is_present_reg[12]_3 ;
  wire \is_present_reg[13]_2 ;
  wire \is_present_reg[14]_1 ;
  wire \is_present_reg[15]_0 ;
  wire \is_present_reg[1]_14 ;
  wire \is_present_reg[2]_13 ;
  wire \is_present_reg[3]_12 ;
  wire \is_present_reg[4]_11 ;
  wire \is_present_reg[5]_10 ;
  wire \is_present_reg[6]_9 ;
  wire \is_present_reg[7]_8 ;
  wire \is_present_reg[8]_7 ;
  wire \is_present_reg[9]_6 ;
  wire [63:0]memory_data;
  wire [0:0]p_0_in;
  wire [0:0]p_0_in_0;
  wire [5:0]p_21_out;
  wire tag_reg_0_15_0_4_i_1_n_0;
  wire [1:0]tag_saved;
  wire \tag_saved_reg[1]_0 ;
  wire NLW_content_reg_CASOUTDBITERR_UNCONNECTED;
  wire NLW_content_reg_CASOUTSBITERR_UNCONNECTED;
  wire NLW_content_reg_DBITERR_UNCONNECTED;
  wire NLW_content_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_content_reg_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_content_reg_CASDOUTB_UNCONNECTED;
  wire [3:0]NLW_content_reg_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_content_reg_CASDOUTPB_UNCONNECTED;
  wire [3:0]NLW_content_reg_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_content_reg_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_content_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_content_reg_RDADDRECC_UNCONNECTED;
  wire [1:1]NLW_tag_reg_0_15_0_4_DOC_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOD_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOE_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOF_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOG_UNCONNECTED;
  wire [1:0]NLW_tag_reg_0_15_0_4_DOH_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[0]_i_2 
       (.I0(data_from_memory[0]),
        .I1(data_from_memory[16]),
        .I2(data_from_memory[32]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[48]),
        .O(content_reg_0));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[10]_i_2 
       (.I0(data_from_memory[10]),
        .I1(data_from_memory[26]),
        .I2(data_from_memory[42]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[58]),
        .O(content_reg_10));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[11]_i_2 
       (.I0(data_from_memory[11]),
        .I1(data_from_memory[27]),
        .I2(data_from_memory[43]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[59]),
        .O(content_reg_11));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[12]_i_2 
       (.I0(data_from_memory[12]),
        .I1(data_from_memory[28]),
        .I2(data_from_memory[44]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[60]),
        .O(content_reg_12));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[13]_i_2 
       (.I0(data_from_memory[13]),
        .I1(data_from_memory[29]),
        .I2(data_from_memory[45]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[61]),
        .O(content_reg_13));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[14]_i_2 
       (.I0(data_from_memory[14]),
        .I1(data_from_memory[30]),
        .I2(data_from_memory[46]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[62]),
        .O(content_reg_14));
  LUT6 #(
    .INIT(64'hF0FFCCAAF000CCAA)) 
    \FETCH_REC_Instr[15]_i_4 
       (.I0(data_from_memory[15]),
        .I1(data_from_memory[31]),
        .I2(data_from_memory[63]),
        .I3(block_sel_saved[0]),
        .I4(block_sel_saved[1]),
        .I5(data_from_memory[47]),
        .O(content_reg_15));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[1]_i_2 
       (.I0(data_from_memory[1]),
        .I1(data_from_memory[17]),
        .I2(data_from_memory[33]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[49]),
        .O(content_reg_1));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[2]_i_2 
       (.I0(data_from_memory[2]),
        .I1(data_from_memory[18]),
        .I2(data_from_memory[34]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[50]),
        .O(content_reg_2));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[3]_i_2 
       (.I0(data_from_memory[3]),
        .I1(data_from_memory[19]),
        .I2(data_from_memory[35]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[51]),
        .O(content_reg_3));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[4]_i_2 
       (.I0(data_from_memory[4]),
        .I1(data_from_memory[20]),
        .I2(data_from_memory[36]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[52]),
        .O(content_reg_4));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[5]_i_2 
       (.I0(data_from_memory[5]),
        .I1(data_from_memory[21]),
        .I2(data_from_memory[37]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[53]),
        .O(content_reg_5));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[6]_i_2 
       (.I0(data_from_memory[6]),
        .I1(data_from_memory[22]),
        .I2(data_from_memory[38]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[54]),
        .O(content_reg_6));
  LUT6 #(
    .INIT(64'hF0FFCCAAF000CCAA)) 
    \FETCH_REC_Instr[7]_i_2 
       (.I0(data_from_memory[7]),
        .I1(data_from_memory[23]),
        .I2(data_from_memory[55]),
        .I3(block_sel_saved[0]),
        .I4(block_sel_saved[1]),
        .I5(data_from_memory[39]),
        .O(content_reg_7));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[8]_i_2 
       (.I0(data_from_memory[8]),
        .I1(data_from_memory[24]),
        .I2(data_from_memory[40]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[56]),
        .O(content_reg_8));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[9]_i_2 
       (.I0(data_from_memory[9]),
        .I1(data_from_memory[25]),
        .I2(data_from_memory[41]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[57]),
        .O(content_reg_9));
  LUT1 #(
    .INIT(2'h1)) 
    FETCH_REC_has_to_save_i_1
       (.I0(\curState_reg[0]_0 ),
        .O(E));
  FDRE #(
    .INIT(1'b0)) 
    \block_sel_saved_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(D[0]),
        .Q(block_sel_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \block_sel_saved_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(D[1]),
        .Q(block_sel_saved[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \cache_line_saved[3]_i_1 
       (.I0(\is_present_reg[0]_0 ),
        .I1(curState),
        .O(cache_line_saved__0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(p_21_out[0]),
        .Q(cache_line_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(p_21_out[1]),
        .Q(cache_line_saved[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(p_21_out[2]),
        .Q(cache_line_saved[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(p_21_out[3]),
        .Q(cache_line_saved[3]),
        .R(1'b0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[0].engine_and_station_i/anEngine/anEngine/a_cache/content" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "511" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "63" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "496" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "63" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    content_reg
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,p_21_out[3:0],1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,cache_line_saved,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_content_reg_CASDOUTA_UNCONNECTED[31:0]),
        .CASDOUTB(NLW_content_reg_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA(NLW_content_reg_CASDOUTPA_UNCONNECTED[3:0]),
        .CASDOUTPB(NLW_content_reg_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_content_reg_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_content_reg_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DBITERR(NLW_content_reg_DBITERR_UNCONNECTED),
        .DINADIN(memory_data[31:0]),
        .DINBDIN(memory_data[63:32]),
        .DINPADINP({1'b1,1'b1,1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(data_from_memory[31:0]),
        .DOUTBDOUT(data_from_memory[63:32]),
        .DOUTPADOUTP(NLW_content_reg_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_content_reg_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_content_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(WEBWE),
        .ENBWREN(curState),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_content_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_content_reg_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE}));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    content_reg_bram_0_i_19
       (.I0(\head_reg[0] ),
        .I1(\tag_saved_reg[1]_0 ),
        .I2(curState),
        .O(\curState_reg[0]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    content_reg_i_1__0
       (.I0(\is_present_reg[0]_0 ),
        .O(WEBWE));
  FDRE #(
    .INIT(1'b0)) 
    \curState_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\curState_reg[0]_1 ),
        .Q(curState),
        .R(\is_present_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h00000100)) 
    \head[4]_i_1 
       (.I0(\head_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(curState),
        .I3(\tag_saved_reg[1]_0 ),
        .I4(\head_reg[0] ),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \head[4]_i_10 
       (.I0(\is_present_reg[3]_12 ),
        .I1(\is_present_reg[2]_13 ),
        .I2(p_21_out[1]),
        .I3(\is_present_reg[1]_14 ),
        .I4(p_21_out[0]),
        .I5(\is_present_reg[0]_15 ),
        .O(\head[4]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \head[4]_i_1__0 
       (.I0(cur_is_even_character),
        .I1(curState),
        .I2(\tag_saved_reg[1]_0 ),
        .I3(\head_reg[0] ),
        .O(p_0_in_0));
  LUT3 #(
    .INIT(8'h04)) 
    \head[4]_i_3 
       (.I0(hit1[3]),
        .I1(\head[4]_i_5_n_0 ),
        .I2(\head[4]_i_6_n_0 ),
        .O(\tag_saved_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0000000041000041)) 
    \head[4]_i_5 
       (.I0(hit1[2]),
        .I1(p_21_out[5]),
        .I2(hit1[1]),
        .I3(p_21_out[4]),
        .I4(hit1[0]),
        .I5(hit1[4]),
        .O(\head[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h303F303F50505F5F)) 
    \head[4]_i_6 
       (.I0(\head[4]_i_7_n_0 ),
        .I1(\head[4]_i_8_n_0 ),
        .I2(p_21_out[3]),
        .I3(\head[4]_i_9_n_0 ),
        .I4(\head[4]_i_10_n_0 ),
        .I5(p_21_out[2]),
        .O(\head[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \head[4]_i_7 
       (.I0(\is_present_reg[11]_4 ),
        .I1(\is_present_reg[10]_5 ),
        .I2(p_21_out[1]),
        .I3(\is_present_reg[9]_6 ),
        .I4(p_21_out[0]),
        .I5(\is_present_reg[8]_7 ),
        .O(\head[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \head[4]_i_8 
       (.I0(\is_present_reg[15]_0 ),
        .I1(\is_present_reg[14]_1 ),
        .I2(p_21_out[1]),
        .I3(\is_present_reg[13]_2 ),
        .I4(p_21_out[0]),
        .I5(\is_present_reg[12]_3 ),
        .O(\head[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \head[4]_i_9 
       (.I0(\is_present_reg[7]_8 ),
        .I1(\is_present_reg[6]_9 ),
        .I2(p_21_out[1]),
        .I3(\is_present_reg[5]_10 ),
        .I4(p_21_out[0]),
        .I5(\is_present_reg[4]_11 ),
        .O(\head[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000100)) 
    \is_present[0]_i_1 
       (.I0(cache_line_saved[1]),
        .I1(cache_line_saved[2]),
        .I2(cache_line_saved[0]),
        .I3(curState),
        .I4(cache_line_saved[3]),
        .I5(\is_present_reg[0]_15 ),
        .O(\is_present[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002000)) 
    \is_present[10]_i_1 
       (.I0(cache_line_saved[1]),
        .I1(cache_line_saved[2]),
        .I2(cache_line_saved[3]),
        .I3(curState),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[10]_5 ),
        .O(\is_present[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
    \is_present[11]_i_1 
       (.I0(cache_line_saved[2]),
        .I1(cache_line_saved[3]),
        .I2(curState),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[11]_4 ),
        .O(\is_present[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    \is_present[12]_i_1 
       (.I0(cache_line_saved[0]),
        .I1(cache_line_saved[1]),
        .I2(cache_line_saved[2]),
        .I3(curState),
        .I4(cache_line_saved[3]),
        .I5(\is_present_reg[12]_3 ),
        .O(\is_present[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF20000000)) 
    \is_present[13]_i_1 
       (.I0(cache_line_saved[2]),
        .I1(cache_line_saved[1]),
        .I2(cache_line_saved[0]),
        .I3(curState),
        .I4(cache_line_saved[3]),
        .I5(\is_present_reg[13]_2 ),
        .O(\is_present[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00008000)) 
    \is_present[14]_i_1 
       (.I0(cache_line_saved[1]),
        .I1(cache_line_saved[2]),
        .I2(cache_line_saved[3]),
        .I3(curState),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[14]_1 ),
        .O(\is_present[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
    \is_present[15]_i_1 
       (.I0(cache_line_saved[3]),
        .I1(cache_line_saved[2]),
        .I2(curState),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[15]_0 ),
        .O(\is_present[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00001000)) 
    \is_present[1]_i_1 
       (.I0(cache_line_saved[1]),
        .I1(cache_line_saved[2]),
        .I2(cache_line_saved[0]),
        .I3(curState),
        .I4(cache_line_saved[3]),
        .I5(\is_present_reg[1]_14 ),
        .O(\is_present[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000400)) 
    \is_present[2]_i_1 
       (.I0(cache_line_saved[0]),
        .I1(curState),
        .I2(cache_line_saved[3]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[2]),
        .I5(\is_present_reg[2]_13 ),
        .O(\is_present[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000800)) 
    \is_present[3]_i_1 
       (.I0(cache_line_saved[0]),
        .I1(curState),
        .I2(cache_line_saved[3]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[2]),
        .I5(\is_present_reg[3]_12 ),
        .O(\is_present[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00040000)) 
    \is_present[4]_i_1 
       (.I0(cache_line_saved[3]),
        .I1(curState),
        .I2(cache_line_saved[0]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[2]),
        .I5(\is_present_reg[4]_11 ),
        .O(\is_present[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002000)) 
    \is_present[5]_i_1 
       (.I0(curState),
        .I1(cache_line_saved[3]),
        .I2(cache_line_saved[2]),
        .I3(cache_line_saved[0]),
        .I4(cache_line_saved[1]),
        .I5(\is_present_reg[5]_10 ),
        .O(\is_present[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF04000000)) 
    \is_present[6]_i_1 
       (.I0(cache_line_saved[0]),
        .I1(curState),
        .I2(cache_line_saved[3]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[2]),
        .I5(\is_present_reg[6]_9 ),
        .O(\is_present[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF20000000)) 
    \is_present[7]_i_1 
       (.I0(curState),
        .I1(cache_line_saved[3]),
        .I2(cache_line_saved[2]),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[7]_8 ),
        .O(\is_present[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000040)) 
    \is_present[8]_i_1 
       (.I0(cache_line_saved[2]),
        .I1(cache_line_saved[3]),
        .I2(curState),
        .I3(cache_line_saved[1]),
        .I4(cache_line_saved[0]),
        .I5(\is_present_reg[8]_7 ),
        .O(\is_present[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00004000)) 
    \is_present[9]_i_1 
       (.I0(cache_line_saved[2]),
        .I1(cache_line_saved[3]),
        .I2(curState),
        .I3(cache_line_saved[0]),
        .I4(cache_line_saved[1]),
        .I5(\is_present_reg[9]_6 ),
        .O(\is_present[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[0]_i_1_n_0 ),
        .Q(\is_present_reg[0]_15 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[10]_i_1_n_0 ),
        .Q(\is_present_reg[10]_5 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[11]_i_1_n_0 ),
        .Q(\is_present_reg[11]_4 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[12]_i_1_n_0 ),
        .Q(\is_present_reg[12]_3 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[13]_i_1_n_0 ),
        .Q(\is_present_reg[13]_2 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[14]_i_1_n_0 ),
        .Q(\is_present_reg[14]_1 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[15]_i_1_n_0 ),
        .Q(\is_present_reg[15]_0 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[1]_i_1_n_0 ),
        .Q(\is_present_reg[1]_14 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[2]_i_1_n_0 ),
        .Q(\is_present_reg[2]_13 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[3]_i_1_n_0 ),
        .Q(\is_present_reg[3]_12 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[4]_i_1_n_0 ),
        .Q(\is_present_reg[4]_11 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[5]_i_1_n_0 ),
        .Q(\is_present_reg[5]_10 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[6]_i_1_n_0 ),
        .Q(\is_present_reg[6]_9 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[7]_i_1_n_0 ),
        .Q(\is_present_reg[7]_8 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[8]_i_1_n_0 ),
        .Q(\is_present_reg[8]_7 ),
        .R(\is_present_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\is_present[9]_i_1_n_0 ),
        .Q(\is_present_reg[9]_6 ),
        .R(\is_present_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \state_cur[2]_i_3 
       (.I0(cur_is_even_character),
        .I1(curState),
        .I2(\tag_saved_reg[1]_0 ),
        .I3(\head_reg[0] ),
        .O(cur_is_even_character_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "80" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[0].engine_and_station_i/anEngine/anEngine/a_cache/tag" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "4" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    tag_reg_0_15_0_4
       (.ADDRA({1'b0,p_21_out[3:0]}),
        .ADDRB({1'b0,p_21_out[3:0]}),
        .ADDRC({1'b0,p_21_out[3:0]}),
        .ADDRD({1'b0,p_21_out[3:0]}),
        .ADDRE({1'b0,p_21_out[3:0]}),
        .ADDRF({1'b0,p_21_out[3:0]}),
        .ADDRG({1'b0,p_21_out[3:0]}),
        .ADDRH({1'b0,cache_line_saved}),
        .DIA(tag_saved),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DIE({1'b0,1'b0}),
        .DIF({1'b0,1'b0}),
        .DIG({1'b0,1'b0}),
        .DIH({1'b0,1'b0}),
        .DOA(hit1[1:0]),
        .DOB(hit1[3:2]),
        .DOC({NLW_tag_reg_0_15_0_4_DOC_UNCONNECTED[1],hit1[4]}),
        .DOD(NLW_tag_reg_0_15_0_4_DOD_UNCONNECTED[1:0]),
        .DOE(NLW_tag_reg_0_15_0_4_DOE_UNCONNECTED[1:0]),
        .DOF(NLW_tag_reg_0_15_0_4_DOF_UNCONNECTED[1:0]),
        .DOG(NLW_tag_reg_0_15_0_4_DOG_UNCONNECTED[1:0]),
        .DOH(NLW_tag_reg_0_15_0_4_DOH_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(tag_reg_0_15_0_4_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    tag_reg_0_15_0_4_i_1
       (.I0(curState),
        .I1(\is_present_reg[0]_0 ),
        .O(tag_reg_0_15_0_4_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \tag_saved_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(p_21_out[4]),
        .Q(tag_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tag_saved_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(cache_line_saved__0),
        .D(p_21_out[5]),
        .Q(tag_saved[1]),
        .R(1'b0));
endmodule

module channel
   (WEA,
    \channel_old_latency_reg[3]_0 ,
    \switch2channel\.latency ,
    \tail_reg[1] ,
    S,
    \channel_old_latency_reg[2]_0 ,
    DI,
    DINADIN,
    content_reg_bram_0,
    \middle_reg[1] ,
    \middle_reg[2] ,
    \middle_reg[3] ,
    \middle_reg[4] ,
    \middle_reg[5] ,
    \middle_reg[6] ,
    \middle_reg[7] ,
    \middle_reg[8] ,
    \cur_state_reg[1] ,
    clk_IBUF_BUFG,
    \switch2channel\.valid ,
    content_reg_bram_0_0,
    \channel_old_latency_reg[2]_1 ,
    \channel_old_latency_reg[2]_2 ,
    CO,
    \channel_old_latency_reg[4]_0 ,
    \channel_old_latency_reg[2]_3 ,
    min_latency1_carry,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    \state_cur_reg[0] ,
    \tail_reg[0] ,
    \tail_reg[0]_0 ,
    \channel_old_latency_reg[2]_4 ,
    min_latency1_carry_0,
    \channel_old_latency_reg[6]_0 );
  output [0:0]WEA;
  output [6:0]\channel_old_latency_reg[3]_0 ;
  output [0:0]\switch2channel\.latency ;
  output \tail_reg[1] ;
  output [3:0]S;
  output \channel_old_latency_reg[2]_0 ;
  output [2:0]DI;
  output [7:0]DINADIN;
  output content_reg_bram_0;
  output \middle_reg[1] ;
  output \middle_reg[2] ;
  output \middle_reg[3] ;
  output \middle_reg[4] ;
  output \middle_reg[5] ;
  output \middle_reg[6] ;
  output \middle_reg[7] ;
  output \middle_reg[8] ;
  output \cur_state_reg[1] ;
  input clk_IBUF_BUFG;
  input \switch2channel\.valid ;
  input [8:0]content_reg_bram_0_0;
  input \channel_old_latency_reg[2]_1 ;
  input \channel_old_latency_reg[2]_2 ;
  input [0:0]CO;
  input \channel_old_latency_reg[4]_0 ;
  input \channel_old_latency_reg[2]_3 ;
  input min_latency1_carry;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input \state_cur_reg[0] ;
  input [2:0]\tail_reg[0] ;
  input \tail_reg[0]_0 ;
  input \channel_old_latency_reg[2]_4 ;
  input min_latency1_carry_0;
  input [6:0]\channel_old_latency_reg[6]_0 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [7:0]DINADIN;
  wire [3:0]S;
  wire [0:0]WEA;
  wire [6:0]channel_old_latency;
  wire \channel_old_latency_reg[2]_0 ;
  wire \channel_old_latency_reg[2]_1 ;
  wire \channel_old_latency_reg[2]_2 ;
  wire \channel_old_latency_reg[2]_3 ;
  wire \channel_old_latency_reg[2]_4 ;
  wire [6:0]\channel_old_latency_reg[3]_0 ;
  wire \channel_old_latency_reg[4]_0 ;
  wire [6:0]\channel_old_latency_reg[6]_0 ;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0;
  wire [8:0]content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire \cur_state_reg[1] ;
  wire \middle_reg[1] ;
  wire \middle_reg[2] ;
  wire \middle_reg[3] ;
  wire \middle_reg[4] ;
  wire \middle_reg[5] ;
  wire \middle_reg[6] ;
  wire \middle_reg[7] ;
  wire \middle_reg[8] ;
  wire min_latency1_carry;
  wire min_latency1_carry_0;
  wire \state_cur_reg[0] ;
  wire [0:0]\switch2channel\.latency ;
  wire \switch2channel\.valid ;
  wire [2:0]\tail_reg[0] ;
  wire \tail_reg[0]_0 ;
  wire \tail_reg[1] ;

  FDSE #(
    .INIT(1'b1)) 
    \channel_old_latency_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [0]),
        .Q(channel_old_latency[0]),
        .S(\state_cur_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [1]),
        .Q(channel_old_latency[1]),
        .R(\state_cur_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [2]),
        .Q(channel_old_latency[2]),
        .R(\state_cur_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [3]),
        .Q(channel_old_latency[3]),
        .R(\state_cur_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [4]),
        .Q(channel_old_latency[4]),
        .R(\state_cur_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [5]),
        .Q(channel_old_latency[5]),
        .R(\state_cur_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [6]),
        .Q(channel_old_latency[6]),
        .R(\state_cur_reg[0] ));
  fifo__parameterized0 fifo_channel
       (.CO(CO),
        .DI(DI),
        .DINADIN(DINADIN),
        .Q(channel_old_latency),
        .S(S),
        .WEA(WEA),
        .\channel_old_latency_reg[2] (\channel_old_latency_reg[2]_0 ),
        .\channel_old_latency_reg[2]_0 (\channel_old_latency_reg[2]_1 ),
        .\channel_old_latency_reg[2]_1 (\channel_old_latency_reg[2]_2 ),
        .\channel_old_latency_reg[2]_2 (\channel_old_latency_reg[2]_3 ),
        .\channel_old_latency_reg[2]_3 (\channel_old_latency_reg[2]_4 ),
        .\channel_old_latency_reg[3] (\channel_old_latency_reg[3]_0 ),
        .\channel_old_latency_reg[4] (\channel_old_latency_reg[4]_0 ),
        .\channel_old_latency_reg[5] (\switch2channel\.latency ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0_0(content_reg_bram_0),
        .content_reg_bram_0_1(content_reg_bram_0_0),
        .content_reg_bram_0_10(content_reg_bram_0_9),
        .content_reg_bram_0_11(content_reg_bram_0_10),
        .content_reg_bram_0_12(content_reg_bram_0_11),
        .content_reg_bram_0_2(content_reg_bram_0_1),
        .content_reg_bram_0_3(content_reg_bram_0_2),
        .content_reg_bram_0_4(content_reg_bram_0_3),
        .content_reg_bram_0_5(content_reg_bram_0_4),
        .content_reg_bram_0_6(content_reg_bram_0_5),
        .content_reg_bram_0_7(content_reg_bram_0_6),
        .content_reg_bram_0_8(content_reg_bram_0_7),
        .content_reg_bram_0_9(content_reg_bram_0_8),
        .\cur_state_reg[1] (\cur_state_reg[1] ),
        .\middle_reg[1]_0 (\middle_reg[1] ),
        .\middle_reg[2]_0 (\middle_reg[2] ),
        .\middle_reg[3]_0 (\middle_reg[3] ),
        .\middle_reg[4]_0 (\middle_reg[4] ),
        .\middle_reg[5]_0 (\middle_reg[5] ),
        .\middle_reg[6]_0 (\middle_reg[6] ),
        .\middle_reg[7]_0 (\middle_reg[7] ),
        .\middle_reg[8]_0 (\middle_reg[8] ),
        .min_latency1_carry(min_latency1_carry),
        .min_latency1_carry_0(min_latency1_carry_0),
        .\state_cur_reg[0]_0 (\state_cur_reg[0] ),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[0]_0 (\tail_reg[0] ),
        .\tail_reg[0]_1 (\tail_reg[0]_0 ),
        .\tail_reg[1]_0 (\tail_reg[1] ));
endmodule

(* ORIG_REF_NAME = "channel" *) 
module channel_2
   (\switch2channel\.ready_0 ,
    \tail_reg[1] ,
    \channel_old_latency_reg[3]_0 ,
    \channel_old_latency_reg[5]_0 ,
    S,
    D,
    \head_reg[0] ,
    \head_reg[0]_0 ,
    \channel_old_latency_reg[5]_1 ,
    \channel_old_latency_reg[5]_2 ,
    content_reg_bram_0,
    DI,
    \channel_old_latency_reg[3]_1 ,
    \channel_old_latency_reg[5]_3 ,
    \head_reg[2] ,
    \channel_old_latency_reg[2]_0 ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    clk_IBUF_BUFG,
    \switch2channel\.valid ,
    DINADIN,
    SR,
    p_0_in,
    \state_cur_reg[0] ,
    CO,
    \channel_old_latency_reg[0]_0 ,
    \channel_old_latency_reg[0]_1 ,
    \channel_old_latency[6]_i_5 ,
    content_reg_bram_0_9,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    min_latency1_carry,
    min_latency1_carry_0,
    \channel_old_latency_reg[6]_0 ,
    E);
  output \switch2channel\.ready_0 ;
  output \tail_reg[1] ;
  output \channel_old_latency_reg[3]_0 ;
  output \channel_old_latency_reg[5]_0 ;
  output [1:0]S;
  output [0:0]D;
  output \head_reg[0] ;
  output \head_reg[0]_0 ;
  output \channel_old_latency_reg[5]_1 ;
  output \channel_old_latency_reg[5]_2 ;
  output [8:0]content_reg_bram_0;
  output [0:0]DI;
  output \channel_old_latency_reg[3]_1 ;
  output \channel_old_latency_reg[5]_3 ;
  output \head_reg[2] ;
  output \channel_old_latency_reg[2]_0 ;
  output content_reg_bram_0_0;
  output content_reg_bram_0_1;
  output content_reg_bram_0_2;
  output content_reg_bram_0_3;
  output content_reg_bram_0_4;
  output content_reg_bram_0_5;
  output content_reg_bram_0_6;
  output content_reg_bram_0_7;
  output content_reg_bram_0_8;
  input clk_IBUF_BUFG;
  input \switch2channel\.valid ;
  input [8:0]DINADIN;
  input [0:0]SR;
  input [0:0]p_0_in;
  input \state_cur_reg[0] ;
  input [0:0]CO;
  input \channel_old_latency_reg[0]_0 ;
  input \channel_old_latency_reg[0]_1 ;
  input \channel_old_latency[6]_i_5 ;
  input content_reg_bram_0_9;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input min_latency1_carry;
  input min_latency1_carry_0;
  input [6:0]\channel_old_latency_reg[6]_0 ;
  input [0:0]E;

  wire [0:0]CO;
  wire [0:0]D;
  wire [0:0]DI;
  wire [8:0]DINADIN;
  wire [0:0]E;
  wire [1:0]S;
  wire [0:0]SR;
  wire [6:0]channel_old_latency;
  wire \channel_old_latency[6]_i_5 ;
  wire \channel_old_latency_reg[0]_0 ;
  wire \channel_old_latency_reg[0]_1 ;
  wire \channel_old_latency_reg[2]_0 ;
  wire \channel_old_latency_reg[3]_0 ;
  wire \channel_old_latency_reg[3]_1 ;
  wire \channel_old_latency_reg[5]_0 ;
  wire \channel_old_latency_reg[5]_1 ;
  wire \channel_old_latency_reg[5]_2 ;
  wire \channel_old_latency_reg[5]_3 ;
  wire [6:0]\channel_old_latency_reg[6]_0 ;
  wire clk_IBUF_BUFG;
  wire [8:0]content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire \head_reg[0] ;
  wire \head_reg[0]_0 ;
  wire \head_reg[2] ;
  wire min_latency1_carry;
  wire min_latency1_carry_0;
  wire [0:0]p_0_in;
  wire \state_cur_reg[0] ;
  wire \switch2channel\.ready_0 ;
  wire \switch2channel\.valid ;
  wire \tail_reg[1] ;

  FDSE #(
    .INIT(1'b1)) 
    \channel_old_latency_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [0]),
        .Q(channel_old_latency[0]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [1]),
        .Q(channel_old_latency[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [2]),
        .Q(channel_old_latency[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [3]),
        .Q(channel_old_latency[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [4]),
        .Q(channel_old_latency[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [5]),
        .Q(channel_old_latency[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \channel_old_latency_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\channel_old_latency_reg[6]_0 [6]),
        .Q(channel_old_latency[6]),
        .R(SR));
  fifo__parameterized0_14 fifo_channel
       (.CO(CO),
        .D(D),
        .DI(DI),
        .DINADIN(DINADIN),
        .E(E),
        .Q(channel_old_latency),
        .S(S),
        .SR(SR),
        .\channel_old_latency[6]_i_5 (\channel_old_latency[6]_i_5 ),
        .\channel_old_latency_reg[0] (\channel_old_latency_reg[0]_0 ),
        .\channel_old_latency_reg[0]_0 (\channel_old_latency_reg[0]_1 ),
        .\channel_old_latency_reg[2] (\channel_old_latency_reg[2]_0 ),
        .\channel_old_latency_reg[3] (\channel_old_latency_reg[3]_0 ),
        .\channel_old_latency_reg[3]_0 (\channel_old_latency_reg[3]_1 ),
        .\channel_old_latency_reg[5] (\channel_old_latency_reg[5]_0 ),
        .\channel_old_latency_reg[5]_0 (\channel_old_latency_reg[5]_1 ),
        .\channel_old_latency_reg[5]_1 (\channel_old_latency_reg[5]_2 ),
        .\channel_old_latency_reg[5]_2 (\channel_old_latency_reg[5]_3 ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0_0(content_reg_bram_0),
        .content_reg_bram_0_1(content_reg_bram_0_0),
        .content_reg_bram_0_10(content_reg_bram_0_9),
        .content_reg_bram_0_11(content_reg_bram_0_10),
        .content_reg_bram_0_12(content_reg_bram_0_11),
        .content_reg_bram_0_13(content_reg_bram_0_12),
        .content_reg_bram_0_14(content_reg_bram_0_13),
        .content_reg_bram_0_15(content_reg_bram_0_14),
        .content_reg_bram_0_16(content_reg_bram_0_15),
        .content_reg_bram_0_17(content_reg_bram_0_16),
        .content_reg_bram_0_18(content_reg_bram_0_17),
        .content_reg_bram_0_19(content_reg_bram_0_18),
        .content_reg_bram_0_2(content_reg_bram_0_1),
        .content_reg_bram_0_3(content_reg_bram_0_2),
        .content_reg_bram_0_4(content_reg_bram_0_3),
        .content_reg_bram_0_5(content_reg_bram_0_4),
        .content_reg_bram_0_6(content_reg_bram_0_5),
        .content_reg_bram_0_7(content_reg_bram_0_6),
        .content_reg_bram_0_8(content_reg_bram_0_7),
        .content_reg_bram_0_9(content_reg_bram_0_8),
        .\head_reg[0]_0 (\head_reg[0] ),
        .\head_reg[0]_1 (\head_reg[0]_0 ),
        .\head_reg[2]_0 (\head_reg[2] ),
        .min_latency1_carry(min_latency1_carry),
        .min_latency1_carry_0(min_latency1_carry_0),
        .p_0_in(p_0_in),
        .\state_cur_reg[0]_0 (\state_cur_reg[0] ),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[1]_0 (\tail_reg[1] ));
endmodule

module engine
   (content_reg_bram_0,
    bram_r_valid,
    ADDRARDADDR,
    E,
    \cur_state_reg[2] ,
    EXE2_Instr_valid_reg,
    \curState_reg[0] ,
    \head_reg[3] ,
    EXE2_Instr_valid_reg_0,
    \tail_reg[0] ,
    \tail_reg[0]_0 ,
    cur_is_even_character_reg,
    \cur_state_reg[1] ,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    cur_is_even_character_reg_2,
    in_ready_packed,
    \FSM_sequential_status_register_reg[0] ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \EXE1_Instr_reg[10] ,
    \EXE1_Pc_reg[0] ,
    \EXE1_Instr_reg[1] ,
    \EXE1_Instr_reg[2] ,
    \EXE1_Instr_reg[3] ,
    \EXE1_Instr_reg[4] ,
    \EXE1_Instr_reg[5] ,
    \EXE1_Instr_reg[6] ,
    \EXE1_Pc_reg[6] ,
    content_reg_bram_0_i_24__2,
    \head_reg[2] ,
    \EXE1_Instr_reg[10]_0 ,
    \switch2channel\.valid ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[25] ,
    \cur_ccs_reg[57] ,
    cur_is_even_character_reg_3,
    cur_is_even_character_reg_4,
    \EXE1_Instr_reg[8] ,
    cur_is_even_character_reg_5,
    clk_IBUF_BUFG,
    WEBWE,
    memory_data,
    \old_grant_reg[0] ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    \FSM_sequential_status_register_reg[0]_2 ,
    \FSM_sequential_status_register_reg[0]_3 ,
    cmd_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    O,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ,
    \cur_state_reg[0] ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ,
    CO,
    cur_is_even_character,
    \tail_reg[4] ,
    \channel_old_latency_reg[2] ,
    \channel_old_latency_reg[2]_0 ,
    \cur_state_reg[0]_0 ,
    \old_grant_reg[0]_0 ,
    old_grant,
    start_cc_pointer_register_IBUF,
    cur_is_even_character_reg_6,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ,
    \cur_state[2]_i_9 ,
    \cur_state[2]_i_9_0 ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    \tail_reg[4]_0 ,
    WEA,
    \FETCH_REC_Instr[15]_i_12 ,
    \FETCH_REC_Instr[15]_i_8 ,
    \FETCH_REC_Instr[15]_i_8_0 ,
    \old_grant[0]_i_5 ,
    \old_grant[0]_i_5_0 ,
    \old_grant[0]_i_3__0 ,
    \old_grant[0]_i_3__0_0 ,
    \FETCH_REC_Instr[15]_i_9 ,
    \FETCH_REC_Instr[15]_i_9_0 ,
    \FETCH_REC_Instr[15]_i_9_1 ,
    \FETCH_REC_Instr[15]_i_9_2 ,
    \old_grant[0]_i_5_1 ,
    \old_grant[0]_i_5_2 ,
    \channel_old_latency_reg[2]_1 ,
    EXE2_Instr_valid,
    FETCH_REC_Instr_valid,
    EXE1_Instr_valid);
  output content_reg_bram_0;
  output bram_r_valid;
  output [8:0]ADDRARDADDR;
  output [0:0]E;
  output \cur_state_reg[2] ;
  output EXE2_Instr_valid_reg;
  output \curState_reg[0] ;
  output \head_reg[3] ;
  output EXE2_Instr_valid_reg_0;
  output \tail_reg[0] ;
  output \tail_reg[0]_0 ;
  output cur_is_even_character_reg;
  output \cur_state_reg[1] ;
  output cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output cur_is_even_character_reg_2;
  output [0:0]in_ready_packed;
  output [0:0]\FSM_sequential_status_register_reg[0] ;
  output \FSM_sequential_status_register_reg[0]_0 ;
  output \EXE1_Instr_reg[10] ;
  output \EXE1_Pc_reg[0] ;
  output \EXE1_Instr_reg[1] ;
  output \EXE1_Instr_reg[2] ;
  output \EXE1_Instr_reg[3] ;
  output \EXE1_Instr_reg[4] ;
  output \EXE1_Instr_reg[5] ;
  output \EXE1_Instr_reg[6] ;
  output \EXE1_Pc_reg[6] ;
  output [0:0]content_reg_bram_0_i_24__2;
  output \head_reg[2] ;
  output \EXE1_Instr_reg[10]_0 ;
  output \switch2channel\.valid ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[25] ;
  output \cur_ccs_reg[57] ;
  output cur_is_even_character_reg_3;
  output cur_is_even_character_reg_4;
  output \EXE1_Instr_reg[8] ;
  output cur_is_even_character_reg_5;
  input clk_IBUF_BUFG;
  input [0:0]WEBWE;
  input [63:0]memory_data;
  input \old_grant_reg[0] ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [3:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \FSM_sequential_status_register_reg[0]_1 ;
  input [2:0]\FSM_sequential_status_register_reg[0]_2 ;
  input \FSM_sequential_status_register_reg[0]_3 ;
  input [0:0]cmd_register_IBUF;
  input [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input [5:0]O;
  input [3:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  input \cur_state_reg[0] ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ;
  input [0:0]CO;
  input cur_is_even_character;
  input \tail_reg[4] ;
  input \channel_old_latency_reg[2] ;
  input [0:0]\channel_old_latency_reg[2]_0 ;
  input \cur_state_reg[0]_0 ;
  input \old_grant_reg[0]_0 ;
  input [0:0]old_grant;
  input [5:0]start_cc_pointer_register_IBUF;
  input cur_is_even_character_reg_6;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  input \cur_state[2]_i_9 ;
  input \cur_state[2]_i_9_0 ;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input \tail_reg[4]_0 ;
  input [0:0]WEA;
  input [15:0]\FETCH_REC_Instr[15]_i_12 ;
  input \FETCH_REC_Instr[15]_i_8 ;
  input \FETCH_REC_Instr[15]_i_8_0 ;
  input \old_grant[0]_i_5 ;
  input \old_grant[0]_i_5_0 ;
  input \old_grant[0]_i_3__0 ;
  input \old_grant[0]_i_3__0_0 ;
  input \FETCH_REC_Instr[15]_i_9 ;
  input \FETCH_REC_Instr[15]_i_9_0 ;
  input \FETCH_REC_Instr[15]_i_9_1 ;
  input \FETCH_REC_Instr[15]_i_9_2 ;
  input \old_grant[0]_i_5_1 ;
  input \old_grant[0]_i_5_2 ;
  input \channel_old_latency_reg[2]_1 ;
  input EXE2_Instr_valid;
  input FETCH_REC_Instr_valid;
  input EXE1_Instr_valid;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [0:0]E;
  wire \EXE1_Instr_reg[10] ;
  wire \EXE1_Instr_reg[10]_0 ;
  wire \EXE1_Instr_reg[1] ;
  wire \EXE1_Instr_reg[2] ;
  wire \EXE1_Instr_reg[3] ;
  wire \EXE1_Instr_reg[4] ;
  wire \EXE1_Instr_reg[5] ;
  wire \EXE1_Instr_reg[6] ;
  wire \EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid;
  wire \EXE1_Pc_reg[0] ;
  wire \EXE1_Pc_reg[6] ;
  wire EXE2_Instr_valid;
  wire EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire [15:0]\FETCH_REC_Instr[15]_i_12 ;
  wire \FETCH_REC_Instr[15]_i_8 ;
  wire \FETCH_REC_Instr[15]_i_8_0 ;
  wire \FETCH_REC_Instr[15]_i_9 ;
  wire \FETCH_REC_Instr[15]_i_9_0 ;
  wire \FETCH_REC_Instr[15]_i_9_1 ;
  wire \FETCH_REC_Instr[15]_i_9_2 ;
  wire FETCH_REC_Instr_valid;
  wire FETCH_SEND_not_stall;
  wire [0:0]\FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[0]_1 ;
  wire [2:0]\FSM_sequential_status_register_reg[0]_2 ;
  wire \FSM_sequential_status_register_reg[0]_3 ;
  wire [5:0]O;
  wire [2:0]Q;
  wire [0:0]WEA;
  wire [0:0]WEBWE;
  wire a_cache_n_10;
  wire a_cache_n_11;
  wire a_cache_n_12;
  wire a_cache_n_13;
  wire a_cache_n_14;
  wire a_cache_n_15;
  wire a_cache_n_16;
  wire a_cache_n_17;
  wire a_cache_n_18;
  wire a_cache_n_19;
  wire a_cache_n_2;
  wire a_cache_n_20;
  wire a_cache_n_21;
  wire a_cache_n_3;
  wire a_cache_n_6;
  wire a_cache_n_7;
  wire a_cache_n_8;
  wire a_cache_n_9;
  wire [3:0]address_register_IBUF;
  wire bram_r_valid;
  wire buffer_n_0;
  wire buffer_n_17;
  wire buffer_n_4;
  wire buffer_n_5;
  wire buffer_n_6;
  wire \channel_old_latency_reg[2] ;
  wire [0:0]\channel_old_latency_reg[2]_0 ;
  wire \channel_old_latency_reg[2]_1 ;
  wire clk_IBUF_BUFG;
  wire [0:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire [0:0]content_reg_bram_0_i_24__2;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_ccs_reg[25] ;
  wire \cur_ccs_reg[57] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire cur_is_even_character_reg_4;
  wire cur_is_even_character_reg_5;
  wire cur_is_even_character_reg_6;
  wire \cur_state[2]_i_9 ;
  wire \cur_state[2]_i_9_0 ;
  wire \cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[1] ;
  wire \cur_state_reg[2] ;
  wire [1:0]fifo_cur_char_data_out;
  wire [0:0]\fifo_even/p_0_in ;
  wire [7:0]fifo_even_data_in;
  wire fifo_even_data_in_valid;
  wire [0:0]\fifo_odd/p_0_in ;
  wire [7:0]fifo_odd_data_in;
  wire fifo_odd_data_in_valid;
  wire \g.aregex_cpu_n_10 ;
  wire \g.aregex_cpu_n_15 ;
  wire \g.aregex_cpu_n_16 ;
  wire \g.aregex_cpu_n_19 ;
  wire \g.aregex_cpu_n_52 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire [3:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ;
  wire \head_reg[2] ;
  wire \head_reg[3] ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [5:1]\memory_bb\.addr ;
  wire [63:0]memory_data;
  wire [0:0]old_grant;
  wire \old_grant[0]_i_3__0 ;
  wire \old_grant[0]_i_3__0_0 ;
  wire \old_grant[0]_i_5 ;
  wire \old_grant[0]_i_5_0 ;
  wire \old_grant[0]_i_5_1 ;
  wire \old_grant[0]_i_5_2 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire [5:0]start_cc_pointer_register_IBUF;
  wire \switch2channel\.valid ;
  wire \tail_reg[0] ;
  wire \tail_reg[0]_0 ;
  wire \tail_reg[4] ;
  wire \tail_reg[4]_0 ;

  cache_block_directly_mapped a_cache
       (.D({content_reg_bram_0,fifo_cur_char_data_out}),
        .E(FETCH_SEND_not_stall),
        .WEBWE(WEBWE),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_0(a_cache_n_6),
        .content_reg_1(a_cache_n_7),
        .content_reg_10(a_cache_n_16),
        .content_reg_11(a_cache_n_17),
        .content_reg_12(a_cache_n_18),
        .content_reg_13(a_cache_n_19),
        .content_reg_14(a_cache_n_20),
        .content_reg_15(a_cache_n_21),
        .content_reg_2(a_cache_n_8),
        .content_reg_3(a_cache_n_9),
        .content_reg_4(a_cache_n_10),
        .content_reg_5(a_cache_n_11),
        .content_reg_6(a_cache_n_12),
        .content_reg_7(a_cache_n_13),
        .content_reg_8(a_cache_n_14),
        .content_reg_9(a_cache_n_15),
        .curState(curState),
        .\curState_reg[0]_0 (a_cache_n_3),
        .\curState_reg[0]_1 (\old_grant_reg[0] ),
        .\curState_reg[0]_2 (\g.aregex_cpu_n_10 ),
        .\head_reg[0] (\g.aregex_cpu_n_19 ),
        .\head_reg[0]_0 (buffer_n_0),
        .\head_reg[0]_1 (buffer_n_5),
        .\memory_bb\.addr (\memory_bb\.addr ),
        .memory_data(memory_data),
        .p_0_in(\fifo_odd/p_0_in ),
        .p_0_in_0(\fifo_even/p_0_in ),
        .\tag_saved_reg[1]_0 (a_cache_n_2));
  ping_pong_buffer buffer
       (.D({\memory_bb\.addr ,content_reg_bram_0,fifo_cur_char_data_out}),
        .DINADIN(fifo_even_data_in),
        .E(fifo_odd_data_in_valid),
        .\FETCH_REC_Instr[15]_i_12 (\FETCH_REC_Instr[15]_i_12 ),
        .WEA(WEA),
        .\channel_old_latency_reg[2] (\channel_old_latency_reg[2] ),
        .\channel_old_latency_reg[2]_0 (\channel_old_latency_reg[2]_0 ),
        .\channel_old_latency_reg[2]_1 (\channel_old_latency_reg[2]_1 ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0(fifo_odd_data_in),
        .content_reg_bram_0_0(a_cache_n_3),
        .content_reg_bram_0_i_24__2(content_reg_bram_0_i_24__2),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_ccs_reg[25] (\cur_ccs_reg[25] ),
        .\cur_ccs_reg[57] (\cur_ccs_reg[57] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(buffer_n_0),
        .cur_is_even_character_reg_0(cur_is_even_character_reg),
        .cur_is_even_character_reg_1(buffer_n_5),
        .cur_is_even_character_reg_2(buffer_n_6),
        .cur_is_even_character_reg_3(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_4(cur_is_even_character_reg_1),
        .cur_is_even_character_reg_5(cur_is_even_character_reg_2),
        .cur_is_even_character_reg_6(cur_is_even_character_reg_3),
        .cur_is_even_character_reg_7(cur_is_even_character_reg_4),
        .\cur_state[2]_i_29 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [2:0]),
        .\cur_state_reg[0] (buffer_n_4),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (\g.aregex_cpu_n_52 ),
        .\cur_state_reg[0]_2 (\cur_state_reg[0] ),
        .\cur_state_reg[0]_3 (EXE2_Instr_valid_reg),
        .\cur_state_reg[1] (\cur_state_reg[1] ),
        .fifo_even_data_in_valid(fifo_even_data_in_valid),
        .\head[4]_i_4 (\FSM_sequential_status_register_reg[0]_2 ),
        .\head_reg[2] (\head_reg[2] ),
        .\head_reg[3] (\head_reg[3] ),
        .\head_reg[6] (\tail_reg[4] ),
        .\head_reg[6]_0 (\g.aregex_cpu_n_15 ),
        .p_0_in(\fifo_even/p_0_in ),
        .p_0_in_0(\fifo_odd/p_0_in ),
        .\state_cur_reg[0] (\g.aregex_cpu_n_16 ),
        .\state_cur_reg[2] (\old_grant_reg[0] ),
        .\tail_reg[0] (\tail_reg[0] ),
        .\tail_reg[0]_0 (\tail_reg[0]_0 ),
        .\tail_reg[6] (buffer_n_17));
  regex_cpu_pipelined \g.aregex_cpu 
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(CO),
        .D({\memory_bb\.addr ,content_reg_bram_0,fifo_cur_char_data_out}),
        .DINADIN(fifo_even_data_in),
        .E(FETCH_SEND_not_stall),
        .\EXE1_Instr_reg[0]_0 (a_cache_n_6),
        .\EXE1_Instr_reg[10]_0 (\EXE1_Instr_reg[10] ),
        .\EXE1_Instr_reg[10]_1 (\EXE1_Instr_reg[10]_0 ),
        .\EXE1_Instr_reg[10]_2 (a_cache_n_16),
        .\EXE1_Instr_reg[11]_0 (a_cache_n_17),
        .\EXE1_Instr_reg[12]_0 (a_cache_n_18),
        .\EXE1_Instr_reg[13]_0 (a_cache_n_19),
        .\EXE1_Instr_reg[14]_0 (a_cache_n_20),
        .\EXE1_Instr_reg[15]_0 (a_cache_n_21),
        .\EXE1_Instr_reg[1]_0 (\EXE1_Instr_reg[1] ),
        .\EXE1_Instr_reg[1]_1 (a_cache_n_7),
        .\EXE1_Instr_reg[2]_0 (\EXE1_Instr_reg[2] ),
        .\EXE1_Instr_reg[2]_1 (a_cache_n_8),
        .\EXE1_Instr_reg[3]_0 (\EXE1_Instr_reg[3] ),
        .\EXE1_Instr_reg[3]_1 (a_cache_n_9),
        .\EXE1_Instr_reg[4]_0 (\EXE1_Instr_reg[4] ),
        .\EXE1_Instr_reg[4]_1 (a_cache_n_10),
        .\EXE1_Instr_reg[5]_0 (\EXE1_Instr_reg[5] ),
        .\EXE1_Instr_reg[5]_1 (a_cache_n_11),
        .\EXE1_Instr_reg[6]_0 (\EXE1_Instr_reg[6] ),
        .\EXE1_Instr_reg[6]_1 (a_cache_n_12),
        .\EXE1_Instr_reg[7]_0 (a_cache_n_13),
        .\EXE1_Instr_reg[8]_0 (\EXE1_Instr_reg[8] ),
        .\EXE1_Instr_reg[8]_1 (a_cache_n_14),
        .\EXE1_Instr_reg[9]_0 (a_cache_n_15),
        .EXE1_Instr_valid(EXE1_Instr_valid),
        .EXE1_Instr_valid_reg_0(\g.aregex_cpu_n_19 ),
        .\EXE1_Pc_reg[0]_0 (\EXE1_Pc_reg[0] ),
        .\EXE1_Pc_reg[6]_0 (\EXE1_Pc_reg[6] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg),
        .EXE2_Instr_valid_reg_1(\g.aregex_cpu_n_15 ),
        .EXE2_Instr_valid_reg_2(EXE2_Instr_valid_reg_0),
        .EXE2_Instr_valid_reg_3(\g.aregex_cpu_n_52 ),
        .\FETCH_REC_Instr[15]_i_8_0 (\FETCH_REC_Instr[15]_i_8 ),
        .\FETCH_REC_Instr[15]_i_8_1 (\FETCH_REC_Instr[15]_i_8_0 ),
        .\FETCH_REC_Instr[15]_i_9_0 (\FETCH_REC_Instr[15]_i_9 ),
        .\FETCH_REC_Instr[15]_i_9_1 (\FETCH_REC_Instr[15]_i_9_0 ),
        .\FETCH_REC_Instr[15]_i_9_2 (\FETCH_REC_Instr[15]_i_9_1 ),
        .\FETCH_REC_Instr[15]_i_9_3 (\FETCH_REC_Instr[15]_i_9_2 ),
        .FETCH_REC_Instr_valid(FETCH_REC_Instr_valid),
        .FETCH_REC_Instr_valid_reg_0(a_cache_n_2),
        .FETCH_REC_Instr_valid_reg_1(buffer_n_0),
        .FETCH_REC_Instr_valid_reg_2(buffer_n_5),
        .FETCH_REC_Instr_valid_reg_3(\cur_state_reg[1] ),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0]_0 ),
        .\FSM_sequential_status_register_reg[0]_1 (\FSM_sequential_status_register_reg[0]_1 ),
        .\FSM_sequential_status_register_reg[0]_2 (\FSM_sequential_status_register_reg[0]_2 ),
        .\FSM_sequential_status_register_reg[0]_3 (\FSM_sequential_status_register_reg[0]_3 ),
        .O(O),
        .Q(Q),
        .WEA(WEA),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(content_reg_bram_0_0),
        .content_reg_bram_0_0(content_reg_bram_0_1),
        .content_reg_bram_0_1(content_reg_bram_0_2),
        .content_reg_bram_0_2(content_reg_bram_0_3),
        .content_reg_bram_0_3(content_reg_bram_0_4),
        .content_reg_bram_0_4(content_reg_bram_0_5),
        .content_reg_bram_0_5(content_reg_bram_0_6),
        .content_reg_bram_0_6(content_reg_bram_0_7),
        .content_reg_bram_0_7(buffer_n_17),
        .curState(curState),
        .\curState_reg[0] (\curState_reg[0] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(\g.aregex_cpu_n_16 ),
        .cur_is_even_character_reg_0(fifo_odd_data_in_valid),
        .cur_is_even_character_reg_1(fifo_odd_data_in),
        .cur_is_even_character_reg_2(cur_is_even_character_reg_5),
        .cur_is_even_character_reg_3(cur_is_even_character_reg_6),
        .\cur_state[2]_i_9 (\cur_state[2]_i_9 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_9_0 ),
        .\cur_state_reg[0] (E),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .fifo_even_data_in_valid(fifo_even_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [3:2]),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_0 (buffer_n_6),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_1 (\cur_state_reg[0] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .old_grant(old_grant),
        .\old_grant[0]_i_3__0_0 (\cur_cc_pointer_reg[2] ),
        .\old_grant[0]_i_3__0_1 (\cur_cc_pointer_reg[2]_0 ),
        .\old_grant[0]_i_3__0_2 (\old_grant[0]_i_3__0 ),
        .\old_grant[0]_i_3__0_3 (\old_grant[0]_i_3__0_0 ),
        .\old_grant[0]_i_5_0 (\old_grant[0]_i_5 ),
        .\old_grant[0]_i_5_1 (\old_grant[0]_i_5_0 ),
        .\old_grant[0]_i_5_2 (\old_grant[0]_i_5_1 ),
        .\old_grant[0]_i_5_3 (\old_grant[0]_i_5_2 ),
        .\old_grant_reg[0] (\g.aregex_cpu_n_10 ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0] ),
        .\old_grant_reg[0]_1 (buffer_n_4),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_0 ),
        .start_cc_pointer_register_IBUF(start_cc_pointer_register_IBUF),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[4] (\head_reg[3] ),
        .\tail_reg[4]_0 (\tail_reg[4] ),
        .\tail_reg[4]_1 (\tail_reg[4]_0 ));
endmodule

(* ORIG_REF_NAME = "engine" *) 
module engine_5
   (WEBWE,
    \cmd_register[1] ,
    FETCH_REC_Instr_valid_reg,
    EXE1_Instr_valid_reg,
    EXE2_Instr_valid,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ,
    D,
    \channel_old_latency_reg[3] ,
    cur_is_even_character_reg,
    EXE1_Instr_valid_reg_0,
    \cur_state_reg[0] ,
    \EXE1_Instr_reg[8] ,
    \head_reg[1] ,
    cur_is_even_character_reg_0,
    DI,
    S,
    cur_is_even_character_reg_1,
    EXE1_Instr_valid_reg_1,
    \head_reg[3] ,
    \old_grant_reg[0] ,
    \old_grant_reg[0]_0 ,
    \old_grant_reg[0]_1 ,
    \old_grant_reg[0]_2 ,
    \old_grant_reg[0]_3 ,
    \old_grant_reg[0]_4 ,
    \EXE2_Instr_reg[0] ,
    \EXE2_Instr_reg[1] ,
    \EXE2_Instr_reg[2] ,
    \EXE2_Instr_reg[3] ,
    \EXE2_Instr_reg[4] ,
    \EXE2_Instr_reg[5] ,
    \EXE2_Instr_reg[6] ,
    \EXE2_Pc_reg[7] ,
    DINADIN,
    \cur_state_reg[2] ,
    \switch2channel\.valid ,
    p_0_in,
    EXE1_Instr_valid_reg_2,
    \tail_reg[3] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_cc_pointer_reg[2]_1 ,
    \cur_cc_pointer_reg[2]_2 ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \cur_cc_pointer_reg[2]_3 ,
    \cur_cc_pointer_reg[2]_4 ,
    \cur_ccs_reg[26] ,
    \cur_ccs_reg[58] ,
    \cur_ccs_reg[27] ,
    \cur_ccs_reg[59] ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_state_reg[2]_0 ,
    clk_IBUF_BUFG,
    memory_data,
    cmd_register_IBUF,
    rst_IBUF,
    \channel_old_latency_reg[3]_0 ,
    cur_is_even_character,
    memory_addr_from_coprocessor_ready,
    old_grant,
    \curState_reg[0] ,
    CO,
    \cur_state_reg[0]_0 ,
    \cur_state_reg[0]_1 ,
    O,
    \cur_state_reg[0]_2 ,
    \channel_old_latency_reg[3]_1 ,
    \channel_old_latency_reg[3]_2 ,
    \channel_old_latency_reg[3]_3 ,
    \channel_old_latency_reg[5] ,
    min_latency1_carry,
    \tail_reg[0] ,
    \switch2channel\.ready_0 ,
    \switch2channel\.ready ,
    \cur_state[2]_i_9 ,
    \channel_old_latency_reg[3]_4 ,
    \channel_old_latency_reg[6] ,
    \channel_old_latency_reg[5]_0 ,
    \channel_old_latency_reg[6]_0 ,
    \channel_old_latency_reg[6]_1 ,
    \memory_bb\.addr ,
    content_reg_bram_0,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    \cur_state_reg[0]_3 ,
    \cur_state_reg[0]_4 ,
    \cur_state_reg[0]_5 ,
    \cur_state_reg[0]_6 ,
    \head_reg[0] ,
    \cur_state_reg[0]_7 ,
    \cur_state_reg[0]_8 ,
    \cur_state_reg[0]_9 ,
    \cur_state[2]_i_9_0 ,
    \old_grant[0]_i_2 ,
    \FETCH_REC_Instr[15]_i_7 ,
    \FETCH_REC_Instr[15]_i_14 ,
    \FETCH_REC_Instr[15]_i_8__0 ,
    \FETCH_REC_Instr[15]_i_8__0_0 );
  output [0:0]WEBWE;
  output \cmd_register[1] ;
  output FETCH_REC_Instr_valid_reg;
  output EXE1_Instr_valid_reg;
  output EXE2_Instr_valid;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  output [5:0]D;
  output \channel_old_latency_reg[3] ;
  output cur_is_even_character_reg;
  output EXE1_Instr_valid_reg_0;
  output [2:0]\cur_state_reg[0] ;
  output \EXE1_Instr_reg[8] ;
  output \head_reg[1] ;
  output cur_is_even_character_reg_0;
  output [1:0]DI;
  output [1:0]S;
  output cur_is_even_character_reg_1;
  output EXE1_Instr_valid_reg_1;
  output \head_reg[3] ;
  output \old_grant_reg[0] ;
  output \old_grant_reg[0]_0 ;
  output \old_grant_reg[0]_1 ;
  output \old_grant_reg[0]_2 ;
  output \old_grant_reg[0]_3 ;
  output \old_grant_reg[0]_4 ;
  output \EXE2_Instr_reg[0] ;
  output \EXE2_Instr_reg[1] ;
  output \EXE2_Instr_reg[2] ;
  output \EXE2_Instr_reg[3] ;
  output \EXE2_Instr_reg[4] ;
  output \EXE2_Instr_reg[5] ;
  output \EXE2_Instr_reg[6] ;
  output \EXE2_Pc_reg[7] ;
  output [0:0]DINADIN;
  output [0:0]\cur_state_reg[2] ;
  output \switch2channel\.valid ;
  output [0:0]p_0_in;
  output EXE1_Instr_valid_reg_2;
  output \tail_reg[3] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_cc_pointer_reg[2]_1 ;
  output \cur_cc_pointer_reg[2]_2 ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \cur_cc_pointer_reg[2]_3 ;
  output \cur_cc_pointer_reg[2]_4 ;
  output \cur_ccs_reg[26] ;
  output \cur_ccs_reg[58] ;
  output \cur_ccs_reg[27] ;
  output \cur_ccs_reg[59] ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_state_reg[2]_0 ;
  input clk_IBUF_BUFG;
  input [63:0]memory_data;
  input [31:0]cmd_register_IBUF;
  input rst_IBUF;
  input \channel_old_latency_reg[3]_0 ;
  input cur_is_even_character;
  input memory_addr_from_coprocessor_ready;
  input [0:0]old_grant;
  input \curState_reg[0] ;
  input [0:0]CO;
  input [2:0]\cur_state_reg[0]_0 ;
  input [3:0]\cur_state_reg[0]_1 ;
  input [0:0]O;
  input \cur_state_reg[0]_2 ;
  input [0:0]\channel_old_latency_reg[3]_1 ;
  input \channel_old_latency_reg[3]_2 ;
  input \channel_old_latency_reg[3]_3 ;
  input \channel_old_latency_reg[5] ;
  input min_latency1_carry;
  input \tail_reg[0] ;
  input \switch2channel\.ready_0 ;
  input \switch2channel\.ready ;
  input \cur_state[2]_i_9 ;
  input \channel_old_latency_reg[3]_4 ;
  input \channel_old_latency_reg[6] ;
  input \channel_old_latency_reg[5]_0 ;
  input \channel_old_latency_reg[6]_0 ;
  input \channel_old_latency_reg[6]_1 ;
  input [0:0]\memory_bb\.addr ;
  input content_reg_bram_0;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input \cur_state_reg[0]_3 ;
  input \cur_state_reg[0]_4 ;
  input \cur_state_reg[0]_5 ;
  input \cur_state_reg[0]_6 ;
  input \head_reg[0] ;
  input \cur_state_reg[0]_7 ;
  input \cur_state_reg[0]_8 ;
  input \cur_state_reg[0]_9 ;
  input \cur_state[2]_i_9_0 ;
  input \old_grant[0]_i_2 ;
  input \FETCH_REC_Instr[15]_i_7 ;
  input [47:0]\FETCH_REC_Instr[15]_i_14 ;
  input \FETCH_REC_Instr[15]_i_8__0 ;
  input \FETCH_REC_Instr[15]_i_8__0_0 ;

  wire [0:0]CO;
  wire [5:0]D;
  wire [1:0]DI;
  wire [0:0]DINADIN;
  wire \EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid_reg;
  wire EXE1_Instr_valid_reg_0;
  wire EXE1_Instr_valid_reg_1;
  wire EXE1_Instr_valid_reg_2;
  wire \EXE2_Instr_reg[0] ;
  wire \EXE2_Instr_reg[1] ;
  wire \EXE2_Instr_reg[2] ;
  wire \EXE2_Instr_reg[3] ;
  wire \EXE2_Instr_reg[4] ;
  wire \EXE2_Instr_reg[5] ;
  wire \EXE2_Instr_reg[6] ;
  wire EXE2_Instr_valid;
  wire \EXE2_Pc_reg[7] ;
  wire [47:0]\FETCH_REC_Instr[15]_i_14 ;
  wire \FETCH_REC_Instr[15]_i_7 ;
  wire \FETCH_REC_Instr[15]_i_8__0 ;
  wire \FETCH_REC_Instr[15]_i_8__0_0 ;
  wire FETCH_REC_Instr_valid_reg;
  wire FETCH_SEND_not_stall;
  wire [0:0]O;
  wire [1:0]S;
  wire [0:0]WEBWE;
  wire a_cache_n_10;
  wire a_cache_n_11;
  wire a_cache_n_12;
  wire a_cache_n_13;
  wire a_cache_n_14;
  wire a_cache_n_15;
  wire a_cache_n_16;
  wire a_cache_n_17;
  wire a_cache_n_18;
  wire a_cache_n_19;
  wire a_cache_n_2;
  wire a_cache_n_20;
  wire a_cache_n_21;
  wire a_cache_n_22;
  wire a_cache_n_23;
  wire a_cache_n_3;
  wire a_cache_n_7;
  wire a_cache_n_8;
  wire a_cache_n_9;
  wire [0:0]\arbiter_output_pc_port/arbiter/in_ready_packed ;
  wire buffer_n_17;
  wire buffer_n_18;
  wire buffer_n_19;
  wire buffer_n_20;
  wire buffer_n_21;
  wire buffer_n_22;
  wire buffer_n_38;
  wire buffer_n_43;
  wire buffer_n_44;
  wire buffer_n_46;
  wire buffer_n_47;
  wire buffer_n_57;
  wire buffer_n_59;
  wire buffer_n_9;
  wire \channel_old_latency_reg[3] ;
  wire \channel_old_latency_reg[3]_0 ;
  wire [0:0]\channel_old_latency_reg[3]_1 ;
  wire \channel_old_latency_reg[3]_2 ;
  wire \channel_old_latency_reg[3]_3 ;
  wire \channel_old_latency_reg[3]_4 ;
  wire \channel_old_latency_reg[5] ;
  wire \channel_old_latency_reg[5]_0 ;
  wire \channel_old_latency_reg[6] ;
  wire \channel_old_latency_reg[6]_0 ;
  wire \channel_old_latency_reg[6]_1 ;
  wire clk_IBUF_BUFG;
  wire \cmd_register[1] ;
  wire [31:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_cc_pointer_reg[2]_1 ;
  wire \cur_cc_pointer_reg[2]_2 ;
  wire \cur_cc_pointer_reg[2]_3 ;
  wire \cur_cc_pointer_reg[2]_4 ;
  wire \cur_ccs_reg[26] ;
  wire \cur_ccs_reg[27] ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[58] ;
  wire \cur_ccs_reg[59] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[2]_i_9 ;
  wire \cur_state[2]_i_9_0 ;
  wire [2:0]\cur_state_reg[0] ;
  wire [2:0]\cur_state_reg[0]_0 ;
  wire [3:0]\cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire \cur_state_reg[0]_3 ;
  wire \cur_state_reg[0]_4 ;
  wire \cur_state_reg[0]_5 ;
  wire \cur_state_reg[0]_6 ;
  wire \cur_state_reg[0]_7 ;
  wire \cur_state_reg[0]_8 ;
  wire \cur_state_reg[0]_9 ;
  wire [0:0]\cur_state_reg[2] ;
  wire \cur_state_reg[2]_0 ;
  wire [1:0]fifo_cur_char_data_out;
  wire [0:0]\fifo_even/p_0_in ;
  wire [7:0]fifo_even_data_in;
  wire fifo_even_data_in_ready;
  wire fifo_even_data_in_valid;
  wire [0:0]\fifo_odd/p_0_in ;
  wire [7:0]fifo_odd_data_in;
  wire fifo_odd_data_in_valid;
  wire \g.aregex_cpu_n_41 ;
  wire \g.aregex_cpu_n_47 ;
  wire \g.aregex_cpu_n_48 ;
  wire \g.aregex_cpu_n_6 ;
  wire \g.aregex_cpu_n_7 ;
  wire \g.aregex_cpu_n_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  wire \head_reg[0] ;
  wire \head_reg[1] ;
  wire \head_reg[3] ;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]\memory_bb\.addr ;
  wire [63:0]memory_data;
  wire min_latency1_carry;
  wire [0:0]old_grant;
  wire \old_grant[0]_i_2 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire [0:0]p_0_in;
  wire [5:0]p_21_out;
  wire rst_IBUF;
  wire \switch2channel\.ready ;
  wire \switch2channel\.ready_0 ;
  wire \switch2channel\.valid ;
  wire \tail_reg[0] ;
  wire \tail_reg[3] ;

  cache_block_directly_mapped_6 a_cache
       (.D(fifo_cur_char_data_out),
        .E(FETCH_SEND_not_stall),
        .WEBWE(WEBWE),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_0(a_cache_n_8),
        .content_reg_1(a_cache_n_9),
        .content_reg_10(a_cache_n_18),
        .content_reg_11(a_cache_n_19),
        .content_reg_12(a_cache_n_20),
        .content_reg_13(a_cache_n_21),
        .content_reg_14(a_cache_n_22),
        .content_reg_15(a_cache_n_23),
        .content_reg_2(a_cache_n_10),
        .content_reg_3(a_cache_n_11),
        .content_reg_4(a_cache_n_12),
        .content_reg_5(a_cache_n_13),
        .content_reg_6(a_cache_n_14),
        .content_reg_7(a_cache_n_15),
        .content_reg_8(a_cache_n_16),
        .content_reg_9(a_cache_n_17),
        .curState(curState),
        .\curState_reg[0]_0 (a_cache_n_7),
        .\curState_reg[0]_1 (\g.aregex_cpu_n_8 ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(a_cache_n_2),
        .\head_reg[0] (\g.aregex_cpu_n_47 ),
        .\head_reg[0]_0 (buffer_n_9),
        .\is_present_reg[0]_0 (\cmd_register[1] ),
        .memory_data(memory_data),
        .p_0_in(\fifo_odd/p_0_in ),
        .p_0_in_0(\fifo_even/p_0_in ),
        .p_21_out(p_21_out),
        .\tag_saved_reg[1]_0 (a_cache_n_3));
  ping_pong_buffer_7 buffer
       (.CO(CO),
        .D(D),
        .DI(DI),
        .DINADIN(fifo_even_data_in),
        .E(fifo_even_data_in_valid),
        .\FETCH_REC_Instr[15]_i_14 (\FETCH_REC_Instr[15]_i_14 ),
        .\FETCH_REC_Instr[15]_i_3 (\g.aregex_cpu_n_7 ),
        .\FETCH_REC_Instr[15]_i_3_0 (\g.aregex_cpu_n_48 ),
        .O(O),
        .S(S),
        .SR(\cmd_register[1] ),
        .\channel_old_latency_reg[3] (\channel_old_latency_reg[3] ),
        .\channel_old_latency_reg[3]_0 (\channel_old_latency_reg[3]_0 ),
        .\channel_old_latency_reg[3]_1 (\channel_old_latency_reg[3]_1 ),
        .\channel_old_latency_reg[3]_2 (\channel_old_latency_reg[3]_2 ),
        .\channel_old_latency_reg[3]_3 (\channel_old_latency_reg[3]_3 ),
        .\channel_old_latency_reg[3]_4 (\channel_old_latency_reg[3]_4 ),
        .\channel_old_latency_reg[5] (\channel_old_latency_reg[5] ),
        .\channel_old_latency_reg[5]_0 (\channel_old_latency_reg[5]_0 ),
        .\channel_old_latency_reg[6] (\channel_old_latency_reg[6] ),
        .\channel_old_latency_reg[6]_0 (\channel_old_latency_reg[6]_0 ),
        .\channel_old_latency_reg[6]_1 (\channel_old_latency_reg[6]_1 ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0(fifo_odd_data_in),
        .content_reg_bram_0_0(EXE1_Instr_valid_reg_1),
        .content_reg_bram_0_1(a_cache_n_7),
        .curState(curState),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2]_2 ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_3 ),
        .\cur_cc_pointer_reg[2]_1 (\cur_cc_pointer_reg[2]_4 ),
        .\cur_cc_pointer_reg[2]_2 (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_3 (\cur_cc_pointer_reg[2]_1 ),
        .\cur_cc_pointer_reg[2]_4 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[3] (buffer_n_59),
        .\cur_ccs_reg[26] (\cur_ccs_reg[26] ),
        .\cur_ccs_reg[27] (\cur_ccs_reg[27] ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[30] (buffer_n_46),
        .\cur_ccs_reg[31] (buffer_n_43),
        .\cur_ccs_reg[58] (\cur_ccs_reg[58] ),
        .\cur_ccs_reg[59] (\cur_ccs_reg[59] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .\cur_ccs_reg[62] (buffer_n_47),
        .\cur_ccs_reg[63] (buffer_n_44),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .\cur_state[2]_i_9 (\cur_state[2]_i_9 ),
        .\cur_state_reg[0] (buffer_n_57),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (\cur_state_reg[0]_1 ),
        .\cur_state_reg[1] (buffer_n_38),
        .\cur_state_reg[2] (\cur_state_reg[2]_0 ),
        .fifo_even_data_in_ready(fifo_even_data_in_ready),
        .fifo_odd_data_in_valid(fifo_odd_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\curState_reg[0] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (EXE1_Instr_valid_reg_0),
        .\head_reg[1] (\head_reg[1] ),
        .\head_reg[3] (buffer_n_9),
        .\head_reg[3]_0 (buffer_n_17),
        .\head_reg[3]_1 (buffer_n_18),
        .\head_reg[3]_2 (buffer_n_19),
        .\head_reg[3]_3 (buffer_n_20),
        .\head_reg[3]_4 (buffer_n_21),
        .\head_reg[3]_5 (buffer_n_22),
        .\head_reg[3]_6 (\head_reg[3] ),
        .in_ready_packed(\arbiter_output_pc_port/arbiter/in_ready_packed ),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .\memory_bb\.addr (\memory_bb\.addr ),
        .min_latency1_carry(min_latency1_carry),
        .old_grant(old_grant),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_3 ),
        .\old_grant_reg[0]_4 (\old_grant_reg[0]_4 ),
        .p_0_in(\fifo_odd/p_0_in ),
        .p_0_in_0(\fifo_even/p_0_in ),
        .\state_cur_reg[0] (\g.aregex_cpu_n_47 ),
        .\state_cur_reg[0]_0 (a_cache_n_3),
        .\state_cur_reg[0]_1 (a_cache_n_2),
        .\state_cur_reg[1] ({p_21_out,fifo_cur_char_data_out}),
        .\state_cur_reg[2] (\g.aregex_cpu_n_41 ),
        .\switch2channel\.ready (\switch2channel\.ready ),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\tail_reg[3] (\tail_reg[3] ),
        .\tail_reg[4] (\tail_reg[0] ),
        .\tail_reg[4]_0 (\g.aregex_cpu_n_6 ));
  regex_cpu_pipelined_8 \g.aregex_cpu 
       (.CO(CO),
        .D({p_21_out,fifo_cur_char_data_out}),
        .DINADIN(fifo_even_data_in),
        .E(FETCH_SEND_not_stall),
        .\EXE1_Instr_reg[0]_0 (a_cache_n_8),
        .\EXE1_Instr_reg[10]_0 (DINADIN),
        .\EXE1_Instr_reg[10]_1 (a_cache_n_18),
        .\EXE1_Instr_reg[11]_0 (a_cache_n_19),
        .\EXE1_Instr_reg[12]_0 (a_cache_n_20),
        .\EXE1_Instr_reg[13]_0 (a_cache_n_21),
        .\EXE1_Instr_reg[14]_0 (a_cache_n_22),
        .\EXE1_Instr_reg[15]_0 (a_cache_n_23),
        .\EXE1_Instr_reg[1]_0 (a_cache_n_9),
        .\EXE1_Instr_reg[2]_0 (a_cache_n_10),
        .\EXE1_Instr_reg[3]_0 (a_cache_n_11),
        .\EXE1_Instr_reg[4]_0 (a_cache_n_12),
        .\EXE1_Instr_reg[5]_0 (a_cache_n_13),
        .\EXE1_Instr_reg[6]_0 (a_cache_n_14),
        .\EXE1_Instr_reg[7]_0 (a_cache_n_15),
        .\EXE1_Instr_reg[8]_0 (\EXE1_Instr_reg[8] ),
        .\EXE1_Instr_reg[8]_1 (a_cache_n_16),
        .\EXE1_Instr_reg[9]_0 (a_cache_n_17),
        .EXE1_Instr_valid_reg_0(EXE1_Instr_valid_reg),
        .EXE1_Instr_valid_reg_1(\g.aregex_cpu_n_6 ),
        .EXE1_Instr_valid_reg_2(EXE1_Instr_valid_reg_0),
        .EXE1_Instr_valid_reg_3(EXE1_Instr_valid_reg_1),
        .EXE1_Instr_valid_reg_4(EXE1_Instr_valid_reg_2),
        .EXE1_Instr_valid_reg_5(\g.aregex_cpu_n_48 ),
        .\EXE2_Instr_reg[0]_0 (\EXE2_Instr_reg[0] ),
        .\EXE2_Instr_reg[13]_0 (\g.aregex_cpu_n_7 ),
        .\EXE2_Instr_reg[1]_0 (\EXE2_Instr_reg[1] ),
        .\EXE2_Instr_reg[2]_0 (\EXE2_Instr_reg[2] ),
        .\EXE2_Instr_reg[3]_0 (\EXE2_Instr_reg[3] ),
        .\EXE2_Instr_reg[4]_0 (\EXE2_Instr_reg[4] ),
        .\EXE2_Instr_reg[5]_0 (\EXE2_Instr_reg[5] ),
        .\EXE2_Instr_reg[6]_0 (\EXE2_Instr_reg[6] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .\EXE2_Pc_reg[7]_0 (\EXE2_Pc_reg[7] ),
        .\FETCH_REC_Instr[15]_i_7_0 (\cur_cc_pointer_reg[2]_2 ),
        .\FETCH_REC_Instr[15]_i_7_1 (\FETCH_REC_Instr[15]_i_7 ),
        .\FETCH_REC_Instr[15]_i_8__0_0 (\FETCH_REC_Instr[15]_i_8__0 ),
        .\FETCH_REC_Instr[15]_i_8__0_1 (\FETCH_REC_Instr[15]_i_8__0_0 ),
        .\FETCH_REC_Instr[15]_i_8__0_10 (\cur_ccs_reg[29] ),
        .\FETCH_REC_Instr[15]_i_8__0_11 (\cur_ccs_reg[61] ),
        .\FETCH_REC_Instr[15]_i_8__0_2 (buffer_n_43),
        .\FETCH_REC_Instr[15]_i_8__0_3 (buffer_n_44),
        .\FETCH_REC_Instr[15]_i_8__0_4 (buffer_n_46),
        .\FETCH_REC_Instr[15]_i_8__0_5 (buffer_n_47),
        .\FETCH_REC_Instr[15]_i_8__0_6 (\cur_ccs_reg[26] ),
        .\FETCH_REC_Instr[15]_i_8__0_7 (\cur_ccs_reg[58] ),
        .\FETCH_REC_Instr[15]_i_8__0_8 (\cur_ccs_reg[27] ),
        .\FETCH_REC_Instr[15]_i_8__0_9 (\cur_ccs_reg[59] ),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg),
        .FETCH_REC_Instr_valid_reg_1(\g.aregex_cpu_n_47 ),
        .FETCH_REC_Instr_valid_reg_2(a_cache_n_7),
        .FETCH_REC_Instr_valid_reg_3(buffer_n_17),
        .O(O),
        .SR(\cmd_register[1] ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(buffer_n_18),
        .content_reg_bram_0_0(content_reg_bram_0),
        .content_reg_bram_0_1(content_reg_bram_0_0),
        .content_reg_bram_0_10(buffer_n_20),
        .content_reg_bram_0_2(content_reg_bram_0_1),
        .content_reg_bram_0_3(content_reg_bram_0_2),
        .content_reg_bram_0_4(content_reg_bram_0_3),
        .content_reg_bram_0_5(content_reg_bram_0_4),
        .content_reg_bram_0_6(content_reg_bram_0_5),
        .content_reg_bram_0_7(content_reg_bram_0_6),
        .content_reg_bram_0_8(content_reg_bram_0_7),
        .content_reg_bram_0_9(buffer_n_22),
        .curState(curState),
        .\curState_reg[0] (\curState_reg[0] ),
        .\curState_reg[0]_0 (buffer_n_57),
        .\curState_reg[0]_1 (a_cache_n_3),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(fifo_odd_data_in),
        .cur_is_even_character_reg_0(fifo_even_data_in_valid),
        .cur_is_even_character_reg_1(\g.aregex_cpu_n_41 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_9_0 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (\cur_state_reg[0]_1 [3:2]),
        .\cur_state_reg[0]_10 (\cur_state_reg[0]_8 ),
        .\cur_state_reg[0]_11 (\cur_state_reg[0]_9 ),
        .\cur_state_reg[0]_2 (\cur_state_reg[0]_2 ),
        .\cur_state_reg[0]_3 (\cur_state_reg[0]_3 ),
        .\cur_state_reg[0]_4 (\cur_state_reg[0]_4 ),
        .\cur_state_reg[0]_5 (buffer_n_38),
        .\cur_state_reg[0]_6 (\cur_state_reg[0]_5 ),
        .\cur_state_reg[0]_7 (\cur_state_reg[0]_6 ),
        .\cur_state_reg[0]_8 (buffer_n_59),
        .\cur_state_reg[0]_9 (\cur_state_reg[0]_7 ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\cur_state_reg[2]_0 (buffer_n_19),
        .fifo_even_data_in_ready(fifo_even_data_in_ready),
        .fifo_odd_data_in_valid(fifo_odd_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .\head_reg[0] (\tail_reg[3] ),
        .\head_reg[0]_0 (\head_reg[0] ),
        .in_ready_packed(\arbiter_output_pc_port/arbiter/in_ready_packed ),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .old_grant(old_grant),
        .\old_grant[0]_i_2_0 (\old_grant[0]_i_2 ),
        .\old_grant[0]_i_2_1 (\cur_cc_pointer_reg[2] ),
        .\old_grant[0]_i_2_2 (\cur_cc_pointer_reg[2]_0 ),
        .\old_grant[0]_i_2_3 (\cur_cc_pointer_reg[2]_1 ),
        .\old_grant[0]_i_2_4 (\cur_cc_pointer_reg[2]_3 ),
        .\old_grant[0]_i_2_5 (\cur_cc_pointer_reg[2]_4 ),
        .\old_grant_reg[0] (\g.aregex_cpu_n_8 ),
        .p_0_in(p_0_in),
        .rst_IBUF(rst_IBUF),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[0] (\tail_reg[0] ),
        .\tail_reg[4] (buffer_n_21));
endmodule

module engine_and_station
   (WEBWE,
    \cmd_register[1] ,
    FETCH_REC_Instr_valid,
    EXE1_Instr_valid,
    EXE2_Instr_valid,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ,
    D,
    EXE1_Instr_valid_reg,
    \cur_state_reg[0] ,
    \EXE1_Instr_reg[8] ,
    EXE1_Instr_valid_reg_0,
    \head_reg[3] ,
    \old_grant_reg[0] ,
    \old_grant_reg[0]_0 ,
    \old_grant_reg[0]_1 ,
    \old_grant_reg[0]_2 ,
    \old_grant_reg[0]_3 ,
    \old_grant_reg[0]_4 ,
    \EXE2_Instr_reg[0] ,
    \EXE2_Instr_reg[1] ,
    \EXE2_Instr_reg[2] ,
    \EXE2_Instr_reg[3] ,
    \EXE2_Instr_reg[4] ,
    \EXE2_Instr_reg[5] ,
    \EXE2_Instr_reg[6] ,
    \EXE2_Pc_reg[7] ,
    \cur_state_reg[2] ,
    EXE1_Instr_valid_reg_1,
    \tail_reg[3] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_cc_pointer_reg[2]_1 ,
    content_reg_bram_0,
    \cur_cc_pointer_reg[2]_2 ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \cur_cc_pointer_reg[2]_3 ,
    \cur_cc_pointer_reg[2]_4 ,
    \cur_ccs_reg[26] ,
    \cur_ccs_reg[58] ,
    \cur_ccs_reg[27] ,
    \cur_ccs_reg[59] ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \head_reg[2] ,
    \cur_state_reg[2]_0 ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    clk_IBUF_BUFG,
    memory_data,
    DINADIN,
    cmd_register_IBUF,
    rst_IBUF,
    cur_is_even_character,
    E,
    \state_cur_reg[0] ,
    memory_addr_from_coprocessor_ready,
    old_grant,
    \curState_reg[0] ,
    CO,
    \cur_state_reg[0]_0 ,
    \cur_state_reg[0]_1 ,
    O,
    \cur_state_reg[0]_2 ,
    \tail_reg[0] ,
    \switch2channel\.ready ,
    \cur_state[2]_i_9 ,
    \memory_bb\.addr ,
    content_reg_bram_0_9,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    \cur_state_reg[0]_3 ,
    \cur_state_reg[0]_4 ,
    \cur_state_reg[0]_5 ,
    \cur_state_reg[0]_6 ,
    \head_reg[0] ,
    \cur_state_reg[0]_7 ,
    \cur_state_reg[0]_8 ,
    \cur_state_reg[0]_9 ,
    \cur_state[2]_i_9_0 ,
    \old_grant[0]_i_2 ,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    content_reg_bram_0_20,
    content_reg_bram_0_21,
    content_reg_bram_0_22,
    content_reg_bram_0_23,
    content_reg_bram_0_24,
    content_reg_bram_0_25,
    content_reg_bram_0_26,
    content_reg_bram_0_27,
    \FETCH_REC_Instr[15]_i_7 ,
    \FETCH_REC_Instr[15]_i_14 ,
    \FETCH_REC_Instr[15]_i_8__0 ,
    \FETCH_REC_Instr[15]_i_8__0_0 ,
    \channel_old_latency_reg[6] );
  output [0:0]WEBWE;
  output \cmd_register[1] ;
  output FETCH_REC_Instr_valid;
  output EXE1_Instr_valid;
  output EXE2_Instr_valid;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  output [6:0]D;
  output EXE1_Instr_valid_reg;
  output [2:0]\cur_state_reg[0] ;
  output \EXE1_Instr_reg[8] ;
  output EXE1_Instr_valid_reg_0;
  output \head_reg[3] ;
  output \old_grant_reg[0] ;
  output \old_grant_reg[0]_0 ;
  output \old_grant_reg[0]_1 ;
  output \old_grant_reg[0]_2 ;
  output \old_grant_reg[0]_3 ;
  output \old_grant_reg[0]_4 ;
  output \EXE2_Instr_reg[0] ;
  output \EXE2_Instr_reg[1] ;
  output \EXE2_Instr_reg[2] ;
  output \EXE2_Instr_reg[3] ;
  output \EXE2_Instr_reg[4] ;
  output \EXE2_Instr_reg[5] ;
  output \EXE2_Instr_reg[6] ;
  output \EXE2_Pc_reg[7] ;
  output [0:0]\cur_state_reg[2] ;
  output EXE1_Instr_valid_reg_1;
  output \tail_reg[3] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_cc_pointer_reg[2]_1 ;
  output [8:0]content_reg_bram_0;
  output \cur_cc_pointer_reg[2]_2 ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \cur_cc_pointer_reg[2]_3 ;
  output \cur_cc_pointer_reg[2]_4 ;
  output \cur_ccs_reg[26] ;
  output \cur_ccs_reg[58] ;
  output \cur_ccs_reg[27] ;
  output \cur_ccs_reg[59] ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \head_reg[2] ;
  output \cur_state_reg[2]_0 ;
  output content_reg_bram_0_0;
  output content_reg_bram_0_1;
  output content_reg_bram_0_2;
  output content_reg_bram_0_3;
  output content_reg_bram_0_4;
  output content_reg_bram_0_5;
  output content_reg_bram_0_6;
  output content_reg_bram_0_7;
  output content_reg_bram_0_8;
  input clk_IBUF_BUFG;
  input [63:0]memory_data;
  input [7:0]DINADIN;
  input [31:0]cmd_register_IBUF;
  input rst_IBUF;
  input cur_is_even_character;
  input [0:0]E;
  input \state_cur_reg[0] ;
  input memory_addr_from_coprocessor_ready;
  input [0:0]old_grant;
  input \curState_reg[0] ;
  input [0:0]CO;
  input [2:0]\cur_state_reg[0]_0 ;
  input [3:0]\cur_state_reg[0]_1 ;
  input [0:0]O;
  input \cur_state_reg[0]_2 ;
  input \tail_reg[0] ;
  input \switch2channel\.ready ;
  input \cur_state[2]_i_9 ;
  input [0:0]\memory_bb\.addr ;
  input content_reg_bram_0_9;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input \cur_state_reg[0]_3 ;
  input \cur_state_reg[0]_4 ;
  input \cur_state_reg[0]_5 ;
  input \cur_state_reg[0]_6 ;
  input \head_reg[0] ;
  input \cur_state_reg[0]_7 ;
  input \cur_state_reg[0]_8 ;
  input \cur_state_reg[0]_9 ;
  input \cur_state[2]_i_9_0 ;
  input \old_grant[0]_i_2 ;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input content_reg_bram_0_20;
  input content_reg_bram_0_21;
  input content_reg_bram_0_22;
  input content_reg_bram_0_23;
  input content_reg_bram_0_24;
  input content_reg_bram_0_25;
  input content_reg_bram_0_26;
  input content_reg_bram_0_27;
  input \FETCH_REC_Instr[15]_i_7 ;
  input [47:0]\FETCH_REC_Instr[15]_i_14 ;
  input \FETCH_REC_Instr[15]_i_8__0 ;
  input \FETCH_REC_Instr[15]_i_8__0_0 ;
  input [6:0]\channel_old_latency_reg[6] ;

  wire [0:0]CO;
  wire [6:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid;
  wire EXE1_Instr_valid_reg;
  wire EXE1_Instr_valid_reg_0;
  wire EXE1_Instr_valid_reg_1;
  wire \EXE2_Instr_reg[0] ;
  wire \EXE2_Instr_reg[1] ;
  wire \EXE2_Instr_reg[2] ;
  wire \EXE2_Instr_reg[3] ;
  wire \EXE2_Instr_reg[4] ;
  wire \EXE2_Instr_reg[5] ;
  wire \EXE2_Instr_reg[6] ;
  wire EXE2_Instr_valid;
  wire \EXE2_Pc_reg[7] ;
  wire [47:0]\FETCH_REC_Instr[15]_i_14 ;
  wire \FETCH_REC_Instr[15]_i_7 ;
  wire \FETCH_REC_Instr[15]_i_8__0 ;
  wire \FETCH_REC_Instr[15]_i_8__0_0 ;
  wire FETCH_REC_Instr_valid;
  wire [0:0]O;
  wire [0:0]WEBWE;
  wire aChannel_n_1;
  wire aChannel_n_10;
  wire aChannel_n_2;
  wire aChannel_n_20;
  wire aChannel_n_21;
  wire aChannel_n_22;
  wire aChannel_n_24;
  wire aChannel_n_3;
  wire aChannel_n_4;
  wire aChannel_n_5;
  wire aChannel_n_7;
  wire aChannel_n_8;
  wire aChannel_n_9;
  wire anEngine_n_12;
  wire anEngine_n_13;
  wire anEngine_n_19;
  wire anEngine_n_20;
  wire anEngine_n_21;
  wire anEngine_n_22;
  wire anEngine_n_23;
  wire anEngine_n_24;
  wire anEngine_n_25;
  wire [6:0]\channel_old_latency_reg[6] ;
  wire clk_IBUF_BUFG;
  wire \cmd_register[1] ;
  wire [31:0]cmd_register_IBUF;
  wire [8:0]content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_20;
  wire content_reg_bram_0_21;
  wire content_reg_bram_0_22;
  wire content_reg_bram_0_23;
  wire content_reg_bram_0_24;
  wire content_reg_bram_0_25;
  wire content_reg_bram_0_26;
  wire content_reg_bram_0_27;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire \curState_reg[0] ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_cc_pointer_reg[2]_1 ;
  wire \cur_cc_pointer_reg[2]_2 ;
  wire \cur_cc_pointer_reg[2]_3 ;
  wire \cur_cc_pointer_reg[2]_4 ;
  wire \cur_ccs_reg[26] ;
  wire \cur_ccs_reg[27] ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[58] ;
  wire \cur_ccs_reg[59] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire \cur_state[2]_i_9 ;
  wire \cur_state[2]_i_9_0 ;
  wire [2:0]\cur_state_reg[0] ;
  wire [2:0]\cur_state_reg[0]_0 ;
  wire [3:0]\cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire \cur_state_reg[0]_3 ;
  wire \cur_state_reg[0]_4 ;
  wire \cur_state_reg[0]_5 ;
  wire \cur_state_reg[0]_6 ;
  wire \cur_state_reg[0]_7 ;
  wire \cur_state_reg[0]_8 ;
  wire \cur_state_reg[0]_9 ;
  wire [0:0]\cur_state_reg[2] ;
  wire \cur_state_reg[2]_0 ;
  wire [1:1]\fifo_channel/p_0_in ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  wire \head_reg[0] ;
  wire \head_reg[2] ;
  wire \head_reg[3] ;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]\memory_bb\.addr ;
  wire [63:0]memory_data;
  wire [0:0]old_grant;
  wire \old_grant[0]_i_2 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire rst_IBUF;
  wire \state_cur_reg[0] ;
  wire station_n_0;
  wire [0:0]\switch2channel\.data ;
  wire \switch2channel\.ready ;
  wire \switch2channel\.ready_0 ;
  wire \switch2channel\.valid ;
  wire \tail_reg[0] ;
  wire \tail_reg[3] ;

  channel_2 aChannel
       (.CO(station_n_0),
        .D(D[0]),
        .DI(aChannel_n_20),
        .DINADIN({DINADIN,\switch2channel\.data }),
        .E(E),
        .S({aChannel_n_4,aChannel_n_5}),
        .SR(\cmd_register[1] ),
        .\channel_old_latency[6]_i_5 (anEngine_n_13),
        .\channel_old_latency_reg[0]_0 (anEngine_n_25),
        .\channel_old_latency_reg[0]_1 (anEngine_n_12),
        .\channel_old_latency_reg[2]_0 (aChannel_n_24),
        .\channel_old_latency_reg[3]_0 (aChannel_n_2),
        .\channel_old_latency_reg[3]_1 (aChannel_n_21),
        .\channel_old_latency_reg[5]_0 (aChannel_n_3),
        .\channel_old_latency_reg[5]_1 (aChannel_n_9),
        .\channel_old_latency_reg[5]_2 (aChannel_n_10),
        .\channel_old_latency_reg[5]_3 (aChannel_n_22),
        .\channel_old_latency_reg[6]_0 (\channel_old_latency_reg[6] ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .content_reg_bram_0_1(content_reg_bram_0_1),
        .content_reg_bram_0_10(content_reg_bram_0_19),
        .content_reg_bram_0_11(content_reg_bram_0_20),
        .content_reg_bram_0_12(content_reg_bram_0_21),
        .content_reg_bram_0_13(content_reg_bram_0_22),
        .content_reg_bram_0_14(content_reg_bram_0_23),
        .content_reg_bram_0_15(content_reg_bram_0_24),
        .content_reg_bram_0_16(content_reg_bram_0_25),
        .content_reg_bram_0_17(content_reg_bram_0_26),
        .content_reg_bram_0_18(content_reg_bram_0_27),
        .content_reg_bram_0_2(content_reg_bram_0_2),
        .content_reg_bram_0_3(content_reg_bram_0_3),
        .content_reg_bram_0_4(content_reg_bram_0_4),
        .content_reg_bram_0_5(content_reg_bram_0_5),
        .content_reg_bram_0_6(content_reg_bram_0_6),
        .content_reg_bram_0_7(content_reg_bram_0_7),
        .content_reg_bram_0_8(content_reg_bram_0_8),
        .content_reg_bram_0_9(content_reg_bram_0_18),
        .\head_reg[0] (aChannel_n_7),
        .\head_reg[0]_0 (aChannel_n_8),
        .\head_reg[2] (\head_reg[2] ),
        .min_latency1_carry(anEngine_n_20),
        .min_latency1_carry_0(anEngine_n_19),
        .p_0_in(\fifo_channel/p_0_in ),
        .\state_cur_reg[0] (\state_cur_reg[0] ),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[1] (aChannel_n_1));
  engine_interfaced_3 anEngine
       (.CO(CO),
        .D(D[6:1]),
        .DI({anEngine_n_21,anEngine_n_22}),
        .DINADIN(\switch2channel\.data ),
        .\EXE1_Instr_reg[8] (\EXE1_Instr_reg[8] ),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid),
        .EXE1_Instr_valid_reg_0(EXE1_Instr_valid_reg),
        .EXE1_Instr_valid_reg_1(EXE1_Instr_valid_reg_0),
        .EXE1_Instr_valid_reg_2(EXE1_Instr_valid_reg_1),
        .\EXE2_Instr_reg[0] (\EXE2_Instr_reg[0] ),
        .\EXE2_Instr_reg[1] (\EXE2_Instr_reg[1] ),
        .\EXE2_Instr_reg[2] (\EXE2_Instr_reg[2] ),
        .\EXE2_Instr_reg[3] (\EXE2_Instr_reg[3] ),
        .\EXE2_Instr_reg[4] (\EXE2_Instr_reg[4] ),
        .\EXE2_Instr_reg[5] (\EXE2_Instr_reg[5] ),
        .\EXE2_Instr_reg[6] (\EXE2_Instr_reg[6] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .\EXE2_Pc_reg[7] (\EXE2_Pc_reg[7] ),
        .\FETCH_REC_Instr[15]_i_14 (\FETCH_REC_Instr[15]_i_14 ),
        .\FETCH_REC_Instr[15]_i_7 (\FETCH_REC_Instr[15]_i_7 ),
        .\FETCH_REC_Instr[15]_i_8__0 (\FETCH_REC_Instr[15]_i_8__0 ),
        .\FETCH_REC_Instr[15]_i_8__0_0 (\FETCH_REC_Instr[15]_i_8__0_0 ),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid),
        .O(O),
        .S({anEngine_n_23,anEngine_n_24}),
        .SR(\cmd_register[1] ),
        .WEBWE(WEBWE),
        .\channel_old_latency_reg[3] (anEngine_n_12),
        .\channel_old_latency_reg[3]_0 (aChannel_n_7),
        .\channel_old_latency_reg[3]_1 (station_n_0),
        .\channel_old_latency_reg[3]_2 (aChannel_n_24),
        .\channel_old_latency_reg[3]_3 (aChannel_n_21),
        .\channel_old_latency_reg[3]_4 (aChannel_n_1),
        .\channel_old_latency_reg[5] (aChannel_n_2),
        .\channel_old_latency_reg[5]_0 (aChannel_n_10),
        .\channel_old_latency_reg[6] (aChannel_n_3),
        .\channel_old_latency_reg[6]_0 (aChannel_n_9),
        .\channel_old_latency_reg[6]_1 (aChannel_n_8),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(content_reg_bram_0_9),
        .content_reg_bram_0_0(content_reg_bram_0_10),
        .content_reg_bram_0_1(content_reg_bram_0_11),
        .content_reg_bram_0_2(content_reg_bram_0_12),
        .content_reg_bram_0_3(content_reg_bram_0_13),
        .content_reg_bram_0_4(content_reg_bram_0_14),
        .content_reg_bram_0_5(content_reg_bram_0_15),
        .content_reg_bram_0_6(content_reg_bram_0_16),
        .content_reg_bram_0_7(content_reg_bram_0_17),
        .\curState_reg[0] (\curState_reg[0] ),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[2]_1 (\cur_cc_pointer_reg[2]_1 ),
        .\cur_cc_pointer_reg[2]_2 (\cur_cc_pointer_reg[2]_2 ),
        .\cur_cc_pointer_reg[2]_3 (\cur_cc_pointer_reg[2]_3 ),
        .\cur_cc_pointer_reg[2]_4 (\cur_cc_pointer_reg[2]_4 ),
        .\cur_ccs_reg[26] (\cur_ccs_reg[26] ),
        .\cur_ccs_reg[27] (\cur_ccs_reg[27] ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[58] (\cur_ccs_reg[58] ),
        .\cur_ccs_reg[59] (\cur_ccs_reg[59] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(anEngine_n_13),
        .cur_is_even_character_reg_0(anEngine_n_20),
        .cur_is_even_character_reg_1(anEngine_n_25),
        .\cur_state[2]_i_9 (\cur_state[2]_i_9 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_9_0 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (\cur_state_reg[0]_1 ),
        .\cur_state_reg[0]_2 (\cur_state_reg[0]_2 ),
        .\cur_state_reg[0]_3 (\cur_state_reg[0]_3 ),
        .\cur_state_reg[0]_4 (\cur_state_reg[0]_4 ),
        .\cur_state_reg[0]_5 (\cur_state_reg[0]_5 ),
        .\cur_state_reg[0]_6 (\cur_state_reg[0]_6 ),
        .\cur_state_reg[0]_7 (\cur_state_reg[0]_7 ),
        .\cur_state_reg[0]_8 (\cur_state_reg[0]_8 ),
        .\cur_state_reg[0]_9 (\cur_state_reg[0]_9 ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\cur_state_reg[2]_0 (\cur_state_reg[2]_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .\head_reg[0] (\head_reg[0] ),
        .\head_reg[1] (anEngine_n_19),
        .\head_reg[3] (\head_reg[3] ),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .\memory_bb\.addr (\memory_bb\.addr ),
        .memory_data(memory_data),
        .min_latency1_carry(aChannel_n_22),
        .old_grant(old_grant),
        .\old_grant[0]_i_2 (\old_grant[0]_i_2 ),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_3 ),
        .\old_grant_reg[0]_4 (\old_grant_reg[0]_4 ),
        .p_0_in(\fifo_channel/p_0_in ),
        .rst_IBUF(rst_IBUF),
        .\switch2channel\.ready (\switch2channel\.ready ),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[0] (\tail_reg[0] ),
        .\tail_reg[3] (\tail_reg[3] ));
  switch_4 station
       (.DI({anEngine_n_21,anEngine_n_22,aChannel_n_20}),
        .S({aChannel_n_4,anEngine_n_23,anEngine_n_24,aChannel_n_5}),
        .\channel_old_latency_reg[0] (station_n_0));
endmodule

(* ORIG_REF_NAME = "engine_and_station" *) 
module engine_and_station_0
   (content_reg_bram_0,
    \switch2channel\.ready ,
    bram_r_valid,
    ADDRARDADDR,
    E,
    \cur_state_reg[2] ,
    \curState_reg[0] ,
    \channel_old_latency_reg[3] ,
    \head_reg[3] ,
    EXE2_Instr_valid_reg,
    \cur_state_reg[1] ,
    cur_is_even_character_reg,
    in_ready_packed,
    DINADIN,
    content_reg_bram_0_0,
    \middle_reg[1] ,
    \middle_reg[2] ,
    \middle_reg[3] ,
    \middle_reg[4] ,
    \middle_reg[5] ,
    \middle_reg[6] ,
    \middle_reg[7] ,
    \middle_reg[8] ,
    \FSM_sequential_status_register_reg[0] ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \EXE1_Instr_reg[10] ,
    \EXE1_Pc_reg[0] ,
    \EXE1_Instr_reg[1] ,
    \EXE1_Instr_reg[2] ,
    \EXE1_Instr_reg[3] ,
    \EXE1_Instr_reg[4] ,
    \EXE1_Instr_reg[5] ,
    \EXE1_Instr_reg[6] ,
    \EXE1_Pc_reg[6] ,
    content_reg_bram_0_i_24__2,
    \head_reg[2] ,
    \EXE1_Instr_reg[10]_0 ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[25] ,
    \cur_ccs_reg[57] ,
    \cur_state_reg[1]_0 ,
    \EXE1_Instr_reg[8] ,
    cur_is_even_character_reg_0,
    clk_IBUF_BUFG,
    WEBWE,
    memory_data,
    content_reg_bram_0_1,
    \old_grant_reg[0] ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    \FSM_sequential_status_register_reg[0]_2 ,
    \FSM_sequential_status_register_reg[0]_3 ,
    cmd_register_IBUF,
    D,
    O,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    \cur_state_reg[0] ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ,
    CO,
    cur_is_even_character,
    \tail_reg[4] ,
    \cur_state_reg[0]_0 ,
    \old_grant_reg[0]_0 ,
    old_grant,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    start_cc_pointer_register_IBUF,
    cur_is_even_character_reg_1,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ,
    \cur_state[2]_i_9 ,
    \cur_state[2]_i_9_0 ,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    content_reg_bram_0_20,
    \tail_reg[4]_0 ,
    \FETCH_REC_Instr[15]_i_12 ,
    \FETCH_REC_Instr[15]_i_8 ,
    \FETCH_REC_Instr[15]_i_8_0 ,
    \old_grant[0]_i_5 ,
    \old_grant[0]_i_5_0 ,
    \old_grant[0]_i_3__0 ,
    \old_grant[0]_i_3__0_0 ,
    \FETCH_REC_Instr[15]_i_9 ,
    \FETCH_REC_Instr[15]_i_9_0 ,
    \FETCH_REC_Instr[15]_i_9_1 ,
    \FETCH_REC_Instr[15]_i_9_2 ,
    \old_grant[0]_i_5_1 ,
    \old_grant[0]_i_5_2 ,
    EXE2_Instr_valid,
    FETCH_REC_Instr_valid,
    EXE1_Instr_valid,
    \channel_old_latency_reg[6] );
  output [0:0]content_reg_bram_0;
  output \switch2channel\.ready ;
  output bram_r_valid;
  output [8:0]ADDRARDADDR;
  output [0:0]E;
  output \cur_state_reg[2] ;
  output \curState_reg[0] ;
  output [6:0]\channel_old_latency_reg[3] ;
  output \head_reg[3] ;
  output EXE2_Instr_valid_reg;
  output \cur_state_reg[1] ;
  output cur_is_even_character_reg;
  output [0:0]in_ready_packed;
  output [7:0]DINADIN;
  output content_reg_bram_0_0;
  output \middle_reg[1] ;
  output \middle_reg[2] ;
  output \middle_reg[3] ;
  output \middle_reg[4] ;
  output \middle_reg[5] ;
  output \middle_reg[6] ;
  output \middle_reg[7] ;
  output \middle_reg[8] ;
  output [0:0]\FSM_sequential_status_register_reg[0] ;
  output \FSM_sequential_status_register_reg[0]_0 ;
  output \EXE1_Instr_reg[10] ;
  output \EXE1_Pc_reg[0] ;
  output \EXE1_Instr_reg[1] ;
  output \EXE1_Instr_reg[2] ;
  output \EXE1_Instr_reg[3] ;
  output \EXE1_Instr_reg[4] ;
  output \EXE1_Instr_reg[5] ;
  output \EXE1_Instr_reg[6] ;
  output \EXE1_Pc_reg[6] ;
  output [0:0]content_reg_bram_0_i_24__2;
  output \head_reg[2] ;
  output \EXE1_Instr_reg[10]_0 ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[25] ;
  output \cur_ccs_reg[57] ;
  output \cur_state_reg[1]_0 ;
  output \EXE1_Instr_reg[8] ;
  output cur_is_even_character_reg_0;
  input clk_IBUF_BUFG;
  input [0:0]WEBWE;
  input [63:0]memory_data;
  input [8:0]content_reg_bram_0_1;
  input \old_grant_reg[0] ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [3:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \FSM_sequential_status_register_reg[0]_1 ;
  input [2:0]\FSM_sequential_status_register_reg[0]_2 ;
  input \FSM_sequential_status_register_reg[0]_3 ;
  input [0:0]cmd_register_IBUF;
  input [2:0]D;
  input [5:0]O;
  input [3:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input \cur_state_reg[0] ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ;
  input [0:0]CO;
  input cur_is_even_character;
  input \tail_reg[4] ;
  input \cur_state_reg[0]_0 ;
  input \old_grant_reg[0]_0 ;
  input [0:0]old_grant;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input [5:0]start_cc_pointer_register_IBUF;
  input cur_is_even_character_reg_1;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  input \cur_state[2]_i_9 ;
  input \cur_state[2]_i_9_0 ;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input content_reg_bram_0_20;
  input \tail_reg[4]_0 ;
  input [15:0]\FETCH_REC_Instr[15]_i_12 ;
  input \FETCH_REC_Instr[15]_i_8 ;
  input \FETCH_REC_Instr[15]_i_8_0 ;
  input \old_grant[0]_i_5 ;
  input \old_grant[0]_i_5_0 ;
  input \old_grant[0]_i_3__0 ;
  input \old_grant[0]_i_3__0_0 ;
  input \FETCH_REC_Instr[15]_i_9 ;
  input \FETCH_REC_Instr[15]_i_9_0 ;
  input \FETCH_REC_Instr[15]_i_9_1 ;
  input \FETCH_REC_Instr[15]_i_9_2 ;
  input \old_grant[0]_i_5_1 ;
  input \old_grant[0]_i_5_2 ;
  input EXE2_Instr_valid;
  input FETCH_REC_Instr_valid;
  input EXE1_Instr_valid;
  input [6:0]\channel_old_latency_reg[6] ;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [2:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[10] ;
  wire \EXE1_Instr_reg[10]_0 ;
  wire \EXE1_Instr_reg[1] ;
  wire \EXE1_Instr_reg[2] ;
  wire \EXE1_Instr_reg[3] ;
  wire \EXE1_Instr_reg[4] ;
  wire \EXE1_Instr_reg[5] ;
  wire \EXE1_Instr_reg[6] ;
  wire \EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid;
  wire \EXE1_Pc_reg[0] ;
  wire \EXE1_Pc_reg[6] ;
  wire EXE2_Instr_valid;
  wire EXE2_Instr_valid_reg;
  wire [15:0]\FETCH_REC_Instr[15]_i_12 ;
  wire \FETCH_REC_Instr[15]_i_8 ;
  wire \FETCH_REC_Instr[15]_i_8_0 ;
  wire \FETCH_REC_Instr[15]_i_9 ;
  wire \FETCH_REC_Instr[15]_i_9_0 ;
  wire \FETCH_REC_Instr[15]_i_9_1 ;
  wire \FETCH_REC_Instr[15]_i_9_2 ;
  wire FETCH_REC_Instr_valid;
  wire [0:0]\FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[0]_1 ;
  wire [2:0]\FSM_sequential_status_register_reg[0]_2 ;
  wire \FSM_sequential_status_register_reg[0]_3 ;
  wire [5:0]O;
  wire [2:0]Q;
  wire [0:0]WEBWE;
  wire aChannel_n_10;
  wire aChannel_n_11;
  wire aChannel_n_12;
  wire aChannel_n_13;
  wire aChannel_n_14;
  wire aChannel_n_15;
  wire aChannel_n_16;
  wire aChannel_n_17;
  wire aChannel_n_9;
  wire [3:0]address_register_IBUF;
  wire anEngine_n_13;
  wire anEngine_n_17;
  wire anEngine_n_18;
  wire anEngine_n_19;
  wire anEngine_n_22;
  wire anEngine_n_23;
  wire anEngine_n_44;
  wire anEngine_n_45;
  wire bram_r_valid;
  wire [6:0]\channel_old_latency_reg[3] ;
  wire [6:0]\channel_old_latency_reg[6] ;
  wire clk_IBUF_BUFG;
  wire [0:0]cmd_register_IBUF;
  wire [0:0]content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire [8:0]content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_20;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire [0:0]content_reg_bram_0_i_24__2;
  wire \curState_reg[0] ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_ccs_reg[25] ;
  wire \cur_ccs_reg[57] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[2]_i_9 ;
  wire \cur_state[2]_i_9_0 ;
  wire \cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[1] ;
  wire \cur_state_reg[1]_0 ;
  wire \cur_state_reg[2] ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire [3:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ;
  wire \head_reg[2] ;
  wire \head_reg[3] ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [63:0]memory_data;
  wire \middle_reg[1] ;
  wire \middle_reg[2] ;
  wire \middle_reg[3] ;
  wire \middle_reg[4] ;
  wire \middle_reg[5] ;
  wire \middle_reg[6] ;
  wire \middle_reg[7] ;
  wire \middle_reg[8] ;
  wire [0:0]old_grant;
  wire \old_grant[0]_i_3__0 ;
  wire \old_grant[0]_i_3__0_0 ;
  wire \old_grant[0]_i_5 ;
  wire \old_grant[0]_i_5_0 ;
  wire \old_grant[0]_i_5_1 ;
  wire \old_grant[0]_i_5_2 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire [5:0]start_cc_pointer_register_IBUF;
  wire station_n_0;
  wire [6:6]\switch2channel\.latency ;
  wire \switch2channel\.ready ;
  wire \switch2channel\.valid ;
  wire \tail_reg[4] ;
  wire \tail_reg[4]_0 ;

  channel aChannel
       (.CO(station_n_0),
        .DI({aChannel_n_15,aChannel_n_16,aChannel_n_17}),
        .DINADIN(DINADIN),
        .S({aChannel_n_10,aChannel_n_11,aChannel_n_12,aChannel_n_13}),
        .WEA(\switch2channel\.ready ),
        .\channel_old_latency_reg[2]_0 (aChannel_n_14),
        .\channel_old_latency_reg[2]_1 (anEngine_n_44),
        .\channel_old_latency_reg[2]_2 (anEngine_n_17),
        .\channel_old_latency_reg[2]_3 (anEngine_n_22),
        .\channel_old_latency_reg[2]_4 (anEngine_n_19),
        .\channel_old_latency_reg[3]_0 (\channel_old_latency_reg[3] ),
        .\channel_old_latency_reg[4]_0 (anEngine_n_45),
        .\channel_old_latency_reg[6]_0 (\channel_old_latency_reg[6] ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0(content_reg_bram_0_0),
        .content_reg_bram_0_0(content_reg_bram_0_1),
        .content_reg_bram_0_1(content_reg_bram_0_2),
        .content_reg_bram_0_10(content_reg_bram_0_11),
        .content_reg_bram_0_11(content_reg_bram_0_12),
        .content_reg_bram_0_2(content_reg_bram_0_3),
        .content_reg_bram_0_3(content_reg_bram_0_4),
        .content_reg_bram_0_4(content_reg_bram_0_5),
        .content_reg_bram_0_5(content_reg_bram_0_6),
        .content_reg_bram_0_6(content_reg_bram_0_7),
        .content_reg_bram_0_7(content_reg_bram_0_8),
        .content_reg_bram_0_8(content_reg_bram_0_9),
        .content_reg_bram_0_9(content_reg_bram_0_10),
        .\cur_state_reg[1] (\cur_state_reg[1]_0 ),
        .\middle_reg[1] (\middle_reg[1] ),
        .\middle_reg[2] (\middle_reg[2] ),
        .\middle_reg[3] (\middle_reg[3] ),
        .\middle_reg[4] (\middle_reg[4] ),
        .\middle_reg[5] (\middle_reg[5] ),
        .\middle_reg[6] (\middle_reg[6] ),
        .\middle_reg[7] (\middle_reg[7] ),
        .\middle_reg[8] (\middle_reg[8] ),
        .min_latency1_carry(anEngine_n_23),
        .min_latency1_carry_0(anEngine_n_18),
        .\state_cur_reg[0] (\old_grant_reg[0] ),
        .\switch2channel\.latency (\switch2channel\.latency ),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[0] (\FSM_sequential_status_register_reg[0]_2 ),
        .\tail_reg[0]_0 (anEngine_n_13),
        .\tail_reg[1] (aChannel_n_9));
  engine_interfaced anEngine
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(CO),
        .D(content_reg_bram_0),
        .E(E),
        .\EXE1_Instr_reg[10] (\EXE1_Instr_reg[10] ),
        .\EXE1_Instr_reg[10]_0 (\EXE1_Instr_reg[10]_0 ),
        .\EXE1_Instr_reg[1] (\EXE1_Instr_reg[1] ),
        .\EXE1_Instr_reg[2] (\EXE1_Instr_reg[2] ),
        .\EXE1_Instr_reg[3] (\EXE1_Instr_reg[3] ),
        .\EXE1_Instr_reg[4] (\EXE1_Instr_reg[4] ),
        .\EXE1_Instr_reg[5] (\EXE1_Instr_reg[5] ),
        .\EXE1_Instr_reg[6] (\EXE1_Instr_reg[6] ),
        .\EXE1_Instr_reg[8] (\EXE1_Instr_reg[8] ),
        .EXE1_Instr_valid(EXE1_Instr_valid),
        .\EXE1_Pc_reg[0] (\EXE1_Pc_reg[0] ),
        .\EXE1_Pc_reg[6] (\EXE1_Pc_reg[6] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg(anEngine_n_13),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg),
        .\FETCH_REC_Instr[15]_i_12 (\FETCH_REC_Instr[15]_i_12 ),
        .\FETCH_REC_Instr[15]_i_8 (\FETCH_REC_Instr[15]_i_8 ),
        .\FETCH_REC_Instr[15]_i_8_0 (\FETCH_REC_Instr[15]_i_8_0 ),
        .\FETCH_REC_Instr[15]_i_9 (\FETCH_REC_Instr[15]_i_9 ),
        .\FETCH_REC_Instr[15]_i_9_0 (\FETCH_REC_Instr[15]_i_9_0 ),
        .\FETCH_REC_Instr[15]_i_9_1 (\FETCH_REC_Instr[15]_i_9_1 ),
        .\FETCH_REC_Instr[15]_i_9_2 (\FETCH_REC_Instr[15]_i_9_2 ),
        .FETCH_REC_Instr_valid(FETCH_REC_Instr_valid),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0]_0 ),
        .\FSM_sequential_status_register_reg[0]_1 (\FSM_sequential_status_register_reg[0]_1 ),
        .\FSM_sequential_status_register_reg[0]_2 (\FSM_sequential_status_register_reg[0]_2 ),
        .\FSM_sequential_status_register_reg[0]_3 (\FSM_sequential_status_register_reg[0]_3 ),
        .O(O),
        .Q(Q),
        .WEA(\switch2channel\.ready ),
        .WEBWE(WEBWE),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .\channel_old_latency_reg[2] (aChannel_n_9),
        .\channel_old_latency_reg[2]_0 (station_n_0),
        .\channel_old_latency_reg[2]_1 (aChannel_n_14),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(content_reg_bram_0_13),
        .content_reg_bram_0_0(content_reg_bram_0_14),
        .content_reg_bram_0_1(content_reg_bram_0_15),
        .content_reg_bram_0_2(content_reg_bram_0_16),
        .content_reg_bram_0_3(content_reg_bram_0_17),
        .content_reg_bram_0_4(content_reg_bram_0_18),
        .content_reg_bram_0_5(content_reg_bram_0_19),
        .content_reg_bram_0_6(content_reg_bram_0_20),
        .content_reg_bram_0_i_24__2(content_reg_bram_0_i_24__2),
        .\curState_reg[0] (\curState_reg[0] ),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_ccs_reg[25] (\cur_ccs_reg[25] ),
        .\cur_ccs_reg[57] (\cur_ccs_reg[57] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(anEngine_n_19),
        .cur_is_even_character_reg_0(cur_is_even_character_reg),
        .cur_is_even_character_reg_1(anEngine_n_22),
        .cur_is_even_character_reg_2(anEngine_n_23),
        .cur_is_even_character_reg_3(anEngine_n_44),
        .cur_is_even_character_reg_4(anEngine_n_45),
        .cur_is_even_character_reg_5(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_6(cur_is_even_character_reg_1),
        .\cur_state[2]_i_9 (\cur_state[2]_i_9 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_9_0 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[1] (\cur_state_reg[1] ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (D),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ),
        .\head_reg[2] (\head_reg[2] ),
        .\head_reg[3] (\head_reg[3] ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .memory_data(memory_data),
        .old_grant(old_grant),
        .\old_grant[0]_i_3__0 (\old_grant[0]_i_3__0 ),
        .\old_grant[0]_i_3__0_0 (\old_grant[0]_i_3__0_0 ),
        .\old_grant[0]_i_5 (\old_grant[0]_i_5 ),
        .\old_grant[0]_i_5_0 (\old_grant[0]_i_5_0 ),
        .\old_grant[0]_i_5_1 (\old_grant[0]_i_5_1 ),
        .\old_grant[0]_i_5_2 (\old_grant[0]_i_5_2 ),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .start_cc_pointer_register_IBUF(start_cc_pointer_register_IBUF),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[0] (anEngine_n_17),
        .\tail_reg[0]_0 (anEngine_n_18),
        .\tail_reg[4] (\tail_reg[4] ),
        .\tail_reg[4]_0 (\tail_reg[4]_0 ));
  switch station
       (.DI({\switch2channel\.latency ,aChannel_n_15,aChannel_n_16,aChannel_n_17}),
        .S({aChannel_n_10,aChannel_n_11,aChannel_n_12,aChannel_n_13}),
        .\channel_old_latency_reg[5] (station_n_0));
endmodule

module engine_interfaced
   (D,
    bram_r_valid,
    ADDRARDADDR,
    E,
    \cur_state_reg[2] ,
    EXE2_Instr_valid_reg,
    \curState_reg[0] ,
    \head_reg[3] ,
    EXE2_Instr_valid_reg_0,
    \tail_reg[0] ,
    \tail_reg[0]_0 ,
    cur_is_even_character_reg,
    \cur_state_reg[1] ,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    cur_is_even_character_reg_2,
    in_ready_packed,
    \FSM_sequential_status_register_reg[0] ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \EXE1_Instr_reg[10] ,
    \EXE1_Pc_reg[0] ,
    \EXE1_Instr_reg[1] ,
    \EXE1_Instr_reg[2] ,
    \EXE1_Instr_reg[3] ,
    \EXE1_Instr_reg[4] ,
    \EXE1_Instr_reg[5] ,
    \EXE1_Instr_reg[6] ,
    \EXE1_Pc_reg[6] ,
    content_reg_bram_0_i_24__2,
    \head_reg[2] ,
    \EXE1_Instr_reg[10]_0 ,
    \switch2channel\.valid ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[25] ,
    \cur_ccs_reg[57] ,
    cur_is_even_character_reg_3,
    cur_is_even_character_reg_4,
    \EXE1_Instr_reg[8] ,
    cur_is_even_character_reg_5,
    clk_IBUF_BUFG,
    WEBWE,
    memory_data,
    \old_grant_reg[0] ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    \FSM_sequential_status_register_reg[0]_2 ,
    \FSM_sequential_status_register_reg[0]_3 ,
    cmd_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    O,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ,
    \cur_state_reg[0] ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ,
    CO,
    cur_is_even_character,
    \tail_reg[4] ,
    \channel_old_latency_reg[2] ,
    \channel_old_latency_reg[2]_0 ,
    \cur_state_reg[0]_0 ,
    \old_grant_reg[0]_0 ,
    old_grant,
    start_cc_pointer_register_IBUF,
    cur_is_even_character_reg_6,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ,
    \cur_state[2]_i_9 ,
    \cur_state[2]_i_9_0 ,
    content_reg_bram_0,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    \tail_reg[4]_0 ,
    WEA,
    \FETCH_REC_Instr[15]_i_12 ,
    \FETCH_REC_Instr[15]_i_8 ,
    \FETCH_REC_Instr[15]_i_8_0 ,
    \old_grant[0]_i_5 ,
    \old_grant[0]_i_5_0 ,
    \old_grant[0]_i_3__0 ,
    \old_grant[0]_i_3__0_0 ,
    \FETCH_REC_Instr[15]_i_9 ,
    \FETCH_REC_Instr[15]_i_9_0 ,
    \FETCH_REC_Instr[15]_i_9_1 ,
    \FETCH_REC_Instr[15]_i_9_2 ,
    \old_grant[0]_i_5_1 ,
    \old_grant[0]_i_5_2 ,
    \channel_old_latency_reg[2]_1 ,
    EXE2_Instr_valid,
    FETCH_REC_Instr_valid,
    EXE1_Instr_valid);
  output [0:0]D;
  output bram_r_valid;
  output [8:0]ADDRARDADDR;
  output [0:0]E;
  output \cur_state_reg[2] ;
  output EXE2_Instr_valid_reg;
  output \curState_reg[0] ;
  output \head_reg[3] ;
  output EXE2_Instr_valid_reg_0;
  output \tail_reg[0] ;
  output \tail_reg[0]_0 ;
  output cur_is_even_character_reg;
  output \cur_state_reg[1] ;
  output cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output cur_is_even_character_reg_2;
  output [0:0]in_ready_packed;
  output [0:0]\FSM_sequential_status_register_reg[0] ;
  output \FSM_sequential_status_register_reg[0]_0 ;
  output \EXE1_Instr_reg[10] ;
  output \EXE1_Pc_reg[0] ;
  output \EXE1_Instr_reg[1] ;
  output \EXE1_Instr_reg[2] ;
  output \EXE1_Instr_reg[3] ;
  output \EXE1_Instr_reg[4] ;
  output \EXE1_Instr_reg[5] ;
  output \EXE1_Instr_reg[6] ;
  output \EXE1_Pc_reg[6] ;
  output [0:0]content_reg_bram_0_i_24__2;
  output \head_reg[2] ;
  output \EXE1_Instr_reg[10]_0 ;
  output \switch2channel\.valid ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[25] ;
  output \cur_ccs_reg[57] ;
  output cur_is_even_character_reg_3;
  output cur_is_even_character_reg_4;
  output \EXE1_Instr_reg[8] ;
  output cur_is_even_character_reg_5;
  input clk_IBUF_BUFG;
  input [0:0]WEBWE;
  input [63:0]memory_data;
  input \old_grant_reg[0] ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [3:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \FSM_sequential_status_register_reg[0]_1 ;
  input [2:0]\FSM_sequential_status_register_reg[0]_2 ;
  input \FSM_sequential_status_register_reg[0]_3 ;
  input [0:0]cmd_register_IBUF;
  input [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input [5:0]O;
  input [3:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  input \cur_state_reg[0] ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ;
  input [0:0]CO;
  input cur_is_even_character;
  input \tail_reg[4] ;
  input \channel_old_latency_reg[2] ;
  input [0:0]\channel_old_latency_reg[2]_0 ;
  input \cur_state_reg[0]_0 ;
  input \old_grant_reg[0]_0 ;
  input [0:0]old_grant;
  input [5:0]start_cc_pointer_register_IBUF;
  input cur_is_even_character_reg_6;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  input \cur_state[2]_i_9 ;
  input \cur_state[2]_i_9_0 ;
  input content_reg_bram_0;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input \tail_reg[4]_0 ;
  input [0:0]WEA;
  input [15:0]\FETCH_REC_Instr[15]_i_12 ;
  input \FETCH_REC_Instr[15]_i_8 ;
  input \FETCH_REC_Instr[15]_i_8_0 ;
  input \old_grant[0]_i_5 ;
  input \old_grant[0]_i_5_0 ;
  input \old_grant[0]_i_3__0 ;
  input \old_grant[0]_i_3__0_0 ;
  input \FETCH_REC_Instr[15]_i_9 ;
  input \FETCH_REC_Instr[15]_i_9_0 ;
  input \FETCH_REC_Instr[15]_i_9_1 ;
  input \FETCH_REC_Instr[15]_i_9_2 ;
  input \old_grant[0]_i_5_1 ;
  input \old_grant[0]_i_5_2 ;
  input \channel_old_latency_reg[2]_1 ;
  input EXE2_Instr_valid;
  input FETCH_REC_Instr_valid;
  input EXE1_Instr_valid;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [0:0]D;
  wire [0:0]E;
  wire \EXE1_Instr_reg[10] ;
  wire \EXE1_Instr_reg[10]_0 ;
  wire \EXE1_Instr_reg[1] ;
  wire \EXE1_Instr_reg[2] ;
  wire \EXE1_Instr_reg[3] ;
  wire \EXE1_Instr_reg[4] ;
  wire \EXE1_Instr_reg[5] ;
  wire \EXE1_Instr_reg[6] ;
  wire \EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid;
  wire \EXE1_Pc_reg[0] ;
  wire \EXE1_Pc_reg[6] ;
  wire EXE2_Instr_valid;
  wire EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire [15:0]\FETCH_REC_Instr[15]_i_12 ;
  wire \FETCH_REC_Instr[15]_i_8 ;
  wire \FETCH_REC_Instr[15]_i_8_0 ;
  wire \FETCH_REC_Instr[15]_i_9 ;
  wire \FETCH_REC_Instr[15]_i_9_0 ;
  wire \FETCH_REC_Instr[15]_i_9_1 ;
  wire \FETCH_REC_Instr[15]_i_9_2 ;
  wire FETCH_REC_Instr_valid;
  wire [0:0]\FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[0]_1 ;
  wire [2:0]\FSM_sequential_status_register_reg[0]_2 ;
  wire \FSM_sequential_status_register_reg[0]_3 ;
  wire [5:0]O;
  wire [2:0]Q;
  wire [0:0]WEA;
  wire [0:0]WEBWE;
  wire [3:0]address_register_IBUF;
  wire bram_r_valid;
  wire \channel_old_latency_reg[2] ;
  wire [0:0]\channel_old_latency_reg[2]_0 ;
  wire \channel_old_latency_reg[2]_1 ;
  wire clk_IBUF_BUFG;
  wire [0:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire [0:0]content_reg_bram_0_i_24__2;
  wire \curState_reg[0] ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_ccs_reg[25] ;
  wire \cur_ccs_reg[57] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire cur_is_even_character_reg_4;
  wire cur_is_even_character_reg_5;
  wire cur_is_even_character_reg_6;
  wire \cur_state[2]_i_9 ;
  wire \cur_state[2]_i_9_0 ;
  wire \cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[1] ;
  wire \cur_state_reg[2] ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire [3:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ;
  wire \head_reg[2] ;
  wire \head_reg[3] ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [63:0]memory_data;
  wire [0:0]old_grant;
  wire \old_grant[0]_i_3__0 ;
  wire \old_grant[0]_i_3__0_0 ;
  wire \old_grant[0]_i_5 ;
  wire \old_grant[0]_i_5_0 ;
  wire \old_grant[0]_i_5_1 ;
  wire \old_grant[0]_i_5_2 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire [5:0]start_cc_pointer_register_IBUF;
  wire \switch2channel\.valid ;
  wire \tail_reg[0] ;
  wire \tail_reg[0]_0 ;
  wire \tail_reg[4] ;
  wire \tail_reg[4]_0 ;

  engine anEngine
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(CO),
        .E(E),
        .\EXE1_Instr_reg[10] (\EXE1_Instr_reg[10] ),
        .\EXE1_Instr_reg[10]_0 (\EXE1_Instr_reg[10]_0 ),
        .\EXE1_Instr_reg[1] (\EXE1_Instr_reg[1] ),
        .\EXE1_Instr_reg[2] (\EXE1_Instr_reg[2] ),
        .\EXE1_Instr_reg[3] (\EXE1_Instr_reg[3] ),
        .\EXE1_Instr_reg[4] (\EXE1_Instr_reg[4] ),
        .\EXE1_Instr_reg[5] (\EXE1_Instr_reg[5] ),
        .\EXE1_Instr_reg[6] (\EXE1_Instr_reg[6] ),
        .\EXE1_Instr_reg[8] (\EXE1_Instr_reg[8] ),
        .EXE1_Instr_valid(EXE1_Instr_valid),
        .\EXE1_Pc_reg[0] (\EXE1_Pc_reg[0] ),
        .\EXE1_Pc_reg[6] (\EXE1_Pc_reg[6] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg(EXE2_Instr_valid_reg),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg_0),
        .\FETCH_REC_Instr[15]_i_12 (\FETCH_REC_Instr[15]_i_12 ),
        .\FETCH_REC_Instr[15]_i_8 (\FETCH_REC_Instr[15]_i_8 ),
        .\FETCH_REC_Instr[15]_i_8_0 (\FETCH_REC_Instr[15]_i_8_0 ),
        .\FETCH_REC_Instr[15]_i_9 (\FETCH_REC_Instr[15]_i_9 ),
        .\FETCH_REC_Instr[15]_i_9_0 (\FETCH_REC_Instr[15]_i_9_0 ),
        .\FETCH_REC_Instr[15]_i_9_1 (\FETCH_REC_Instr[15]_i_9_1 ),
        .\FETCH_REC_Instr[15]_i_9_2 (\FETCH_REC_Instr[15]_i_9_2 ),
        .FETCH_REC_Instr_valid(FETCH_REC_Instr_valid),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0]_0 ),
        .\FSM_sequential_status_register_reg[0]_1 (\FSM_sequential_status_register_reg[0]_1 ),
        .\FSM_sequential_status_register_reg[0]_2 (\FSM_sequential_status_register_reg[0]_2 ),
        .\FSM_sequential_status_register_reg[0]_3 (\FSM_sequential_status_register_reg[0]_3 ),
        .O(O),
        .Q(Q),
        .WEA(WEA),
        .WEBWE(WEBWE),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .\channel_old_latency_reg[2] (\channel_old_latency_reg[2] ),
        .\channel_old_latency_reg[2]_0 (\channel_old_latency_reg[2]_0 ),
        .\channel_old_latency_reg[2]_1 (\channel_old_latency_reg[2]_1 ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(D),
        .content_reg_bram_0_0(content_reg_bram_0),
        .content_reg_bram_0_1(content_reg_bram_0_0),
        .content_reg_bram_0_2(content_reg_bram_0_1),
        .content_reg_bram_0_3(content_reg_bram_0_2),
        .content_reg_bram_0_4(content_reg_bram_0_3),
        .content_reg_bram_0_5(content_reg_bram_0_4),
        .content_reg_bram_0_6(content_reg_bram_0_5),
        .content_reg_bram_0_7(content_reg_bram_0_6),
        .content_reg_bram_0_i_24__2(content_reg_bram_0_i_24__2),
        .\curState_reg[0] (\curState_reg[0] ),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_ccs_reg[25] (\cur_ccs_reg[25] ),
        .\cur_ccs_reg[57] (\cur_ccs_reg[57] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .cur_is_even_character_reg_2(cur_is_even_character_reg_2),
        .cur_is_even_character_reg_3(cur_is_even_character_reg_3),
        .cur_is_even_character_reg_4(cur_is_even_character_reg_4),
        .cur_is_even_character_reg_5(cur_is_even_character_reg_5),
        .cur_is_even_character_reg_6(cur_is_even_character_reg_6),
        .\cur_state[2]_i_9 (\cur_state[2]_i_9 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_9_0 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[1] (\cur_state_reg[1] ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 ),
        .\head_reg[2] (\head_reg[2] ),
        .\head_reg[3] (\head_reg[3] ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .memory_data(memory_data),
        .old_grant(old_grant),
        .\old_grant[0]_i_3__0 (\old_grant[0]_i_3__0 ),
        .\old_grant[0]_i_3__0_0 (\old_grant[0]_i_3__0_0 ),
        .\old_grant[0]_i_5 (\old_grant[0]_i_5 ),
        .\old_grant[0]_i_5_0 (\old_grant[0]_i_5_0 ),
        .\old_grant[0]_i_5_1 (\old_grant[0]_i_5_1 ),
        .\old_grant[0]_i_5_2 (\old_grant[0]_i_5_2 ),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .start_cc_pointer_register_IBUF(start_cc_pointer_register_IBUF),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[0] (\tail_reg[0] ),
        .\tail_reg[0]_0 (\tail_reg[0]_0 ),
        .\tail_reg[4] (\tail_reg[4] ),
        .\tail_reg[4]_0 (\tail_reg[4]_0 ));
endmodule

(* ORIG_REF_NAME = "engine_interfaced" *) 
module engine_interfaced_3
   (WEBWE,
    SR,
    FETCH_REC_Instr_valid_reg,
    EXE1_Instr_valid_reg,
    EXE2_Instr_valid,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ,
    D,
    \channel_old_latency_reg[3] ,
    cur_is_even_character_reg,
    EXE1_Instr_valid_reg_0,
    \cur_state_reg[0] ,
    \EXE1_Instr_reg[8] ,
    \head_reg[1] ,
    cur_is_even_character_reg_0,
    DI,
    S,
    cur_is_even_character_reg_1,
    EXE1_Instr_valid_reg_1,
    \head_reg[3] ,
    \old_grant_reg[0] ,
    \old_grant_reg[0]_0 ,
    \old_grant_reg[0]_1 ,
    \old_grant_reg[0]_2 ,
    \old_grant_reg[0]_3 ,
    \old_grant_reg[0]_4 ,
    \EXE2_Instr_reg[0] ,
    \EXE2_Instr_reg[1] ,
    \EXE2_Instr_reg[2] ,
    \EXE2_Instr_reg[3] ,
    \EXE2_Instr_reg[4] ,
    \EXE2_Instr_reg[5] ,
    \EXE2_Instr_reg[6] ,
    \EXE2_Pc_reg[7] ,
    DINADIN,
    \cur_state_reg[2] ,
    \switch2channel\.valid ,
    p_0_in,
    EXE1_Instr_valid_reg_2,
    \tail_reg[3] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_cc_pointer_reg[2]_1 ,
    \cur_cc_pointer_reg[2]_2 ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \cur_cc_pointer_reg[2]_3 ,
    \cur_cc_pointer_reg[2]_4 ,
    \cur_ccs_reg[26] ,
    \cur_ccs_reg[58] ,
    \cur_ccs_reg[27] ,
    \cur_ccs_reg[59] ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_state_reg[2]_0 ,
    clk_IBUF_BUFG,
    memory_data,
    cmd_register_IBUF,
    rst_IBUF,
    \channel_old_latency_reg[3]_0 ,
    cur_is_even_character,
    memory_addr_from_coprocessor_ready,
    old_grant,
    \curState_reg[0] ,
    CO,
    \cur_state_reg[0]_0 ,
    \cur_state_reg[0]_1 ,
    O,
    \cur_state_reg[0]_2 ,
    \channel_old_latency_reg[3]_1 ,
    \channel_old_latency_reg[3]_2 ,
    \channel_old_latency_reg[3]_3 ,
    \channel_old_latency_reg[5] ,
    min_latency1_carry,
    \tail_reg[0] ,
    \switch2channel\.ready_0 ,
    \switch2channel\.ready ,
    \cur_state[2]_i_9 ,
    \channel_old_latency_reg[3]_4 ,
    \channel_old_latency_reg[6] ,
    \channel_old_latency_reg[5]_0 ,
    \channel_old_latency_reg[6]_0 ,
    \channel_old_latency_reg[6]_1 ,
    \memory_bb\.addr ,
    content_reg_bram_0,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    \cur_state_reg[0]_3 ,
    \cur_state_reg[0]_4 ,
    \cur_state_reg[0]_5 ,
    \cur_state_reg[0]_6 ,
    \head_reg[0] ,
    \cur_state_reg[0]_7 ,
    \cur_state_reg[0]_8 ,
    \cur_state_reg[0]_9 ,
    \cur_state[2]_i_9_0 ,
    \old_grant[0]_i_2 ,
    \FETCH_REC_Instr[15]_i_7 ,
    \FETCH_REC_Instr[15]_i_14 ,
    \FETCH_REC_Instr[15]_i_8__0 ,
    \FETCH_REC_Instr[15]_i_8__0_0 );
  output [0:0]WEBWE;
  output [0:0]SR;
  output FETCH_REC_Instr_valid_reg;
  output EXE1_Instr_valid_reg;
  output EXE2_Instr_valid;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  output [5:0]D;
  output \channel_old_latency_reg[3] ;
  output cur_is_even_character_reg;
  output EXE1_Instr_valid_reg_0;
  output [2:0]\cur_state_reg[0] ;
  output \EXE1_Instr_reg[8] ;
  output \head_reg[1] ;
  output cur_is_even_character_reg_0;
  output [1:0]DI;
  output [1:0]S;
  output cur_is_even_character_reg_1;
  output EXE1_Instr_valid_reg_1;
  output \head_reg[3] ;
  output \old_grant_reg[0] ;
  output \old_grant_reg[0]_0 ;
  output \old_grant_reg[0]_1 ;
  output \old_grant_reg[0]_2 ;
  output \old_grant_reg[0]_3 ;
  output \old_grant_reg[0]_4 ;
  output \EXE2_Instr_reg[0] ;
  output \EXE2_Instr_reg[1] ;
  output \EXE2_Instr_reg[2] ;
  output \EXE2_Instr_reg[3] ;
  output \EXE2_Instr_reg[4] ;
  output \EXE2_Instr_reg[5] ;
  output \EXE2_Instr_reg[6] ;
  output \EXE2_Pc_reg[7] ;
  output [0:0]DINADIN;
  output [0:0]\cur_state_reg[2] ;
  output \switch2channel\.valid ;
  output [0:0]p_0_in;
  output EXE1_Instr_valid_reg_2;
  output \tail_reg[3] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_cc_pointer_reg[2]_1 ;
  output \cur_cc_pointer_reg[2]_2 ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \cur_cc_pointer_reg[2]_3 ;
  output \cur_cc_pointer_reg[2]_4 ;
  output \cur_ccs_reg[26] ;
  output \cur_ccs_reg[58] ;
  output \cur_ccs_reg[27] ;
  output \cur_ccs_reg[59] ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_state_reg[2]_0 ;
  input clk_IBUF_BUFG;
  input [63:0]memory_data;
  input [31:0]cmd_register_IBUF;
  input rst_IBUF;
  input \channel_old_latency_reg[3]_0 ;
  input cur_is_even_character;
  input memory_addr_from_coprocessor_ready;
  input [0:0]old_grant;
  input \curState_reg[0] ;
  input [0:0]CO;
  input [2:0]\cur_state_reg[0]_0 ;
  input [3:0]\cur_state_reg[0]_1 ;
  input [0:0]O;
  input \cur_state_reg[0]_2 ;
  input [0:0]\channel_old_latency_reg[3]_1 ;
  input \channel_old_latency_reg[3]_2 ;
  input \channel_old_latency_reg[3]_3 ;
  input \channel_old_latency_reg[5] ;
  input min_latency1_carry;
  input \tail_reg[0] ;
  input \switch2channel\.ready_0 ;
  input \switch2channel\.ready ;
  input \cur_state[2]_i_9 ;
  input \channel_old_latency_reg[3]_4 ;
  input \channel_old_latency_reg[6] ;
  input \channel_old_latency_reg[5]_0 ;
  input \channel_old_latency_reg[6]_0 ;
  input \channel_old_latency_reg[6]_1 ;
  input [0:0]\memory_bb\.addr ;
  input content_reg_bram_0;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input \cur_state_reg[0]_3 ;
  input \cur_state_reg[0]_4 ;
  input \cur_state_reg[0]_5 ;
  input \cur_state_reg[0]_6 ;
  input \head_reg[0] ;
  input \cur_state_reg[0]_7 ;
  input \cur_state_reg[0]_8 ;
  input \cur_state_reg[0]_9 ;
  input \cur_state[2]_i_9_0 ;
  input \old_grant[0]_i_2 ;
  input \FETCH_REC_Instr[15]_i_7 ;
  input [47:0]\FETCH_REC_Instr[15]_i_14 ;
  input \FETCH_REC_Instr[15]_i_8__0 ;
  input \FETCH_REC_Instr[15]_i_8__0_0 ;

  wire [0:0]CO;
  wire [5:0]D;
  wire [1:0]DI;
  wire [0:0]DINADIN;
  wire \EXE1_Instr_reg[8] ;
  wire EXE1_Instr_valid_reg;
  wire EXE1_Instr_valid_reg_0;
  wire EXE1_Instr_valid_reg_1;
  wire EXE1_Instr_valid_reg_2;
  wire \EXE2_Instr_reg[0] ;
  wire \EXE2_Instr_reg[1] ;
  wire \EXE2_Instr_reg[2] ;
  wire \EXE2_Instr_reg[3] ;
  wire \EXE2_Instr_reg[4] ;
  wire \EXE2_Instr_reg[5] ;
  wire \EXE2_Instr_reg[6] ;
  wire EXE2_Instr_valid;
  wire \EXE2_Pc_reg[7] ;
  wire [47:0]\FETCH_REC_Instr[15]_i_14 ;
  wire \FETCH_REC_Instr[15]_i_7 ;
  wire \FETCH_REC_Instr[15]_i_8__0 ;
  wire \FETCH_REC_Instr[15]_i_8__0_0 ;
  wire FETCH_REC_Instr_valid_reg;
  wire [0:0]O;
  wire [1:0]S;
  wire [0:0]SR;
  wire [0:0]WEBWE;
  wire \channel_old_latency_reg[3] ;
  wire \channel_old_latency_reg[3]_0 ;
  wire [0:0]\channel_old_latency_reg[3]_1 ;
  wire \channel_old_latency_reg[3]_2 ;
  wire \channel_old_latency_reg[3]_3 ;
  wire \channel_old_latency_reg[3]_4 ;
  wire \channel_old_latency_reg[5] ;
  wire \channel_old_latency_reg[5]_0 ;
  wire \channel_old_latency_reg[6] ;
  wire \channel_old_latency_reg[6]_0 ;
  wire \channel_old_latency_reg[6]_1 ;
  wire clk_IBUF_BUFG;
  wire [31:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire \curState_reg[0] ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_cc_pointer_reg[2]_1 ;
  wire \cur_cc_pointer_reg[2]_2 ;
  wire \cur_cc_pointer_reg[2]_3 ;
  wire \cur_cc_pointer_reg[2]_4 ;
  wire \cur_ccs_reg[26] ;
  wire \cur_ccs_reg[27] ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[58] ;
  wire \cur_ccs_reg[59] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[2]_i_9 ;
  wire \cur_state[2]_i_9_0 ;
  wire [2:0]\cur_state_reg[0] ;
  wire [2:0]\cur_state_reg[0]_0 ;
  wire [3:0]\cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire \cur_state_reg[0]_3 ;
  wire \cur_state_reg[0]_4 ;
  wire \cur_state_reg[0]_5 ;
  wire \cur_state_reg[0]_6 ;
  wire \cur_state_reg[0]_7 ;
  wire \cur_state_reg[0]_8 ;
  wire \cur_state_reg[0]_9 ;
  wire [0:0]\cur_state_reg[2] ;
  wire \cur_state_reg[2]_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  wire \head_reg[0] ;
  wire \head_reg[1] ;
  wire \head_reg[3] ;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]\memory_bb\.addr ;
  wire [63:0]memory_data;
  wire min_latency1_carry;
  wire [0:0]old_grant;
  wire \old_grant[0]_i_2 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire [0:0]p_0_in;
  wire rst_IBUF;
  wire \switch2channel\.ready ;
  wire \switch2channel\.ready_0 ;
  wire \switch2channel\.valid ;
  wire \tail_reg[0] ;
  wire \tail_reg[3] ;

  engine_5 anEngine
       (.CO(CO),
        .D(D),
        .DI(DI),
        .DINADIN(DINADIN),
        .\EXE1_Instr_reg[8] (\EXE1_Instr_reg[8] ),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg),
        .EXE1_Instr_valid_reg_0(EXE1_Instr_valid_reg_0),
        .EXE1_Instr_valid_reg_1(EXE1_Instr_valid_reg_1),
        .EXE1_Instr_valid_reg_2(EXE1_Instr_valid_reg_2),
        .\EXE2_Instr_reg[0] (\EXE2_Instr_reg[0] ),
        .\EXE2_Instr_reg[1] (\EXE2_Instr_reg[1] ),
        .\EXE2_Instr_reg[2] (\EXE2_Instr_reg[2] ),
        .\EXE2_Instr_reg[3] (\EXE2_Instr_reg[3] ),
        .\EXE2_Instr_reg[4] (\EXE2_Instr_reg[4] ),
        .\EXE2_Instr_reg[5] (\EXE2_Instr_reg[5] ),
        .\EXE2_Instr_reg[6] (\EXE2_Instr_reg[6] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .\EXE2_Pc_reg[7] (\EXE2_Pc_reg[7] ),
        .\FETCH_REC_Instr[15]_i_14 (\FETCH_REC_Instr[15]_i_14 ),
        .\FETCH_REC_Instr[15]_i_7 (\FETCH_REC_Instr[15]_i_7 ),
        .\FETCH_REC_Instr[15]_i_8__0 (\FETCH_REC_Instr[15]_i_8__0 ),
        .\FETCH_REC_Instr[15]_i_8__0_0 (\FETCH_REC_Instr[15]_i_8__0_0 ),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .O(O),
        .S(S),
        .WEBWE(WEBWE),
        .\channel_old_latency_reg[3] (\channel_old_latency_reg[3] ),
        .\channel_old_latency_reg[3]_0 (\channel_old_latency_reg[3]_0 ),
        .\channel_old_latency_reg[3]_1 (\channel_old_latency_reg[3]_1 ),
        .\channel_old_latency_reg[3]_2 (\channel_old_latency_reg[3]_2 ),
        .\channel_old_latency_reg[3]_3 (\channel_old_latency_reg[3]_3 ),
        .\channel_old_latency_reg[3]_4 (\channel_old_latency_reg[3]_4 ),
        .\channel_old_latency_reg[5] (\channel_old_latency_reg[5] ),
        .\channel_old_latency_reg[5]_0 (\channel_old_latency_reg[5]_0 ),
        .\channel_old_latency_reg[6] (\channel_old_latency_reg[6] ),
        .\channel_old_latency_reg[6]_0 (\channel_old_latency_reg[6]_0 ),
        .\channel_old_latency_reg[6]_1 (\channel_old_latency_reg[6]_1 ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\cmd_register[1] (SR),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .content_reg_bram_0_1(content_reg_bram_0_1),
        .content_reg_bram_0_2(content_reg_bram_0_2),
        .content_reg_bram_0_3(content_reg_bram_0_3),
        .content_reg_bram_0_4(content_reg_bram_0_4),
        .content_reg_bram_0_5(content_reg_bram_0_5),
        .content_reg_bram_0_6(content_reg_bram_0_6),
        .content_reg_bram_0_7(content_reg_bram_0_7),
        .\curState_reg[0] (\curState_reg[0] ),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[2]_1 (\cur_cc_pointer_reg[2]_1 ),
        .\cur_cc_pointer_reg[2]_2 (\cur_cc_pointer_reg[2]_2 ),
        .\cur_cc_pointer_reg[2]_3 (\cur_cc_pointer_reg[2]_3 ),
        .\cur_cc_pointer_reg[2]_4 (\cur_cc_pointer_reg[2]_4 ),
        .\cur_ccs_reg[26] (\cur_ccs_reg[26] ),
        .\cur_ccs_reg[27] (\cur_ccs_reg[27] ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[58] (\cur_ccs_reg[58] ),
        .\cur_ccs_reg[59] (\cur_ccs_reg[59] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .\cur_state[2]_i_9 (\cur_state[2]_i_9 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_9_0 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (\cur_state_reg[0]_1 ),
        .\cur_state_reg[0]_2 (\cur_state_reg[0]_2 ),
        .\cur_state_reg[0]_3 (\cur_state_reg[0]_3 ),
        .\cur_state_reg[0]_4 (\cur_state_reg[0]_4 ),
        .\cur_state_reg[0]_5 (\cur_state_reg[0]_5 ),
        .\cur_state_reg[0]_6 (\cur_state_reg[0]_6 ),
        .\cur_state_reg[0]_7 (\cur_state_reg[0]_7 ),
        .\cur_state_reg[0]_8 (\cur_state_reg[0]_8 ),
        .\cur_state_reg[0]_9 (\cur_state_reg[0]_9 ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\cur_state_reg[2]_0 (\cur_state_reg[2]_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .\head_reg[0] (\head_reg[0] ),
        .\head_reg[1] (\head_reg[1] ),
        .\head_reg[3] (\head_reg[3] ),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .\memory_bb\.addr (\memory_bb\.addr ),
        .memory_data(memory_data),
        .min_latency1_carry(min_latency1_carry),
        .old_grant(old_grant),
        .\old_grant[0]_i_2 (\old_grant[0]_i_2 ),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_3 ),
        .\old_grant_reg[0]_4 (\old_grant_reg[0]_4 ),
        .p_0_in(p_0_in),
        .rst_IBUF(rst_IBUF),
        .\switch2channel\.ready (\switch2channel\.ready ),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\switch2channel\.valid (\switch2channel\.valid ),
        .\tail_reg[0] (\tail_reg[0] ),
        .\tail_reg[3] (\tail_reg[3] ));
endmodule

module fifo
   (WEA,
    \tail_reg[0]_0 ,
    \tail_reg[0]_1 ,
    cur_is_even_character_reg,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    cur_is_even_character_reg_2,
    D,
    cur_is_even_character_reg_3,
    cur_is_even_character_reg_4,
    clk_IBUF_BUFG,
    fifo_even_data_in_valid,
    DINADIN,
    \state_cur_reg[0]_0 ,
    p_0_in,
    cur_is_even_character,
    \channel_old_latency_reg[2] ,
    \channel_old_latency_reg[2]_0 ,
    min_latency1_carry_i_7__0,
    content_reg_bram_0_0,
    \channel_old_latency_reg[2]_1 ,
    \FETCH_REC_Pc_reg[0] ,
    \FETCH_REC_Pc_reg[1] ,
    \FETCH_REC_Pc_reg[6] ,
    \FETCH_REC_Pc_reg[7] ,
    \FETCH_REC_Pc_reg[4] ,
    \FETCH_REC_Pc_reg[2] ,
    DOUTBDOUT,
    \FETCH_REC_Pc_reg[2]_0 ,
    \FETCH_REC_Pc_reg[3] ,
    \FETCH_REC_Pc_reg[5] ,
    \channel_old_latency_reg[4] ,
    min_latency1_carry_i_4,
    \channel_old_latency[5]_i_2_0 ,
    min_latency1_carry_i_14__0_0);
  output [0:0]WEA;
  output \tail_reg[0]_0 ;
  output \tail_reg[0]_1 ;
  output cur_is_even_character_reg;
  output cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output cur_is_even_character_reg_2;
  output [7:0]D;
  output cur_is_even_character_reg_3;
  output cur_is_even_character_reg_4;
  input clk_IBUF_BUFG;
  input fifo_even_data_in_valid;
  input [7:0]DINADIN;
  input \state_cur_reg[0]_0 ;
  input [0:0]p_0_in;
  input cur_is_even_character;
  input \channel_old_latency_reg[2] ;
  input [0:0]\channel_old_latency_reg[2]_0 ;
  input min_latency1_carry_i_7__0;
  input content_reg_bram_0_0;
  input \channel_old_latency_reg[2]_1 ;
  input \FETCH_REC_Pc_reg[0] ;
  input \FETCH_REC_Pc_reg[1] ;
  input \FETCH_REC_Pc_reg[6] ;
  input \FETCH_REC_Pc_reg[7] ;
  input \FETCH_REC_Pc_reg[4] ;
  input \FETCH_REC_Pc_reg[2] ;
  input [1:0]DOUTBDOUT;
  input \FETCH_REC_Pc_reg[2]_0 ;
  input \FETCH_REC_Pc_reg[3] ;
  input \FETCH_REC_Pc_reg[5] ;
  input \channel_old_latency_reg[4] ;
  input min_latency1_carry_i_4;
  input \channel_old_latency[5]_i_2_0 ;
  input min_latency1_carry_i_14__0_0;

  wire [7:0]D;
  wire [7:0]DINADIN;
  wire [1:0]DOUTBDOUT;
  wire \FETCH_REC_Pc_reg[0] ;
  wire \FETCH_REC_Pc_reg[1] ;
  wire \FETCH_REC_Pc_reg[2] ;
  wire \FETCH_REC_Pc_reg[2]_0 ;
  wire \FETCH_REC_Pc_reg[3] ;
  wire \FETCH_REC_Pc_reg[4] ;
  wire \FETCH_REC_Pc_reg[5] ;
  wire \FETCH_REC_Pc_reg[6] ;
  wire \FETCH_REC_Pc_reg[7] ;
  wire [0:0]WEA;
  wire \channel_old_latency[5]_i_2_0 ;
  wire \channel_old_latency[5]_i_3__0_n_0 ;
  wire \channel_old_latency[5]_i_5_n_0 ;
  wire \channel_old_latency[5]_i_6_n_0 ;
  wire \channel_old_latency_reg[2] ;
  wire [0:0]\channel_old_latency_reg[2]_0 ;
  wire \channel_old_latency_reg[2]_1 ;
  wire \channel_old_latency_reg[4] ;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_i_21__3_n_0;
  wire content_reg_bram_0_i_22__2_n_0;
  wire content_reg_bram_0_i_40__0_n_0;
  wire content_reg_bram_0_i_41__0_n_0;
  wire content_reg_bram_0_i_6__4_n_0;
  wire content_reg_i_11__0_n_0;
  wire content_reg_i_7__0_n_0;
  wire content_reg_i_8_n_0;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire cur_is_even_character_reg_4;
  wire fifo_even_data_in_valid;
  wire [7:0]from_memory;
  wire \head[0]_i_1__3_n_0 ;
  wire \head[1]_i_1__0_n_0 ;
  wire \head[2]_i_1__0_n_0 ;
  wire \head[3]_i_1__0_n_0 ;
  wire \head[4]_i_2__0_n_0 ;
  wire \head[4]_i_4__1_n_0 ;
  wire [4:0]head_reg;
  wire \middle[0]_i_1__1_n_0 ;
  wire \middle[1]_i_1__1_n_0 ;
  wire \middle[2]_i_1__1_n_0 ;
  wire \middle[3]_i_1__1_n_0 ;
  wire \middle[4]_i_1__1_n_0 ;
  wire \middle[5]_i_1__1_n_0 ;
  wire \middle[6]_i_1__1_n_0 ;
  wire \middle[7]_i_1__2_n_0 ;
  wire \middle[7]_i_2__1_n_0 ;
  wire \middle_reg_n_0_[0] ;
  wire \middle_reg_n_0_[1] ;
  wire \middle_reg_n_0_[2] ;
  wire \middle_reg_n_0_[3] ;
  wire \middle_reg_n_0_[4] ;
  wire \middle_reg_n_0_[5] ;
  wire \middle_reg_n_0_[6] ;
  wire \middle_reg_n_0_[7] ;
  wire min_latency1_carry_i_14__0_0;
  wire min_latency1_carry_i_23_n_0;
  wire min_latency1_carry_i_25__0_n_0;
  wire min_latency1_carry_i_4;
  wire min_latency1_carry_i_7__0;
  wire [0:0]p_0_in;
  wire [2:0]state_cur;
  wire \state_cur[2]_i_1__3_n_0 ;
  wire \state_cur[2]_i_3__3_n_0 ;
  wire \state_cur[2]_i_4__2_n_0 ;
  wire \state_cur[2]_i_5__4_n_0 ;
  wire \state_cur_reg[0]_0 ;
  wire [2:0]state_next;
  wire [4:0]state_next4;
  wire [4:0]tail_reg;
  wire \tail_reg[0]_0 ;
  wire \tail_reg[0]_1 ;
  wire [4:1]where_to_read;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:8]NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \block_sel_saved[0]_i_1__0 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[0] ),
        .I3(cur_is_even_character),
        .I4(from_memory[0]),
        .I5(\FETCH_REC_Pc_reg[0] ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \block_sel_saved[1]_i_1__0 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[1] ),
        .I3(cur_is_even_character),
        .I4(from_memory[1]),
        .I5(\FETCH_REC_Pc_reg[1] ),
        .O(D[1]));
  LUT3 #(
    .INIT(8'h8B)) 
    \channel_old_latency[3]_i_3 
       (.I0(cur_is_even_character_reg_1),
        .I1(\channel_old_latency_reg[2]_0 ),
        .I2(\channel_old_latency_reg[2]_1 ),
        .O(cur_is_even_character_reg_2));
  LUT4 #(
    .INIT(16'h990F)) 
    \channel_old_latency[3]_i_6 
       (.I0(\tail_reg[0]_1 ),
        .I1(cur_is_even_character_reg),
        .I2(\channel_old_latency_reg[2] ),
        .I3(\channel_old_latency_reg[2]_0 ),
        .O(\tail_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h00000000FEBABAFE)) 
    \channel_old_latency[5]_i_2 
       (.I0(\channel_old_latency[5]_i_3__0_n_0 ),
        .I1(cur_is_even_character),
        .I2(\channel_old_latency_reg[4] ),
        .I3(tail_reg[0]),
        .I4(head_reg[0]),
        .I5(\channel_old_latency[5]_i_5_n_0 ),
        .O(cur_is_even_character_reg_3));
  LUT5 #(
    .INIT(32'hFFFF47FF)) 
    \channel_old_latency[5]_i_3__0 
       (.I0(min_latency1_carry_i_23_n_0),
        .I1(cur_is_even_character),
        .I2(min_latency1_carry_i_7__0),
        .I3(\tail_reg[0]_1 ),
        .I4(min_latency1_carry_i_25__0_n_0),
        .O(\channel_old_latency[5]_i_3__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \channel_old_latency[5]_i_5 
       (.I0(\channel_old_latency[5]_i_6_n_0 ),
        .I1(cur_is_even_character),
        .I2(\channel_old_latency[5]_i_2_0 ),
        .O(\channel_old_latency[5]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h96996696)) 
    \channel_old_latency[5]_i_6 
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .I4(\state_cur[2]_i_5__4_n_0 ),
        .O(\channel_old_latency[5]_i_6_n_0 ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[1].engine_and_station_i/anEngine/anEngine/buffer/fifo_even/content" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "31" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    content_reg_bram_0
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,tail_reg,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,where_to_read,content_reg_bram_0_i_6__4_n_0,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DINADIN}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT({NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:8],from_memory}),
        .DOUTPADOUTP(NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(fifo_even_data_in_valid),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'hDFFDFEEFEFFEDFFD)) 
    content_reg_bram_0_i_15__3
       (.I0(head_reg[3]),
        .I1(content_reg_bram_0_i_40__0_n_0),
        .I2(head_reg[4]),
        .I3(tail_reg[4]),
        .I4(content_reg_bram_0_i_41__0_n_0),
        .I5(tail_reg[3]),
        .O(WEA));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h8)) 
    content_reg_bram_0_i_21__3
       (.I0(head_reg[1]),
        .I1(head_reg[2]),
        .O(content_reg_bram_0_i_21__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    content_reg_bram_0_i_22__2
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(content_reg_bram_0_i_22__2_n_0));
  LUT6 #(
    .INIT(64'hFFFF6AFF00006A00)) 
    content_reg_bram_0_i_2__4
       (.I0(head_reg[4]),
        .I1(content_reg_bram_0_i_21__3_n_0),
        .I2(head_reg[3]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_i_22__2_n_0),
        .I5(\head[4]_i_2__0_n_0 ),
        .O(where_to_read[4]));
  LUT6 #(
    .INIT(64'hC8CCCDCCCDCCC8CC)) 
    content_reg_bram_0_i_3__1
       (.I0(content_reg_bram_0_i_22__2_n_0),
        .I1(\head[3]_i_1__0_n_0 ),
        .I2(content_reg_bram_0_0),
        .I3(cur_is_even_character),
        .I4(head_reg[3]),
        .I5(content_reg_bram_0_i_21__3_n_0),
        .O(where_to_read[3]));
  LUT6 #(
    .INIT(64'hFB7DEFFFEFFFFB7D)) 
    content_reg_bram_0_i_40__0
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(content_reg_bram_0_i_40__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    content_reg_bram_0_i_41__0
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(content_reg_bram_0_i_41__0_n_0));
  LUT6 #(
    .INIT(64'h3233FFFFCDCC0000)) 
    content_reg_bram_0_i_4__2
       (.I0(content_reg_bram_0_i_22__2_n_0),
        .I1(head_reg[0]),
        .I2(content_reg_bram_0_0),
        .I3(cur_is_even_character),
        .I4(head_reg[1]),
        .I5(head_reg[2]),
        .O(where_to_read[2]));
  LUT6 #(
    .INIT(64'h555555556AAAAAAA)) 
    content_reg_bram_0_i_5__2
       (.I0(head_reg[1]),
        .I1(p_0_in),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(state_cur[0]),
        .I5(head_reg[0]),
        .O(where_to_read[1]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    content_reg_bram_0_i_6__4
       (.I0(head_reg[0]),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(state_cur[2]),
        .I4(p_0_in),
        .O(content_reg_bram_0_i_6__4_n_0));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    content_reg_i_1
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[5] ),
        .I3(cur_is_even_character),
        .I4(from_memory[5]),
        .I5(\FETCH_REC_Pc_reg[5] ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'hD0FF)) 
    content_reg_i_11__0
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[2] ),
        .I3(cur_is_even_character),
        .O(content_reg_i_11__0_n_0));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    content_reg_i_2__0
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[4] ),
        .I3(cur_is_even_character),
        .I4(from_memory[4]),
        .I5(\FETCH_REC_Pc_reg[4] ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hEAEAEA00EA00EA00)) 
    content_reg_i_3__0
       (.I0(content_reg_i_7__0_n_0),
        .I1(from_memory[3]),
        .I2(content_reg_i_8_n_0),
        .I3(\FETCH_REC_Pc_reg[3] ),
        .I4(DOUTBDOUT[1]),
        .I5(\FETCH_REC_Pc_reg[2]_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hEAEAEA00EA00EA00)) 
    content_reg_i_4__0
       (.I0(content_reg_i_11__0_n_0),
        .I1(from_memory[2]),
        .I2(content_reg_i_8_n_0),
        .I3(\FETCH_REC_Pc_reg[2] ),
        .I4(DOUTBDOUT[0]),
        .I5(\FETCH_REC_Pc_reg[2]_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'hD0FF)) 
    content_reg_i_7__0
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[3] ),
        .I3(cur_is_even_character),
        .O(content_reg_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    content_reg_i_8
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .O(content_reg_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1__3 
       (.I0(head_reg[0]),
        .O(\head[0]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1__0 
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .O(\head[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[2]_i_1__0 
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[0]),
        .O(\head[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \head[3]_i_1__0 
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .O(\head[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \head[4]_i_2__0 
       (.I0(head_reg[4]),
        .I1(head_reg[2]),
        .I2(head_reg[1]),
        .I3(head_reg[0]),
        .I4(head_reg[3]),
        .O(\head[4]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8AA8AAAAAAAA8AA8)) 
    \head[4]_i_3__1 
       (.I0(cur_is_even_character),
        .I1(\head[4]_i_4__1_n_0 ),
        .I2(tail_reg[3]),
        .I3(head_reg[3]),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(cur_is_even_character_reg_4));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \head[4]_i_4__1 
       (.I0(tail_reg[0]),
        .I1(head_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[4]),
        .I5(head_reg[4]),
        .O(\head[4]_i_4__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\head[0]_i_1__3_n_0 ),
        .Q(head_reg[0]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\head[1]_i_1__0_n_0 ),
        .Q(head_reg[1]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\head[2]_i_1__0_n_0 ),
        .Q(head_reg[2]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\head[3]_i_1__0_n_0 ),
        .Q(head_reg[3]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\head[4]_i_2__0_n_0 ),
        .Q(head_reg[4]),
        .R(\state_cur_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[0]_i_1__1 
       (.I0(from_memory[0]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(DINADIN[0]),
        .O(\middle[0]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[1]_i_1__1 
       (.I0(from_memory[1]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(DINADIN[1]),
        .O(\middle[1]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[2]_i_1__1 
       (.I0(from_memory[2]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(DINADIN[2]),
        .O(\middle[2]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[3]_i_1__1 
       (.I0(from_memory[3]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(DINADIN[3]),
        .O(\middle[3]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[4]_i_1__1 
       (.I0(from_memory[4]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(DINADIN[4]),
        .O(\middle[4]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[5]_i_1__1 
       (.I0(from_memory[5]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(DINADIN[5]),
        .O(\middle[5]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[6]_i_1__1 
       (.I0(from_memory[6]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(DINADIN[6]),
        .O(\middle[6]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h5000004005450044)) 
    \middle[7]_i_1__2 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(fifo_even_data_in_valid),
        .I2(p_0_in),
        .I3(state_cur[0]),
        .I4(state_cur[1]),
        .I5(state_cur[2]),
        .O(\middle[7]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[7]_i_2__1 
       (.I0(from_memory[7]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(DINADIN[7]),
        .O(\middle[7]_i_2__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[7]_i_1__2_n_0 ),
        .D(\middle[0]_i_1__1_n_0 ),
        .Q(\middle_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[7]_i_1__2_n_0 ),
        .D(\middle[1]_i_1__1_n_0 ),
        .Q(\middle_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[7]_i_1__2_n_0 ),
        .D(\middle[2]_i_1__1_n_0 ),
        .Q(\middle_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[7]_i_1__2_n_0 ),
        .D(\middle[3]_i_1__1_n_0 ),
        .Q(\middle_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[7]_i_1__2_n_0 ),
        .D(\middle[4]_i_1__1_n_0 ),
        .Q(\middle_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[7]_i_1__2_n_0 ),
        .D(\middle[5]_i_1__1_n_0 ),
        .Q(\middle_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[7]_i_1__2_n_0 ),
        .D(\middle[6]_i_1__1_n_0 ),
        .Q(\middle_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[7]_i_1__2_n_0 ),
        .D(\middle[7]_i_2__1_n_0 ),
        .Q(\middle_reg_n_0_[7] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h47FFB800FFFF0000)) 
    min_latency1_carry_i_14__0
       (.I0(min_latency1_carry_i_23_n_0),
        .I1(cur_is_even_character),
        .I2(min_latency1_carry_i_7__0),
        .I3(\tail_reg[0]_1 ),
        .I4(min_latency1_carry_i_25__0_n_0),
        .I5(cur_is_even_character_reg),
        .O(cur_is_even_character_reg_0));
  LUT5 #(
    .INIT(32'h47B8B8B8)) 
    min_latency1_carry_i_16__0
       (.I0(min_latency1_carry_i_23_n_0),
        .I1(cur_is_even_character),
        .I2(min_latency1_carry_i_7__0),
        .I3(cur_is_even_character_reg),
        .I4(\tail_reg[0]_1 ),
        .O(cur_is_even_character_reg_1));
  LUT6 #(
    .INIT(64'h1BB100001BB11BB1)) 
    min_latency1_carry_i_17__0
       (.I0(cur_is_even_character),
        .I1(\channel_old_latency_reg[4] ),
        .I2(tail_reg[0]),
        .I3(head_reg[0]),
        .I4(\channel_old_latency[5]_i_3__0_n_0 ),
        .I5(\channel_old_latency[5]_i_5_n_0 ),
        .O(cur_is_even_character_reg));
  LUT6 #(
    .INIT(64'h4BB4FFFF4BB40000)) 
    min_latency1_carry_i_18
       (.I0(tail_reg[0]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .I4(cur_is_even_character),
        .I5(min_latency1_carry_i_4),
        .O(\tail_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h6696969966966696)) 
    min_latency1_carry_i_23
       (.I0(head_reg[2]),
        .I1(tail_reg[2]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .I5(head_reg[0]),
        .O(min_latency1_carry_i_23_n_0));
  LUT5 #(
    .INIT(32'h69FF6900)) 
    min_latency1_carry_i_25__0
       (.I0(tail_reg[3]),
        .I1(head_reg[3]),
        .I2(\state_cur[2]_i_5__4_n_0 ),
        .I3(cur_is_even_character),
        .I4(min_latency1_carry_i_14__0_0),
        .O(min_latency1_carry_i_25__0_n_0));
  LUT6 #(
    .INIT(64'hCDD0C450FDD0F450)) 
    \state_cur[0]_i_1__3 
       (.I0(p_0_in),
        .I1(fifo_even_data_in_valid),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(state_cur[0]),
        .I5(\state_cur[2]_i_3__3_n_0 ),
        .O(state_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \state_cur[1]_i_1__3 
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(state_next[1]));
  LUT6 #(
    .INIT(64'hC0FF00FFFF00EEAA)) 
    \state_cur[2]_i_1__3 
       (.I0(fifo_even_data_in_valid),
        .I1(p_0_in),
        .I2(\state_cur[2]_i_3__3_n_0 ),
        .I3(state_cur[2]),
        .I4(state_cur[0]),
        .I5(state_cur[1]),
        .O(\state_cur[2]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT5 #(
    .INIT(32'hD7D7FFD3)) 
    \state_cur[2]_i_2__3 
       (.I0(p_0_in),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(fifo_even_data_in_valid),
        .I4(state_cur[0]),
        .O(state_next[2]));
  LUT6 #(
    .INIT(64'h0060900090000090)) 
    \state_cur[2]_i_3__3 
       (.I0(tail_reg[4]),
        .I1(head_reg[4]),
        .I2(\state_cur[2]_i_4__2_n_0 ),
        .I3(tail_reg[3]),
        .I4(head_reg[3]),
        .I5(\state_cur[2]_i_5__4_n_0 ),
        .O(\state_cur[2]_i_3__3_n_0 ));
  LUT6 #(
    .INIT(64'h0690000000000690)) 
    \state_cur[2]_i_4__2 
       (.I0(tail_reg[2]),
        .I1(head_reg[2]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .I5(tail_reg[0]),
        .O(\state_cur[2]_i_4__2_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    \state_cur[2]_i_5__4 
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\state_cur[2]_i_5__4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__3_n_0 ),
        .D(state_next[0]),
        .Q(state_cur[0]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__3_n_0 ),
        .D(state_next[1]),
        .Q(state_cur[1]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__3_n_0 ),
        .D(state_next[2]),
        .Q(state_cur[2]),
        .R(\state_cur_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \tag_saved[0]_i_1__0 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[6] ),
        .I3(cur_is_even_character),
        .I4(from_memory[6]),
        .I5(\FETCH_REC_Pc_reg[6] ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \tag_saved[1]_i_1__0 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[7] ),
        .I3(cur_is_even_character),
        .I4(from_memory[7]),
        .I5(\FETCH_REC_Pc_reg[7] ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \tail[0]_i_1 
       (.I0(tail_reg[0]),
        .O(state_next4[0]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[1]_i_1__3 
       (.I0(tail_reg[0]),
        .I1(tail_reg[1]),
        .O(state_next4[1]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[2]_i_1__1 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(state_next4[2]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \tail[3]_i_1__1 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .I3(tail_reg[3]),
        .O(state_next4[3]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \tail[4]_i_1__1 
       (.I0(tail_reg[4]),
        .I1(tail_reg[2]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(tail_reg[3]),
        .O(state_next4[4]));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_even_data_in_valid),
        .D(state_next4[0]),
        .Q(tail_reg[0]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_even_data_in_valid),
        .D(state_next4[1]),
        .Q(tail_reg[1]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_even_data_in_valid),
        .D(state_next4[2]),
        .Q(tail_reg[2]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_even_data_in_valid),
        .D(state_next4[3]),
        .Q(tail_reg[3]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_even_data_in_valid),
        .D(state_next4[4]),
        .Q(tail_reg[4]),
        .R(\state_cur_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "fifo" *) 
module fifo_1
   (DOUTBDOUT,
    cur_is_even_character_reg,
    \head_reg[0]_0 ,
    \cur_state_reg[0] ,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    content_reg_bram_0_i_24__2_0,
    \head_reg[2]_0 ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[25] ,
    \cur_ccs_reg[57] ,
    \tail_reg[6] ,
    \head_reg[3]_0 ,
    \cur_state_reg[1] ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    cur_is_even_character_reg_2,
    cur_is_even_character_reg_3,
    content_reg_bram_0_5,
    \state_cur_reg[1]_0 ,
    \tail_reg[0]_0 ,
    \head_reg[4]_0 ,
    \head_reg[2]_1 ,
    \tail_reg[3]_0 ,
    clk_IBUF_BUFG,
    E,
    content_reg_bram_0_6,
    p_0_in_0,
    cur_is_even_character,
    \cur_state_reg[0]_0 ,
    \head[4]_i_4 ,
    \cur_state_reg[0]_1 ,
    \cur_state_reg[0]_2 ,
    \cur_state_reg[0]_3 ,
    \cur_state_reg[0]_4 ,
    \state_cur_reg[2]_0 ,
    \state_cur_reg[0]_0 ,
    content_reg_bram_0_7,
    \cur_state[2]_i_29 ,
    \FETCH_REC_Instr[15]_i_12 ,
    content_reg_bram_0_i_19__1,
    WEA,
    \tail_reg[4]_0 ,
    \head_reg[6] ,
    \head_reg[6]_0 );
  output [1:0]DOUTBDOUT;
  output cur_is_even_character_reg;
  output \head_reg[0]_0 ;
  output \cur_state_reg[0] ;
  output cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output [0:0]content_reg_bram_0_i_24__2_0;
  output \head_reg[2]_0 ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[25] ;
  output \cur_ccs_reg[57] ;
  output \tail_reg[6] ;
  output \head_reg[3]_0 ;
  output \cur_state_reg[1] ;
  output content_reg_bram_0_0;
  output content_reg_bram_0_1;
  output content_reg_bram_0_2;
  output content_reg_bram_0_3;
  output content_reg_bram_0_4;
  output cur_is_even_character_reg_2;
  output cur_is_even_character_reg_3;
  output content_reg_bram_0_5;
  output \state_cur_reg[1]_0 ;
  output \tail_reg[0]_0 ;
  output \head_reg[4]_0 ;
  output \head_reg[2]_1 ;
  output \tail_reg[3]_0 ;
  input clk_IBUF_BUFG;
  input [0:0]E;
  input [7:0]content_reg_bram_0_6;
  input [0:0]p_0_in_0;
  input cur_is_even_character;
  input \cur_state_reg[0]_0 ;
  input [2:0]\head[4]_i_4 ;
  input \cur_state_reg[0]_1 ;
  input \cur_state_reg[0]_2 ;
  input \cur_state_reg[0]_3 ;
  input \cur_state_reg[0]_4 ;
  input \state_cur_reg[2]_0 ;
  input \state_cur_reg[0]_0 ;
  input content_reg_bram_0_7;
  input [2:0]\cur_state[2]_i_29 ;
  input [15:0]\FETCH_REC_Instr[15]_i_12 ;
  input [0:0]content_reg_bram_0_i_19__1;
  input [0:0]WEA;
  input [0:0]\tail_reg[4]_0 ;
  input \head_reg[6] ;
  input \head_reg[6]_0 ;

  wire [1:0]DOUTBDOUT;
  wire [0:0]E;
  wire [15:0]\FETCH_REC_Instr[15]_i_12 ;
  wire [0:0]WEA;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire [7:0]content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_i_17__3_n_0;
  wire content_reg_bram_0_i_18__2_n_0;
  wire [0:0]content_reg_bram_0_i_19__1;
  wire content_reg_bram_0_i_19__3_n_0;
  wire content_reg_bram_0_i_20__3_n_0;
  wire content_reg_bram_0_i_21__1_n_0;
  wire [0:0]content_reg_bram_0_i_24__2_0;
  wire content_reg_bram_0_i_6__3_n_0;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_ccs_reg[25] ;
  wire \cur_ccs_reg[57] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire [2:0]\cur_state[2]_i_29 ;
  wire \cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire \cur_state_reg[0]_3 ;
  wire \cur_state_reg[0]_4 ;
  wire \cur_state_reg[1] ;
  wire fifo_odd_data_in_ready;
  wire [7:0]from_memory;
  wire \head[0]_i_1__4_n_0 ;
  wire \head[1]_i_1_n_0 ;
  wire \head[2]_i_1_n_0 ;
  wire \head[3]_i_1_n_0 ;
  wire \head[4]_i_2_n_0 ;
  wire [2:0]\head[4]_i_4 ;
  wire \head[4]_i_4__2_n_0 ;
  wire [4:0]head_reg;
  wire \head_reg[0]_0 ;
  wire \head_reg[2]_0 ;
  wire \head_reg[2]_1 ;
  wire \head_reg[3]_0 ;
  wire \head_reg[4]_0 ;
  wire \head_reg[6] ;
  wire \head_reg[6]_0 ;
  wire [7:0]middle;
  wire middle_0;
  wire [7:0]middle_next;
  wire \old_grant[0]_i_20_n_0 ;
  wire \old_grant[0]_i_21_n_0 ;
  wire [0:0]p_0_in_0;
  wire [2:0]state_cur;
  wire state_cur0;
  wire \state_cur[2]_i_3__4_n_0 ;
  wire \state_cur[2]_i_4__3_n_0 ;
  wire \state_cur[2]_i_5__3_n_0 ;
  wire \state_cur_reg[0]_0 ;
  wire \state_cur_reg[1]_0 ;
  wire \state_cur_reg[2]_0 ;
  wire [2:0]state_next;
  wire \tail[0]_i_1__0_n_0 ;
  wire \tail[1]_i_1__4_n_0 ;
  wire \tail[2]_i_1__2_n_0 ;
  wire \tail[3]_i_1__4_n_0 ;
  wire \tail[4]_i_1__2_n_0 ;
  wire [4:0]tail_reg;
  wire \tail_reg[0]_0 ;
  wire \tail_reg[3]_0 ;
  wire [0:0]\tail_reg[4]_0 ;
  wire \tail_reg[6] ;
  wire [4:1]where_to_read;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:8]NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hDB)) 
    FETCH_REC_has_to_save_i_4
       (.I0(\head[4]_i_4 [1]),
        .I1(\head[4]_i_4 [2]),
        .I2(\head[4]_i_4 [0]),
        .O(\cur_state_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT5 #(
    .INIT(32'h00003533)) 
    \block_sel_saved[0]_i_2__0 
       (.I0(from_memory[0]),
        .I1(middle[0]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_0));
  LUT5 #(
    .INIT(32'h00003533)) 
    \block_sel_saved[1]_i_2__0 
       (.I0(from_memory[1]),
        .I1(middle[1]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_1));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \channel_old_latency[5]_i_4 
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .O(\head_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT5 #(
    .INIT(32'h96996696)) 
    \channel_old_latency[5]_i_7 
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .I4(\state_cur[2]_i_5__3_n_0 ),
        .O(\head_reg[4]_0 ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[1].engine_and_station_i/anEngine/anEngine/buffer/fifo_odd/content" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "31" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    content_reg_bram_0
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,tail_reg,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,where_to_read,content_reg_bram_0_i_6__3_n_0,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,content_reg_bram_0_6}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT({NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:8],from_memory[7:4],DOUTBDOUT,from_memory[1:0]}),
        .DOUTPADOUTP(NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(E),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({fifo_odd_data_in_ready,fifo_odd_data_in_ready}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT1 #(
    .INIT(2'h1)) 
    content_reg_bram_0_i_15__4
       (.I0(content_reg_bram_0_i_19__3_n_0),
        .O(fifo_odd_data_in_ready));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'hB)) 
    content_reg_bram_0_i_16__2
       (.I0(content_reg_bram_0_i_19__3_n_0),
        .I1(\tail_reg[4]_0 ),
        .O(\head_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT2 #(
    .INIT(4'h8)) 
    content_reg_bram_0_i_17__3
       (.I0(head_reg[1]),
        .I1(head_reg[2]),
        .O(content_reg_bram_0_i_17__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    content_reg_bram_0_i_18__2
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(content_reg_bram_0_i_18__2_n_0));
  LUT6 #(
    .INIT(64'h2002011010012002)) 
    content_reg_bram_0_i_19__3
       (.I0(head_reg[3]),
        .I1(content_reg_bram_0_i_20__3_n_0),
        .I2(head_reg[4]),
        .I3(tail_reg[4]),
        .I4(content_reg_bram_0_i_21__1_n_0),
        .I5(tail_reg[3]),
        .O(content_reg_bram_0_i_19__3_n_0));
  LUT6 #(
    .INIT(64'hFB7DEFFFEFFFFB7D)) 
    content_reg_bram_0_i_20__3
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(content_reg_bram_0_i_20__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    content_reg_bram_0_i_21__1
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(content_reg_bram_0_i_21__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT4 #(
    .INIT(16'hCEEE)) 
    content_reg_bram_0_i_24__2
       (.I0(\head_reg[3]_0 ),
        .I1(\head_reg[6] ),
        .I2(\head_reg[6]_0 ),
        .I3(WEA),
        .O(\head_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hFFFF6AFF00006A00)) 
    content_reg_bram_0_i_2__3
       (.I0(head_reg[4]),
        .I1(content_reg_bram_0_i_17__3_n_0),
        .I2(head_reg[3]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_i_18__2_n_0),
        .I5(\head[4]_i_2_n_0 ),
        .O(where_to_read[4]));
  LUT6 #(
    .INIT(64'hCCC8CCCDCCCDCCC8)) 
    content_reg_bram_0_i_3__2
       (.I0(content_reg_bram_0_i_18__2_n_0),
        .I1(\head[3]_i_1_n_0 ),
        .I2(cur_is_even_character),
        .I3(content_reg_bram_0_7),
        .I4(head_reg[3]),
        .I5(content_reg_bram_0_i_17__3_n_0),
        .O(where_to_read[3]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    content_reg_bram_0_i_42
       (.I0(\head_reg[3]_0 ),
        .I1(content_reg_bram_0_i_19__1),
        .I2(WEA),
        .O(\tail_reg[6] ));
  LUT6 #(
    .INIT(64'h3332FFFFCCCD0000)) 
    content_reg_bram_0_i_4__3
       (.I0(content_reg_bram_0_i_18__2_n_0),
        .I1(head_reg[0]),
        .I2(cur_is_even_character),
        .I3(content_reg_bram_0_7),
        .I4(head_reg[1]),
        .I5(head_reg[2]),
        .O(where_to_read[2]));
  LUT6 #(
    .INIT(64'h555555556AAAAAAA)) 
    content_reg_bram_0_i_5__1
       (.I0(head_reg[1]),
        .I1(p_0_in_0),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(state_cur[0]),
        .I5(head_reg[0]),
        .O(where_to_read[1]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    content_reg_bram_0_i_6__3
       (.I0(head_reg[0]),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(state_cur[2]),
        .I4(p_0_in_0),
        .O(content_reg_bram_0_i_6__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h2)) 
    content_reg_i_10__0
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .O(\state_cur_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'hFBAA)) 
    content_reg_i_12
       (.I0(cur_is_even_character),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(middle[2]),
        .O(cur_is_even_character_reg_2));
  LUT5 #(
    .INIT(32'h00003533)) 
    content_reg_i_5__0
       (.I0(from_memory[5]),
        .I1(middle[5]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_5));
  LUT5 #(
    .INIT(32'h00003533)) 
    content_reg_i_6__0
       (.I0(from_memory[4]),
        .I1(middle[4]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_4));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'hFBAA)) 
    content_reg_i_9__0
       (.I0(cur_is_even_character),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(middle[3]),
        .O(cur_is_even_character_reg_3));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    \cur_state[0]_i_2 
       (.I0(cur_is_even_character_reg),
        .I1(\cur_state_reg[0]_0 ),
        .I2(\cur_state_reg[0]_3 ),
        .I3(\cur_state_reg[0]_1 ),
        .I4(\cur_state_reg[0]_2 ),
        .I5(\cur_state_reg[0]_4 ),
        .O(cur_is_even_character_reg_1));
  LUT4 #(
    .INIT(16'h1000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_90 
       (.I0(cur_is_even_character_reg),
        .I1(\cur_state_reg[0]_0 ),
        .I2(\cur_state_reg[0]_1 ),
        .I3(\cur_state_reg[0]_2 ),
        .O(cur_is_even_character_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1__4 
       (.I0(head_reg[0]),
        .O(\head[0]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1 
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .O(\head[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[2]_i_1 
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[0]),
        .O(\head[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \head[3]_i_1 
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .O(\head[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \head[4]_i_2 
       (.I0(head_reg[4]),
        .I1(head_reg[2]),
        .I2(head_reg[1]),
        .I3(head_reg[0]),
        .I4(head_reg[3]),
        .O(\head[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4554555555554554)) 
    \head[4]_i_3__2 
       (.I0(cur_is_even_character),
        .I1(\head[4]_i_4__2_n_0 ),
        .I2(tail_reg[3]),
        .I3(head_reg[3]),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(cur_is_even_character_reg));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \head[4]_i_4__2 
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(tail_reg[1]),
        .I5(head_reg[1]),
        .O(\head[4]_i_4__2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \head[6]_i_1__0 
       (.I0(\head_reg[2]_0 ),
        .O(content_reg_bram_0_i_24__2_0));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(\head[0]_i_1__4_n_0 ),
        .Q(head_reg[0]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(\head[1]_i_1_n_0 ),
        .Q(head_reg[1]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(\head[2]_i_1_n_0 ),
        .Q(head_reg[2]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(\head[3]_i_1_n_0 ),
        .Q(head_reg[3]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(\head[4]_i_2_n_0 ),
        .Q(head_reg[4]),
        .R(\state_cur_reg[2]_0 ));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[0]_i_1__2 
       (.I0(from_memory[0]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_6[0]),
        .O(middle_next[0]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[1]_i_1__2 
       (.I0(from_memory[1]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_6[1]),
        .O(middle_next[1]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[2]_i_1__2 
       (.I0(DOUTBDOUT[0]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_6[2]),
        .O(middle_next[2]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[3]_i_1__2 
       (.I0(DOUTBDOUT[1]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_6[3]),
        .O(middle_next[3]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[4]_i_1__2 
       (.I0(from_memory[4]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_6[4]),
        .O(middle_next[4]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[5]_i_1__2 
       (.I0(from_memory[5]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_6[5]),
        .O(middle_next[5]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[6]_i_1__2 
       (.I0(from_memory[6]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_6[6]),
        .O(middle_next[6]));
  LUT6 #(
    .INIT(64'h2020001302020203)) 
    \middle[7]_i_1__1 
       (.I0(state_cur[1]),
        .I1(\state_cur_reg[2]_0 ),
        .I2(state_cur[2]),
        .I3(\state_cur_reg[0]_0 ),
        .I4(state_cur[0]),
        .I5(p_0_in_0),
        .O(middle_0));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[7]_i_2__2 
       (.I0(from_memory[7]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in_0),
        .I4(content_reg_bram_0_6[7]),
        .O(middle_next[7]));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[0]),
        .Q(middle[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[1]),
        .Q(middle[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[2]),
        .Q(middle[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[3]),
        .Q(middle[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[4]),
        .Q(middle[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[5]),
        .Q(middle[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[6]),
        .Q(middle[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[7]),
        .Q(middle[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6696969966966696)) 
    min_latency1_carry_i_24
       (.I0(head_reg[2]),
        .I1(tail_reg[2]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .I5(head_reg[0]),
        .O(\head_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT4 #(
    .INIT(16'h4BB4)) 
    min_latency1_carry_i_26__0
       (.I0(tail_reg[0]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .O(\tail_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'h69)) 
    min_latency1_carry_i_27
       (.I0(tail_reg[3]),
        .I1(head_reg[3]),
        .I2(\state_cur[2]_i_5__3_n_0 ),
        .O(\tail_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_20 
       (.I0(\FETCH_REC_Instr[15]_i_12 [6]),
        .I1(\FETCH_REC_Instr[15]_i_12 [4]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_12 [2]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_12 [0]),
        .O(\old_grant[0]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_21 
       (.I0(\FETCH_REC_Instr[15]_i_12 [14]),
        .I1(\FETCH_REC_Instr[15]_i_12 [12]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_12 [10]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_12 [8]),
        .O(\old_grant[0]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_32 
       (.I0(\FETCH_REC_Instr[15]_i_12 [7]),
        .I1(\FETCH_REC_Instr[15]_i_12 [5]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_12 [3]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_12 [1]),
        .O(\cur_ccs_reg[25] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_33 
       (.I0(\FETCH_REC_Instr[15]_i_12 [15]),
        .I1(\FETCH_REC_Instr[15]_i_12 [13]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_12 [11]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_12 [9]),
        .O(\cur_ccs_reg[57] ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT5 #(
    .INIT(32'hFF1FF1FF)) 
    \old_grant[0]_i_4__1 
       (.I0(cur_is_even_character_reg),
        .I1(\cur_state_reg[0]_0 ),
        .I2(\head[4]_i_4 [0]),
        .I3(\head[4]_i_4 [2]),
        .I4(\head[4]_i_4 [1]),
        .O(\cur_state_reg[0] ));
  MUXF7 \old_grant_reg[0]_i_10 
       (.I0(\old_grant[0]_i_20_n_0 ),
        .I1(\old_grant[0]_i_21_n_0 ),
        .O(\cur_cc_pointer_reg[2] ),
        .S(\cur_state[2]_i_29 [2]));
  MUXF7 \old_grant_reg[0]_i_16 
       (.I0(\cur_ccs_reg[25] ),
        .I1(\cur_ccs_reg[57] ),
        .O(\cur_cc_pointer_reg[2]_0 ),
        .S(\cur_state[2]_i_29 [2]));
  LUT6 #(
    .INIT(64'h8080BCB0FCC0FCFC)) 
    \state_cur[0]_i_1__4 
       (.I0(\state_cur[2]_i_3__4_n_0 ),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(state_cur[0]),
        .I4(p_0_in_0),
        .I5(\state_cur_reg[0]_0 ),
        .O(state_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \state_cur[1]_i_1__2 
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(state_next[1]));
  LUT6 #(
    .INIT(64'h0CFF00FFFF00DD55)) 
    \state_cur[2]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(p_0_in_0),
        .I2(\state_cur[2]_i_3__4_n_0 ),
        .I3(state_cur[2]),
        .I4(state_cur[0]),
        .I5(state_cur[1]),
        .O(state_cur0));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT5 #(
    .INIT(32'hD7D3D7FF)) 
    \state_cur[2]_i_2__4 
       (.I0(p_0_in_0),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(state_cur[0]),
        .I4(\state_cur_reg[0]_0 ),
        .O(state_next[2]));
  LUT6 #(
    .INIT(64'hFF9F6FFF6FFFFF6F)) 
    \state_cur[2]_i_3__4 
       (.I0(tail_reg[4]),
        .I1(head_reg[4]),
        .I2(\state_cur[2]_i_4__3_n_0 ),
        .I3(tail_reg[3]),
        .I4(head_reg[3]),
        .I5(\state_cur[2]_i_5__3_n_0 ),
        .O(\state_cur[2]_i_3__4_n_0 ));
  LUT6 #(
    .INIT(64'h0690000000000690)) 
    \state_cur[2]_i_4__3 
       (.I0(tail_reg[2]),
        .I1(head_reg[2]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .I5(tail_reg[0]),
        .O(\state_cur[2]_i_4__3_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    \state_cur[2]_i_5__3 
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\state_cur[2]_i_5__3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(state_cur0),
        .D(state_next[0]),
        .Q(state_cur[0]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(state_cur0),
        .D(state_next[1]),
        .Q(state_cur[1]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(state_cur0),
        .D(state_next[2]),
        .Q(state_cur[2]),
        .R(\state_cur_reg[2]_0 ));
  LUT5 #(
    .INIT(32'h00003533)) 
    \tag_saved[0]_i_2__0 
       (.I0(from_memory[6]),
        .I1(middle[6]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_2));
  LUT5 #(
    .INIT(32'h00003533)) 
    \tag_saved[1]_i_2__0 
       (.I0(from_memory[7]),
        .I1(middle[7]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_3));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \tail[0]_i_1__0 
       (.I0(tail_reg[0]),
        .O(\tail[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[1]_i_1__4 
       (.I0(tail_reg[0]),
        .I1(tail_reg[1]),
        .O(\tail[1]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[2]_i_1__2 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(\tail[2]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \tail[3]_i_1__4 
       (.I0(tail_reg[3]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(tail_reg[2]),
        .O(\tail[3]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \tail[4]_i_1__2 
       (.I0(tail_reg[4]),
        .I1(tail_reg[2]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(tail_reg[3]),
        .O(\tail[4]_i_1__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\tail[0]_i_1__0_n_0 ),
        .Q(tail_reg[0]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\tail[1]_i_1__4_n_0 ),
        .Q(tail_reg[1]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\tail[2]_i_1__2_n_0 ),
        .Q(tail_reg[2]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\tail[3]_i_1__4_n_0 ),
        .Q(tail_reg[3]),
        .R(\state_cur_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\tail[4]_i_1__2_n_0 ),
        .Q(tail_reg[4]),
        .R(\state_cur_reg[2]_0 ));
endmodule

(* ORIG_REF_NAME = "fifo" *) 
module fifo_12
   (WEA,
    D,
    \channel_old_latency_reg[3] ,
    cur_is_even_character_reg,
    \head_reg[1]_0 ,
    cur_is_even_character_reg_0,
    DI,
    S,
    cur_is_even_character_reg_1,
    \head_reg[3]_0 ,
    \head_reg[3]_1 ,
    \head_reg[3]_2 ,
    \head_reg[3]_3 ,
    \head_reg[3]_4 ,
    \head_reg[3]_5 ,
    \state_cur_reg[1]_0 ,
    \old_grant_reg[0] ,
    \old_grant_reg[0]_0 ,
    \old_grant_reg[0]_1 ,
    \old_grant_reg[0]_2 ,
    \old_grant_reg[0]_3 ,
    \old_grant_reg[0]_4 ,
    \cur_state_reg[1] ,
    \cur_state_reg[0] ,
    \tail_reg[3]_0 ,
    \cur_cc_pointer_reg[3] ,
    clk_IBUF_BUFG,
    E,
    DINADIN,
    \channel_old_latency_reg[3]_0 ,
    p_0_in_0,
    cur_is_even_character,
    \channel_old_latency_reg[3]_1 ,
    \channel_old_latency_reg[3]_2 ,
    \channel_old_latency_reg[3]_3 ,
    \channel_old_latency_reg[5] ,
    min_latency1_carry,
    content_reg_bram_0_0,
    \FETCH_REC_Instr[15]_i_3 ,
    \FETCH_REC_Instr[15]_i_3_0 ,
    \tail_reg[4]_0 ,
    \switch2channel\.ready_0 ,
    \switch2channel\.ready ,
    \cur_state[2]_i_9 ,
    \tail_reg[4]_1 ,
    content_reg_bram_0_1,
    in_ready_packed,
    \channel_old_latency_reg[3]_4 ,
    \channel_old_latency_reg[6] ,
    \channel_old_latency_reg[5]_0 ,
    \channel_old_latency_reg[6]_0 ,
    \channel_old_latency_reg[6]_1 ,
    \FETCH_REC_Pc_reg[0] ,
    \FETCH_REC_Pc_reg[1] ,
    \state_cur_reg[2]_0 ,
    SR,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    old_grant,
    \memory_bb\.addr ,
    \FETCH_REC_Pc_reg[6] ,
    \FETCH_REC_Pc_reg[7] ,
    \FETCH_REC_Pc_reg[4] ,
    \FETCH_REC_Pc_reg[2] ,
    DOUTBDOUT,
    \FETCH_REC_Pc_reg[2]_0 ,
    \FETCH_REC_Pc_reg[3] ,
    \FETCH_REC_Pc_reg[5] ,
    \cur_state_reg[0]_0 ,
    min_latency1_carry_i_3,
    min_latency1_carry_i_9_0,
    \cur_state[0]_i_2 ,
    \cur_state_reg[0]_1 ,
    O,
    CO,
    min_latency1_carry_i_8_0,
    min_latency1_carry_i_3_0,
    min_latency1_carry_i_8_1);
  output [0:0]WEA;
  output [5:0]D;
  output \channel_old_latency_reg[3] ;
  output cur_is_even_character_reg;
  output \head_reg[1]_0 ;
  output cur_is_even_character_reg_0;
  output [1:0]DI;
  output [1:0]S;
  output cur_is_even_character_reg_1;
  output \head_reg[3]_0 ;
  output \head_reg[3]_1 ;
  output \head_reg[3]_2 ;
  output \head_reg[3]_3 ;
  output \head_reg[3]_4 ;
  output \head_reg[3]_5 ;
  output [7:0]\state_cur_reg[1]_0 ;
  output \old_grant_reg[0] ;
  output \old_grant_reg[0]_0 ;
  output \old_grant_reg[0]_1 ;
  output \old_grant_reg[0]_2 ;
  output \old_grant_reg[0]_3 ;
  output \old_grant_reg[0]_4 ;
  output \cur_state_reg[1] ;
  output \cur_state_reg[0] ;
  output \tail_reg[3]_0 ;
  output \cur_cc_pointer_reg[3] ;
  input clk_IBUF_BUFG;
  input [0:0]E;
  input [7:0]DINADIN;
  input \channel_old_latency_reg[3]_0 ;
  input [0:0]p_0_in_0;
  input cur_is_even_character;
  input [0:0]\channel_old_latency_reg[3]_1 ;
  input \channel_old_latency_reg[3]_2 ;
  input \channel_old_latency_reg[3]_3 ;
  input \channel_old_latency_reg[5] ;
  input min_latency1_carry;
  input content_reg_bram_0_0;
  input \FETCH_REC_Instr[15]_i_3 ;
  input \FETCH_REC_Instr[15]_i_3_0 ;
  input \tail_reg[4]_0 ;
  input \switch2channel\.ready_0 ;
  input \switch2channel\.ready ;
  input \cur_state[2]_i_9 ;
  input \tail_reg[4]_1 ;
  input content_reg_bram_0_1;
  input [0:0]in_ready_packed;
  input \channel_old_latency_reg[3]_4 ;
  input \channel_old_latency_reg[6] ;
  input \channel_old_latency_reg[5]_0 ;
  input \channel_old_latency_reg[6]_0 ;
  input \channel_old_latency_reg[6]_1 ;
  input \FETCH_REC_Pc_reg[0] ;
  input \FETCH_REC_Pc_reg[1] ;
  input \state_cur_reg[2]_0 ;
  input [0:0]SR;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [0:0]old_grant;
  input [0:0]\memory_bb\.addr ;
  input \FETCH_REC_Pc_reg[6] ;
  input \FETCH_REC_Pc_reg[7] ;
  input \FETCH_REC_Pc_reg[4] ;
  input \FETCH_REC_Pc_reg[2] ;
  input [1:0]DOUTBDOUT;
  input \FETCH_REC_Pc_reg[2]_0 ;
  input \FETCH_REC_Pc_reg[3] ;
  input \FETCH_REC_Pc_reg[5] ;
  input [2:0]\cur_state_reg[0]_0 ;
  input min_latency1_carry_i_3;
  input min_latency1_carry_i_9_0;
  input \cur_state[0]_i_2 ;
  input [0:0]\cur_state_reg[0]_1 ;
  input [0:0]O;
  input [0:0]CO;
  input min_latency1_carry_i_8_0;
  input min_latency1_carry_i_3_0;
  input min_latency1_carry_i_8_1;

  wire [0:0]CO;
  wire [5:0]D;
  wire [1:0]DI;
  wire [7:0]DINADIN;
  wire [1:0]DOUTBDOUT;
  wire [0:0]E;
  wire \FETCH_REC_Instr[15]_i_3 ;
  wire \FETCH_REC_Instr[15]_i_3_0 ;
  wire \FETCH_REC_Pc_reg[0] ;
  wire \FETCH_REC_Pc_reg[1] ;
  wire \FETCH_REC_Pc_reg[2] ;
  wire \FETCH_REC_Pc_reg[2]_0 ;
  wire \FETCH_REC_Pc_reg[3] ;
  wire \FETCH_REC_Pc_reg[4] ;
  wire \FETCH_REC_Pc_reg[5] ;
  wire \FETCH_REC_Pc_reg[6] ;
  wire \FETCH_REC_Pc_reg[7] ;
  wire [0:0]O;
  wire [1:0]S;
  wire [0:0]SR;
  wire [0:0]WEA;
  wire \channel_old_latency[5]_i_2__0_n_0 ;
  wire \channel_old_latency[6]_i_5_n_0 ;
  wire \channel_old_latency_reg[3] ;
  wire \channel_old_latency_reg[3]_0 ;
  wire [0:0]\channel_old_latency_reg[3]_1 ;
  wire \channel_old_latency_reg[3]_2 ;
  wire \channel_old_latency_reg[3]_3 ;
  wire \channel_old_latency_reg[3]_4 ;
  wire \channel_old_latency_reg[5] ;
  wire \channel_old_latency_reg[5]_0 ;
  wire \channel_old_latency_reg[6] ;
  wire \channel_old_latency_reg[6]_0 ;
  wire \channel_old_latency_reg[6]_1 ;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_i_17__1_n_0;
  wire content_reg_bram_0_i_18__3_n_0;
  wire content_reg_bram_0_i_38__0_n_0;
  wire content_reg_bram_0_i_39_n_0;
  wire content_reg_bram_0_i_3__3_n_0;
  wire content_reg_bram_0_i_5__3_n_0;
  wire content_reg_bram_0_i_6__2_n_0;
  wire content_reg_i_12__0_n_0;
  wire content_reg_i_8__0_n_0;
  wire content_reg_i_9_n_0;
  wire \cur_cc_pointer_reg[3] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[0]_i_10_n_0 ;
  wire \cur_state[0]_i_2 ;
  wire \cur_state[0]_i_9_n_0 ;
  wire \cur_state[2]_i_9 ;
  wire \cur_state_reg[0] ;
  wire [2:0]\cur_state_reg[0]_0 ;
  wire [0:0]\cur_state_reg[0]_1 ;
  wire \cur_state_reg[1] ;
  wire [7:0]from_memory;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \head[0]_i_1__0_n_0 ;
  wire [4:0]head_reg;
  wire \head_reg[1]_0 ;
  wire \head_reg[3]_0 ;
  wire \head_reg[3]_1 ;
  wire \head_reg[3]_2 ;
  wire \head_reg[3]_3 ;
  wire \head_reg[3]_4 ;
  wire \head_reg[3]_5 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]\memory_bb\.addr ;
  wire middle;
  wire \middle[0]_i_1__0_n_0 ;
  wire \middle[1]_i_1__0_n_0 ;
  wire \middle[2]_i_1__0_n_0 ;
  wire \middle[3]_i_1__0_n_0 ;
  wire \middle[4]_i_1__0_n_0 ;
  wire \middle[5]_i_1__0_n_0 ;
  wire \middle[6]_i_1__0_n_0 ;
  wire \middle[7]_i_2__0_n_0 ;
  wire \middle_reg_n_0_[0] ;
  wire \middle_reg_n_0_[1] ;
  wire \middle_reg_n_0_[2] ;
  wire \middle_reg_n_0_[3] ;
  wire \middle_reg_n_0_[4] ;
  wire \middle_reg_n_0_[5] ;
  wire \middle_reg_n_0_[6] ;
  wire \middle_reg_n_0_[7] ;
  wire min_latency1_carry;
  wire min_latency1_carry_i_10_n_0;
  wire min_latency1_carry_i_11__0_n_0;
  wire min_latency1_carry_i_14_n_0;
  wire min_latency1_carry_i_16_n_0;
  wire min_latency1_carry_i_24__0_n_0;
  wire min_latency1_carry_i_25_n_0;
  wire min_latency1_carry_i_3;
  wire min_latency1_carry_i_31_n_0;
  wire min_latency1_carry_i_3_0;
  wire min_latency1_carry_i_8_0;
  wire min_latency1_carry_i_8_1;
  wire min_latency1_carry_i_9_0;
  wire min_latency1_carry_i_9_n_0;
  wire [0:0]old_grant;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire [0:0]p_0_in_0;
  wire [4:1]p_0_in__1;
  wire [2:0]state_cur;
  wire \state_cur[2]_i_1__0_n_0 ;
  wire \state_cur[2]_i_3__0_n_0 ;
  wire \state_cur[2]_i_4_n_0 ;
  wire \state_cur[2]_i_5__1_n_0 ;
  wire [7:0]\state_cur_reg[1]_0 ;
  wire \state_cur_reg[2]_0 ;
  wire [2:0]state_next;
  wire [4:0]state_next4;
  wire \switch2channel\.ready ;
  wire \switch2channel\.ready_0 ;
  wire [4:0]tail_reg;
  wire \tail_reg[3]_0 ;
  wire \tail_reg[4]_0 ;
  wire \tail_reg[4]_1 ;
  wire [4:2]where_to_read;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:8]NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFF2FFF222200000)) 
    \FETCH_REC_Instr[15]_i_6__0 
       (.I0(WEA),
        .I1(content_reg_bram_0_0),
        .I2(\FETCH_REC_Instr[15]_i_3 ),
        .I3(\FETCH_REC_Instr[15]_i_3_0 ),
        .I4(\tail_reg[4]_0 ),
        .I5(\switch2channel\.ready_0 ),
        .O(\head_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \block_sel_saved[0]_i_1 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[0] ),
        .I3(cur_is_even_character),
        .I4(from_memory[0]),
        .I5(\FETCH_REC_Pc_reg[0] ),
        .O(\state_cur_reg[1]_0 [0]));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \block_sel_saved[1]_i_1 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[1] ),
        .I3(cur_is_even_character),
        .I4(from_memory[1]),
        .I5(\FETCH_REC_Pc_reg[1] ),
        .O(\state_cur_reg[1]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \channel_old_latency[1]_i_1 
       (.I0(\channel_old_latency[5]_i_2__0_n_0 ),
        .I1(\channel_old_latency_reg[3]_0 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \channel_old_latency[2]_i_1 
       (.I0(cur_is_even_character_reg),
        .I1(\channel_old_latency_reg[3]_0 ),
        .I2(\channel_old_latency[5]_i_2__0_n_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h9555)) 
    \channel_old_latency[3]_i_1 
       (.I0(\channel_old_latency_reg[3] ),
        .I1(\channel_old_latency[5]_i_2__0_n_0 ),
        .I2(\channel_old_latency_reg[3]_0 ),
        .I3(cur_is_even_character_reg),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h0080FF7F)) 
    \channel_old_latency[4]_i_1 
       (.I0(\channel_old_latency[5]_i_2__0_n_0 ),
        .I1(\channel_old_latency_reg[3]_0 ),
        .I2(cur_is_even_character_reg),
        .I3(\channel_old_latency_reg[3] ),
        .I4(cur_is_even_character_reg_1),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hAAAAAAAA9AAAAAAA)) 
    \channel_old_latency[5]_i_1 
       (.I0(\channel_old_latency_reg[5]_0 ),
        .I1(cur_is_even_character_reg_1),
        .I2(\channel_old_latency[5]_i_2__0_n_0 ),
        .I3(\channel_old_latency_reg[3]_0 ),
        .I4(cur_is_even_character_reg),
        .I5(\channel_old_latency_reg[3] ),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h9F90)) 
    \channel_old_latency[5]_i_2__0 
       (.I0(\head_reg[1]_0 ),
        .I1(cur_is_even_character_reg_0),
        .I2(\channel_old_latency_reg[3]_1 ),
        .I3(\channel_old_latency_reg[3]_4 ),
        .O(\channel_old_latency[5]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABAAAAAAAAAAA)) 
    \channel_old_latency[6]_i_1 
       (.I0(\channel_old_latency_reg[6] ),
        .I1(\channel_old_latency_reg[3] ),
        .I2(cur_is_even_character_reg),
        .I3(\channel_old_latency[6]_i_5_n_0 ),
        .I4(cur_is_even_character_reg_1),
        .I5(\channel_old_latency_reg[5]_0 ),
        .O(D[5]));
  LUT3 #(
    .INIT(8'hC5)) 
    \channel_old_latency[6]_i_3__0 
       (.I0(\channel_old_latency_reg[3]_3 ),
        .I1(min_latency1_carry_i_16_n_0),
        .I2(\channel_old_latency_reg[3]_1 ),
        .O(\channel_old_latency_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h9A009AFF)) 
    \channel_old_latency[6]_i_4__0 
       (.I0(min_latency1_carry_i_14_n_0),
        .I1(\head_reg[1]_0 ),
        .I2(cur_is_even_character_reg_0),
        .I3(\channel_old_latency_reg[3]_1 ),
        .I4(\channel_old_latency_reg[3]_2 ),
        .O(cur_is_even_character_reg));
  LUT6 #(
    .INIT(64'hAAAAAA8A00000000)) 
    \channel_old_latency[6]_i_5 
       (.I0(\channel_old_latency[5]_i_2__0_n_0 ),
        .I1(\channel_old_latency_reg[3] ),
        .I2(\channel_old_latency_reg[5]_0 ),
        .I3(\channel_old_latency_reg[6]_0 ),
        .I4(cur_is_even_character_reg_1),
        .I5(\channel_old_latency_reg[6]_1 ),
        .O(\channel_old_latency[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F0DFFFF0F0D0000)) 
    \channel_old_latency[6]_i_6 
       (.I0(cur_is_even_character_reg_0),
        .I1(min_latency1_carry_i_9_n_0),
        .I2(min_latency1_carry_i_10_n_0),
        .I3(min_latency1_carry_i_11__0_n_0),
        .I4(\channel_old_latency_reg[3]_1 ),
        .I5(\channel_old_latency_reg[5] ),
        .O(cur_is_even_character_reg_1));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[0].engine_and_station_i/anEngine/anEngine/buffer/fifo_even/content" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "31" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    content_reg_bram_0
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,tail_reg,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,where_to_read[4],content_reg_bram_0_i_3__3_n_0,where_to_read[2],content_reg_bram_0_i_5__3_n_0,content_reg_bram_0_i_6__2_n_0,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DINADIN}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT({NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:8],from_memory}),
        .DOUTPADOUTP(NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(E),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'hFEEFDFFDDFFDEFFE)) 
    content_reg_bram_0_i_15__2
       (.I0(head_reg[3]),
        .I1(content_reg_bram_0_i_38__0_n_0),
        .I2(head_reg[4]),
        .I3(tail_reg[4]),
        .I4(tail_reg[3]),
        .I5(content_reg_bram_0_i_39_n_0),
        .O(WEA));
  LUT6 #(
    .INIT(64'hFDDDFFFDFDDDFDDD)) 
    content_reg_bram_0_i_16__4
       (.I0(WEA),
        .I1(content_reg_bram_0_0),
        .I2(\tail_reg[4]_0 ),
        .I3(\tail_reg[4]_1 ),
        .I4(\channel_old_latency_reg[3]_1 ),
        .I5(\switch2channel\.ready_0 ),
        .O(\head_reg[3]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_17__1
       (.I0(state_cur[1]),
        .I1(state_cur[0]),
        .I2(state_cur[2]),
        .O(content_reg_bram_0_i_17__1_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    content_reg_bram_0_i_18__3
       (.I0(head_reg[1]),
        .I1(head_reg[2]),
        .O(content_reg_bram_0_i_18__3_n_0));
  LUT6 #(
    .INIT(64'hF0F0F0F00FF078F0)) 
    content_reg_bram_0_i_2__0
       (.I0(content_reg_bram_0_i_17__1_n_0),
        .I1(p_0_in_0),
        .I2(head_reg[4]),
        .I3(head_reg[3]),
        .I4(head_reg[0]),
        .I5(content_reg_bram_0_i_18__3_n_0),
        .O(where_to_read[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h22F00000)) 
    content_reg_bram_0_i_30__1
       (.I0(WEA),
        .I1(content_reg_bram_0_0),
        .I2(\switch2channel\.ready_0 ),
        .I3(content_reg_bram_0_1),
        .I4(in_ready_packed),
        .O(\head_reg[3]_4 ));
  LUT6 #(
    .INIT(64'hFB7DEFFFEFFFFB7D)) 
    content_reg_bram_0_i_38__0
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(content_reg_bram_0_i_38__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_39
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(content_reg_bram_0_i_39_n_0));
  LUT6 #(
    .INIT(64'h5AAA6AAA6AAA6AAA)) 
    content_reg_bram_0_i_3__3
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(head_reg[2]),
        .I3(head_reg[1]),
        .I4(p_0_in_0),
        .I5(content_reg_bram_0_i_17__1_n_0),
        .O(content_reg_bram_0_i_3__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hF022)) 
    content_reg_bram_0_i_42__0
       (.I0(WEA),
        .I1(content_reg_bram_0_0),
        .I2(\switch2channel\.ready_0 ),
        .I3(content_reg_bram_0_1),
        .O(\head_reg[3]_5 ));
  LUT4 #(
    .INIT(16'hD0F0)) 
    content_reg_bram_0_i_43__0
       (.I0(WEA),
        .I1(content_reg_bram_0_0),
        .I2(\switch2channel\.ready_0 ),
        .I3(\channel_old_latency_reg[3]_1 ),
        .O(\head_reg[3]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h0FF078F0)) 
    content_reg_bram_0_i_4__0
       (.I0(p_0_in_0),
        .I1(content_reg_bram_0_i_17__1_n_0),
        .I2(head_reg[2]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .O(where_to_read[2]));
  LUT6 #(
    .INIT(64'h555555556AAAAAAA)) 
    content_reg_bram_0_i_5__3
       (.I0(head_reg[1]),
        .I1(state_cur[2]),
        .I2(state_cur[0]),
        .I3(state_cur[1]),
        .I4(p_0_in_0),
        .I5(head_reg[0]),
        .O(content_reg_bram_0_i_5__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    content_reg_bram_0_i_6__2
       (.I0(head_reg[0]),
        .I1(p_0_in_0),
        .I2(state_cur[1]),
        .I3(state_cur[0]),
        .I4(state_cur[2]),
        .O(content_reg_bram_0_i_6__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hD0FF)) 
    content_reg_i_12__0
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[2] ),
        .I3(cur_is_even_character),
        .O(content_reg_i_12__0_n_0));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    content_reg_i_2
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[5] ),
        .I3(cur_is_even_character),
        .I4(from_memory[5]),
        .I5(\FETCH_REC_Pc_reg[5] ),
        .O(\state_cur_reg[1]_0 [5]));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    content_reg_i_3
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[4] ),
        .I3(cur_is_even_character),
        .I4(from_memory[4]),
        .I5(\FETCH_REC_Pc_reg[4] ),
        .O(\state_cur_reg[1]_0 [4]));
  LUT6 #(
    .INIT(64'hEAEAEA00EA00EA00)) 
    content_reg_i_4
       (.I0(content_reg_i_8__0_n_0),
        .I1(from_memory[3]),
        .I2(content_reg_i_9_n_0),
        .I3(\FETCH_REC_Pc_reg[3] ),
        .I4(DOUTBDOUT[1]),
        .I5(\FETCH_REC_Pc_reg[2]_0 ),
        .O(\state_cur_reg[1]_0 [3]));
  LUT6 #(
    .INIT(64'hEAEAEA00EA00EA00)) 
    content_reg_i_5
       (.I0(content_reg_i_12__0_n_0),
        .I1(from_memory[2]),
        .I2(content_reg_i_9_n_0),
        .I3(\FETCH_REC_Pc_reg[2] ),
        .I4(DOUTBDOUT[0]),
        .I5(\FETCH_REC_Pc_reg[2]_0 ),
        .O(\state_cur_reg[1]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hD0FF)) 
    content_reg_i_8__0
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[3] ),
        .I3(cur_is_even_character),
        .O(content_reg_i_8__0_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    content_reg_i_9
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .O(content_reg_i_9_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \cur_state[0]_i_10 
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\cur_state[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000002800000000)) 
    \cur_state[0]_i_4 
       (.I0(\head_reg[3]_1 ),
        .I1(\cur_state_reg[0]_1 ),
        .I2(O),
        .I3(CO),
        .I4(\cur_state_reg[0]_0 [0]),
        .I5(\cur_state_reg[0]_0 [2]),
        .O(\cur_cc_pointer_reg[3] ));
  LUT6 #(
    .INIT(64'h0090FFFF00900000)) 
    \cur_state[0]_i_6 
       (.I0(tail_reg[3]),
        .I1(head_reg[3]),
        .I2(\cur_state[0]_i_9_n_0 ),
        .I3(\cur_state[0]_i_10_n_0 ),
        .I4(cur_is_even_character),
        .I5(\cur_state[0]_i_2 ),
        .O(\tail_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \cur_state[0]_i_9 
       (.I0(tail_reg[1]),
        .I1(head_reg[1]),
        .O(\cur_state[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF2FF)) 
    \cur_state[2]_i_19 
       (.I0(WEA),
        .I1(content_reg_bram_0_0),
        .I2(\switch2channel\.ready ),
        .I3(\cur_state[2]_i_9 ),
        .I4(\switch2channel\.ready_0 ),
        .O(\head_reg[3]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hA0B0)) 
    \cur_state[2]_i_6 
       (.I0(\cur_state_reg[0]_0 [1]),
        .I1(\head_reg[3]_5 ),
        .I2(\cur_state_reg[0]_0 [0]),
        .I3(\cur_state_reg[0]_0 [2]),
        .O(\cur_state_reg[1] ));
  LUT5 #(
    .INIT(32'h002A0000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_65 
       (.I0(\state_cur_reg[1]_0 [7]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(old_grant),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I4(memory_addr_from_coprocessor_ready),
        .O(\old_grant_reg[0]_4 ));
  LUT5 #(
    .INIT(32'h002A0000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_68 
       (.I0(\state_cur_reg[1]_0 [6]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(old_grant),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I4(memory_addr_from_coprocessor_ready),
        .O(\old_grant_reg[0]_3 ));
  LUT5 #(
    .INIT(32'h002A0000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_71 
       (.I0(\state_cur_reg[1]_0 [5]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(old_grant),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I4(memory_addr_from_coprocessor_ready),
        .O(\old_grant_reg[0]_2 ));
  LUT5 #(
    .INIT(32'h002A0000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_74 
       (.I0(\state_cur_reg[1]_0 [4]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(old_grant),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I4(memory_addr_from_coprocessor_ready),
        .O(\old_grant_reg[0]_1 ));
  LUT5 #(
    .INIT(32'h002A0000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_77 
       (.I0(\state_cur_reg[1]_0 [3]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(old_grant),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I4(memory_addr_from_coprocessor_ready),
        .O(\old_grant_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hC0C8C08800080088)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_79 
       (.I0(\state_cur_reg[1]_0 [2]),
        .I1(memory_addr_from_coprocessor_ready),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I4(old_grant),
        .I5(\memory_bb\.addr ),
        .O(\old_grant_reg[0] ));
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1__0 
       (.I0(head_reg[0]),
        .O(\head[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1__4 
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[2]_i_1__4 
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[0]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \head[3]_i_1__4 
       (.I0(head_reg[3]),
        .I1(head_reg[1]),
        .I2(head_reg[2]),
        .I3(head_reg[0]),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \head[4]_i_2__2 
       (.I0(head_reg[4]),
        .I1(head_reg[3]),
        .I2(head_reg[0]),
        .I3(head_reg[2]),
        .I4(head_reg[1]),
        .O(p_0_in__1[4]));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(\head[0]_i_1__0_n_0 ),
        .Q(head_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(p_0_in__1[1]),
        .Q(head_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(p_0_in__1[2]),
        .Q(head_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(p_0_in__1[3]),
        .Q(head_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in_0),
        .D(p_0_in__1[4]),
        .Q(head_reg[4]),
        .R(SR));
  LUT5 #(
    .INIT(32'hBBFB8808)) 
    \middle[0]_i_1__0 
       (.I0(from_memory[0]),
        .I1(state_cur[1]),
        .I2(p_0_in_0),
        .I3(state_cur[0]),
        .I4(DINADIN[0]),
        .O(\middle[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hBBFB8808)) 
    \middle[1]_i_1__0 
       (.I0(from_memory[1]),
        .I1(state_cur[1]),
        .I2(p_0_in_0),
        .I3(state_cur[0]),
        .I4(DINADIN[1]),
        .O(\middle[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hBBFB8808)) 
    \middle[2]_i_1__0 
       (.I0(from_memory[2]),
        .I1(state_cur[1]),
        .I2(p_0_in_0),
        .I3(state_cur[0]),
        .I4(DINADIN[2]),
        .O(\middle[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hBBFB8808)) 
    \middle[3]_i_1__0 
       (.I0(from_memory[3]),
        .I1(state_cur[1]),
        .I2(p_0_in_0),
        .I3(state_cur[0]),
        .I4(DINADIN[3]),
        .O(\middle[3]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hBBFB8808)) 
    \middle[4]_i_1__0 
       (.I0(from_memory[4]),
        .I1(state_cur[1]),
        .I2(p_0_in_0),
        .I3(state_cur[0]),
        .I4(DINADIN[4]),
        .O(\middle[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hBBFB8808)) 
    \middle[5]_i_1__0 
       (.I0(from_memory[5]),
        .I1(state_cur[1]),
        .I2(p_0_in_0),
        .I3(state_cur[0]),
        .I4(DINADIN[5]),
        .O(\middle[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hBBFB8808)) 
    \middle[6]_i_1__0 
       (.I0(from_memory[6]),
        .I1(state_cur[1]),
        .I2(p_0_in_0),
        .I3(state_cur[0]),
        .I4(DINADIN[6]),
        .O(\middle[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h4401000000054445)) 
    \middle[7]_i_1__0 
       (.I0(SR),
        .I1(state_cur[1]),
        .I2(\state_cur_reg[2]_0 ),
        .I3(state_cur[0]),
        .I4(p_0_in_0),
        .I5(state_cur[2]),
        .O(middle));
  LUT5 #(
    .INIT(32'hBBFB8808)) 
    \middle[7]_i_2__0 
       (.I0(from_memory[7]),
        .I1(state_cur[1]),
        .I2(p_0_in_0),
        .I3(state_cur[0]),
        .I4(DINADIN[7]),
        .O(\middle[7]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[0]_i_1__0_n_0 ),
        .Q(\middle_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[1]_i_1__0_n_0 ),
        .Q(\middle_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[2]_i_1__0_n_0 ),
        .Q(\middle_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[3]_i_1__0_n_0 ),
        .Q(\middle_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[4]_i_1__0_n_0 ),
        .Q(\middle_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[5]_i_1__0_n_0 ),
        .Q(\middle_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[6]_i_1__0_n_0 ),
        .Q(\middle_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[7]_i_2__0_n_0 ),
        .Q(\middle_reg_n_0_[7] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    min_latency1_carry_i_10
       (.I0(min_latency1_carry_i_25_n_0),
        .I1(cur_is_even_character),
        .I2(min_latency1_carry_i_8_0),
        .O(min_latency1_carry_i_10_n_0));
  LUT5 #(
    .INIT(32'h69FF6900)) 
    min_latency1_carry_i_11__0
       (.I0(head_reg[3]),
        .I1(tail_reg[3]),
        .I2(\state_cur[2]_i_5__1_n_0 ),
        .I3(cur_is_even_character),
        .I4(min_latency1_carry_i_8_1),
        .O(min_latency1_carry_i_11__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    min_latency1_carry_i_14
       (.I0(min_latency1_carry_i_31_n_0),
        .I1(cur_is_even_character),
        .I2(min_latency1_carry_i_9_0),
        .O(min_latency1_carry_i_14_n_0));
  LUT6 #(
    .INIT(64'h9699FFFF96990000)) 
    min_latency1_carry_i_15__0
       (.I0(head_reg[1]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .I3(head_reg[0]),
        .I4(cur_is_even_character),
        .I5(min_latency1_carry_i_3_0),
        .O(\head_reg[1]_0 ));
  LUT3 #(
    .INIT(8'hD2)) 
    min_latency1_carry_i_16
       (.I0(cur_is_even_character_reg_0),
        .I1(min_latency1_carry_i_9_n_0),
        .I2(min_latency1_carry_i_11__0_n_0),
        .O(min_latency1_carry_i_16_n_0));
  LUT6 #(
    .INIT(64'hFFFF0000FFFF0F0D)) 
    min_latency1_carry_i_1__0
       (.I0(cur_is_even_character_reg_0),
        .I1(min_latency1_carry_i_9_n_0),
        .I2(min_latency1_carry_i_10_n_0),
        .I3(min_latency1_carry_i_11__0_n_0),
        .I4(min_latency1_carry),
        .I5(\channel_old_latency_reg[5] ),
        .O(DI[1]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h9)) 
    min_latency1_carry_i_24__0
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .O(min_latency1_carry_i_24__0_n_0));
  LUT5 #(
    .INIT(32'h96996696)) 
    min_latency1_carry_i_25
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .I4(\state_cur[2]_i_5__1_n_0 ),
        .O(min_latency1_carry_i_25_n_0));
  LUT6 #(
    .INIT(64'hFF000000FF656500)) 
    min_latency1_carry_i_2__0
       (.I0(min_latency1_carry_i_14_n_0),
        .I1(\head_reg[1]_0 ),
        .I2(cur_is_even_character_reg_0),
        .I3(min_latency1_carry_i_16_n_0),
        .I4(\channel_old_latency_reg[3]_3 ),
        .I5(\channel_old_latency_reg[3]_2 ),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'h6696969966966696)) 
    min_latency1_carry_i_31
       (.I0(head_reg[2]),
        .I1(tail_reg[2]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .I5(head_reg[0]),
        .O(min_latency1_carry_i_31_n_0));
  LUT6 #(
    .INIT(64'h00000F0D0000F0F2)) 
    min_latency1_carry_i_5__0
       (.I0(cur_is_even_character_reg_0),
        .I1(min_latency1_carry_i_9_n_0),
        .I2(min_latency1_carry_i_10_n_0),
        .I3(min_latency1_carry_i_11__0_n_0),
        .I4(min_latency1_carry),
        .I5(\channel_old_latency_reg[5] ),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h0660060660066060)) 
    min_latency1_carry_i_6__0
       (.I0(min_latency1_carry_i_16_n_0),
        .I1(\channel_old_latency_reg[3]_3 ),
        .I2(min_latency1_carry_i_14_n_0),
        .I3(\head_reg[1]_0 ),
        .I4(cur_is_even_character_reg_0),
        .I5(\channel_old_latency_reg[3]_2 ),
        .O(S[0]));
  LUT6 #(
    .INIT(64'h000000EFEFEF00EF)) 
    min_latency1_carry_i_8
       (.I0(min_latency1_carry_i_11__0_n_0),
        .I1(min_latency1_carry_i_9_n_0),
        .I2(min_latency1_carry_i_10_n_0),
        .I3(min_latency1_carry_i_3),
        .I4(cur_is_even_character),
        .I5(min_latency1_carry_i_24__0_n_0),
        .O(cur_is_even_character_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'hB)) 
    min_latency1_carry_i_9
       (.I0(\head_reg[1]_0 ),
        .I1(min_latency1_carry_i_14_n_0),
        .O(min_latency1_carry_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hFFDB)) 
    \old_grant[0]_i_5__1 
       (.I0(\cur_state_reg[0]_0 [0]),
        .I1(\cur_state_reg[0]_0 [2]),
        .I2(\cur_state_reg[0]_0 [1]),
        .I3(\tail_reg[3]_0 ),
        .O(\cur_state_reg[0] ));
  LUT6 #(
    .INIT(64'h303AFAFF00F0A0F0)) 
    \state_cur[0]_i_1__0 
       (.I0(state_cur[0]),
        .I1(\state_cur[2]_i_3__0_n_0 ),
        .I2(state_cur[2]),
        .I3(p_0_in_0),
        .I4(\state_cur_reg[2]_0 ),
        .I5(state_cur[1]),
        .O(state_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \state_cur[1]_i_1__0 
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(state_next[1]));
  LUT6 #(
    .INIT(64'h80FAFF0080FFFF55)) 
    \state_cur[2]_i_1__0 
       (.I0(state_cur[0]),
        .I1(\state_cur[2]_i_3__0_n_0 ),
        .I2(p_0_in_0),
        .I3(state_cur[1]),
        .I4(state_cur[2]),
        .I5(\state_cur_reg[2]_0 ),
        .O(\state_cur[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hD7D3D7FF)) 
    \state_cur[2]_i_2__0 
       (.I0(p_0_in_0),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(state_cur[0]),
        .I4(\state_cur_reg[2]_0 ),
        .O(state_next[2]));
  LUT6 #(
    .INIT(64'h0090600090000090)) 
    \state_cur[2]_i_3__0 
       (.I0(tail_reg[4]),
        .I1(head_reg[4]),
        .I2(\state_cur[2]_i_4_n_0 ),
        .I3(head_reg[3]),
        .I4(tail_reg[3]),
        .I5(\state_cur[2]_i_5__1_n_0 ),
        .O(\state_cur[2]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000600690090000)) 
    \state_cur[2]_i_4 
       (.I0(tail_reg[2]),
        .I1(head_reg[2]),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(tail_reg[1]),
        .I5(head_reg[1]),
        .O(\state_cur[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    \state_cur[2]_i_5__1 
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\state_cur[2]_i_5__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__0_n_0 ),
        .D(state_next[0]),
        .Q(state_cur[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__0_n_0 ),
        .D(state_next[1]),
        .Q(state_cur[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__0_n_0 ),
        .D(state_next[2]),
        .Q(state_cur[2]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \tag_saved[0]_i_1 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[6] ),
        .I3(cur_is_even_character),
        .I4(from_memory[6]),
        .I5(\FETCH_REC_Pc_reg[6] ),
        .O(\state_cur_reg[1]_0 [6]));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \tag_saved[1]_i_1 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\middle_reg_n_0_[7] ),
        .I3(cur_is_even_character),
        .I4(from_memory[7]),
        .I5(\FETCH_REC_Pc_reg[7] ),
        .O(\state_cur_reg[1]_0 [7]));
  LUT1 #(
    .INIT(2'h1)) 
    \tail[0]_i_1__2 
       (.I0(tail_reg[0]),
        .O(state_next4[0]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[1]_i_1__0 
       (.I0(tail_reg[0]),
        .I1(tail_reg[1]),
        .O(state_next4[1]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[2]_i_1__0 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(state_next4[2]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \tail[3]_i_1__0 
       (.I0(tail_reg[3]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(tail_reg[2]),
        .O(state_next4[3]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \tail[4]_i_1__0 
       (.I0(tail_reg[4]),
        .I1(tail_reg[3]),
        .I2(tail_reg[2]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .O(state_next4[4]));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(state_next4[0]),
        .Q(tail_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(state_next4[1]),
        .Q(tail_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(state_next4[2]),
        .Q(tail_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(state_next4[3]),
        .Q(tail_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(state_next4[4]),
        .Q(tail_reg[4]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "fifo" *) 
module fifo_13
   (DOUTBDOUT,
    \head_reg[3]_0 ,
    \head_reg[0]_0 ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    cur_is_even_character_reg,
    cur_is_even_character_reg_0,
    content_reg_bram_0_5,
    \state_cur_reg[1]_0 ,
    \cur_cc_pointer_reg[2] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[31] ,
    \cur_ccs_reg[63] ,
    \cur_cc_pointer_reg[2]_1 ,
    \cur_ccs_reg[30] ,
    \cur_ccs_reg[62] ,
    \cur_cc_pointer_reg[2]_2 ,
    \cur_ccs_reg[26] ,
    \cur_ccs_reg[58] ,
    \cur_cc_pointer_reg[2]_3 ,
    \cur_ccs_reg[27] ,
    \cur_ccs_reg[59] ,
    \cur_cc_pointer_reg[2]_4 ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \head_reg[2]_0 ,
    \head_reg[3]_1 ,
    \head_reg[4]_0 ,
    \cur_state_reg[2] ,
    \head_reg[0]_1 ,
    \head_reg[3]_2 ,
    clk_IBUF_BUFG,
    fifo_odd_data_in_valid,
    content_reg_bram_0_6,
    \state_cur_reg[0]_0 ,
    \state_cur_reg[0]_1 ,
    curState,
    cur_is_even_character,
    p_0_in,
    \state_cur_reg[0]_2 ,
    content_reg_bram_0_7,
    SR,
    \cur_state[2]_i_29 ,
    \FETCH_REC_Instr[15]_i_14 ,
    content_reg_bram_0_i_21);
  output [1:0]DOUTBDOUT;
  output \head_reg[3]_0 ;
  output \head_reg[0]_0 ;
  output content_reg_bram_0_0;
  output content_reg_bram_0_1;
  output content_reg_bram_0_2;
  output content_reg_bram_0_3;
  output content_reg_bram_0_4;
  output cur_is_even_character_reg;
  output cur_is_even_character_reg_0;
  output content_reg_bram_0_5;
  output \state_cur_reg[1]_0 ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[31] ;
  output \cur_ccs_reg[63] ;
  output \cur_cc_pointer_reg[2]_1 ;
  output \cur_ccs_reg[30] ;
  output \cur_ccs_reg[62] ;
  output \cur_cc_pointer_reg[2]_2 ;
  output \cur_ccs_reg[26] ;
  output \cur_ccs_reg[58] ;
  output \cur_cc_pointer_reg[2]_3 ;
  output \cur_ccs_reg[27] ;
  output \cur_ccs_reg[59] ;
  output \cur_cc_pointer_reg[2]_4 ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \head_reg[2]_0 ;
  output \head_reg[3]_1 ;
  output \head_reg[4]_0 ;
  output \cur_state_reg[2] ;
  output \head_reg[0]_1 ;
  output \head_reg[3]_2 ;
  input clk_IBUF_BUFG;
  input fifo_odd_data_in_valid;
  input [7:0]content_reg_bram_0_6;
  input \state_cur_reg[0]_0 ;
  input \state_cur_reg[0]_1 ;
  input [0:0]curState;
  input cur_is_even_character;
  input [0:0]p_0_in;
  input \state_cur_reg[0]_2 ;
  input content_reg_bram_0_7;
  input [0:0]SR;
  input [2:0]\cur_state[2]_i_29 ;
  input [47:0]\FETCH_REC_Instr[15]_i_14 ;
  input [2:0]content_reg_bram_0_i_21;

  wire [1:0]DOUTBDOUT;
  wire [47:0]\FETCH_REC_Instr[15]_i_14 ;
  wire [0:0]SR;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire [7:0]content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_i_17__2_n_0;
  wire content_reg_bram_0_i_18__4_n_0;
  wire [2:0]content_reg_bram_0_i_21;
  wire content_reg_bram_0_i_21__0_n_0;
  wire content_reg_bram_0_i_22__1_n_0;
  wire content_reg_bram_0_i_6__1_n_0;
  wire [0:0]curState;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_cc_pointer_reg[2]_1 ;
  wire \cur_cc_pointer_reg[2]_2 ;
  wire \cur_cc_pointer_reg[2]_3 ;
  wire \cur_cc_pointer_reg[2]_4 ;
  wire \cur_ccs_reg[26] ;
  wire \cur_ccs_reg[27] ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[30] ;
  wire \cur_ccs_reg[31] ;
  wire \cur_ccs_reg[58] ;
  wire \cur_ccs_reg[59] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire \cur_ccs_reg[62] ;
  wire \cur_ccs_reg[63] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire [2:0]\cur_state[2]_i_29 ;
  wire \cur_state_reg[2] ;
  wire fifo_odd_data_in_ready;
  wire fifo_odd_data_in_valid;
  wire [7:0]from_memory;
  wire \head[0]_i_1_n_0 ;
  wire \head[4]_i_4__0_n_0 ;
  wire [4:0]head_reg;
  wire \head_reg[0]_0 ;
  wire \head_reg[0]_1 ;
  wire \head_reg[2]_0 ;
  wire \head_reg[3]_0 ;
  wire \head_reg[3]_1 ;
  wire \head_reg[3]_2 ;
  wire \head_reg[4]_0 ;
  wire [7:0]middle;
  wire middle_0;
  wire [7:0]middle_next;
  wire [0:0]p_0_in;
  wire [4:1]p_0_in__0;
  wire [2:0]state_cur;
  wire state_cur0;
  wire \state_cur[0]_i_2_n_0 ;
  wire \state_cur[0]_i_3_n_0 ;
  wire \state_cur[0]_i_4_n_0 ;
  wire \state_cur[2]_i_4__4_n_0 ;
  wire \state_cur[2]_i_5_n_0 ;
  wire \state_cur_reg[0]_0 ;
  wire \state_cur_reg[0]_1 ;
  wire \state_cur_reg[0]_2 ;
  wire \state_cur_reg[1]_0 ;
  wire [2:0]state_next;
  wire \tail[0]_i_1__3_n_0 ;
  wire \tail[1]_i_1_n_0 ;
  wire \tail[2]_i_1_n_0 ;
  wire \tail[3]_i_1_n_0 ;
  wire \tail[4]_i_1_n_0 ;
  wire [4:0]tail_reg;
  wire [4:1]where_to_read;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:8]NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  LUT5 #(
    .INIT(32'h00003533)) 
    \block_sel_saved[0]_i_2 
       (.I0(from_memory[0]),
        .I1(middle[0]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_0));
  LUT5 #(
    .INIT(32'h00003533)) 
    \block_sel_saved[1]_i_2 
       (.I0(from_memory[1]),
        .I1(middle[1]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_1));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[0].engine_and_station_i/anEngine/anEngine/buffer/fifo_odd/content" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "31" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    content_reg_bram_0
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,tail_reg,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,where_to_read,content_reg_bram_0_i_6__1_n_0,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,content_reg_bram_0_6}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT({NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:8],from_memory[7:4],DOUTBDOUT,from_memory[1:0]}),
        .DOUTPADOUTP(NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(fifo_odd_data_in_valid),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({fifo_odd_data_in_ready,fifo_odd_data_in_ready}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT1 #(
    .INIT(2'h1)) 
    content_reg_bram_0_i_15__1
       (.I0(\head_reg[3]_1 ),
        .O(fifo_odd_data_in_ready));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h8)) 
    content_reg_bram_0_i_17__2
       (.I0(head_reg[1]),
        .I1(head_reg[2]),
        .O(content_reg_bram_0_i_17__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_18__4
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(state_cur[0]),
        .O(content_reg_bram_0_i_18__4_n_0));
  LUT6 #(
    .INIT(64'h6AFFFFFF6A000000)) 
    content_reg_bram_0_i_2
       (.I0(head_reg[4]),
        .I1(content_reg_bram_0_i_17__2_n_0),
        .I2(head_reg[3]),
        .I3(content_reg_bram_0_i_18__4_n_0),
        .I4(p_0_in),
        .I5(p_0_in__0[4]),
        .O(where_to_read[4]));
  LUT6 #(
    .INIT(64'h0110200220021001)) 
    content_reg_bram_0_i_20__1
       (.I0(head_reg[3]),
        .I1(content_reg_bram_0_i_21__0_n_0),
        .I2(head_reg[4]),
        .I3(tail_reg[4]),
        .I4(tail_reg[3]),
        .I5(content_reg_bram_0_i_22__1_n_0),
        .O(\head_reg[3]_1 ));
  LUT6 #(
    .INIT(64'hE7FFFFE7FDBFBFFD)) 
    content_reg_bram_0_i_21__0
       (.I0(head_reg[0]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .I3(head_reg[2]),
        .I4(tail_reg[2]),
        .I5(head_reg[1]),
        .O(content_reg_bram_0_i_21__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_22__1
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(content_reg_bram_0_i_22__1_n_0));
  LUT6 #(
    .INIT(64'hEFFEFFFF01100000)) 
    content_reg_bram_0_i_3
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_7),
        .I2(head_reg[3]),
        .I3(content_reg_bram_0_i_17__2_n_0),
        .I4(content_reg_bram_0_i_18__4_n_0),
        .I5(p_0_in__0[3]),
        .O(where_to_read[3]));
  LUT6 #(
    .INIT(64'h00FFFF00EF10FF00)) 
    content_reg_bram_0_i_4
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_7),
        .I2(content_reg_bram_0_i_18__4_n_0),
        .I3(head_reg[2]),
        .I4(head_reg[1]),
        .I5(head_reg[0]),
        .O(where_to_read[2]));
  LUT3 #(
    .INIT(8'h04)) 
    content_reg_bram_0_i_40
       (.I0(content_reg_bram_0_i_21[2]),
        .I1(content_reg_bram_0_i_21[0]),
        .I2(content_reg_bram_0_i_21[1]),
        .O(\cur_state_reg[2] ));
  LUT6 #(
    .INIT(64'h555555556AAAAAAA)) 
    content_reg_bram_0_i_5
       (.I0(head_reg[1]),
        .I1(state_cur[0]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(p_0_in),
        .I5(head_reg[0]),
        .O(where_to_read[1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    content_reg_bram_0_i_6__1
       (.I0(head_reg[0]),
        .I1(p_0_in),
        .I2(state_cur[1]),
        .I3(state_cur[2]),
        .I4(state_cur[0]),
        .O(content_reg_bram_0_i_6__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hFBAA)) 
    content_reg_i_10
       (.I0(cur_is_even_character),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(middle[3]),
        .O(cur_is_even_character_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    content_reg_i_11
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .O(\state_cur_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hFBAA)) 
    content_reg_i_13
       (.I0(cur_is_even_character),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(middle[2]),
        .O(cur_is_even_character_reg));
  LUT5 #(
    .INIT(32'h00003533)) 
    content_reg_i_6
       (.I0(from_memory[5]),
        .I1(middle[5]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_5));
  LUT5 #(
    .INIT(32'h00003533)) 
    content_reg_i_7
       (.I0(from_memory[4]),
        .I1(middle[4]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_4));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1 
       (.I0(head_reg[0]),
        .O(\head[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1__3 
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[2]_i_1__3 
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \head[3]_i_1__3 
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \head[4]_i_2__1 
       (.I0(head_reg[4]),
        .I1(head_reg[2]),
        .I2(head_reg[1]),
        .I3(head_reg[0]),
        .I4(head_reg[3]),
        .O(p_0_in__0[4]));
  LUT5 #(
    .INIT(32'h09000009)) 
    \head[4]_i_3__0 
       (.I0(head_reg[3]),
        .I1(tail_reg[3]),
        .I2(\head[4]_i_4__0_n_0 ),
        .I3(tail_reg[4]),
        .I4(head_reg[4]),
        .O(\head_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \head[4]_i_4__0 
       (.I0(tail_reg[0]),
        .I1(head_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\head[4]_i_4__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\head[0]_i_1_n_0 ),
        .Q(head_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(p_0_in__0[1]),
        .Q(head_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(p_0_in__0[2]),
        .Q(head_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(p_0_in__0[3]),
        .Q(head_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(p_0_in__0[4]),
        .Q(head_reg[4]),
        .R(SR));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[0]_i_1 
       (.I0(from_memory[0]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_6[0]),
        .O(middle_next[0]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[1]_i_1 
       (.I0(from_memory[1]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_6[1]),
        .O(middle_next[1]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[2]_i_1 
       (.I0(DOUTBDOUT[0]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_6[2]),
        .O(middle_next[2]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[3]_i_1 
       (.I0(DOUTBDOUT[1]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_6[3]),
        .O(middle_next[3]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[4]_i_1 
       (.I0(from_memory[4]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_6[4]),
        .O(middle_next[4]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[5]_i_1 
       (.I0(from_memory[5]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_6[5]),
        .O(middle_next[5]));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[6]_i_1 
       (.I0(from_memory[6]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_6[6]),
        .O(middle_next[6]));
  LUT6 #(
    .INIT(64'h4140111105000100)) 
    \middle[7]_i_1 
       (.I0(SR),
        .I1(state_cur[2]),
        .I2(state_cur[0]),
        .I3(fifo_odd_data_in_valid),
        .I4(p_0_in),
        .I5(state_cur[1]),
        .O(middle_0));
  LUT5 #(
    .INIT(32'hBFBB8088)) 
    \middle[7]_i_2 
       (.I0(from_memory[7]),
        .I1(state_cur[1]),
        .I2(state_cur[0]),
        .I3(p_0_in),
        .I4(content_reg_bram_0_6[7]),
        .O(middle_next[7]));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[0]),
        .Q(middle[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[1]),
        .Q(middle[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[2]),
        .Q(middle[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[3]),
        .Q(middle[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[4]),
        .Q(middle[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[5]),
        .Q(middle[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[6]),
        .Q(middle[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(middle_0),
        .D(middle_next[7]),
        .Q(middle[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h9)) 
    min_latency1_carry_i_23__0
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .O(\head_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'h96996696)) 
    min_latency1_carry_i_26
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .I4(\state_cur[0]_i_4_n_0 ),
        .O(\head_reg[4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h69)) 
    min_latency1_carry_i_27__0
       (.I0(head_reg[3]),
        .I1(tail_reg[3]),
        .I2(\state_cur[0]_i_4_n_0 ),
        .O(\head_reg[3]_2 ));
  LUT6 #(
    .INIT(64'h6696999966666696)) 
    min_latency1_carry_i_32
       (.I0(head_reg[2]),
        .I1(tail_reg[2]),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(tail_reg[1]),
        .I5(head_reg[1]),
        .O(\head_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hD22D)) 
    min_latency1_carry_i_33
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .O(\head_reg[0]_1 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_18 
       (.I0(\FETCH_REC_Instr[15]_i_14 [20]),
        .I1(\FETCH_REC_Instr[15]_i_14 [14]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [8]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [2]),
        .O(\cur_ccs_reg[28] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_19 
       (.I0(\FETCH_REC_Instr[15]_i_14 [44]),
        .I1(\FETCH_REC_Instr[15]_i_14 [38]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [32]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [26]),
        .O(\cur_ccs_reg[60] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_22 
       (.I0(\FETCH_REC_Instr[15]_i_14 [21]),
        .I1(\FETCH_REC_Instr[15]_i_14 [15]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [9]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [3]),
        .O(\cur_ccs_reg[29] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_23 
       (.I0(\FETCH_REC_Instr[15]_i_14 [45]),
        .I1(\FETCH_REC_Instr[15]_i_14 [39]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [33]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [27]),
        .O(\cur_ccs_reg[61] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_24 
       (.I0(\FETCH_REC_Instr[15]_i_14 [18]),
        .I1(\FETCH_REC_Instr[15]_i_14 [12]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [6]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [0]),
        .O(\cur_ccs_reg[26] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_25 
       (.I0(\FETCH_REC_Instr[15]_i_14 [42]),
        .I1(\FETCH_REC_Instr[15]_i_14 [36]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [30]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [24]),
        .O(\cur_ccs_reg[58] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_26 
       (.I0(\FETCH_REC_Instr[15]_i_14 [19]),
        .I1(\FETCH_REC_Instr[15]_i_14 [13]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [7]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [1]),
        .O(\cur_ccs_reg[27] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_27 
       (.I0(\FETCH_REC_Instr[15]_i_14 [43]),
        .I1(\FETCH_REC_Instr[15]_i_14 [37]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [31]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [25]),
        .O(\cur_ccs_reg[59] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_28 
       (.I0(\FETCH_REC_Instr[15]_i_14 [23]),
        .I1(\FETCH_REC_Instr[15]_i_14 [17]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [11]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [5]),
        .O(\cur_ccs_reg[31] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_29 
       (.I0(\FETCH_REC_Instr[15]_i_14 [47]),
        .I1(\FETCH_REC_Instr[15]_i_14 [41]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [35]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [29]),
        .O(\cur_ccs_reg[63] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_30 
       (.I0(\FETCH_REC_Instr[15]_i_14 [22]),
        .I1(\FETCH_REC_Instr[15]_i_14 [16]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [10]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [4]),
        .O(\cur_ccs_reg[30] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_31 
       (.I0(\FETCH_REC_Instr[15]_i_14 [46]),
        .I1(\FETCH_REC_Instr[15]_i_14 [40]),
        .I2(\cur_state[2]_i_29 [1]),
        .I3(\FETCH_REC_Instr[15]_i_14 [34]),
        .I4(\cur_state[2]_i_29 [0]),
        .I5(\FETCH_REC_Instr[15]_i_14 [28]),
        .O(\cur_ccs_reg[62] ));
  MUXF7 \old_grant_reg[0]_i_11 
       (.I0(\cur_ccs_reg[29] ),
        .I1(\cur_ccs_reg[61] ),
        .O(\cur_cc_pointer_reg[2]_4 ),
        .S(\cur_state[2]_i_29 [2]));
  MUXF7 \old_grant_reg[0]_i_12 
       (.I0(\cur_ccs_reg[26] ),
        .I1(\cur_ccs_reg[58] ),
        .O(\cur_cc_pointer_reg[2]_2 ),
        .S(\cur_state[2]_i_29 [2]));
  MUXF7 \old_grant_reg[0]_i_13 
       (.I0(\cur_ccs_reg[27] ),
        .I1(\cur_ccs_reg[59] ),
        .O(\cur_cc_pointer_reg[2]_3 ),
        .S(\cur_state[2]_i_29 [2]));
  MUXF7 \old_grant_reg[0]_i_14 
       (.I0(\cur_ccs_reg[31] ),
        .I1(\cur_ccs_reg[63] ),
        .O(\cur_cc_pointer_reg[2]_0 ),
        .S(\cur_state[2]_i_29 [2]));
  MUXF7 \old_grant_reg[0]_i_15 
       (.I0(\cur_ccs_reg[30] ),
        .I1(\cur_ccs_reg[62] ),
        .O(\cur_cc_pointer_reg[2]_1 ),
        .S(\cur_state[2]_i_29 [2]));
  MUXF7 \old_grant_reg[0]_i_9 
       (.I0(\cur_ccs_reg[28] ),
        .I1(\cur_ccs_reg[60] ),
        .O(\cur_cc_pointer_reg[2] ),
        .S(\cur_state[2]_i_29 [2]));
  LUT6 #(
    .INIT(64'hFB02B030FBF2B030)) 
    \state_cur[0]_i_1 
       (.I0(state_cur[0]),
        .I1(p_0_in),
        .I2(state_cur[2]),
        .I3(fifo_odd_data_in_valid),
        .I4(state_cur[1]),
        .I5(\state_cur[0]_i_2_n_0 ),
        .O(state_next[0]));
  LUT6 #(
    .INIT(64'h0090600090000090)) 
    \state_cur[0]_i_2 
       (.I0(tail_reg[4]),
        .I1(head_reg[4]),
        .I2(\state_cur[0]_i_3_n_0 ),
        .I3(head_reg[3]),
        .I4(tail_reg[3]),
        .I5(\state_cur[0]_i_4_n_0 ),
        .O(\state_cur[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0690000000000690)) 
    \state_cur[0]_i_3 
       (.I0(tail_reg[2]),
        .I1(head_reg[2]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .I5(tail_reg[0]),
        .O(\state_cur[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2B22FFFF00002B22)) 
    \state_cur[0]_i_4 
       (.I0(head_reg[1]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .I3(head_reg[0]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\state_cur[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \state_cur[1]_i_1 
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(state_next[1]));
  LUT6 #(
    .INIT(64'h3333CFC4FFFFFFF5)) 
    \state_cur[2]_i_1 
       (.I0(\state_cur_reg[0]_2 ),
        .I1(state_cur[2]),
        .I2(state_cur[0]),
        .I3(fifo_odd_data_in_valid),
        .I4(state_cur[1]),
        .I5(\state_cur[2]_i_4__4_n_0 ),
        .O(state_cur0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'hD7D7FFD3)) 
    \state_cur[2]_i_2 
       (.I0(p_0_in),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(fifo_odd_data_in_valid),
        .I4(state_cur[0]),
        .O(state_next[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \state_cur[2]_i_4__4 
       (.I0(\state_cur[2]_i_5_n_0 ),
        .I1(\state_cur_reg[0]_0 ),
        .I2(\state_cur_reg[0]_1 ),
        .I3(curState),
        .I4(cur_is_even_character),
        .I5(\head_reg[3]_0 ),
        .O(\state_cur[2]_i_4__4_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \state_cur[2]_i_5 
       (.I0(state_cur[0]),
        .I1(state_cur[2]),
        .I2(\state_cur[0]_i_2_n_0 ),
        .O(\state_cur[2]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(state_cur0),
        .D(state_next[0]),
        .Q(state_cur[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(state_cur0),
        .D(state_next[1]),
        .Q(state_cur[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(state_cur0),
        .D(state_next[2]),
        .Q(state_cur[2]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00003533)) 
    \tag_saved[0]_i_2 
       (.I0(from_memory[6]),
        .I1(middle[6]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_2));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h00003533)) 
    \tag_saved[1]_i_2 
       (.I0(from_memory[7]),
        .I1(middle[7]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_3));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \tail[0]_i_1__3 
       (.I0(tail_reg[0]),
        .O(\tail[0]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[1]_i_1 
       (.I0(tail_reg[0]),
        .I1(tail_reg[1]),
        .O(\tail[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[2]_i_1 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(\tail[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \tail[3]_i_1 
       (.I0(tail_reg[3]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(tail_reg[2]),
        .O(\tail[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \tail[4]_i_1 
       (.I0(tail_reg[4]),
        .I1(tail_reg[3]),
        .I2(tail_reg[2]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .O(\tail[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_odd_data_in_valid),
        .D(\tail[0]_i_1__3_n_0 ),
        .Q(tail_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_odd_data_in_valid),
        .D(\tail[1]_i_1_n_0 ),
        .Q(tail_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_odd_data_in_valid),
        .D(\tail[2]_i_1_n_0 ),
        .Q(tail_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_odd_data_in_valid),
        .D(\tail[3]_i_1_n_0 ),
        .Q(tail_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(fifo_odd_data_in_valid),
        .D(\tail[4]_i_1_n_0 ),
        .Q(tail_reg[4]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "fifo" *) 
module fifo__parameterized0
   (WEA,
    \channel_old_latency_reg[3] ,
    \channel_old_latency_reg[5] ,
    \tail_reg[1]_0 ,
    S,
    \channel_old_latency_reg[2] ,
    DI,
    DINADIN,
    content_reg_bram_0_0,
    \middle_reg[1]_0 ,
    \middle_reg[2]_0 ,
    \middle_reg[3]_0 ,
    \middle_reg[4]_0 ,
    \middle_reg[5]_0 ,
    \middle_reg[6]_0 ,
    \middle_reg[7]_0 ,
    \middle_reg[8]_0 ,
    \cur_state_reg[1] ,
    clk_IBUF_BUFG,
    \switch2channel\.valid ,
    content_reg_bram_0_1,
    \channel_old_latency_reg[2]_0 ,
    \channel_old_latency_reg[2]_1 ,
    CO,
    \channel_old_latency_reg[4] ,
    Q,
    \channel_old_latency_reg[2]_2 ,
    min_latency1_carry,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    \state_cur_reg[0]_0 ,
    \tail_reg[0]_0 ,
    \tail_reg[0]_1 ,
    \channel_old_latency_reg[2]_3 ,
    min_latency1_carry_0);
  output [0:0]WEA;
  output [6:0]\channel_old_latency_reg[3] ;
  output \channel_old_latency_reg[5] ;
  output \tail_reg[1]_0 ;
  output [3:0]S;
  output \channel_old_latency_reg[2] ;
  output [2:0]DI;
  output [7:0]DINADIN;
  output content_reg_bram_0_0;
  output \middle_reg[1]_0 ;
  output \middle_reg[2]_0 ;
  output \middle_reg[3]_0 ;
  output \middle_reg[4]_0 ;
  output \middle_reg[5]_0 ;
  output \middle_reg[6]_0 ;
  output \middle_reg[7]_0 ;
  output \middle_reg[8]_0 ;
  output \cur_state_reg[1] ;
  input clk_IBUF_BUFG;
  input \switch2channel\.valid ;
  input [8:0]content_reg_bram_0_1;
  input \channel_old_latency_reg[2]_0 ;
  input \channel_old_latency_reg[2]_1 ;
  input [0:0]CO;
  input \channel_old_latency_reg[4] ;
  input [6:0]Q;
  input \channel_old_latency_reg[2]_2 ;
  input min_latency1_carry;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input content_reg_bram_0_8;
  input content_reg_bram_0_9;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input \state_cur_reg[0]_0 ;
  input [2:0]\tail_reg[0]_0 ;
  input \tail_reg[0]_1 ;
  input \channel_old_latency_reg[2]_3 ;
  input min_latency1_carry_0;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [7:0]DINADIN;
  wire [6:0]Q;
  wire [3:0]S;
  wire [0:0]WEA;
  wire \channel_old_latency[3]_i_2_n_0 ;
  wire \channel_old_latency[3]_i_4_n_0 ;
  wire \channel_old_latency[3]_i_5_n_0 ;
  wire \channel_old_latency[6]_i_2_n_0 ;
  wire \channel_old_latency[6]_i_3_n_0 ;
  wire \channel_old_latency[6]_i_4_n_0 ;
  wire \channel_old_latency[6]_i_5__0_n_0 ;
  wire \channel_old_latency_reg[2] ;
  wire \channel_old_latency_reg[2]_0 ;
  wire \channel_old_latency_reg[2]_1 ;
  wire \channel_old_latency_reg[2]_2 ;
  wire \channel_old_latency_reg[2]_3 ;
  wire [6:0]\channel_old_latency_reg[3] ;
  wire \channel_old_latency_reg[4] ;
  wire \channel_old_latency_reg[5] ;
  wire clk_IBUF_BUFG;
  wire content_reg_bram_0_0;
  wire [8:0]content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire content_reg_bram_0_i_20__4_n_0;
  wire content_reg_bram_0_i_21__4_n_0;
  wire content_reg_bram_0_i_22__3_n_0;
  wire content_reg_bram_0_i_23__2_n_0;
  wire content_reg_bram_0_i_25__0_n_0;
  wire content_reg_bram_0_i_26__1_n_0;
  wire content_reg_bram_0_i_27__1_n_0;
  wire content_reg_bram_0_i_27_n_0;
  wire content_reg_bram_0_i_28__1_n_0;
  wire content_reg_bram_0_i_28__2_n_0;
  wire content_reg_bram_0_i_29__1_n_0;
  wire content_reg_bram_0_i_41_n_0;
  wire content_reg_bram_0_i_54__0_n_0;
  wire content_reg_bram_0_i_55_n_0;
  wire content_reg_bram_0_i_56__0_n_0;
  wire content_reg_bram_0_i_57__0_n_0;
  wire content_reg_bram_0_i_8__3_n_0;
  wire \cur_state_reg[1] ;
  wire [8:0]from_memory;
  wire \head[0]_i_1__2_n_0 ;
  wire [6:0]head_reg;
  wire middle;
  wire \middle[0]_i_1__3_n_0 ;
  wire \middle[1]_i_1__3_n_0 ;
  wire \middle[2]_i_1__3_n_0 ;
  wire \middle[3]_i_1__3_n_0 ;
  wire \middle[4]_i_1__3_n_0 ;
  wire \middle[5]_i_1__3_n_0 ;
  wire \middle[6]_i_1__3_n_0 ;
  wire \middle[7]_i_1__3_n_0 ;
  wire \middle[8]_i_2_n_0 ;
  wire \middle_reg[1]_0 ;
  wire \middle_reg[2]_0 ;
  wire \middle_reg[3]_0 ;
  wire \middle_reg[4]_0 ;
  wire \middle_reg[5]_0 ;
  wire \middle_reg[6]_0 ;
  wire \middle_reg[7]_0 ;
  wire \middle_reg[8]_0 ;
  wire \middle_reg_n_0_[0] ;
  wire \middle_reg_n_0_[1] ;
  wire \middle_reg_n_0_[2] ;
  wire \middle_reg_n_0_[3] ;
  wire \middle_reg_n_0_[4] ;
  wire \middle_reg_n_0_[5] ;
  wire \middle_reg_n_0_[6] ;
  wire \middle_reg_n_0_[7] ;
  wire \middle_reg_n_0_[8] ;
  wire min_latency1_carry;
  wire min_latency1_carry_0;
  wire min_latency1_carry_i_10__0_n_0;
  wire min_latency1_carry_i_11_n_0;
  wire min_latency1_carry_i_12__0_n_0;
  wire min_latency1_carry_i_13_n_0;
  wire min_latency1_carry_i_20_n_0;
  wire min_latency1_carry_i_21__0_n_0;
  wire min_latency1_carry_i_22__0_n_0;
  wire min_latency1_carry_i_9__0_n_0;
  wire [1:0]p_0_in;
  wire [6:1]p_0_in__2;
  wire [2:0]state_cur;
  wire \state_cur[2]_i_1__1_n_0 ;
  wire \state_cur[2]_i_3__2_n_0 ;
  wire \state_cur[2]_i_4__1_n_0 ;
  wire \state_cur[2]_i_5__2_n_0 ;
  wire \state_cur[2]_i_6_n_0 ;
  wire \state_cur_reg[0]_0 ;
  wire [2:0]state_next;
  wire \switch2channel\.valid ;
  wire \tail[0]_i_1__1_n_0 ;
  wire \tail[1]_i_1__2_n_0 ;
  wire \tail[2]_i_1__4_n_0 ;
  wire \tail[3]_i_1__3_n_0 ;
  wire \tail[4]_i_1__4_n_0 ;
  wire \tail[5]_i_1__0_n_0 ;
  wire \tail[6]_i_2__0_n_0 ;
  wire [6:0]tail_reg;
  wire [2:0]\tail_reg[0]_0 ;
  wire \tail_reg[0]_1 ;
  wire \tail_reg[1]_0 ;
  wire [6:1]where_to_read;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:9]NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  LUT5 #(
    .INIT(32'h0400FFFF)) 
    \channel_old_latency[0]_i_1__0 
       (.I0(\channel_old_latency[3]_i_2_n_0 ),
        .I1(\channel_old_latency_reg[2]_0 ),
        .I2(\channel_old_latency[3]_i_4_n_0 ),
        .I3(\channel_old_latency[6]_i_4_n_0 ),
        .I4(\channel_old_latency[3]_i_5_n_0 ),
        .O(\channel_old_latency_reg[3] [0]));
  LUT6 #(
    .INIT(64'hFBFF00000400FFFF)) 
    \channel_old_latency[1]_i_1__0 
       (.I0(\channel_old_latency[3]_i_2_n_0 ),
        .I1(\channel_old_latency_reg[2]_0 ),
        .I2(\channel_old_latency[3]_i_4_n_0 ),
        .I3(\channel_old_latency[6]_i_4_n_0 ),
        .I4(\channel_old_latency[3]_i_5_n_0 ),
        .I5(\channel_old_latency_reg[2]_1 ),
        .O(\channel_old_latency_reg[3] [1]));
  LUT6 #(
    .INIT(64'hCCCCCCCC3733CCCC)) 
    \channel_old_latency[2]_i_1__0 
       (.I0(\channel_old_latency[3]_i_2_n_0 ),
        .I1(\channel_old_latency_reg[2]_0 ),
        .I2(\channel_old_latency[3]_i_4_n_0 ),
        .I3(\channel_old_latency[6]_i_4_n_0 ),
        .I4(\channel_old_latency[3]_i_5_n_0 ),
        .I5(\channel_old_latency_reg[2]_1 ),
        .O(\channel_old_latency_reg[3] [2]));
  LUT6 #(
    .INIT(64'h0F0F0F0FC7C30F0F)) 
    \channel_old_latency[3]_i_1__0 
       (.I0(\channel_old_latency[3]_i_2_n_0 ),
        .I1(\channel_old_latency_reg[2]_0 ),
        .I2(\channel_old_latency[3]_i_4_n_0 ),
        .I3(\channel_old_latency[6]_i_4_n_0 ),
        .I4(\channel_old_latency[3]_i_5_n_0 ),
        .I5(\channel_old_latency_reg[2]_1 ),
        .O(\channel_old_latency_reg[3] [3]));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \channel_old_latency[3]_i_2 
       (.I0(CO),
        .I1(\channel_old_latency[6]_i_2_n_0 ),
        .I2(\channel_old_latency_reg[5] ),
        .I3(\tail_reg[1]_0 ),
        .O(\channel_old_latency[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF009696)) 
    \channel_old_latency[3]_i_4 
       (.I0(min_latency1_carry_i_12__0_n_0),
        .I1(min_latency1_carry_i_13_n_0),
        .I2(Q[3]),
        .I3(\channel_old_latency_reg[2]_2 ),
        .I4(CO),
        .O(\channel_old_latency[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT5 #(
    .INIT(32'h74474774)) 
    \channel_old_latency[3]_i_5 
       (.I0(\channel_old_latency_reg[2]_3 ),
        .I1(CO),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(Q[0]),
        .O(\channel_old_latency[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'hB847)) 
    \channel_old_latency[4]_i_1__0 
       (.I0(\channel_old_latency_reg[4] ),
        .I1(CO),
        .I2(\channel_old_latency[6]_i_2_n_0 ),
        .I3(\channel_old_latency[6]_i_3_n_0 ),
        .O(\channel_old_latency_reg[3] [4]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'h74473300)) 
    \channel_old_latency[5]_i_1__0 
       (.I0(\channel_old_latency_reg[4] ),
        .I1(CO),
        .I2(\channel_old_latency[6]_i_2_n_0 ),
        .I3(\channel_old_latency[6]_i_4_n_0 ),
        .I4(\channel_old_latency[6]_i_3_n_0 ),
        .O(\channel_old_latency_reg[3] [5]));
  LUT5 #(
    .INIT(32'h51505050)) 
    \channel_old_latency[6]_i_1__0 
       (.I0(CO),
        .I1(\channel_old_latency[6]_i_2_n_0 ),
        .I2(\channel_old_latency_reg[5] ),
        .I3(\channel_old_latency[6]_i_3_n_0 ),
        .I4(\channel_old_latency[6]_i_4_n_0 ),
        .O(\channel_old_latency_reg[3] [6]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT5 #(
    .INIT(32'hB24D4DB2)) 
    \channel_old_latency[6]_i_2 
       (.I0(min_latency1_carry_i_13_n_0),
        .I1(min_latency1_carry_i_12__0_n_0),
        .I2(Q[3]),
        .I3(\channel_old_latency[6]_i_5__0_n_0 ),
        .I4(Q[4]),
        .O(\channel_old_latency[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000044000400)) 
    \channel_old_latency[6]_i_3 
       (.I0(\channel_old_latency_reg[2]_1 ),
        .I1(\channel_old_latency[3]_i_5_n_0 ),
        .I2(\channel_old_latency[6]_i_4_n_0 ),
        .I3(\channel_old_latency_reg[2]_0 ),
        .I4(\channel_old_latency[3]_i_2_n_0 ),
        .I5(\channel_old_latency[3]_i_4_n_0 ),
        .O(\channel_old_latency[6]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \channel_old_latency[6]_i_4 
       (.I0(min_latency1_carry_i_9__0_n_0),
        .I1(min_latency1_carry_i_10__0_n_0),
        .I2(Q[5]),
        .O(\channel_old_latency[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h96669996)) 
    \channel_old_latency[6]_i_5__0 
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(min_latency1_carry_i_22__0_n_0),
        .I3(tail_reg[3]),
        .I4(head_reg[3]),
        .O(\channel_old_latency[6]_i_5__0_n_0 ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d9" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d9" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1152" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[1].engine_and_station_i/aChannel/fifo_channel/content" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "127" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "8" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "8" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    content_reg_bram_0
       (.ADDRARDADDR({1'b1,1'b1,1'b1,tail_reg,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,where_to_read,content_reg_bram_0_i_8__3_n_0,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,content_reg_bram_0_1}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT({NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:9],from_memory}),
        .DOUTPADOUTP(NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(\switch2channel\.valid ),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h540454040000FFFF)) 
    content_reg_bram_0_i_10__1
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(\middle_reg_n_0_[7] ),
        .I2(content_reg_bram_0_i_28__1_n_0),
        .I3(from_memory[7]),
        .I4(content_reg_bram_0_4),
        .I5(content_reg_bram_0_3),
        .O(DINADIN[6]));
  LUT6 #(
    .INIT(64'h540454040000FFFF)) 
    content_reg_bram_0_i_11__1
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(\middle_reg_n_0_[6] ),
        .I2(content_reg_bram_0_i_28__1_n_0),
        .I3(from_memory[6]),
        .I4(content_reg_bram_0_5),
        .I5(content_reg_bram_0_3),
        .O(DINADIN[5]));
  LUT6 #(
    .INIT(64'h540454040000FFFF)) 
    content_reg_bram_0_i_12__1
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(\middle_reg_n_0_[5] ),
        .I2(content_reg_bram_0_i_28__1_n_0),
        .I3(from_memory[5]),
        .I4(content_reg_bram_0_6),
        .I5(content_reg_bram_0_3),
        .O(DINADIN[4]));
  LUT6 #(
    .INIT(64'h540454040000FFFF)) 
    content_reg_bram_0_i_13__1
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(\middle_reg_n_0_[4] ),
        .I2(content_reg_bram_0_i_28__1_n_0),
        .I3(from_memory[4]),
        .I4(content_reg_bram_0_7),
        .I5(content_reg_bram_0_3),
        .O(DINADIN[3]));
  LUT6 #(
    .INIT(64'h540454040000FFFF)) 
    content_reg_bram_0_i_14__1
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(\middle_reg_n_0_[3] ),
        .I2(content_reg_bram_0_i_28__1_n_0),
        .I3(from_memory[3]),
        .I4(content_reg_bram_0_8),
        .I5(content_reg_bram_0_3),
        .O(DINADIN[2]));
  LUT6 #(
    .INIT(64'h540454040000FFFF)) 
    content_reg_bram_0_i_15
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(\middle_reg_n_0_[2] ),
        .I2(content_reg_bram_0_i_28__1_n_0),
        .I3(from_memory[2]),
        .I4(content_reg_bram_0_9),
        .I5(content_reg_bram_0_3),
        .O(DINADIN[1]));
  LUT6 #(
    .INIT(64'h540454040000FFFF)) 
    content_reg_bram_0_i_16__0
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(\middle_reg_n_0_[1] ),
        .I2(content_reg_bram_0_i_28__1_n_0),
        .I3(from_memory[1]),
        .I4(content_reg_bram_0_10),
        .I5(content_reg_bram_0_3),
        .O(DINADIN[0]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT5 #(
    .INIT(32'hFFFFFF96)) 
    content_reg_bram_0_i_18__1
       (.I0(tail_reg[6]),
        .I1(head_reg[6]),
        .I2(content_reg_bram_0_i_25__0_n_0),
        .I3(content_reg_bram_0_i_26__1_n_0),
        .I4(content_reg_bram_0_i_27__1_n_0),
        .O(WEA));
  LUT6 #(
    .INIT(64'hFF00FFB800000000)) 
    content_reg_bram_0_i_20
       (.I0(from_memory[0]),
        .I1(content_reg_bram_0_i_28__1_n_0),
        .I2(\middle_reg_n_0_[0] ),
        .I3(content_reg_bram_0_11),
        .I4(content_reg_bram_0_i_41_n_0),
        .I5(content_reg_bram_0_12),
        .O(content_reg_bram_0_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'hAA8A)) 
    content_reg_bram_0_i_20__2
       (.I0(content_reg_bram_0_i_41_n_0),
        .I1(\tail_reg[0]_0 [1]),
        .I2(\tail_reg[0]_0 [0]),
        .I3(\tail_reg[0]_0 [2]),
        .O(\cur_state_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    content_reg_bram_0_i_20__4
       (.I0(head_reg[3]),
        .I1(head_reg[1]),
        .I2(head_reg[2]),
        .I3(head_reg[4]),
        .O(content_reg_bram_0_i_20__4_n_0));
  LUT6 #(
    .INIT(64'h0202020000000200)) 
    content_reg_bram_0_i_21
       (.I0(content_reg_bram_0_12),
        .I1(content_reg_bram_0_i_41_n_0),
        .I2(content_reg_bram_0_11),
        .I3(\middle_reg_n_0_[8] ),
        .I4(content_reg_bram_0_i_28__1_n_0),
        .I5(from_memory[8]),
        .O(\middle_reg[8]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_21__4
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(state_cur[0]),
        .O(content_reg_bram_0_i_21__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    content_reg_bram_0_i_22__3
       (.I0(head_reg[3]),
        .I1(head_reg[2]),
        .I2(head_reg[1]),
        .I3(head_reg[0]),
        .I4(head_reg[4]),
        .O(content_reg_bram_0_i_22__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_23__2
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[3]),
        .O(content_reg_bram_0_i_23__2_n_0));
  LUT6 #(
    .INIT(64'h0202020000000200)) 
    content_reg_bram_0_i_24
       (.I0(content_reg_bram_0_12),
        .I1(content_reg_bram_0_i_41_n_0),
        .I2(content_reg_bram_0_11),
        .I3(\middle_reg_n_0_[7] ),
        .I4(content_reg_bram_0_i_28__1_n_0),
        .I5(from_memory[7]),
        .O(\middle_reg[7]_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    content_reg_bram_0_i_25__0
       (.I0(tail_reg[5]),
        .I1(tail_reg[4]),
        .I2(tail_reg[2]),
        .I3(tail_reg[0]),
        .I4(tail_reg[1]),
        .I5(tail_reg[3]),
        .O(content_reg_bram_0_i_25__0_n_0));
  LUT6 #(
    .INIT(64'h0202020000000200)) 
    content_reg_bram_0_i_26
       (.I0(content_reg_bram_0_12),
        .I1(content_reg_bram_0_i_41_n_0),
        .I2(content_reg_bram_0_11),
        .I3(\middle_reg_n_0_[6] ),
        .I4(content_reg_bram_0_i_28__1_n_0),
        .I5(from_memory[6]),
        .O(\middle_reg[6]_0 ));
  LUT6 #(
    .INIT(64'hFB7DEFFFEFFFFB7D)) 
    content_reg_bram_0_i_26__1
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(content_reg_bram_0_i_26__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'hFF04FFFF)) 
    content_reg_bram_0_i_27
       (.I0(\tail_reg[0]_0 [2]),
        .I1(\tail_reg[0]_0 [0]),
        .I2(\tail_reg[0]_0 [1]),
        .I3(content_reg_bram_0_i_41_n_0),
        .I4(content_reg_bram_0_12),
        .O(content_reg_bram_0_i_27_n_0));
  LUT6 #(
    .INIT(64'h6DFFFB6DFFFBFFFF)) 
    content_reg_bram_0_i_27__1
       (.I0(head_reg[3]),
        .I1(tail_reg[3]),
        .I2(content_reg_bram_0_i_28__2_n_0),
        .I3(head_reg[4]),
        .I4(tail_reg[4]),
        .I5(content_reg_bram_0_i_29__1_n_0),
        .O(content_reg_bram_0_i_27__1_n_0));
  LUT6 #(
    .INIT(64'h0202020000000200)) 
    content_reg_bram_0_i_28
       (.I0(content_reg_bram_0_12),
        .I1(content_reg_bram_0_i_41_n_0),
        .I2(content_reg_bram_0_11),
        .I3(\middle_reg_n_0_[5] ),
        .I4(content_reg_bram_0_i_28__1_n_0),
        .I5(from_memory[5]),
        .O(\middle_reg[5]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    content_reg_bram_0_i_28__1
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .O(content_reg_bram_0_i_28__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    content_reg_bram_0_i_28__2
       (.I0(tail_reg[1]),
        .I1(tail_reg[0]),
        .I2(tail_reg[2]),
        .O(content_reg_bram_0_i_28__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h9)) 
    content_reg_bram_0_i_29__1
       (.I0(tail_reg[5]),
        .I1(head_reg[5]),
        .O(content_reg_bram_0_i_29__1_n_0));
  LUT6 #(
    .INIT(64'h04FBFF00F708FF00)) 
    content_reg_bram_0_i_2__1
       (.I0(content_reg_bram_0_i_20__4_n_0),
        .I1(content_reg_bram_0_i_21__4_n_0),
        .I2(content_reg_bram_0_i_27_n_0),
        .I3(head_reg[6]),
        .I4(head_reg[5]),
        .I5(content_reg_bram_0_i_22__3_n_0),
        .O(where_to_read[6]));
  LUT6 #(
    .INIT(64'h0202020000000200)) 
    content_reg_bram_0_i_30
       (.I0(content_reg_bram_0_12),
        .I1(content_reg_bram_0_i_41_n_0),
        .I2(content_reg_bram_0_11),
        .I3(\middle_reg_n_0_[4] ),
        .I4(content_reg_bram_0_i_28__1_n_0),
        .I5(from_memory[4]),
        .O(\middle_reg[4]_0 ));
  LUT6 #(
    .INIT(64'h0202020000000200)) 
    content_reg_bram_0_i_32
       (.I0(content_reg_bram_0_12),
        .I1(content_reg_bram_0_i_41_n_0),
        .I2(content_reg_bram_0_11),
        .I3(\middle_reg_n_0_[3] ),
        .I4(content_reg_bram_0_i_28__1_n_0),
        .I5(from_memory[3]),
        .O(\middle_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h0202020000000200)) 
    content_reg_bram_0_i_34
       (.I0(content_reg_bram_0_12),
        .I1(content_reg_bram_0_i_41_n_0),
        .I2(content_reg_bram_0_11),
        .I3(\middle_reg_n_0_[2] ),
        .I4(content_reg_bram_0_i_28__1_n_0),
        .I5(from_memory[2]),
        .O(\middle_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h0202020000000200)) 
    content_reg_bram_0_i_36
       (.I0(content_reg_bram_0_12),
        .I1(content_reg_bram_0_i_41_n_0),
        .I2(content_reg_bram_0_11),
        .I3(\middle_reg_n_0_[1] ),
        .I4(content_reg_bram_0_i_28__1_n_0),
        .I5(from_memory[1]),
        .O(\middle_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h59AAFFFF59AA0000)) 
    content_reg_bram_0_i_3__0
       (.I0(head_reg[5]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(head_reg[0]),
        .I3(content_reg_bram_0_i_20__4_n_0),
        .I4(content_reg_bram_0_i_21__4_n_0),
        .I5(p_0_in__2[5]),
        .O(where_to_read[5]));
  LUT6 #(
    .INIT(64'h2000002000000000)) 
    content_reg_bram_0_i_41
       (.I0(content_reg_bram_0_i_54__0_n_0),
        .I1(content_reg_bram_0_i_55_n_0),
        .I2(content_reg_bram_0_i_56__0_n_0),
        .I3(head_reg[5]),
        .I4(tail_reg[5]),
        .I5(content_reg_bram_0_i_57__0_n_0),
        .O(content_reg_bram_0_i_41_n_0));
  LUT6 #(
    .INIT(64'h59AAFFFF59AA0000)) 
    content_reg_bram_0_i_4__1
       (.I0(head_reg[4]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(head_reg[0]),
        .I3(content_reg_bram_0_i_23__2_n_0),
        .I4(content_reg_bram_0_i_21__4_n_0),
        .I5(p_0_in__2[4]),
        .O(where_to_read[4]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    content_reg_bram_0_i_54__0
       (.I0(head_reg[2]),
        .I1(tail_reg[2]),
        .I2(tail_reg[4]),
        .I3(head_reg[4]),
        .I4(tail_reg[6]),
        .I5(head_reg[6]),
        .O(content_reg_bram_0_i_54__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h6)) 
    content_reg_bram_0_i_55
       (.I0(tail_reg[1]),
        .I1(head_reg[1]),
        .O(content_reg_bram_0_i_55_n_0));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h9)) 
    content_reg_bram_0_i_56__0
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .O(content_reg_bram_0_i_56__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h9)) 
    content_reg_bram_0_i_57__0
       (.I0(tail_reg[3]),
        .I1(head_reg[3]),
        .O(content_reg_bram_0_i_57__0_n_0));
  LUT6 #(
    .INIT(64'h0FB4F0F0F0F0F0F0)) 
    content_reg_bram_0_i_5__0
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(content_reg_bram_0_i_21__4_n_0),
        .I2(head_reg[3]),
        .I3(head_reg[0]),
        .I4(head_reg[1]),
        .I5(head_reg[2]),
        .O(where_to_read[3]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h0FF0B4F0)) 
    content_reg_bram_0_i_6
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(content_reg_bram_0_i_21__4_n_0),
        .I2(head_reg[2]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .O(where_to_read[2]));
  LUT6 #(
    .INIT(64'h55555555AAAA6AAA)) 
    content_reg_bram_0_i_7__1
       (.I0(head_reg[1]),
        .I1(state_cur[0]),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(head_reg[0]),
        .O(where_to_read[1]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT5 #(
    .INIT(32'h65555555)) 
    content_reg_bram_0_i_8__3
       (.I0(head_reg[0]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[1]),
        .I3(state_cur[2]),
        .I4(state_cur[0]),
        .O(content_reg_bram_0_i_8__3_n_0));
  LUT6 #(
    .INIT(64'h540454040000FFFF)) 
    content_reg_bram_0_i_9__1
       (.I0(content_reg_bram_0_i_27_n_0),
        .I1(\middle_reg_n_0_[8] ),
        .I2(content_reg_bram_0_i_28__1_n_0),
        .I3(from_memory[8]),
        .I4(content_reg_bram_0_2),
        .I5(content_reg_bram_0_3),
        .O(DINADIN[7]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1__2 
       (.I0(head_reg[0]),
        .O(\head[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1__2 
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[2]_i_1__2 
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[0]),
        .O(p_0_in__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \head[3]_i_1__2 
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .O(p_0_in__2[3]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \head[4]_i_1__4 
       (.I0(head_reg[4]),
        .I1(head_reg[3]),
        .I2(head_reg[2]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .O(p_0_in__2[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \head[5]_i_1__0 
       (.I0(head_reg[5]),
        .I1(head_reg[4]),
        .I2(head_reg[0]),
        .I3(head_reg[1]),
        .I4(head_reg[2]),
        .I5(head_reg[3]),
        .O(p_0_in__2[5]));
  LUT1 #(
    .INIT(2'h1)) 
    \head[6]_i_1 
       (.I0(content_reg_bram_0_i_27_n_0),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[6]_i_2__0 
       (.I0(head_reg[6]),
        .I1(head_reg[5]),
        .I2(content_reg_bram_0_i_22__3_n_0),
        .O(p_0_in__2[6]));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[0]),
        .D(\head[0]_i_1__2_n_0 ),
        .Q(head_reg[0]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[0]),
        .D(p_0_in__2[1]),
        .Q(head_reg[1]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[0]),
        .D(p_0_in__2[2]),
        .Q(head_reg[2]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[0]),
        .D(p_0_in__2[3]),
        .Q(head_reg[3]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[0]),
        .D(p_0_in__2[4]),
        .Q(head_reg[4]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[0]),
        .D(p_0_in__2[5]),
        .Q(head_reg[5]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[0]),
        .D(p_0_in__2[6]),
        .Q(head_reg[6]),
        .R(\state_cur_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[0]_i_1__3 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[0]),
        .I4(content_reg_bram_0_1[0]),
        .O(\middle[0]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[1]_i_1__3 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[1]),
        .I4(content_reg_bram_0_1[1]),
        .O(\middle[1]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[2]_i_1__3 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[2]),
        .I4(content_reg_bram_0_1[2]),
        .O(\middle[2]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[3]_i_1__3 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[3]),
        .I4(content_reg_bram_0_1[3]),
        .O(\middle[3]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[4]_i_1__3 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[4]),
        .I4(content_reg_bram_0_1[4]),
        .O(\middle[4]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[5]_i_1__3 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[5]),
        .I4(content_reg_bram_0_1[5]),
        .O(\middle[5]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[6]_i_1__3 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[6]),
        .I4(content_reg_bram_0_1[6]),
        .O(\middle[6]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[7]_i_1__3 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[7]),
        .I4(content_reg_bram_0_1[7]),
        .O(\middle[7]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h0033000230020202)) 
    \middle[8]_i_1 
       (.I0(p_0_in[1]),
        .I1(\state_cur_reg[0]_0 ),
        .I2(state_cur[0]),
        .I3(state_cur[2]),
        .I4(state_cur[1]),
        .I5(content_reg_bram_0_i_27_n_0),
        .O(middle));
  LUT5 #(
    .INIT(32'hFF57A800)) 
    \middle[8]_i_2 
       (.I0(state_cur[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[0]),
        .I3(from_memory[8]),
        .I4(content_reg_bram_0_1[8]),
        .O(\middle[8]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[0]_i_1__3_n_0 ),
        .Q(\middle_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[1]_i_1__3_n_0 ),
        .Q(\middle_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[2]_i_1__3_n_0 ),
        .Q(\middle_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[3]_i_1__3_n_0 ),
        .Q(\middle_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[4]_i_1__3_n_0 ),
        .Q(\middle_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[5]_i_1__3_n_0 ),
        .Q(\middle_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[6]_i_1__3_n_0 ),
        .Q(\middle_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[7]_i_1__3_n_0 ),
        .Q(\middle_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(middle),
        .D(\middle[8]_i_2_n_0 ),
        .Q(\middle_reg_n_0_[8] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB24D4DB2)) 
    min_latency1_carry_i_1
       (.I0(Q[5]),
        .I1(min_latency1_carry_i_9__0_n_0),
        .I2(min_latency1_carry_i_10__0_n_0),
        .I3(min_latency1_carry_i_11_n_0),
        .I4(Q[6]),
        .O(\channel_old_latency_reg[5] ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'h69)) 
    min_latency1_carry_i_10__0
       (.I0(head_reg[5]),
        .I1(tail_reg[5]),
        .I2(\state_cur[2]_i_5__2_n_0 ),
        .O(min_latency1_carry_i_10__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'h69996669)) 
    min_latency1_carry_i_11
       (.I0(head_reg[6]),
        .I1(tail_reg[6]),
        .I2(\state_cur[2]_i_5__2_n_0 ),
        .I3(tail_reg[5]),
        .I4(head_reg[5]),
        .O(min_latency1_carry_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'h17)) 
    min_latency1_carry_i_12__0
       (.I0(Q[2]),
        .I1(min_latency1_carry_i_20_n_0),
        .I2(min_latency1_carry_i_21__0_n_0),
        .O(min_latency1_carry_i_12__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h69)) 
    min_latency1_carry_i_13
       (.I0(head_reg[3]),
        .I1(tail_reg[3]),
        .I2(min_latency1_carry_i_22__0_n_0),
        .O(min_latency1_carry_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'h69)) 
    min_latency1_carry_i_15
       (.I0(min_latency1_carry_i_20_n_0),
        .I1(min_latency1_carry_i_21__0_n_0),
        .I2(Q[2]),
        .O(\channel_old_latency_reg[2] ));
  LUT6 #(
    .INIT(64'h9996699966699666)) 
    min_latency1_carry_i_19
       (.I0(tail_reg[1]),
        .I1(head_reg[1]),
        .I2(Q[0]),
        .I3(tail_reg[0]),
        .I4(head_reg[0]),
        .I5(Q[1]),
        .O(\tail_reg[1]_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    min_latency1_carry_i_2
       (.I0(\channel_old_latency[6]_i_4_n_0 ),
        .I1(\channel_old_latency[6]_i_2_n_0 ),
        .I2(\channel_old_latency_reg[4] ),
        .O(DI[2]));
  LUT6 #(
    .INIT(64'h6FF6096069660000)) 
    min_latency1_carry_i_20
       (.I0(head_reg[1]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .I3(head_reg[0]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(min_latency1_carry_i_20_n_0));
  LUT6 #(
    .INIT(64'h6696969966966696)) 
    min_latency1_carry_i_21__0
       (.I0(head_reg[2]),
        .I1(tail_reg[2]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .I5(head_reg[0]),
        .O(min_latency1_carry_i_21__0_n_0));
  LUT6 #(
    .INIT(64'hD0FD0000FFFFD0FD)) 
    min_latency1_carry_i_22__0
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(min_latency1_carry_i_22__0_n_0));
  LUT6 #(
    .INIT(64'h690069006900FF69)) 
    min_latency1_carry_i_3__0
       (.I0(min_latency1_carry_i_12__0_n_0),
        .I1(min_latency1_carry_i_13_n_0),
        .I2(Q[3]),
        .I3(\channel_old_latency_reg[2]_2 ),
        .I4(\channel_old_latency_reg[2] ),
        .I5(min_latency1_carry),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'hB89090B890B8B890)) 
    min_latency1_carry_i_4
       (.I0(\channel_old_latency_reg[2]_3 ),
        .I1(min_latency1_carry_0),
        .I2(\tail_reg[1]_0 ),
        .I3(Q[0]),
        .I4(tail_reg[0]),
        .I5(head_reg[0]),
        .O(DI[0]));
  LUT1 #(
    .INIT(2'h1)) 
    min_latency1_carry_i_5
       (.I0(\channel_old_latency_reg[5] ),
        .O(S[3]));
  LUT3 #(
    .INIT(8'h41)) 
    min_latency1_carry_i_6
       (.I0(\channel_old_latency[6]_i_4_n_0 ),
        .I1(\channel_old_latency[6]_i_2_n_0 ),
        .I2(\channel_old_latency_reg[4] ),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h0000966996690000)) 
    min_latency1_carry_i_7__0
       (.I0(min_latency1_carry_i_12__0_n_0),
        .I1(min_latency1_carry_i_13_n_0),
        .I2(Q[3]),
        .I3(\channel_old_latency_reg[2]_2 ),
        .I4(\channel_old_latency_reg[2] ),
        .I5(min_latency1_carry),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h0660600690090990)) 
    min_latency1_carry_i_8__0
       (.I0(\tail_reg[1]_0 ),
        .I1(min_latency1_carry_0),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(Q[0]),
        .I5(\channel_old_latency_reg[2]_3 ),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT5 #(
    .INIT(32'h4D00FF4D)) 
    min_latency1_carry_i_9__0
       (.I0(min_latency1_carry_i_13_n_0),
        .I1(min_latency1_carry_i_12__0_n_0),
        .I2(Q[3]),
        .I3(\channel_old_latency[6]_i_5__0_n_0 ),
        .I4(Q[4]),
        .O(min_latency1_carry_i_9__0_n_0));
  LUT6 #(
    .INIT(64'hFFFCFC00AAF0C000)) 
    \state_cur[0]_i_1__1 
       (.I0(\state_cur[2]_i_3__2_n_0 ),
        .I1(state_cur[0]),
        .I2(content_reg_bram_0_i_27_n_0),
        .I3(state_cur[1]),
        .I4(state_cur[2]),
        .I5(p_0_in[1]),
        .O(state_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \state_cur[1]_i_1__4 
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(state_next[1]));
  LUT6 #(
    .INIT(64'h0FF03FF00FBA0FBA)) 
    \state_cur[2]_i_1__1 
       (.I0(p_0_in[1]),
        .I1(content_reg_bram_0_i_27_n_0),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(\state_cur[2]_i_3__2_n_0 ),
        .I5(state_cur[0]),
        .O(\state_cur[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'hFFEFA5ED)) 
    \state_cur[2]_i_2__1 
       (.I0(state_cur[1]),
        .I1(p_0_in[1]),
        .I2(state_cur[2]),
        .I3(state_cur[0]),
        .I4(content_reg_bram_0_i_27_n_0),
        .O(state_next[2]));
  LUT6 #(
    .INIT(64'hF6FFFFF6FFF6F9FF)) 
    \state_cur[2]_i_3__2 
       (.I0(tail_reg[6]),
        .I1(head_reg[6]),
        .I2(\state_cur[2]_i_4__1_n_0 ),
        .I3(head_reg[5]),
        .I4(tail_reg[5]),
        .I5(\state_cur[2]_i_5__2_n_0 ),
        .O(\state_cur[2]_i_3__2_n_0 ));
  LUT6 #(
    .INIT(64'hF6FFFFF6FFF6F9FF)) 
    \state_cur[2]_i_4__1 
       (.I0(tail_reg[4]),
        .I1(head_reg[4]),
        .I2(\state_cur[2]_i_6_n_0 ),
        .I3(head_reg[3]),
        .I4(tail_reg[3]),
        .I5(min_latency1_carry_i_22__0_n_0),
        .O(\state_cur[2]_i_4__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'hD400FFD4)) 
    \state_cur[2]_i_5__2 
       (.I0(head_reg[3]),
        .I1(tail_reg[3]),
        .I2(min_latency1_carry_i_22__0_n_0),
        .I3(tail_reg[4]),
        .I4(head_reg[4]),
        .O(\state_cur[2]_i_5__2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF9FF96FF6FFFF)) 
    \state_cur[2]_i_6 
       (.I0(tail_reg[2]),
        .I1(head_reg[2]),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(tail_reg[1]),
        .I5(head_reg[1]),
        .O(\state_cur[2]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__1_n_0 ),
        .D(state_next[0]),
        .Q(state_cur[0]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__1_n_0 ),
        .D(state_next[1]),
        .Q(state_cur[1]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__1_n_0 ),
        .D(state_next[2]),
        .Q(state_cur[2]),
        .R(\state_cur_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \tail[0]_i_1__1 
       (.I0(tail_reg[0]),
        .O(\tail[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[1]_i_1__2 
       (.I0(tail_reg[0]),
        .I1(tail_reg[1]),
        .O(\tail[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[2]_i_1__4 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(\tail[2]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \tail[3]_i_1__3 
       (.I0(tail_reg[3]),
        .I1(tail_reg[2]),
        .I2(tail_reg[0]),
        .I3(tail_reg[1]),
        .O(\tail[3]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \tail[4]_i_1__4 
       (.I0(tail_reg[4]),
        .I1(tail_reg[3]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(tail_reg[2]),
        .O(\tail[4]_i_1__4_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \tail[5]_i_1__0 
       (.I0(tail_reg[3]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .I3(tail_reg[2]),
        .I4(tail_reg[4]),
        .I5(tail_reg[5]),
        .O(\tail[5]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tail[6]_i_1__0 
       (.I0(WEA),
        .I1(\tail_reg[0]_1 ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[6]_i_2__0 
       (.I0(tail_reg[6]),
        .I1(content_reg_bram_0_i_25__0_n_0),
        .O(\tail[6]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[1]),
        .D(\tail[0]_i_1__1_n_0 ),
        .Q(tail_reg[0]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[1]),
        .D(\tail[1]_i_1__2_n_0 ),
        .Q(tail_reg[1]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[1]),
        .D(\tail[2]_i_1__4_n_0 ),
        .Q(tail_reg[2]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[1]),
        .D(\tail[3]_i_1__3_n_0 ),
        .Q(tail_reg[3]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[1]),
        .D(\tail[4]_i_1__4_n_0 ),
        .Q(tail_reg[4]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[1]),
        .D(\tail[5]_i_1__0_n_0 ),
        .Q(tail_reg[5]),
        .R(\state_cur_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in[1]),
        .D(\tail[6]_i_2__0_n_0 ),
        .Q(tail_reg[6]),
        .R(\state_cur_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "fifo" *) 
module fifo__parameterized0_14
   (\switch2channel\.ready_0 ,
    \tail_reg[1]_0 ,
    \channel_old_latency_reg[3] ,
    \channel_old_latency_reg[5] ,
    S,
    D,
    \head_reg[0]_0 ,
    \head_reg[0]_1 ,
    \channel_old_latency_reg[5]_0 ,
    \channel_old_latency_reg[5]_1 ,
    content_reg_bram_0_0,
    DI,
    \channel_old_latency_reg[3]_0 ,
    \channel_old_latency_reg[5]_2 ,
    \head_reg[2]_0 ,
    \channel_old_latency_reg[2] ,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    content_reg_bram_0_9,
    clk_IBUF_BUFG,
    \switch2channel\.valid ,
    DINADIN,
    SR,
    p_0_in,
    \state_cur_reg[0]_0 ,
    Q,
    CO,
    \channel_old_latency_reg[0] ,
    \channel_old_latency_reg[0]_0 ,
    \channel_old_latency[6]_i_5 ,
    content_reg_bram_0_10,
    content_reg_bram_0_11,
    content_reg_bram_0_12,
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    content_reg_bram_0_15,
    content_reg_bram_0_16,
    content_reg_bram_0_17,
    content_reg_bram_0_18,
    content_reg_bram_0_19,
    min_latency1_carry,
    min_latency1_carry_0,
    E);
  output \switch2channel\.ready_0 ;
  output \tail_reg[1]_0 ;
  output \channel_old_latency_reg[3] ;
  output \channel_old_latency_reg[5] ;
  output [1:0]S;
  output [0:0]D;
  output \head_reg[0]_0 ;
  output \head_reg[0]_1 ;
  output \channel_old_latency_reg[5]_0 ;
  output \channel_old_latency_reg[5]_1 ;
  output [8:0]content_reg_bram_0_0;
  output [0:0]DI;
  output \channel_old_latency_reg[3]_0 ;
  output \channel_old_latency_reg[5]_2 ;
  output \head_reg[2]_0 ;
  output \channel_old_latency_reg[2] ;
  output content_reg_bram_0_1;
  output content_reg_bram_0_2;
  output content_reg_bram_0_3;
  output content_reg_bram_0_4;
  output content_reg_bram_0_5;
  output content_reg_bram_0_6;
  output content_reg_bram_0_7;
  output content_reg_bram_0_8;
  output content_reg_bram_0_9;
  input clk_IBUF_BUFG;
  input \switch2channel\.valid ;
  input [8:0]DINADIN;
  input [0:0]SR;
  input [0:0]p_0_in;
  input \state_cur_reg[0]_0 ;
  input [6:0]Q;
  input [0:0]CO;
  input \channel_old_latency_reg[0] ;
  input \channel_old_latency_reg[0]_0 ;
  input \channel_old_latency[6]_i_5 ;
  input content_reg_bram_0_10;
  input content_reg_bram_0_11;
  input content_reg_bram_0_12;
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input content_reg_bram_0_15;
  input content_reg_bram_0_16;
  input content_reg_bram_0_17;
  input content_reg_bram_0_18;
  input content_reg_bram_0_19;
  input min_latency1_carry;
  input min_latency1_carry_0;
  input [0:0]E;

  wire [0:0]CO;
  wire [0:0]D;
  wire [0:0]DI;
  wire [8:0]DINADIN;
  wire [0:0]E;
  wire [6:0]Q;
  wire [1:0]S;
  wire [0:0]SR;
  wire \channel_old_latency[6]_i_5 ;
  wire \channel_old_latency_reg[0] ;
  wire \channel_old_latency_reg[0]_0 ;
  wire \channel_old_latency_reg[2] ;
  wire \channel_old_latency_reg[3] ;
  wire \channel_old_latency_reg[3]_0 ;
  wire \channel_old_latency_reg[5] ;
  wire \channel_old_latency_reg[5]_0 ;
  wire \channel_old_latency_reg[5]_1 ;
  wire \channel_old_latency_reg[5]_2 ;
  wire clk_IBUF_BUFG;
  wire [8:0]content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_15;
  wire content_reg_bram_0_16;
  wire content_reg_bram_0_17;
  wire content_reg_bram_0_18;
  wire content_reg_bram_0_19;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire content_reg_bram_0_i_21__2_n_0;
  wire content_reg_bram_0_i_22__0_n_0;
  wire content_reg_bram_0_i_23__1_n_0;
  wire content_reg_bram_0_i_25__2_n_0;
  wire content_reg_bram_0_i_26__2_n_0;
  wire content_reg_bram_0_i_31__0_n_0;
  wire content_reg_bram_0_i_32__1_n_0;
  wire content_reg_bram_0_i_33__0_n_0;
  wire content_reg_bram_0_i_34__1_n_0;
  wire content_reg_bram_0_i_35__1_n_0;
  wire content_reg_bram_0_i_43_n_0;
  wire content_reg_bram_0_i_44__0_n_0;
  wire content_reg_bram_0_i_45__0_n_0;
  wire content_reg_bram_0_i_8__4_n_0;
  wire [8:0]from_memory;
  wire \head[0]_i_1__1_n_0 ;
  wire [6:0]head_reg;
  wire \head_reg[0]_0 ;
  wire \head_reg[0]_1 ;
  wire \head_reg[2]_0 ;
  wire \middle[0]_i_1__4_n_0 ;
  wire \middle[1]_i_1__4_n_0 ;
  wire \middle[2]_i_1__4_n_0 ;
  wire \middle[3]_i_1__4_n_0 ;
  wire \middle[4]_i_1__4_n_0 ;
  wire \middle[5]_i_1__4_n_0 ;
  wire \middle[6]_i_1__4_n_0 ;
  wire \middle[7]_i_1__4_n_0 ;
  wire \middle[8]_i_1__0_n_0 ;
  wire \middle[8]_i_2__0_n_0 ;
  wire \middle_reg_n_0_[0] ;
  wire \middle_reg_n_0_[1] ;
  wire \middle_reg_n_0_[2] ;
  wire \middle_reg_n_0_[3] ;
  wire \middle_reg_n_0_[4] ;
  wire \middle_reg_n_0_[5] ;
  wire \middle_reg_n_0_[6] ;
  wire \middle_reg_n_0_[7] ;
  wire \middle_reg_n_0_[8] ;
  wire min_latency1_carry;
  wire min_latency1_carry_0;
  wire min_latency1_carry_i_20__0_n_0;
  wire min_latency1_carry_i_21_n_0;
  wire min_latency1_carry_i_22_n_0;
  wire min_latency1_carry_i_28_n_0;
  wire min_latency1_carry_i_29_n_0;
  wire min_latency1_carry_i_30_n_0;
  wire min_latency1_carry_i_34_n_0;
  wire min_latency1_carry_i_35_n_0;
  wire [0:0]p_0_in;
  wire [6:1]p_0_in__1;
  wire [2:0]state_cur;
  wire \state_cur[2]_i_1__2_n_0 ;
  wire \state_cur[2]_i_3__1_n_0 ;
  wire \state_cur[2]_i_4__0_n_0 ;
  wire \state_cur[2]_i_5__0_n_0 ;
  wire \state_cur[2]_i_6__0_n_0 ;
  wire \state_cur[2]_i_7_n_0 ;
  wire \state_cur_reg[0]_0 ;
  wire [2:0]state_next;
  wire \switch2channel\.ready_0 ;
  wire \switch2channel\.valid ;
  wire \tail[0]_i_1__4_n_0 ;
  wire \tail[1]_i_1__1_n_0 ;
  wire \tail[2]_i_1__3_n_0 ;
  wire \tail[3]_i_1__2_n_0 ;
  wire \tail[4]_i_1__3_n_0 ;
  wire \tail[5]_i_1_n_0 ;
  wire \tail[6]_i_2_n_0 ;
  wire [6:0]tail_reg;
  wire \tail_reg[1]_0 ;
  wire [6:1]where_to_read;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:9]NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \channel_old_latency[0]_i_1 
       (.I0(\head_reg[0]_0 ),
        .O(D));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \channel_old_latency[5]_i_3 
       (.I0(\head_reg[0]_1 ),
        .I1(\channel_old_latency_reg[0] ),
        .I2(\channel_old_latency_reg[5]_0 ),
        .I3(\channel_old_latency_reg[5]_1 ),
        .I4(\channel_old_latency_reg[0]_0 ),
        .O(\head_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h00000000B24D4DB2)) 
    \channel_old_latency[6]_i_2__0 
       (.I0(Q[5]),
        .I1(min_latency1_carry_i_20__0_n_0),
        .I2(min_latency1_carry_i_21_n_0),
        .I3(min_latency1_carry_i_22_n_0),
        .I4(Q[6]),
        .I5(CO),
        .O(\channel_old_latency_reg[5] ));
  LUT2 #(
    .INIT(4'h2)) 
    \channel_old_latency[6]_i_7 
       (.I0(\channel_old_latency_reg[5]_2 ),
        .I1(CO),
        .O(\channel_old_latency_reg[5]_1 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \channel_old_latency[6]_i_8 
       (.I0(\channel_old_latency_reg[5] ),
        .I1(\tail_reg[1]_0 ),
        .I2(\channel_old_latency[6]_i_5 ),
        .O(\channel_old_latency_reg[5]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h74474774)) 
    \channel_old_latency[6]_i_9 
       (.I0(min_latency1_carry),
        .I1(CO),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(Q[0]),
        .O(\head_reg[0]_1 ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d9" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d9" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1152" *) 
  (* RTL_RAM_NAME = "a_topology/genblk1[0].engine_and_station_i/aChannel/fifo_channel/content" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "127" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "8" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "8" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    content_reg_bram_0
       (.ADDRARDADDR({1'b1,1'b1,1'b1,tail_reg,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,where_to_read,content_reg_bram_0_i_8__4_n_0,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DINADIN}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT({NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:9],from_memory}),
        .DOUTPADOUTP(NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(\switch2channel\.valid ),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({\switch2channel\.ready_0 ,\switch2channel\.ready_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h0000FFFFFB08FB08)) 
    content_reg_bram_0_i_10__4
       (.I0(from_memory[7]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[7] ),
        .I4(content_reg_bram_0_18),
        .I5(content_reg_bram_0_11),
        .O(content_reg_bram_0_0[7]));
  LUT6 #(
    .INIT(64'h0000FFFFFB08FB08)) 
    content_reg_bram_0_i_11__4
       (.I0(from_memory[6]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[6] ),
        .I4(content_reg_bram_0_17),
        .I5(content_reg_bram_0_11),
        .O(content_reg_bram_0_0[6]));
  LUT6 #(
    .INIT(64'h0000FFFFFB08FB08)) 
    content_reg_bram_0_i_12__4
       (.I0(from_memory[5]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[5] ),
        .I4(content_reg_bram_0_16),
        .I5(content_reg_bram_0_11),
        .O(content_reg_bram_0_0[5]));
  LUT6 #(
    .INIT(64'h0000FFFFFB08FB08)) 
    content_reg_bram_0_i_13__4
       (.I0(from_memory[4]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[4] ),
        .I4(content_reg_bram_0_15),
        .I5(content_reg_bram_0_11),
        .O(content_reg_bram_0_0[4]));
  LUT6 #(
    .INIT(64'h0000FFFFFB08FB08)) 
    content_reg_bram_0_i_14__4
       (.I0(from_memory[3]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[3] ),
        .I4(content_reg_bram_0_14),
        .I5(content_reg_bram_0_11),
        .O(content_reg_bram_0_0[3]));
  LUT6 #(
    .INIT(64'h0000FFFFFB08FB08)) 
    content_reg_bram_0_i_15__0
       (.I0(from_memory[2]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[2] ),
        .I4(content_reg_bram_0_13),
        .I5(content_reg_bram_0_11),
        .O(content_reg_bram_0_0[2]));
  LUT6 #(
    .INIT(64'h0000FFFFFB08FB08)) 
    content_reg_bram_0_i_16__1
       (.I0(from_memory[1]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[1] ),
        .I4(content_reg_bram_0_12),
        .I5(content_reg_bram_0_11),
        .O(content_reg_bram_0_0[1]));
  LUT6 #(
    .INIT(64'hBBBBB8BB8888B888)) 
    content_reg_bram_0_i_17__0
       (.I0(content_reg_bram_0_10),
        .I1(content_reg_bram_0_11),
        .I2(from_memory[0]),
        .I3(state_cur[1]),
        .I4(state_cur[2]),
        .I5(\middle_reg_n_0_[0] ),
        .O(content_reg_bram_0_0[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF8778)) 
    content_reg_bram_0_i_18__0
       (.I0(tail_reg[5]),
        .I1(content_reg_bram_0_i_31__0_n_0),
        .I2(tail_reg[6]),
        .I3(head_reg[6]),
        .I4(content_reg_bram_0_i_32__1_n_0),
        .I5(content_reg_bram_0_i_33__0_n_0),
        .O(\switch2channel\.ready_0 ));
  LUT6 #(
    .INIT(64'h0200000000000200)) 
    content_reg_bram_0_i_19__2
       (.I0(content_reg_bram_0_i_43_n_0),
        .I1(content_reg_bram_0_i_44__0_n_0),
        .I2(content_reg_bram_0_i_34__1_n_0),
        .I3(content_reg_bram_0_i_45__0_n_0),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(\head_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    content_reg_bram_0_i_21__2
       (.I0(head_reg[4]),
        .I1(head_reg[3]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .O(content_reg_bram_0_i_21__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    content_reg_bram_0_i_22__0
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(state_cur[0]),
        .O(content_reg_bram_0_i_22__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    content_reg_bram_0_i_23__1
       (.I0(head_reg[4]),
        .I1(head_reg[3]),
        .I2(head_reg[2]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .O(content_reg_bram_0_i_23__1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_25__1
       (.I0(from_memory[8]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[8] ),
        .O(content_reg_bram_0_8));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    content_reg_bram_0_i_25__2
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(content_reg_bram_0_i_25__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    content_reg_bram_0_i_26__2
       (.I0(head_reg[1]),
        .I1(head_reg[2]),
        .O(content_reg_bram_0_i_26__2_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_27__2
       (.I0(from_memory[7]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[7] ),
        .O(content_reg_bram_0_7));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_29__0
       (.I0(from_memory[6]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[6] ),
        .O(content_reg_bram_0_6));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h4BF078F0)) 
    content_reg_bram_0_i_2__2
       (.I0(content_reg_bram_0_i_21__2_n_0),
        .I1(content_reg_bram_0_i_22__0_n_0),
        .I2(head_reg[6]),
        .I3(head_reg[5]),
        .I4(content_reg_bram_0_i_23__1_n_0),
        .O(where_to_read[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    content_reg_bram_0_i_31__0
       (.I0(tail_reg[4]),
        .I1(tail_reg[3]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(tail_reg[2]),
        .O(content_reg_bram_0_i_31__0_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_31__1
       (.I0(from_memory[5]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[5] ),
        .O(content_reg_bram_0_5));
  LUT6 #(
    .INIT(64'hFFBE7DFFEBFFFF7D)) 
    content_reg_bram_0_i_32__1
       (.I0(head_reg[0]),
        .I1(head_reg[2]),
        .I2(tail_reg[2]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .I5(head_reg[1]),
        .O(content_reg_bram_0_i_32__1_n_0));
  LUT6 #(
    .INIT(64'hBEFFFFBEFFE7BEFF)) 
    content_reg_bram_0_i_33__0
       (.I0(content_reg_bram_0_i_34__1_n_0),
        .I1(tail_reg[4]),
        .I2(head_reg[4]),
        .I3(content_reg_bram_0_i_35__1_n_0),
        .I4(tail_reg[3]),
        .I5(head_reg[3]),
        .O(content_reg_bram_0_i_33__0_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_33__1
       (.I0(from_memory[4]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[4] ),
        .O(content_reg_bram_0_4));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    content_reg_bram_0_i_34__1
       (.I0(tail_reg[5]),
        .I1(head_reg[5]),
        .O(content_reg_bram_0_i_34__1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_35__0
       (.I0(from_memory[3]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[3] ),
        .O(content_reg_bram_0_3));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    content_reg_bram_0_i_35__1
       (.I0(tail_reg[1]),
        .I1(tail_reg[0]),
        .I2(tail_reg[2]),
        .O(content_reg_bram_0_i_35__1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_37__0
       (.I0(from_memory[2]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[2] ),
        .O(content_reg_bram_0_2));
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_39__0
       (.I0(from_memory[1]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[1] ),
        .O(content_reg_bram_0_1));
  LUT6 #(
    .INIT(64'h0F0F2DF0F0F02DF0)) 
    content_reg_bram_0_i_3__4
       (.I0(\state_cur_reg[0]_0 ),
        .I1(head_reg[0]),
        .I2(head_reg[5]),
        .I3(content_reg_bram_0_i_21__2_n_0),
        .I4(content_reg_bram_0_i_25__2_n_0),
        .I5(content_reg_bram_0_i_23__1_n_0),
        .O(where_to_read[5]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    content_reg_bram_0_i_43
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(tail_reg[3]),
        .I3(head_reg[3]),
        .I4(tail_reg[6]),
        .I5(head_reg[6]),
        .O(content_reg_bram_0_i_43_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    content_reg_bram_0_i_44__0
       (.I0(tail_reg[1]),
        .I1(head_reg[1]),
        .O(content_reg_bram_0_i_44__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h9)) 
    content_reg_bram_0_i_45__0
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .O(content_reg_bram_0_i_45__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    content_reg_bram_0_i_46__0
       (.I0(from_memory[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[0] ),
        .O(content_reg_bram_0_9));
  LUT6 #(
    .INIT(64'h32CDFF00FF00FF00)) 
    content_reg_bram_0_i_4__4
       (.I0(\state_cur_reg[0]_0 ),
        .I1(head_reg[0]),
        .I2(content_reg_bram_0_i_25__2_n_0),
        .I3(head_reg[4]),
        .I4(content_reg_bram_0_i_26__2_n_0),
        .I5(head_reg[3]),
        .O(where_to_read[4]));
  LUT6 #(
    .INIT(64'h32CDFF00FF00FF00)) 
    content_reg_bram_0_i_5__4
       (.I0(\state_cur_reg[0]_0 ),
        .I1(head_reg[0]),
        .I2(content_reg_bram_0_i_25__2_n_0),
        .I3(head_reg[3]),
        .I4(head_reg[1]),
        .I5(head_reg[2]),
        .O(where_to_read[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h32FFCD00)) 
    content_reg_bram_0_i_6__0
       (.I0(content_reg_bram_0_i_25__2_n_0),
        .I1(head_reg[0]),
        .I2(\state_cur_reg[0]_0 ),
        .I3(head_reg[1]),
        .I4(head_reg[2]),
        .O(where_to_read[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h56)) 
    content_reg_bram_0_i_7__4
       (.I0(head_reg[1]),
        .I1(content_reg_bram_0_i_22__0_n_0),
        .I2(head_reg[0]),
        .O(where_to_read[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h9)) 
    content_reg_bram_0_i_8__4
       (.I0(head_reg[0]),
        .I1(content_reg_bram_0_i_22__0_n_0),
        .O(content_reg_bram_0_i_8__4_n_0));
  LUT6 #(
    .INIT(64'h0000FFFFFB08FB08)) 
    content_reg_bram_0_i_9__4
       (.I0(from_memory[8]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[8] ),
        .I4(content_reg_bram_0_19),
        .I5(content_reg_bram_0_11),
        .O(content_reg_bram_0_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1__1 
       (.I0(head_reg[0]),
        .O(\head[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1__1 
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[2]_i_1__1 
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[0]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \head[3]_i_1__1 
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \head[4]_i_1__3 
       (.I0(head_reg[4]),
        .I1(head_reg[3]),
        .I2(head_reg[2]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .O(p_0_in__1[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \head[5]_i_1 
       (.I0(head_reg[5]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .I4(head_reg[3]),
        .I5(head_reg[4]),
        .O(p_0_in__1[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[6]_i_2 
       (.I0(head_reg[6]),
        .I1(head_reg[5]),
        .I2(content_reg_bram_0_i_23__1_n_0),
        .O(p_0_in__1[6]));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\head[0]_i_1__1_n_0 ),
        .Q(head_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[1]),
        .Q(head_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[2]),
        .Q(head_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[3]),
        .Q(head_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[4]),
        .Q(head_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[5]),
        .Q(head_reg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[6]),
        .Q(head_reg[6]),
        .R(SR));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[0]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[0]),
        .I4(DINADIN[0]),
        .O(\middle[0]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[1]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[1]),
        .I4(DINADIN[1]),
        .O(\middle[1]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[2]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[2]),
        .I4(DINADIN[2]),
        .O(\middle[2]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[3]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[3]),
        .I4(DINADIN[3]),
        .O(\middle[3]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[4]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[4]),
        .I4(DINADIN[4]),
        .O(\middle[4]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[5]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[5]),
        .I4(DINADIN[5]),
        .O(\middle[5]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[6]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[6]),
        .I4(DINADIN[6]),
        .O(\middle[6]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[7]_i_1__4 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[7]),
        .I4(DINADIN[7]),
        .O(\middle[7]_i_1__4_n_0 ));
  LUT6 #(
    .INIT(64'h0000500455040404)) 
    \middle[8]_i_1__0 
       (.I0(SR),
        .I1(p_0_in),
        .I2(state_cur[0]),
        .I3(state_cur[1]),
        .I4(\state_cur_reg[0]_0 ),
        .I5(state_cur[2]),
        .O(\middle[8]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFF1FE000)) 
    \middle[8]_i_2__0 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[0]),
        .I2(state_cur[1]),
        .I3(from_memory[8]),
        .I4(DINADIN[8]),
        .O(\middle[8]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[0]_i_1__4_n_0 ),
        .Q(\middle_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[1]_i_1__4_n_0 ),
        .Q(\middle_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[2]_i_1__4_n_0 ),
        .Q(\middle_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[3]_i_1__4_n_0 ),
        .Q(\middle_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[4]_i_1__4_n_0 ),
        .Q(\middle_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[5]_i_1__4_n_0 ),
        .Q(\middle_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[6]_i_1__4_n_0 ),
        .Q(\middle_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[7]_i_1__4_n_0 ),
        .Q(\middle_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\middle[8]_i_1__0_n_0 ),
        .D(\middle[8]_i_2__0_n_0 ),
        .Q(\middle_reg_n_0_[8] ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h69)) 
    min_latency1_carry_i_12
       (.I0(min_latency1_carry_i_20__0_n_0),
        .I1(min_latency1_carry_i_21_n_0),
        .I2(Q[5]),
        .O(\channel_old_latency_reg[5]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hB24D4DB2)) 
    min_latency1_carry_i_13__0
       (.I0(min_latency1_carry_i_28_n_0),
        .I1(min_latency1_carry_i_29_n_0),
        .I2(Q[3]),
        .I3(min_latency1_carry_i_30_n_0),
        .I4(Q[4]),
        .O(\channel_old_latency_reg[3] ));
  LUT3 #(
    .INIT(8'h69)) 
    min_latency1_carry_i_17
       (.I0(min_latency1_carry_i_29_n_0),
        .I1(min_latency1_carry_i_28_n_0),
        .I2(Q[3]),
        .O(\channel_old_latency_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h96)) 
    min_latency1_carry_i_18__0
       (.I0(min_latency1_carry_i_34_n_0),
        .I1(min_latency1_carry_i_35_n_0),
        .I2(Q[2]),
        .O(\channel_old_latency_reg[2] ));
  LUT6 #(
    .INIT(64'h9996699966699666)) 
    min_latency1_carry_i_19__0
       (.I0(tail_reg[1]),
        .I1(head_reg[1]),
        .I2(Q[0]),
        .I3(tail_reg[0]),
        .I4(head_reg[0]),
        .I5(Q[1]),
        .O(\tail_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h4D00FF4D)) 
    min_latency1_carry_i_20__0
       (.I0(min_latency1_carry_i_28_n_0),
        .I1(min_latency1_carry_i_29_n_0),
        .I2(Q[3]),
        .I3(min_latency1_carry_i_30_n_0),
        .I4(Q[4]),
        .O(min_latency1_carry_i_20__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h96)) 
    min_latency1_carry_i_21
       (.I0(head_reg[5]),
        .I1(tail_reg[5]),
        .I2(\state_cur[2]_i_5__0_n_0 ),
        .O(min_latency1_carry_i_21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h96996696)) 
    min_latency1_carry_i_22
       (.I0(head_reg[6]),
        .I1(tail_reg[6]),
        .I2(head_reg[5]),
        .I3(tail_reg[5]),
        .I4(\state_cur[2]_i_5__0_n_0 ),
        .O(min_latency1_carry_i_22_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    min_latency1_carry_i_28
       (.I0(head_reg[3]),
        .I1(tail_reg[3]),
        .I2(\state_cur[2]_i_7_n_0 ),
        .O(min_latency1_carry_i_28_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h2B)) 
    min_latency1_carry_i_29
       (.I0(min_latency1_carry_i_35_n_0),
        .I1(Q[2]),
        .I2(min_latency1_carry_i_34_n_0),
        .O(min_latency1_carry_i_29_n_0));
  LUT6 #(
    .INIT(64'hE26060E260E2E260)) 
    min_latency1_carry_i_3
       (.I0(min_latency1_carry),
        .I1(min_latency1_carry_0),
        .I2(\tail_reg[1]_0 ),
        .I3(Q[0]),
        .I4(tail_reg[0]),
        .I5(head_reg[0]),
        .O(DI));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h69669969)) 
    min_latency1_carry_i_30
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .I4(\state_cur[2]_i_7_n_0 ),
        .O(min_latency1_carry_i_30_n_0));
  LUT6 #(
    .INIT(64'h6FF642244BB40000)) 
    min_latency1_carry_i_34
       (.I0(tail_reg[0]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(min_latency1_carry_i_34_n_0));
  LUT6 #(
    .INIT(64'h9969696699699969)) 
    min_latency1_carry_i_35
       (.I0(head_reg[2]),
        .I1(tail_reg[2]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .I5(head_reg[0]),
        .O(min_latency1_carry_i_35_n_0));
  LUT5 #(
    .INIT(32'h4DB2B24D)) 
    min_latency1_carry_i_4__0
       (.I0(Q[5]),
        .I1(min_latency1_carry_i_20__0_n_0),
        .I2(min_latency1_carry_i_21_n_0),
        .I3(min_latency1_carry_i_22_n_0),
        .I4(Q[6]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h0990900960060660)) 
    min_latency1_carry_i_7
       (.I0(\tail_reg[1]_0 ),
        .I1(min_latency1_carry_0),
        .I2(head_reg[0]),
        .I3(tail_reg[0]),
        .I4(Q[0]),
        .I5(min_latency1_carry),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hFAFFFC00FAC0C000)) 
    \state_cur[0]_i_1__2 
       (.I0(\state_cur[2]_i_3__1_n_0 ),
        .I1(state_cur[0]),
        .I2(p_0_in),
        .I3(state_cur[1]),
        .I4(state_cur[2]),
        .I5(\state_cur_reg[0]_0 ),
        .O(state_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \state_cur[1]_i_1__1 
       (.I0(state_cur[0]),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(state_next[1]));
  LUT6 #(
    .INIT(64'h5545AAEE5F45AAEE)) 
    \state_cur[2]_i_1__2 
       (.I0(state_cur[1]),
        .I1(p_0_in),
        .I2(\state_cur_reg[0]_0 ),
        .I3(state_cur[0]),
        .I4(state_cur[2]),
        .I5(\state_cur[2]_i_3__1_n_0 ),
        .O(\state_cur[2]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hEBEBFFE3)) 
    \state_cur[2]_i_2__2 
       (.I0(\state_cur_reg[0]_0 ),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(p_0_in),
        .I4(state_cur[0]),
        .O(state_next[2]));
  LUT6 #(
    .INIT(64'hFFF6F9FFF6FFFFF6)) 
    \state_cur[2]_i_3__1 
       (.I0(tail_reg[6]),
        .I1(head_reg[6]),
        .I2(\state_cur[2]_i_4__0_n_0 ),
        .I3(head_reg[5]),
        .I4(tail_reg[5]),
        .I5(\state_cur[2]_i_5__0_n_0 ),
        .O(\state_cur[2]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF6F9FFF6FFFFF6)) 
    \state_cur[2]_i_4__0 
       (.I0(tail_reg[4]),
        .I1(head_reg[4]),
        .I2(\state_cur[2]_i_6__0_n_0 ),
        .I3(head_reg[3]),
        .I4(tail_reg[3]),
        .I5(\state_cur[2]_i_7_n_0 ),
        .O(\state_cur[2]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hB2FF00B2)) 
    \state_cur[2]_i_5__0 
       (.I0(\state_cur[2]_i_7_n_0 ),
        .I1(tail_reg[3]),
        .I2(head_reg[3]),
        .I3(tail_reg[4]),
        .I4(head_reg[4]),
        .O(\state_cur[2]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'hF96FFFFFFFFFF96F)) 
    \state_cur[2]_i_6__0 
       (.I0(tail_reg[2]),
        .I1(head_reg[2]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(head_reg[0]),
        .I5(tail_reg[0]),
        .O(\state_cur[2]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    \state_cur[2]_i_7 
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\state_cur[2]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__2_n_0 ),
        .D(state_next[0]),
        .Q(state_cur[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__2_n_0 ),
        .D(state_next[1]),
        .Q(state_cur[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\state_cur[2]_i_1__2_n_0 ),
        .D(state_next[2]),
        .Q(state_cur[2]),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \tail[0]_i_1__4 
       (.I0(tail_reg[0]),
        .O(\tail[0]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[1]_i_1__1 
       (.I0(tail_reg[0]),
        .I1(tail_reg[1]),
        .O(\tail[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[2]_i_1__3 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(\tail[2]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \tail[3]_i_1__2 
       (.I0(tail_reg[3]),
        .I1(tail_reg[2]),
        .I2(tail_reg[0]),
        .I3(tail_reg[1]),
        .O(\tail[3]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \tail[4]_i_1__3 
       (.I0(tail_reg[4]),
        .I1(tail_reg[3]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(tail_reg[2]),
        .O(\tail[4]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \tail[5]_i_1 
       (.I0(tail_reg[5]),
        .I1(tail_reg[2]),
        .I2(tail_reg[0]),
        .I3(tail_reg[1]),
        .I4(tail_reg[3]),
        .I5(tail_reg[4]),
        .O(\tail[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[6]_i_2 
       (.I0(tail_reg[6]),
        .I1(content_reg_bram_0_i_31__0_n_0),
        .I2(tail_reg[5]),
        .O(\tail[6]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\tail[0]_i_1__4_n_0 ),
        .Q(tail_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\tail[1]_i_1__1_n_0 ),
        .Q(tail_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\tail[2]_i_1__3_n_0 ),
        .Q(tail_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\tail[3]_i_1__2_n_0 ),
        .Q(tail_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\tail[4]_i_1__3_n_0 ),
        .Q(tail_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\tail[5]_i_1_n_0 ),
        .Q(tail_reg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(\tail[6]_i_2_n_0 ),
        .Q(tail_reg[6]),
        .R(SR));
endmodule

module ping_pong_buffer
   (cur_is_even_character_reg,
    \tail_reg[0] ,
    \tail_reg[0]_0 ,
    cur_is_even_character_reg_0,
    \cur_state_reg[0] ,
    cur_is_even_character_reg_1,
    cur_is_even_character_reg_2,
    cur_is_even_character_reg_3,
    cur_is_even_character_reg_4,
    cur_is_even_character_reg_5,
    content_reg_bram_0_i_24__2,
    \head_reg[2] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[25] ,
    \cur_ccs_reg[57] ,
    cur_is_even_character_reg_6,
    \tail_reg[6] ,
    \head_reg[3] ,
    \cur_state_reg[1] ,
    D,
    cur_is_even_character_reg_7,
    clk_IBUF_BUFG,
    fifo_even_data_in_valid,
    DINADIN,
    E,
    content_reg_bram_0,
    \state_cur_reg[2] ,
    p_0_in,
    p_0_in_0,
    cur_is_even_character,
    \channel_old_latency_reg[2] ,
    \channel_old_latency_reg[2]_0 ,
    \head[4]_i_4 ,
    \cur_state_reg[0]_0 ,
    \cur_state_reg[0]_1 ,
    \cur_state_reg[0]_2 ,
    \cur_state_reg[0]_3 ,
    \state_cur_reg[0] ,
    content_reg_bram_0_0,
    \cur_state[2]_i_29 ,
    \FETCH_REC_Instr[15]_i_12 ,
    \channel_old_latency_reg[2]_1 ,
    WEA,
    \head_reg[6] ,
    \head_reg[6]_0 );
  output cur_is_even_character_reg;
  output \tail_reg[0] ;
  output \tail_reg[0]_0 ;
  output cur_is_even_character_reg_0;
  output \cur_state_reg[0] ;
  output cur_is_even_character_reg_1;
  output cur_is_even_character_reg_2;
  output cur_is_even_character_reg_3;
  output cur_is_even_character_reg_4;
  output cur_is_even_character_reg_5;
  output [0:0]content_reg_bram_0_i_24__2;
  output \head_reg[2] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[25] ;
  output \cur_ccs_reg[57] ;
  output cur_is_even_character_reg_6;
  output \tail_reg[6] ;
  output \head_reg[3] ;
  output \cur_state_reg[1] ;
  output [7:0]D;
  output cur_is_even_character_reg_7;
  input clk_IBUF_BUFG;
  input fifo_even_data_in_valid;
  input [7:0]DINADIN;
  input [0:0]E;
  input [7:0]content_reg_bram_0;
  input \state_cur_reg[2] ;
  input [0:0]p_0_in;
  input [0:0]p_0_in_0;
  input cur_is_even_character;
  input \channel_old_latency_reg[2] ;
  input [0:0]\channel_old_latency_reg[2]_0 ;
  input [2:0]\head[4]_i_4 ;
  input \cur_state_reg[0]_0 ;
  input \cur_state_reg[0]_1 ;
  input \cur_state_reg[0]_2 ;
  input \cur_state_reg[0]_3 ;
  input \state_cur_reg[0] ;
  input content_reg_bram_0_0;
  input [2:0]\cur_state[2]_i_29 ;
  input [15:0]\FETCH_REC_Instr[15]_i_12 ;
  input \channel_old_latency_reg[2]_1 ;
  input [0:0]WEA;
  input \head_reg[6] ;
  input \head_reg[6]_0 ;

  wire [7:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire [15:0]\FETCH_REC_Instr[15]_i_12 ;
  wire [0:0]WEA;
  wire \channel_old_latency_reg[2] ;
  wire [0:0]\channel_old_latency_reg[2]_0 ;
  wire \channel_old_latency_reg[2]_1 ;
  wire clk_IBUF_BUFG;
  wire [7:0]content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire [0:0]content_reg_bram_0_i_24__2;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_ccs_reg[25] ;
  wire \cur_ccs_reg[57] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire cur_is_even_character_reg_4;
  wire cur_is_even_character_reg_5;
  wire cur_is_even_character_reg_6;
  wire cur_is_even_character_reg_7;
  wire [2:0]\cur_state[2]_i_29 ;
  wire \cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire \cur_state_reg[0]_3 ;
  wire \cur_state_reg[1] ;
  wire fifo_even_data_in_ready;
  wire fifo_even_data_in_valid;
  wire fifo_odd_n_16;
  wire fifo_odd_n_17;
  wire fifo_odd_n_18;
  wire fifo_odd_n_19;
  wire fifo_odd_n_20;
  wire fifo_odd_n_21;
  wire fifo_odd_n_22;
  wire fifo_odd_n_23;
  wire fifo_odd_n_24;
  wire fifo_odd_n_25;
  wire fifo_odd_n_26;
  wire fifo_odd_n_27;
  wire fifo_odd_n_28;
  wire fifo_odd_n_3;
  wire [3:2]from_memory;
  wire [2:0]\head[4]_i_4 ;
  wire \head_reg[2] ;
  wire \head_reg[3] ;
  wire \head_reg[6] ;
  wire \head_reg[6]_0 ;
  wire [0:0]p_0_in;
  wire [0:0]p_0_in_0;
  wire \state_cur_reg[0] ;
  wire \state_cur_reg[2] ;
  wire \tail_reg[0] ;
  wire \tail_reg[0]_0 ;
  wire \tail_reg[6] ;

  fifo fifo_even
       (.D(D),
        .DINADIN(DINADIN),
        .DOUTBDOUT(from_memory),
        .\FETCH_REC_Pc_reg[0] (fifo_odd_n_16),
        .\FETCH_REC_Pc_reg[1] (fifo_odd_n_17),
        .\FETCH_REC_Pc_reg[2] (fifo_odd_n_21),
        .\FETCH_REC_Pc_reg[2]_0 (fifo_odd_n_24),
        .\FETCH_REC_Pc_reg[3] (fifo_odd_n_22),
        .\FETCH_REC_Pc_reg[4] (fifo_odd_n_20),
        .\FETCH_REC_Pc_reg[5] (fifo_odd_n_23),
        .\FETCH_REC_Pc_reg[6] (fifo_odd_n_18),
        .\FETCH_REC_Pc_reg[7] (fifo_odd_n_19),
        .WEA(fifo_even_data_in_ready),
        .\channel_old_latency[5]_i_2_0 (fifo_odd_n_26),
        .\channel_old_latency_reg[2] (\channel_old_latency_reg[2] ),
        .\channel_old_latency_reg[2]_0 (\channel_old_latency_reg[2]_0 ),
        .\channel_old_latency_reg[2]_1 (\channel_old_latency_reg[2]_1 ),
        .\channel_old_latency_reg[4] (fifo_odd_n_3),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_4),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_5),
        .cur_is_even_character_reg_2(cur_is_even_character_reg_6),
        .cur_is_even_character_reg_3(cur_is_even_character_reg_7),
        .cur_is_even_character_reg_4(cur_is_even_character_reg_1),
        .fifo_even_data_in_valid(fifo_even_data_in_valid),
        .min_latency1_carry_i_14__0_0(fifo_odd_n_28),
        .min_latency1_carry_i_4(fifo_odd_n_25),
        .min_latency1_carry_i_7__0(fifo_odd_n_27),
        .p_0_in(p_0_in),
        .\state_cur_reg[0]_0 (\state_cur_reg[2] ),
        .\tail_reg[0]_0 (\tail_reg[0] ),
        .\tail_reg[0]_1 (\tail_reg[0]_0 ));
  fifo_1 fifo_odd
       (.DOUTBDOUT(from_memory),
        .E(E),
        .\FETCH_REC_Instr[15]_i_12 (\FETCH_REC_Instr[15]_i_12 ),
        .WEA(WEA),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0_0(fifo_odd_n_16),
        .content_reg_bram_0_1(fifo_odd_n_17),
        .content_reg_bram_0_2(fifo_odd_n_18),
        .content_reg_bram_0_3(fifo_odd_n_19),
        .content_reg_bram_0_4(fifo_odd_n_20),
        .content_reg_bram_0_5(fifo_odd_n_23),
        .content_reg_bram_0_6(content_reg_bram_0),
        .content_reg_bram_0_7(content_reg_bram_0_0),
        .content_reg_bram_0_i_19__1(\channel_old_latency_reg[2]_0 ),
        .content_reg_bram_0_i_24__2_0(content_reg_bram_0_i_24__2),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_ccs_reg[25] (\cur_ccs_reg[25] ),
        .\cur_ccs_reg[57] (\cur_ccs_reg[57] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_2),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_3),
        .cur_is_even_character_reg_2(fifo_odd_n_21),
        .cur_is_even_character_reg_3(fifo_odd_n_22),
        .\cur_state[2]_i_29 (\cur_state[2]_i_29 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (cur_is_even_character_reg_1),
        .\cur_state_reg[0]_1 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_2 (\cur_state_reg[0]_1 ),
        .\cur_state_reg[0]_3 (\cur_state_reg[0]_2 ),
        .\cur_state_reg[0]_4 (\cur_state_reg[0]_3 ),
        .\cur_state_reg[1] (\cur_state_reg[1] ),
        .\head[4]_i_4 (\head[4]_i_4 ),
        .\head_reg[0]_0 (fifo_odd_n_3),
        .\head_reg[2]_0 (\head_reg[2] ),
        .\head_reg[2]_1 (fifo_odd_n_27),
        .\head_reg[3]_0 (\head_reg[3] ),
        .\head_reg[4]_0 (fifo_odd_n_26),
        .\head_reg[6] (\head_reg[6] ),
        .\head_reg[6]_0 (\head_reg[6]_0 ),
        .p_0_in_0(p_0_in_0),
        .\state_cur_reg[0]_0 (\state_cur_reg[0] ),
        .\state_cur_reg[1]_0 (fifo_odd_n_24),
        .\state_cur_reg[2]_0 (\state_cur_reg[2] ),
        .\tail_reg[0]_0 (fifo_odd_n_25),
        .\tail_reg[3]_0 (fifo_odd_n_28),
        .\tail_reg[4]_0 (fifo_even_data_in_ready),
        .\tail_reg[6] (\tail_reg[6] ));
endmodule

(* ORIG_REF_NAME = "ping_pong_buffer" *) 
module ping_pong_buffer_7
   (fifo_even_data_in_ready,
    D,
    \channel_old_latency_reg[3] ,
    cur_is_even_character_reg,
    \head_reg[3] ,
    \head_reg[1] ,
    cur_is_even_character_reg_0,
    DI,
    S,
    cur_is_even_character_reg_1,
    \head_reg[3]_0 ,
    \head_reg[3]_1 ,
    \head_reg[3]_2 ,
    \head_reg[3]_3 ,
    \head_reg[3]_4 ,
    \head_reg[3]_5 ,
    \head_reg[3]_6 ,
    \state_cur_reg[1] ,
    \old_grant_reg[0] ,
    \old_grant_reg[0]_0 ,
    \old_grant_reg[0]_1 ,
    \old_grant_reg[0]_2 ,
    \old_grant_reg[0]_3 ,
    \old_grant_reg[0]_4 ,
    \cur_state_reg[1] ,
    \cur_cc_pointer_reg[2] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[31] ,
    \cur_ccs_reg[63] ,
    \cur_cc_pointer_reg[2]_1 ,
    \cur_ccs_reg[30] ,
    \cur_ccs_reg[62] ,
    \cur_cc_pointer_reg[2]_2 ,
    \cur_ccs_reg[26] ,
    \cur_ccs_reg[58] ,
    \cur_cc_pointer_reg[2]_3 ,
    \cur_ccs_reg[27] ,
    \cur_ccs_reg[59] ,
    \cur_cc_pointer_reg[2]_4 ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_state_reg[0] ,
    \tail_reg[3] ,
    \cur_cc_pointer_reg[3] ,
    \cur_state_reg[2] ,
    clk_IBUF_BUFG,
    E,
    DINADIN,
    fifo_odd_data_in_valid,
    content_reg_bram_0,
    \channel_old_latency_reg[3]_0 ,
    \state_cur_reg[0] ,
    \state_cur_reg[0]_0 ,
    curState,
    cur_is_even_character,
    p_0_in,
    p_0_in_0,
    \channel_old_latency_reg[3]_1 ,
    \channel_old_latency_reg[3]_2 ,
    \channel_old_latency_reg[3]_3 ,
    \channel_old_latency_reg[5] ,
    min_latency1_carry,
    \FETCH_REC_Instr[15]_i_3 ,
    \FETCH_REC_Instr[15]_i_3_0 ,
    \tail_reg[4] ,
    \switch2channel\.ready_0 ,
    \switch2channel\.ready ,
    \cur_state[2]_i_9 ,
    \tail_reg[4]_0 ,
    content_reg_bram_0_0,
    in_ready_packed,
    \channel_old_latency_reg[3]_4 ,
    \channel_old_latency_reg[6] ,
    \channel_old_latency_reg[5]_0 ,
    \channel_old_latency_reg[6]_0 ,
    \channel_old_latency_reg[6]_1 ,
    \state_cur_reg[0]_1 ,
    content_reg_bram_0_1,
    SR,
    \state_cur_reg[2] ,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    old_grant,
    \memory_bb\.addr ,
    \cur_state_reg[0]_0 ,
    \cur_state_reg[0]_1 ,
    \FETCH_REC_Instr[15]_i_14 ,
    O,
    CO);
  output fifo_even_data_in_ready;
  output [5:0]D;
  output \channel_old_latency_reg[3] ;
  output cur_is_even_character_reg;
  output \head_reg[3] ;
  output \head_reg[1] ;
  output cur_is_even_character_reg_0;
  output [1:0]DI;
  output [1:0]S;
  output cur_is_even_character_reg_1;
  output \head_reg[3]_0 ;
  output \head_reg[3]_1 ;
  output \head_reg[3]_2 ;
  output \head_reg[3]_3 ;
  output \head_reg[3]_4 ;
  output \head_reg[3]_5 ;
  output \head_reg[3]_6 ;
  output [7:0]\state_cur_reg[1] ;
  output \old_grant_reg[0] ;
  output \old_grant_reg[0]_0 ;
  output \old_grant_reg[0]_1 ;
  output \old_grant_reg[0]_2 ;
  output \old_grant_reg[0]_3 ;
  output \old_grant_reg[0]_4 ;
  output \cur_state_reg[1] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[31] ;
  output \cur_ccs_reg[63] ;
  output \cur_cc_pointer_reg[2]_1 ;
  output \cur_ccs_reg[30] ;
  output \cur_ccs_reg[62] ;
  output \cur_cc_pointer_reg[2]_2 ;
  output \cur_ccs_reg[26] ;
  output \cur_ccs_reg[58] ;
  output \cur_cc_pointer_reg[2]_3 ;
  output \cur_ccs_reg[27] ;
  output \cur_ccs_reg[59] ;
  output \cur_cc_pointer_reg[2]_4 ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_state_reg[0] ;
  output \tail_reg[3] ;
  output \cur_cc_pointer_reg[3] ;
  output \cur_state_reg[2] ;
  input clk_IBUF_BUFG;
  input [0:0]E;
  input [7:0]DINADIN;
  input fifo_odd_data_in_valid;
  input [7:0]content_reg_bram_0;
  input \channel_old_latency_reg[3]_0 ;
  input \state_cur_reg[0] ;
  input \state_cur_reg[0]_0 ;
  input [0:0]curState;
  input cur_is_even_character;
  input [0:0]p_0_in;
  input [0:0]p_0_in_0;
  input [0:0]\channel_old_latency_reg[3]_1 ;
  input \channel_old_latency_reg[3]_2 ;
  input \channel_old_latency_reg[3]_3 ;
  input \channel_old_latency_reg[5] ;
  input min_latency1_carry;
  input \FETCH_REC_Instr[15]_i_3 ;
  input \FETCH_REC_Instr[15]_i_3_0 ;
  input \tail_reg[4] ;
  input \switch2channel\.ready_0 ;
  input \switch2channel\.ready ;
  input \cur_state[2]_i_9 ;
  input \tail_reg[4]_0 ;
  input content_reg_bram_0_0;
  input [0:0]in_ready_packed;
  input \channel_old_latency_reg[3]_4 ;
  input \channel_old_latency_reg[6] ;
  input \channel_old_latency_reg[5]_0 ;
  input \channel_old_latency_reg[6]_0 ;
  input \channel_old_latency_reg[6]_1 ;
  input \state_cur_reg[0]_1 ;
  input content_reg_bram_0_1;
  input [0:0]SR;
  input \state_cur_reg[2] ;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [0:0]old_grant;
  input [0:0]\memory_bb\.addr ;
  input [2:0]\cur_state_reg[0]_0 ;
  input [3:0]\cur_state_reg[0]_1 ;
  input [47:0]\FETCH_REC_Instr[15]_i_14 ;
  input [0:0]O;
  input [0:0]CO;

  wire [0:0]CO;
  wire [5:0]D;
  wire [1:0]DI;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire [47:0]\FETCH_REC_Instr[15]_i_14 ;
  wire \FETCH_REC_Instr[15]_i_3 ;
  wire \FETCH_REC_Instr[15]_i_3_0 ;
  wire [0:0]O;
  wire [1:0]S;
  wire [0:0]SR;
  wire \channel_old_latency_reg[3] ;
  wire \channel_old_latency_reg[3]_0 ;
  wire [0:0]\channel_old_latency_reg[3]_1 ;
  wire \channel_old_latency_reg[3]_2 ;
  wire \channel_old_latency_reg[3]_3 ;
  wire \channel_old_latency_reg[3]_4 ;
  wire \channel_old_latency_reg[5] ;
  wire \channel_old_latency_reg[5]_0 ;
  wire \channel_old_latency_reg[6] ;
  wire \channel_old_latency_reg[6]_0 ;
  wire \channel_old_latency_reg[6]_1 ;
  wire clk_IBUF_BUFG;
  wire [7:0]content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire [0:0]curState;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_cc_pointer_reg[2]_1 ;
  wire \cur_cc_pointer_reg[2]_2 ;
  wire \cur_cc_pointer_reg[2]_3 ;
  wire \cur_cc_pointer_reg[2]_4 ;
  wire \cur_cc_pointer_reg[3] ;
  wire \cur_ccs_reg[26] ;
  wire \cur_ccs_reg[27] ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[30] ;
  wire \cur_ccs_reg[31] ;
  wire \cur_ccs_reg[58] ;
  wire \cur_ccs_reg[59] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire \cur_ccs_reg[62] ;
  wire \cur_ccs_reg[63] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[2]_i_9 ;
  wire \cur_state_reg[0] ;
  wire [2:0]\cur_state_reg[0]_0 ;
  wire [3:0]\cur_state_reg[0]_1 ;
  wire \cur_state_reg[1] ;
  wire \cur_state_reg[2] ;
  wire fifo_even_data_in_ready;
  wire fifo_odd_data_in_valid;
  wire fifo_odd_n_10;
  wire fifo_odd_n_11;
  wire fifo_odd_n_12;
  wire fifo_odd_n_3;
  wire fifo_odd_n_31;
  wire fifo_odd_n_33;
  wire fifo_odd_n_35;
  wire fifo_odd_n_36;
  wire fifo_odd_n_4;
  wire fifo_odd_n_5;
  wire fifo_odd_n_6;
  wire fifo_odd_n_7;
  wire fifo_odd_n_8;
  wire fifo_odd_n_9;
  wire [3:2]from_memory;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \head_reg[1] ;
  wire \head_reg[3] ;
  wire \head_reg[3]_0 ;
  wire \head_reg[3]_1 ;
  wire \head_reg[3]_2 ;
  wire \head_reg[3]_3 ;
  wire \head_reg[3]_4 ;
  wire \head_reg[3]_5 ;
  wire \head_reg[3]_6 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]\memory_bb\.addr ;
  wire min_latency1_carry;
  wire [0:0]old_grant;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire [0:0]p_0_in;
  wire [0:0]p_0_in_0;
  wire \state_cur_reg[0] ;
  wire \state_cur_reg[0]_0 ;
  wire \state_cur_reg[0]_1 ;
  wire [7:0]\state_cur_reg[1] ;
  wire \state_cur_reg[2] ;
  wire \switch2channel\.ready ;
  wire \switch2channel\.ready_0 ;
  wire \tail_reg[3] ;
  wire \tail_reg[4] ;
  wire \tail_reg[4]_0 ;

  fifo_12 fifo_even
       (.CO(CO),
        .D(D),
        .DI(DI),
        .DINADIN(DINADIN),
        .DOUTBDOUT(from_memory),
        .E(E),
        .\FETCH_REC_Instr[15]_i_3 (\FETCH_REC_Instr[15]_i_3 ),
        .\FETCH_REC_Instr[15]_i_3_0 (\FETCH_REC_Instr[15]_i_3_0 ),
        .\FETCH_REC_Pc_reg[0] (fifo_odd_n_4),
        .\FETCH_REC_Pc_reg[1] (fifo_odd_n_5),
        .\FETCH_REC_Pc_reg[2] (fifo_odd_n_9),
        .\FETCH_REC_Pc_reg[2]_0 (fifo_odd_n_12),
        .\FETCH_REC_Pc_reg[3] (fifo_odd_n_10),
        .\FETCH_REC_Pc_reg[4] (fifo_odd_n_8),
        .\FETCH_REC_Pc_reg[5] (fifo_odd_n_11),
        .\FETCH_REC_Pc_reg[6] (fifo_odd_n_6),
        .\FETCH_REC_Pc_reg[7] (fifo_odd_n_7),
        .O(O),
        .S(S),
        .SR(SR),
        .WEA(fifo_even_data_in_ready),
        .\channel_old_latency_reg[3] (\channel_old_latency_reg[3] ),
        .\channel_old_latency_reg[3]_0 (\channel_old_latency_reg[3]_0 ),
        .\channel_old_latency_reg[3]_1 (\channel_old_latency_reg[3]_1 ),
        .\channel_old_latency_reg[3]_2 (\channel_old_latency_reg[3]_2 ),
        .\channel_old_latency_reg[3]_3 (\channel_old_latency_reg[3]_3 ),
        .\channel_old_latency_reg[3]_4 (\channel_old_latency_reg[3]_4 ),
        .\channel_old_latency_reg[5] (\channel_old_latency_reg[5] ),
        .\channel_old_latency_reg[5]_0 (\channel_old_latency_reg[5]_0 ),
        .\channel_old_latency_reg[6] (\channel_old_latency_reg[6] ),
        .\channel_old_latency_reg[6]_0 (\channel_old_latency_reg[6]_0 ),
        .\channel_old_latency_reg[6]_1 (\channel_old_latency_reg[6]_1 ),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0_0(\head_reg[3]_1 ),
        .content_reg_bram_0_1(content_reg_bram_0_0),
        .\cur_cc_pointer_reg[3] (\cur_cc_pointer_reg[3] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .\cur_state[0]_i_2 (\head_reg[3] ),
        .\cur_state[2]_i_9 (\cur_state[2]_i_9 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (\cur_state_reg[0]_1 [3]),
        .\cur_state_reg[1] (\cur_state_reg[1] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\head_reg[1]_0 (\head_reg[1] ),
        .\head_reg[3]_0 (\head_reg[3]_0 ),
        .\head_reg[3]_1 (\head_reg[3]_2 ),
        .\head_reg[3]_2 (\head_reg[3]_3 ),
        .\head_reg[3]_3 (\head_reg[3]_4 ),
        .\head_reg[3]_4 (\head_reg[3]_5 ),
        .\head_reg[3]_5 (\head_reg[3]_6 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .\memory_bb\.addr (\memory_bb\.addr ),
        .min_latency1_carry(min_latency1_carry),
        .min_latency1_carry_i_3(fifo_odd_n_3),
        .min_latency1_carry_i_3_0(fifo_odd_n_35),
        .min_latency1_carry_i_8_0(fifo_odd_n_33),
        .min_latency1_carry_i_8_1(fifo_odd_n_36),
        .min_latency1_carry_i_9_0(fifo_odd_n_31),
        .old_grant(old_grant),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_3 ),
        .\old_grant_reg[0]_4 (\old_grant_reg[0]_4 ),
        .p_0_in_0(p_0_in_0),
        .\state_cur_reg[1]_0 (\state_cur_reg[1] ),
        .\state_cur_reg[2]_0 (\state_cur_reg[2] ),
        .\switch2channel\.ready (\switch2channel\.ready ),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\tail_reg[3]_0 (\tail_reg[3] ),
        .\tail_reg[4]_0 (\tail_reg[4] ),
        .\tail_reg[4]_1 (\tail_reg[4]_0 ));
  fifo_13 fifo_odd
       (.DOUTBDOUT(from_memory),
        .\FETCH_REC_Instr[15]_i_14 (\FETCH_REC_Instr[15]_i_14 ),
        .SR(SR),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0_0(fifo_odd_n_4),
        .content_reg_bram_0_1(fifo_odd_n_5),
        .content_reg_bram_0_2(fifo_odd_n_6),
        .content_reg_bram_0_3(fifo_odd_n_7),
        .content_reg_bram_0_4(fifo_odd_n_8),
        .content_reg_bram_0_5(fifo_odd_n_11),
        .content_reg_bram_0_6(content_reg_bram_0),
        .content_reg_bram_0_7(content_reg_bram_0_1),
        .content_reg_bram_0_i_21(\cur_state_reg[0]_0 ),
        .curState(curState),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[2]_1 (\cur_cc_pointer_reg[2]_1 ),
        .\cur_cc_pointer_reg[2]_2 (\cur_cc_pointer_reg[2]_2 ),
        .\cur_cc_pointer_reg[2]_3 (\cur_cc_pointer_reg[2]_3 ),
        .\cur_cc_pointer_reg[2]_4 (\cur_cc_pointer_reg[2]_4 ),
        .\cur_ccs_reg[26] (\cur_ccs_reg[26] ),
        .\cur_ccs_reg[27] (\cur_ccs_reg[27] ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[30] (\cur_ccs_reg[30] ),
        .\cur_ccs_reg[31] (\cur_ccs_reg[31] ),
        .\cur_ccs_reg[58] (\cur_ccs_reg[58] ),
        .\cur_ccs_reg[59] (\cur_ccs_reg[59] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .\cur_ccs_reg[62] (\cur_ccs_reg[62] ),
        .\cur_ccs_reg[63] (\cur_ccs_reg[63] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(fifo_odd_n_9),
        .cur_is_even_character_reg_0(fifo_odd_n_10),
        .\cur_state[2]_i_29 (\cur_state_reg[0]_1 [2:0]),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .fifo_odd_data_in_valid(fifo_odd_data_in_valid),
        .\head_reg[0]_0 (fifo_odd_n_3),
        .\head_reg[0]_1 (fifo_odd_n_35),
        .\head_reg[2]_0 (fifo_odd_n_31),
        .\head_reg[3]_0 (\head_reg[3] ),
        .\head_reg[3]_1 (\head_reg[3]_1 ),
        .\head_reg[3]_2 (fifo_odd_n_36),
        .\head_reg[4]_0 (fifo_odd_n_33),
        .p_0_in(p_0_in),
        .\state_cur_reg[0]_0 (\state_cur_reg[0] ),
        .\state_cur_reg[0]_1 (\state_cur_reg[0]_0 ),
        .\state_cur_reg[0]_2 (\state_cur_reg[0]_1 ),
        .\state_cur_reg[1]_0 (fifo_odd_n_12));
endmodule

module regex_coprocessor_top
   (bram_r_valid,
    \FSM_sequential_status_register_reg[2] ,
    ADDRARDADDR,
    E,
    D,
    rst_master,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    address_register_IBUF,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \FSM_sequential_status_register_reg[0] ,
    \FSM_sequential_status_register_reg[0]_0 ,
    cmd_register_IBUF,
    rst_IBUF,
    clk_IBUF_BUFG,
    memory_data,
    start_cc_pointer_register_IBUF,
    end_cc_pointer_register_IBUF);
  output bram_r_valid;
  output \FSM_sequential_status_register_reg[2] ;
  output [8:0]ADDRARDADDR;
  output [0:0]E;
  output [2:0]D;
  output rst_master;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input [3:0]address_register_IBUF;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \FSM_sequential_status_register_reg[0] ;
  input \FSM_sequential_status_register_reg[0]_0 ;
  input [31:0]cmd_register_IBUF;
  input rst_IBUF;
  input clk_IBUF_BUFG;
  input [63:0]memory_data;
  input [31:0]start_cc_pointer_register_IBUF;
  input [31:0]end_cc_pointer_register_IBUF;

  wire [8:0]ADDRARDADDR;
  wire [2:0]D;
  wire [0:0]E;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[2] ;
  wire [2:0]Q;
  wire a_topology_n_13;
  wire a_topology_n_14;
  wire a_topology_n_15;
  wire a_topology_n_16;
  wire a_topology_n_17;
  wire a_topology_n_18;
  wire a_topology_n_19;
  wire a_topology_n_20;
  wire a_topology_n_21;
  wire a_topology_n_22;
  wire a_topology_n_23;
  wire a_topology_n_24;
  wire a_topology_n_25;
  wire a_topology_n_26;
  wire [3:0]address_register_IBUF;
  wire bram_r_valid;
  wire clk_IBUF_BUFG;
  wire [31:0]cmd_register_IBUF;
  wire \cur_cc_pointer[31]_i_6_n_0 ;
  wire \cur_cc_pointer_reg[16]_i_2_n_0 ;
  wire \cur_cc_pointer_reg[16]_i_2_n_1 ;
  wire \cur_cc_pointer_reg[16]_i_2_n_2 ;
  wire \cur_cc_pointer_reg[16]_i_2_n_3 ;
  wire \cur_cc_pointer_reg[16]_i_2_n_4 ;
  wire \cur_cc_pointer_reg[16]_i_2_n_5 ;
  wire \cur_cc_pointer_reg[16]_i_2_n_6 ;
  wire \cur_cc_pointer_reg[16]_i_2_n_7 ;
  wire \cur_cc_pointer_reg[24]_i_2_n_0 ;
  wire \cur_cc_pointer_reg[24]_i_2_n_1 ;
  wire \cur_cc_pointer_reg[24]_i_2_n_2 ;
  wire \cur_cc_pointer_reg[24]_i_2_n_3 ;
  wire \cur_cc_pointer_reg[24]_i_2_n_4 ;
  wire \cur_cc_pointer_reg[24]_i_2_n_5 ;
  wire \cur_cc_pointer_reg[24]_i_2_n_6 ;
  wire \cur_cc_pointer_reg[24]_i_2_n_7 ;
  wire \cur_cc_pointer_reg[31]_i_5_n_2 ;
  wire \cur_cc_pointer_reg[31]_i_5_n_3 ;
  wire \cur_cc_pointer_reg[31]_i_5_n_4 ;
  wire \cur_cc_pointer_reg[31]_i_5_n_5 ;
  wire \cur_cc_pointer_reg[31]_i_5_n_6 ;
  wire \cur_cc_pointer_reg[31]_i_5_n_7 ;
  wire \cur_cc_pointer_reg[8]_i_2_n_0 ;
  wire \cur_cc_pointer_reg[8]_i_2_n_1 ;
  wire \cur_cc_pointer_reg[8]_i_2_n_2 ;
  wire \cur_cc_pointer_reg[8]_i_2_n_3 ;
  wire \cur_cc_pointer_reg[8]_i_2_n_4 ;
  wire \cur_cc_pointer_reg[8]_i_2_n_5 ;
  wire \cur_cc_pointer_reg[8]_i_2_n_6 ;
  wire \cur_cc_pointer_reg[8]_i_2_n_7 ;
  wire \cur_cc_pointer_reg_n_0_[0] ;
  wire \cur_cc_pointer_reg_n_0_[10] ;
  wire \cur_cc_pointer_reg_n_0_[11] ;
  wire \cur_cc_pointer_reg_n_0_[12] ;
  wire \cur_cc_pointer_reg_n_0_[13] ;
  wire \cur_cc_pointer_reg_n_0_[14] ;
  wire \cur_cc_pointer_reg_n_0_[15] ;
  wire \cur_cc_pointer_reg_n_0_[16] ;
  wire \cur_cc_pointer_reg_n_0_[17] ;
  wire \cur_cc_pointer_reg_n_0_[18] ;
  wire \cur_cc_pointer_reg_n_0_[19] ;
  wire \cur_cc_pointer_reg_n_0_[1] ;
  wire \cur_cc_pointer_reg_n_0_[20] ;
  wire \cur_cc_pointer_reg_n_0_[21] ;
  wire \cur_cc_pointer_reg_n_0_[22] ;
  wire \cur_cc_pointer_reg_n_0_[23] ;
  wire \cur_cc_pointer_reg_n_0_[24] ;
  wire \cur_cc_pointer_reg_n_0_[25] ;
  wire \cur_cc_pointer_reg_n_0_[26] ;
  wire \cur_cc_pointer_reg_n_0_[27] ;
  wire \cur_cc_pointer_reg_n_0_[28] ;
  wire \cur_cc_pointer_reg_n_0_[29] ;
  wire \cur_cc_pointer_reg_n_0_[2] ;
  wire \cur_cc_pointer_reg_n_0_[30] ;
  wire \cur_cc_pointer_reg_n_0_[31] ;
  wire \cur_cc_pointer_reg_n_0_[4] ;
  wire \cur_cc_pointer_reg_n_0_[5] ;
  wire \cur_cc_pointer_reg_n_0_[6] ;
  wire \cur_cc_pointer_reg_n_0_[7] ;
  wire \cur_cc_pointer_reg_n_0_[8] ;
  wire \cur_cc_pointer_reg_n_0_[9] ;
  wire \cur_ccs[63]_i_1_n_0 ;
  wire \cur_ccs_reg_n_0_[0] ;
  wire \cur_ccs_reg_n_0_[1] ;
  wire \cur_ccs_reg_n_0_[2] ;
  wire \cur_ccs_reg_n_0_[3] ;
  wire \cur_ccs_reg_n_0_[4] ;
  wire \cur_ccs_reg_n_0_[5] ;
  wire \cur_ccs_reg_n_0_[6] ;
  wire \cur_ccs_reg_n_0_[7] ;
  wire cur_is_even_character;
  wire [2:0]cur_state;
  wire \cur_state[0]_i_8_n_0 ;
  wire \cur_state[2]_i_11_n_0 ;
  wire \cur_state[2]_i_12_n_0 ;
  wire \cur_state[2]_i_13_n_0 ;
  wire \cur_state[2]_i_20_n_0 ;
  wire \cur_state[2]_i_21_n_0 ;
  wire \cur_state[2]_i_22_n_0 ;
  wire \cur_state[2]_i_23_n_0 ;
  wire \cur_state[2]_i_24_n_0 ;
  wire \cur_state[2]_i_25_n_0 ;
  wire \cur_state[2]_i_26_n_0 ;
  wire \cur_state[2]_i_27_n_0 ;
  wire \cur_state[2]_i_28_n_0 ;
  wire \cur_state[2]_i_29_n_0 ;
  wire \cur_state[2]_i_5_n_0 ;
  wire \cur_state[2]_i_7_n_0 ;
  wire \cur_state_reg[2]_i_10_n_0 ;
  wire \cur_state_reg[2]_i_10_n_1 ;
  wire \cur_state_reg[2]_i_10_n_2 ;
  wire \cur_state_reg[2]_i_10_n_3 ;
  wire \cur_state_reg[2]_i_10_n_4 ;
  wire \cur_state_reg[2]_i_10_n_5 ;
  wire \cur_state_reg[2]_i_10_n_6 ;
  wire \cur_state_reg[2]_i_10_n_7 ;
  wire \cur_state_reg[2]_i_8_n_5 ;
  wire \cur_state_reg[2]_i_8_n_6 ;
  wire \cur_state_reg[2]_i_8_n_7 ;
  wire [7:0]data1;
  wire [7:0]data2;
  wire [7:0]data3;
  wire [7:0]data4;
  wire [7:0]data5;
  wire [7:0]data6;
  wire [7:0]data7;
  wire [31:0]end_cc_pointer_register_IBUF;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  wire memory_addr_from_coprocessor_ready;
  wire [63:0]memory_data;
  wire [31:0]next_cc_pointer;
  wire p_1_in;
  wire rst_IBUF;
  wire rst_master;
  wire [31:0]start_cc_pointer_register_IBUF;
  wire [31:1]tmp_cur_cc_increment;
  wire [7:6]\NLW_cur_cc_pointer_reg[31]_i_5_CO_UNCONNECTED ;
  wire [7:7]\NLW_cur_cc_pointer_reg[31]_i_5_O_UNCONNECTED ;
  wire [7:0]\NLW_cur_state_reg[2]_i_10_O_UNCONNECTED ;
  wire [7:3]\NLW_cur_state_reg[2]_i_8_CO_UNCONNECTED ;
  wire [7:0]\NLW_cur_state_reg[2]_i_8_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0000000011113111)) 
    \FSM_sequential_status_register[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(cur_state[2]),
        .I3(cur_state[1]),
        .I4(cur_state[0]),
        .I5(Q[2]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT5 #(
    .INIT(32'h00000800)) 
    \FSM_sequential_status_register[1]_i_1 
       (.I0(cur_state[1]),
        .I1(cur_state[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT5 #(
    .INIT(32'h00040404)) 
    \FSM_sequential_status_register[2]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(cur_state[1]),
        .I4(cur_state[2]),
        .O(D[2]));
  topology_token_ring a_topology
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(\cur_state_reg[2]_i_8_n_5 ),
        .D(next_cc_pointer[11:9]),
        .E(E),
        .\FETCH_REC_Instr[15]_i_14 ({data7,data6,data5,data4,data3,data2,data1,\cur_ccs_reg_n_0_[7] ,\cur_ccs_reg_n_0_[6] ,\cur_ccs_reg_n_0_[5] ,\cur_ccs_reg_n_0_[4] ,\cur_ccs_reg_n_0_[3] ,\cur_ccs_reg_n_0_[2] ,\cur_ccs_reg_n_0_[1] ,\cur_ccs_reg_n_0_[0] }),
        .\FSM_sequential_status_register_reg[0] (a_topology_n_17),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_1 (cur_state),
        .\FSM_sequential_status_register_reg[0]_2 (\FSM_sequential_status_register_reg[0]_0 ),
        .O(tmp_cur_cc_increment[8:3]),
        .Q(Q),
        .SR(rst_master),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .\cur_cc_pointer_reg[2] (a_topology_n_18),
        .\cur_cc_pointer_reg[2]_0 (a_topology_n_19),
        .\cur_cc_pointer_reg[2]_1 (a_topology_n_20),
        .\cur_cc_pointer_reg[2]_2 (a_topology_n_21),
        .\cur_cc_pointer_reg[2]_3 (a_topology_n_22),
        .\cur_cc_pointer_reg[2]_4 (a_topology_n_23),
        .\cur_cc_pointer_reg[2]_5 (a_topology_n_24),
        .\cur_cc_pointer_reg[2]_6 (a_topology_n_25),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(a_topology_n_26),
        .cur_is_even_character_reg_0(\cur_cc_pointer[31]_i_6_n_0 ),
        .\cur_state[2]_i_9 (\cur_state[2]_i_29_n_0 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_28_n_0 ),
        .\cur_state_reg[0] ({a_topology_n_13,a_topology_n_14,a_topology_n_15}),
        .\cur_state_reg[0]_0 (\cur_state[2]_i_5_n_0 ),
        .\cur_state_reg[0]_1 (\cur_state[2]_i_7_n_0 ),
        .\cur_state_reg[0]_2 (\cur_state[0]_i_8_n_0 ),
        .\cur_state_reg[2] (a_topology_n_16),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\FSM_sequential_status_register_reg[2] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ({p_1_in,\cur_cc_pointer_reg_n_0_[2] ,\cur_cc_pointer_reg_n_0_[1] ,\cur_cc_pointer_reg_n_0_[0] }),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .memory_data(memory_data),
        .rst_IBUF(rst_IBUF),
        .start_cc_pointer_register_IBUF(start_cc_pointer_register_IBUF[8:3]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'h3A)) 
    \cur_cc_pointer[0]_i_1 
       (.I0(start_cc_pointer_register_IBUF[0]),
        .I1(\cur_cc_pointer_reg_n_0_[0] ),
        .I2(cur_state[2]),
        .O(next_cc_pointer[0]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[10]_i_1 
       (.I0(tmp_cur_cc_increment[10]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[10]),
        .O(next_cc_pointer[10]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[11]_i_1 
       (.I0(tmp_cur_cc_increment[11]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[11]),
        .O(next_cc_pointer[11]));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[12]_i_1 
       (.I0(tmp_cur_cc_increment[12]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[12]),
        .O(next_cc_pointer[12]));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[13]_i_1 
       (.I0(tmp_cur_cc_increment[13]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[13]),
        .O(next_cc_pointer[13]));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[14]_i_1 
       (.I0(tmp_cur_cc_increment[14]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[14]),
        .O(next_cc_pointer[14]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[15]_i_1 
       (.I0(tmp_cur_cc_increment[15]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[15]),
        .O(next_cc_pointer[15]));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[16]_i_1 
       (.I0(tmp_cur_cc_increment[16]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[16]),
        .O(next_cc_pointer[16]));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[17]_i_1 
       (.I0(tmp_cur_cc_increment[17]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[17]),
        .O(next_cc_pointer[17]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[18]_i_1 
       (.I0(tmp_cur_cc_increment[18]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[18]),
        .O(next_cc_pointer[18]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[19]_i_1 
       (.I0(tmp_cur_cc_increment[19]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[19]),
        .O(next_cc_pointer[19]));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[1]_i_1 
       (.I0(tmp_cur_cc_increment[1]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[1]),
        .O(next_cc_pointer[1]));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[20]_i_1 
       (.I0(tmp_cur_cc_increment[20]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[20]),
        .O(next_cc_pointer[20]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[21]_i_1 
       (.I0(tmp_cur_cc_increment[21]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[21]),
        .O(next_cc_pointer[21]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[22]_i_1 
       (.I0(tmp_cur_cc_increment[22]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[22]),
        .O(next_cc_pointer[22]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[23]_i_1 
       (.I0(tmp_cur_cc_increment[23]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[23]),
        .O(next_cc_pointer[23]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[24]_i_1 
       (.I0(tmp_cur_cc_increment[24]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[24]),
        .O(next_cc_pointer[24]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[25]_i_1 
       (.I0(tmp_cur_cc_increment[25]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[25]),
        .O(next_cc_pointer[25]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[26]_i_1 
       (.I0(tmp_cur_cc_increment[26]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[26]),
        .O(next_cc_pointer[26]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[27]_i_1 
       (.I0(tmp_cur_cc_increment[27]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[27]),
        .O(next_cc_pointer[27]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[28]_i_1 
       (.I0(tmp_cur_cc_increment[28]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[28]),
        .O(next_cc_pointer[28]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[29]_i_1 
       (.I0(tmp_cur_cc_increment[29]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[29]),
        .O(next_cc_pointer[29]));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[2]_i_1 
       (.I0(tmp_cur_cc_increment[2]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[2]),
        .O(next_cc_pointer[2]));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[30]_i_1 
       (.I0(tmp_cur_cc_increment[30]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[30]),
        .O(next_cc_pointer[30]));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[31]_i_2 
       (.I0(tmp_cur_cc_increment[31]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[31]),
        .O(next_cc_pointer[31]));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cur_cc_pointer[31]_i_6 
       (.I0(p_1_in),
        .I1(tmp_cur_cc_increment[3]),
        .O(\cur_cc_pointer[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[3]_i_1 
       (.I0(tmp_cur_cc_increment[3]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[3]),
        .O(next_cc_pointer[3]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[4]_i_1 
       (.I0(tmp_cur_cc_increment[4]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[4]),
        .O(next_cc_pointer[4]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[5]_i_1 
       (.I0(tmp_cur_cc_increment[5]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[5]),
        .O(next_cc_pointer[5]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[6]_i_1 
       (.I0(tmp_cur_cc_increment[6]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[6]),
        .O(next_cc_pointer[6]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[7]_i_1 
       (.I0(tmp_cur_cc_increment[7]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[7]),
        .O(next_cc_pointer[7]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[8]_i_1 
       (.I0(tmp_cur_cc_increment[8]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[8]),
        .O(next_cc_pointer[8]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[9]_i_1 
       (.I0(tmp_cur_cc_increment[9]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[9]),
        .O(next_cc_pointer[9]));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[0]),
        .Q(\cur_cc_pointer_reg_n_0_[0] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[10]),
        .Q(\cur_cc_pointer_reg_n_0_[10] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[11]),
        .Q(\cur_cc_pointer_reg_n_0_[11] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[12]),
        .Q(\cur_cc_pointer_reg_n_0_[12] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[13]),
        .Q(\cur_cc_pointer_reg_n_0_[13] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[14]),
        .Q(\cur_cc_pointer_reg_n_0_[14] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[15]),
        .Q(\cur_cc_pointer_reg_n_0_[15] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[16]),
        .Q(\cur_cc_pointer_reg_n_0_[16] ),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \cur_cc_pointer_reg[16]_i_2 
       (.CI(\cur_cc_pointer_reg[8]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\cur_cc_pointer_reg[16]_i_2_n_0 ,\cur_cc_pointer_reg[16]_i_2_n_1 ,\cur_cc_pointer_reg[16]_i_2_n_2 ,\cur_cc_pointer_reg[16]_i_2_n_3 ,\cur_cc_pointer_reg[16]_i_2_n_4 ,\cur_cc_pointer_reg[16]_i_2_n_5 ,\cur_cc_pointer_reg[16]_i_2_n_6 ,\cur_cc_pointer_reg[16]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_cur_cc_increment[16:9]),
        .S({\cur_cc_pointer_reg_n_0_[16] ,\cur_cc_pointer_reg_n_0_[15] ,\cur_cc_pointer_reg_n_0_[14] ,\cur_cc_pointer_reg_n_0_[13] ,\cur_cc_pointer_reg_n_0_[12] ,\cur_cc_pointer_reg_n_0_[11] ,\cur_cc_pointer_reg_n_0_[10] ,\cur_cc_pointer_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[17]),
        .Q(\cur_cc_pointer_reg_n_0_[17] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[18]),
        .Q(\cur_cc_pointer_reg_n_0_[18] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[19]),
        .Q(\cur_cc_pointer_reg_n_0_[19] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[1]),
        .Q(\cur_cc_pointer_reg_n_0_[1] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[20]),
        .Q(\cur_cc_pointer_reg_n_0_[20] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[21]),
        .Q(\cur_cc_pointer_reg_n_0_[21] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[22]),
        .Q(\cur_cc_pointer_reg_n_0_[22] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[23]),
        .Q(\cur_cc_pointer_reg_n_0_[23] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[24]),
        .Q(\cur_cc_pointer_reg_n_0_[24] ),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \cur_cc_pointer_reg[24]_i_2 
       (.CI(\cur_cc_pointer_reg[16]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\cur_cc_pointer_reg[24]_i_2_n_0 ,\cur_cc_pointer_reg[24]_i_2_n_1 ,\cur_cc_pointer_reg[24]_i_2_n_2 ,\cur_cc_pointer_reg[24]_i_2_n_3 ,\cur_cc_pointer_reg[24]_i_2_n_4 ,\cur_cc_pointer_reg[24]_i_2_n_5 ,\cur_cc_pointer_reg[24]_i_2_n_6 ,\cur_cc_pointer_reg[24]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_cur_cc_increment[24:17]),
        .S({\cur_cc_pointer_reg_n_0_[24] ,\cur_cc_pointer_reg_n_0_[23] ,\cur_cc_pointer_reg_n_0_[22] ,\cur_cc_pointer_reg_n_0_[21] ,\cur_cc_pointer_reg_n_0_[20] ,\cur_cc_pointer_reg_n_0_[19] ,\cur_cc_pointer_reg_n_0_[18] ,\cur_cc_pointer_reg_n_0_[17] }));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[25]),
        .Q(\cur_cc_pointer_reg_n_0_[25] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[26]),
        .Q(\cur_cc_pointer_reg_n_0_[26] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[27]),
        .Q(\cur_cc_pointer_reg_n_0_[27] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[28]),
        .Q(\cur_cc_pointer_reg_n_0_[28] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[29]),
        .Q(\cur_cc_pointer_reg_n_0_[29] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[2]),
        .Q(\cur_cc_pointer_reg_n_0_[2] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[30]),
        .Q(\cur_cc_pointer_reg_n_0_[30] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[31]),
        .Q(\cur_cc_pointer_reg_n_0_[31] ),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \cur_cc_pointer_reg[31]_i_5 
       (.CI(\cur_cc_pointer_reg[24]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_cur_cc_pointer_reg[31]_i_5_CO_UNCONNECTED [7:6],\cur_cc_pointer_reg[31]_i_5_n_2 ,\cur_cc_pointer_reg[31]_i_5_n_3 ,\cur_cc_pointer_reg[31]_i_5_n_4 ,\cur_cc_pointer_reg[31]_i_5_n_5 ,\cur_cc_pointer_reg[31]_i_5_n_6 ,\cur_cc_pointer_reg[31]_i_5_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cur_cc_pointer_reg[31]_i_5_O_UNCONNECTED [7],tmp_cur_cc_increment[31:25]}),
        .S({1'b0,\cur_cc_pointer_reg_n_0_[31] ,\cur_cc_pointer_reg_n_0_[30] ,\cur_cc_pointer_reg_n_0_[29] ,\cur_cc_pointer_reg_n_0_[28] ,\cur_cc_pointer_reg_n_0_[27] ,\cur_cc_pointer_reg_n_0_[26] ,\cur_cc_pointer_reg_n_0_[25] }));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[3]),
        .Q(p_1_in),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[4]),
        .Q(\cur_cc_pointer_reg_n_0_[4] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[5]),
        .Q(\cur_cc_pointer_reg_n_0_[5] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[6]),
        .Q(\cur_cc_pointer_reg_n_0_[6] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[7]),
        .Q(\cur_cc_pointer_reg_n_0_[7] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[8]),
        .Q(\cur_cc_pointer_reg_n_0_[8] ),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \cur_cc_pointer_reg[8]_i_2 
       (.CI(\cur_cc_pointer_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({\cur_cc_pointer_reg[8]_i_2_n_0 ,\cur_cc_pointer_reg[8]_i_2_n_1 ,\cur_cc_pointer_reg[8]_i_2_n_2 ,\cur_cc_pointer_reg[8]_i_2_n_3 ,\cur_cc_pointer_reg[8]_i_2_n_4 ,\cur_cc_pointer_reg[8]_i_2_n_5 ,\cur_cc_pointer_reg[8]_i_2_n_6 ,\cur_cc_pointer_reg[8]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_cur_cc_increment[8:1]),
        .S({\cur_cc_pointer_reg_n_0_[8] ,\cur_cc_pointer_reg_n_0_[7] ,\cur_cc_pointer_reg_n_0_[6] ,\cur_cc_pointer_reg_n_0_[5] ,\cur_cc_pointer_reg_n_0_[4] ,p_1_in,\cur_cc_pointer_reg_n_0_[2] ,\cur_cc_pointer_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_17),
        .D(next_cc_pointer[9]),
        .Q(\cur_cc_pointer_reg_n_0_[9] ),
        .R(rst_master));
  LUT3 #(
    .INIT(8'h06)) 
    \cur_ccs[63]_i_1 
       (.I0(cur_state[0]),
        .I1(cur_state[1]),
        .I2(cur_state[2]),
        .O(\cur_ccs[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[0]),
        .Q(\cur_ccs_reg_n_0_[0] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[10]),
        .Q(data1[2]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[11]),
        .Q(data1[3]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[12]),
        .Q(data1[4]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[13]),
        .Q(data1[5]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[14]),
        .Q(data1[6]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[15]),
        .Q(data1[7]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[16]),
        .Q(data2[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[17]),
        .Q(data2[1]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[18]),
        .Q(data2[2]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[19]),
        .Q(data2[3]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[1]),
        .Q(\cur_ccs_reg_n_0_[1] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[20]),
        .Q(data2[4]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[21]),
        .Q(data2[5]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[22]),
        .Q(data2[6]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[23]),
        .Q(data2[7]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[24]),
        .Q(data3[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[25]),
        .Q(data3[1]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[26]),
        .Q(data3[2]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[27]),
        .Q(data3[3]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[28]),
        .Q(data3[4]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[29]),
        .Q(data3[5]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[2]),
        .Q(\cur_ccs_reg_n_0_[2] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[30]),
        .Q(data3[6]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[31]),
        .Q(data3[7]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[32]),
        .Q(data4[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[33]),
        .Q(data4[1]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[34]),
        .Q(data4[2]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[35]),
        .Q(data4[3]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[36]),
        .Q(data4[4]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[37]),
        .Q(data4[5]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[38]),
        .Q(data4[6]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[39]),
        .Q(data4[7]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[3]),
        .Q(\cur_ccs_reg_n_0_[3] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[40]),
        .Q(data5[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[41]),
        .Q(data5[1]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[42]),
        .Q(data5[2]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[43]),
        .Q(data5[3]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[44]),
        .Q(data5[4]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[45]),
        .Q(data5[5]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[46]),
        .Q(data5[6]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[47]),
        .Q(data5[7]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[48]),
        .Q(data6[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[49]),
        .Q(data6[1]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[4]),
        .Q(\cur_ccs_reg_n_0_[4] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[50]),
        .Q(data6[2]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[51]),
        .Q(data6[3]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[52]),
        .Q(data6[4]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[53]),
        .Q(data6[5]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[54]),
        .Q(data6[6]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[55]),
        .Q(data6[7]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[56]),
        .Q(data7[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[57]),
        .Q(data7[1]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[58]),
        .Q(data7[2]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[59]),
        .Q(data7[3]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[5]),
        .Q(\cur_ccs_reg_n_0_[5] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[60]),
        .Q(data7[4]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[61]),
        .Q(data7[5]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[62]),
        .Q(data7[6]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[63]),
        .Q(data7[7]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[6]),
        .Q(\cur_ccs_reg_n_0_[6] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[7]),
        .Q(\cur_ccs_reg_n_0_[7] ),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[8]),
        .Q(data1[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(memory_data[9]),
        .Q(data1[1]),
        .R(rst_master));
  FDSE #(
    .INIT(1'b1)) 
    cur_is_even_character_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_topology_n_26),
        .Q(cur_is_even_character),
        .S(rst_master));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cur_state[0]_i_8 
       (.I0(a_topology_n_21),
        .I1(a_topology_n_20),
        .I2(a_topology_n_19),
        .I3(a_topology_n_18),
        .I4(\cur_state[2]_i_29_n_0 ),
        .O(\cur_state[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \cur_state[2]_i_11 
       (.I0(end_cc_pointer_register_IBUF[31]),
        .I1(\cur_cc_pointer_reg_n_0_[31] ),
        .I2(end_cc_pointer_register_IBUF[30]),
        .I3(\cur_cc_pointer_reg_n_0_[30] ),
        .O(\cur_state[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_12 
       (.I0(\cur_cc_pointer_reg_n_0_[27] ),
        .I1(end_cc_pointer_register_IBUF[27]),
        .I2(\cur_cc_pointer_reg_n_0_[28] ),
        .I3(end_cc_pointer_register_IBUF[28]),
        .I4(end_cc_pointer_register_IBUF[29]),
        .I5(\cur_cc_pointer_reg_n_0_[29] ),
        .O(\cur_state[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_13 
       (.I0(\cur_cc_pointer_reg_n_0_[24] ),
        .I1(end_cc_pointer_register_IBUF[24]),
        .I2(\cur_cc_pointer_reg_n_0_[25] ),
        .I3(end_cc_pointer_register_IBUF[25]),
        .I4(end_cc_pointer_register_IBUF[26]),
        .I5(\cur_cc_pointer_reg_n_0_[26] ),
        .O(\cur_state[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_20 
       (.I0(\cur_cc_pointer_reg_n_0_[22] ),
        .I1(end_cc_pointer_register_IBUF[22]),
        .I2(\cur_cc_pointer_reg_n_0_[21] ),
        .I3(end_cc_pointer_register_IBUF[21]),
        .I4(end_cc_pointer_register_IBUF[23]),
        .I5(\cur_cc_pointer_reg_n_0_[23] ),
        .O(\cur_state[2]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_21 
       (.I0(\cur_cc_pointer_reg_n_0_[20] ),
        .I1(end_cc_pointer_register_IBUF[20]),
        .I2(\cur_cc_pointer_reg_n_0_[18] ),
        .I3(end_cc_pointer_register_IBUF[18]),
        .I4(end_cc_pointer_register_IBUF[19]),
        .I5(\cur_cc_pointer_reg_n_0_[19] ),
        .O(\cur_state[2]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_22 
       (.I0(\cur_cc_pointer_reg_n_0_[15] ),
        .I1(end_cc_pointer_register_IBUF[15]),
        .I2(\cur_cc_pointer_reg_n_0_[16] ),
        .I3(end_cc_pointer_register_IBUF[16]),
        .I4(end_cc_pointer_register_IBUF[17]),
        .I5(\cur_cc_pointer_reg_n_0_[17] ),
        .O(\cur_state[2]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_23 
       (.I0(\cur_cc_pointer_reg_n_0_[12] ),
        .I1(end_cc_pointer_register_IBUF[12]),
        .I2(\cur_cc_pointer_reg_n_0_[13] ),
        .I3(end_cc_pointer_register_IBUF[13]),
        .I4(end_cc_pointer_register_IBUF[14]),
        .I5(\cur_cc_pointer_reg_n_0_[14] ),
        .O(\cur_state[2]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_24 
       (.I0(\cur_cc_pointer_reg_n_0_[9] ),
        .I1(end_cc_pointer_register_IBUF[9]),
        .I2(\cur_cc_pointer_reg_n_0_[10] ),
        .I3(end_cc_pointer_register_IBUF[10]),
        .I4(end_cc_pointer_register_IBUF[11]),
        .I5(\cur_cc_pointer_reg_n_0_[11] ),
        .O(\cur_state[2]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_25 
       (.I0(\cur_cc_pointer_reg_n_0_[6] ),
        .I1(end_cc_pointer_register_IBUF[6]),
        .I2(\cur_cc_pointer_reg_n_0_[7] ),
        .I3(end_cc_pointer_register_IBUF[7]),
        .I4(end_cc_pointer_register_IBUF[8]),
        .I5(\cur_cc_pointer_reg_n_0_[8] ),
        .O(\cur_state[2]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_26 
       (.I0(p_1_in),
        .I1(end_cc_pointer_register_IBUF[3]),
        .I2(\cur_cc_pointer_reg_n_0_[4] ),
        .I3(end_cc_pointer_register_IBUF[4]),
        .I4(end_cc_pointer_register_IBUF[5]),
        .I5(\cur_cc_pointer_reg_n_0_[5] ),
        .O(\cur_state[2]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \cur_state[2]_i_27 
       (.I0(\cur_cc_pointer_reg_n_0_[2] ),
        .I1(end_cc_pointer_register_IBUF[2]),
        .I2(\cur_cc_pointer_reg_n_0_[0] ),
        .I3(end_cc_pointer_register_IBUF[0]),
        .I4(end_cc_pointer_register_IBUF[1]),
        .I5(\cur_cc_pointer_reg_n_0_[1] ),
        .O(\cur_state[2]_i_27_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cur_state[2]_i_28 
       (.I0(a_topology_n_18),
        .I1(a_topology_n_19),
        .I2(a_topology_n_20),
        .I3(a_topology_n_21),
        .O(\cur_state[2]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cur_state[2]_i_29 
       (.I0(a_topology_n_25),
        .I1(a_topology_n_24),
        .I2(a_topology_n_22),
        .I3(a_topology_n_23),
        .O(\cur_state[2]_i_29_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \cur_state[2]_i_5 
       (.I0(cur_state[1]),
        .I1(cur_state[0]),
        .O(\cur_state[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cur_state[2]_i_7 
       (.I0(cur_state[1]),
        .I1(cur_state[2]),
        .O(\cur_state[2]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cur_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_16),
        .D(a_topology_n_15),
        .Q(cur_state[0]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_16),
        .D(a_topology_n_14),
        .Q(cur_state[1]),
        .R(rst_master));
  FDRE #(
    .INIT(1'b0)) 
    \cur_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(a_topology_n_16),
        .D(a_topology_n_13),
        .Q(cur_state[2]),
        .R(rst_master));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \cur_state_reg[2]_i_10 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\cur_state_reg[2]_i_10_n_0 ,\cur_state_reg[2]_i_10_n_1 ,\cur_state_reg[2]_i_10_n_2 ,\cur_state_reg[2]_i_10_n_3 ,\cur_state_reg[2]_i_10_n_4 ,\cur_state_reg[2]_i_10_n_5 ,\cur_state_reg[2]_i_10_n_6 ,\cur_state_reg[2]_i_10_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_cur_state_reg[2]_i_10_O_UNCONNECTED [7:0]),
        .S({\cur_state[2]_i_20_n_0 ,\cur_state[2]_i_21_n_0 ,\cur_state[2]_i_22_n_0 ,\cur_state[2]_i_23_n_0 ,\cur_state[2]_i_24_n_0 ,\cur_state[2]_i_25_n_0 ,\cur_state[2]_i_26_n_0 ,\cur_state[2]_i_27_n_0 }));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \cur_state_reg[2]_i_8 
       (.CI(\cur_state_reg[2]_i_10_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_cur_state_reg[2]_i_8_CO_UNCONNECTED [7:3],\cur_state_reg[2]_i_8_n_5 ,\cur_state_reg[2]_i_8_n_6 ,\cur_state_reg[2]_i_8_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_cur_state_reg[2]_i_8_O_UNCONNECTED [7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,\cur_state[2]_i_11_n_0 ,\cur_state[2]_i_12_n_0 ,\cur_state[2]_i_13_n_0 }));
  LUT4 #(
    .INIT(16'h0200)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_56 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .I1(Q[2]),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .O(\FSM_sequential_status_register_reg[2] ));
endmodule

module regex_cpu_pipelined
   (bram_r_valid,
    ADDRARDADDR,
    \old_grant_reg[0] ,
    \cur_state_reg[0] ,
    \cur_state_reg[2] ,
    EXE2_Instr_valid_reg_0,
    \curState_reg[0] ,
    EXE2_Instr_valid_reg_1,
    cur_is_even_character_reg,
    EXE2_Instr_valid_reg_2,
    fifo_even_data_in_valid,
    EXE1_Instr_valid_reg_0,
    in_ready_packed,
    \FSM_sequential_status_register_reg[0] ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \EXE1_Instr_reg[10]_0 ,
    cur_is_even_character_reg_0,
    DINADIN,
    \EXE1_Pc_reg[0]_0 ,
    cur_is_even_character_reg_1,
    \EXE1_Instr_reg[1]_0 ,
    \EXE1_Instr_reg[2]_0 ,
    \EXE1_Instr_reg[3]_0 ,
    \EXE1_Instr_reg[4]_0 ,
    \EXE1_Instr_reg[5]_0 ,
    \EXE1_Instr_reg[6]_0 ,
    \EXE1_Pc_reg[6]_0 ,
    \EXE1_Instr_reg[10]_1 ,
    \switch2channel\.valid ,
    \EXE1_Instr_reg[8]_0 ,
    EXE2_Instr_valid_reg_3,
    cur_is_even_character_reg_2,
    \old_grant_reg[0]_0 ,
    clk_IBUF_BUFG,
    E,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    D,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    \FSM_sequential_status_register_reg[0]_2 ,
    \FSM_sequential_status_register_reg[0]_3 ,
    cmd_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    O,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_2 ,
    CO,
    curState,
    FETCH_REC_Instr_valid_reg_0,
    \old_grant_reg[0]_1 ,
    \tail_reg[4] ,
    \tail_reg[4]_0 ,
    cur_is_even_character,
    FETCH_REC_Instr_valid_reg_1,
    FETCH_REC_Instr_valid_reg_2,
    FETCH_REC_Instr_valid_reg_3,
    \old_grant_reg[0]_2 ,
    old_grant,
    start_cc_pointer_register_IBUF,
    cur_is_even_character_reg_3,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ,
    \cur_state[2]_i_9 ,
    \cur_state[2]_i_9_0 ,
    content_reg_bram_0,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    \tail_reg[4]_1 ,
    WEA,
    content_reg_bram_0_7,
    \old_grant[0]_i_3__0_0 ,
    \old_grant[0]_i_3__0_1 ,
    \FETCH_REC_Instr[15]_i_8_0 ,
    \FETCH_REC_Instr[15]_i_8_1 ,
    \old_grant[0]_i_5_0 ,
    \old_grant[0]_i_5_1 ,
    \old_grant[0]_i_3__0_2 ,
    \old_grant[0]_i_3__0_3 ,
    \FETCH_REC_Instr[15]_i_9_0 ,
    \FETCH_REC_Instr[15]_i_9_1 ,
    \FETCH_REC_Instr[15]_i_9_2 ,
    \FETCH_REC_Instr[15]_i_9_3 ,
    \old_grant[0]_i_5_2 ,
    \old_grant[0]_i_5_3 ,
    EXE2_Instr_valid,
    FETCH_REC_Instr_valid,
    EXE1_Instr_valid,
    \EXE1_Instr_reg[0]_0 ,
    \EXE1_Instr_reg[1]_1 ,
    \EXE1_Instr_reg[2]_1 ,
    \EXE1_Instr_reg[3]_1 ,
    \EXE1_Instr_reg[4]_1 ,
    \EXE1_Instr_reg[5]_1 ,
    \EXE1_Instr_reg[6]_1 ,
    \EXE1_Instr_reg[7]_0 ,
    \EXE1_Instr_reg[8]_1 ,
    \EXE1_Instr_reg[9]_0 ,
    \EXE1_Instr_reg[10]_2 ,
    \EXE1_Instr_reg[11]_0 ,
    \EXE1_Instr_reg[12]_0 ,
    \EXE1_Instr_reg[13]_0 ,
    \EXE1_Instr_reg[14]_0 ,
    \EXE1_Instr_reg[15]_0 );
  output bram_r_valid;
  output [8:0]ADDRARDADDR;
  output \old_grant_reg[0] ;
  output [0:0]\cur_state_reg[0] ;
  output \cur_state_reg[2] ;
  output EXE2_Instr_valid_reg_0;
  output \curState_reg[0] ;
  output EXE2_Instr_valid_reg_1;
  output cur_is_even_character_reg;
  output EXE2_Instr_valid_reg_2;
  output fifo_even_data_in_valid;
  output EXE1_Instr_valid_reg_0;
  output [0:0]in_ready_packed;
  output [0:0]\FSM_sequential_status_register_reg[0] ;
  output \FSM_sequential_status_register_reg[0]_0 ;
  output \EXE1_Instr_reg[10]_0 ;
  output [0:0]cur_is_even_character_reg_0;
  output [7:0]DINADIN;
  output \EXE1_Pc_reg[0]_0 ;
  output [7:0]cur_is_even_character_reg_1;
  output \EXE1_Instr_reg[1]_0 ;
  output \EXE1_Instr_reg[2]_0 ;
  output \EXE1_Instr_reg[3]_0 ;
  output \EXE1_Instr_reg[4]_0 ;
  output \EXE1_Instr_reg[5]_0 ;
  output \EXE1_Instr_reg[6]_0 ;
  output \EXE1_Pc_reg[6]_0 ;
  output \EXE1_Instr_reg[10]_1 ;
  output \switch2channel\.valid ;
  output \EXE1_Instr_reg[8]_0 ;
  output EXE2_Instr_valid_reg_3;
  output cur_is_even_character_reg_2;
  input \old_grant_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input [0:0]E;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [3:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input [7:0]D;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \FSM_sequential_status_register_reg[0]_1 ;
  input [2:0]\FSM_sequential_status_register_reg[0]_2 ;
  input \FSM_sequential_status_register_reg[0]_3 ;
  input [0:0]cmd_register_IBUF;
  input [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input [5:0]O;
  input [1:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_2 ;
  input [0:0]CO;
  input [0:0]curState;
  input FETCH_REC_Instr_valid_reg_0;
  input \old_grant_reg[0]_1 ;
  input \tail_reg[4] ;
  input \tail_reg[4]_0 ;
  input cur_is_even_character;
  input FETCH_REC_Instr_valid_reg_1;
  input FETCH_REC_Instr_valid_reg_2;
  input FETCH_REC_Instr_valid_reg_3;
  input \old_grant_reg[0]_2 ;
  input [0:0]old_grant;
  input [5:0]start_cc_pointer_register_IBUF;
  input cur_is_even_character_reg_3;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  input \cur_state[2]_i_9 ;
  input \cur_state[2]_i_9_0 ;
  input content_reg_bram_0;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input \tail_reg[4]_1 ;
  input [0:0]WEA;
  input content_reg_bram_0_7;
  input \old_grant[0]_i_3__0_0 ;
  input \old_grant[0]_i_3__0_1 ;
  input \FETCH_REC_Instr[15]_i_8_0 ;
  input \FETCH_REC_Instr[15]_i_8_1 ;
  input \old_grant[0]_i_5_0 ;
  input \old_grant[0]_i_5_1 ;
  input \old_grant[0]_i_3__0_2 ;
  input \old_grant[0]_i_3__0_3 ;
  input \FETCH_REC_Instr[15]_i_9_0 ;
  input \FETCH_REC_Instr[15]_i_9_1 ;
  input \FETCH_REC_Instr[15]_i_9_2 ;
  input \FETCH_REC_Instr[15]_i_9_3 ;
  input \old_grant[0]_i_5_2 ;
  input \old_grant[0]_i_5_3 ;
  input EXE2_Instr_valid;
  input FETCH_REC_Instr_valid;
  input EXE1_Instr_valid;
  input \EXE1_Instr_reg[0]_0 ;
  input \EXE1_Instr_reg[1]_1 ;
  input \EXE1_Instr_reg[2]_1 ;
  input \EXE1_Instr_reg[3]_1 ;
  input \EXE1_Instr_reg[4]_1 ;
  input \EXE1_Instr_reg[5]_1 ;
  input \EXE1_Instr_reg[6]_1 ;
  input \EXE1_Instr_reg[7]_0 ;
  input \EXE1_Instr_reg[8]_1 ;
  input \EXE1_Instr_reg[9]_0 ;
  input \EXE1_Instr_reg[10]_2 ;
  input \EXE1_Instr_reg[11]_0 ;
  input \EXE1_Instr_reg[12]_0 ;
  input \EXE1_Instr_reg[13]_0 ;
  input \EXE1_Instr_reg[14]_0 ;
  input \EXE1_Instr_reg[15]_0 ;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [7:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire [15:0]EXE1_Instr;
  wire \EXE1_Instr_reg[0]_0 ;
  wire \EXE1_Instr_reg[10]_0 ;
  wire \EXE1_Instr_reg[10]_1 ;
  wire \EXE1_Instr_reg[10]_2 ;
  wire \EXE1_Instr_reg[11]_0 ;
  wire \EXE1_Instr_reg[12]_0 ;
  wire \EXE1_Instr_reg[13]_0 ;
  wire \EXE1_Instr_reg[14]_0 ;
  wire \EXE1_Instr_reg[15]_0 ;
  wire \EXE1_Instr_reg[1]_0 ;
  wire \EXE1_Instr_reg[1]_1 ;
  wire \EXE1_Instr_reg[2]_0 ;
  wire \EXE1_Instr_reg[2]_1 ;
  wire \EXE1_Instr_reg[3]_0 ;
  wire \EXE1_Instr_reg[3]_1 ;
  wire \EXE1_Instr_reg[4]_0 ;
  wire \EXE1_Instr_reg[4]_1 ;
  wire \EXE1_Instr_reg[5]_0 ;
  wire \EXE1_Instr_reg[5]_1 ;
  wire \EXE1_Instr_reg[6]_0 ;
  wire \EXE1_Instr_reg[6]_1 ;
  wire \EXE1_Instr_reg[7]_0 ;
  wire \EXE1_Instr_reg[8]_0 ;
  wire \EXE1_Instr_reg[8]_1 ;
  wire \EXE1_Instr_reg[9]_0 ;
  wire EXE1_Instr_valid;
  wire EXE1_Instr_valid_1;
  wire EXE1_Instr_valid_reg_0;
  wire [7:0]EXE1_Pc;
  wire \EXE1_Pc_reg[0]_0 ;
  wire \EXE1_Pc_reg[6]_0 ;
  wire \EXE2_Instr_reg_n_0_[0] ;
  wire \EXE2_Instr_reg_n_0_[1] ;
  wire \EXE2_Instr_reg_n_0_[2] ;
  wire \EXE2_Instr_reg_n_0_[3] ;
  wire \EXE2_Instr_reg_n_0_[4] ;
  wire \EXE2_Instr_reg_n_0_[5] ;
  wire \EXE2_Instr_reg_n_0_[6] ;
  wire \EXE2_Instr_reg_n_0_[7] ;
  wire EXE2_Instr_valid;
  wire EXE2_Instr_valid9_out;
  wire EXE2_Instr_valid_2;
  wire EXE2_Instr_valid_i_2__0_n_0;
  wire EXE2_Instr_valid_reg_0;
  wire EXE2_Instr_valid_reg_1;
  wire EXE2_Instr_valid_reg_2;
  wire EXE2_Instr_valid_reg_3;
  wire [7:0]EXE2_Pc;
  wire [15:0]FETCH_REC_Instr;
  wire \FETCH_REC_Instr[15]_i_10_n_0 ;
  wire \FETCH_REC_Instr[15]_i_11_n_0 ;
  wire \FETCH_REC_Instr[15]_i_5__0_n_0 ;
  wire \FETCH_REC_Instr[15]_i_6_n_0 ;
  wire \FETCH_REC_Instr[15]_i_7__0_n_0 ;
  wire \FETCH_REC_Instr[15]_i_8_0 ;
  wire \FETCH_REC_Instr[15]_i_8_1 ;
  wire \FETCH_REC_Instr[15]_i_8_n_0 ;
  wire \FETCH_REC_Instr[15]_i_9_0 ;
  wire \FETCH_REC_Instr[15]_i_9_1 ;
  wire \FETCH_REC_Instr[15]_i_9_2 ;
  wire \FETCH_REC_Instr[15]_i_9_3 ;
  wire \FETCH_REC_Instr[15]_i_9_n_0 ;
  wire [15:0]FETCH_REC_Instr_next;
  wire FETCH_REC_Instr_valid;
  wire FETCH_REC_Instr_valid_0;
  wire FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire FETCH_REC_Instr_valid_reg_3;
  wire [7:0]FETCH_REC_Pc;
  wire FETCH_REC_has_to_save;
  wire FETCH_REC_not_stall;
  wire \FSM_sequential_status_register[2]_i_3_n_0 ;
  wire [0:0]\FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[0]_1 ;
  wire [2:0]\FSM_sequential_status_register_reg[0]_2 ;
  wire \FSM_sequential_status_register_reg[0]_3 ;
  wire [5:0]O;
  wire [2:0]Q;
  wire [0:0]WEA;
  wire [3:0]address_register_IBUF;
  wire arbiter_output_pc_port_n_11;
  wire arbiter_output_pc_port_n_13;
  wire arbiter_output_pc_port_n_43;
  wire bram_r_valid;
  wire clk_IBUF_BUFG;
  wire [0:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_i_48__0_n_0;
  wire content_reg_bram_0_i_49__0_n_0;
  wire content_reg_bram_0_i_50__0_n_0;
  wire content_reg_bram_0_i_51__0_n_0;
  wire content_reg_bram_0_i_52__0_n_0;
  wire content_reg_bram_0_i_53__0_n_0;
  wire content_reg_bram_0_i_54_n_0;
  wire content_reg_bram_0_i_55__0_n_0;
  wire content_reg_bram_0_i_56_n_0;
  wire content_reg_bram_0_i_57_n_0;
  wire content_reg_bram_0_i_58_n_0;
  wire content_reg_bram_0_i_59_n_0;
  wire content_reg_bram_0_i_60__0_n_0;
  wire content_reg_bram_0_i_61_n_0;
  wire content_reg_bram_0_i_62_n_0;
  wire content_reg_bram_0_i_63_n_0;
  wire content_reg_bram_0_i_64_n_0;
  wire content_reg_bram_0_i_65_n_0;
  wire content_reg_bram_0_i_66_n_0;
  wire content_reg_bram_0_i_67_n_0;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \cur_cc_pointer[31]_i_4_n_0 ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire [0:0]cur_is_even_character_reg_0;
  wire [7:0]cur_is_even_character_reg_1;
  wire cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire \cur_state[2]_i_9 ;
  wire \cur_state[2]_i_9_0 ;
  wire [0:0]\cur_state_reg[0] ;
  wire \cur_state_reg[2] ;
  wire fifo_even_data_in_valid;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire [1:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_64_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_67_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_70_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_73_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]old_grant;
  wire \old_grant[0]_i_10_n_0 ;
  wire \old_grant[0]_i_2__0_n_0 ;
  wire \old_grant[0]_i_3__0_0 ;
  wire \old_grant[0]_i_3__0_1 ;
  wire \old_grant[0]_i_3__0_2 ;
  wire \old_grant[0]_i_3__0_3 ;
  wire \old_grant[0]_i_3__0_n_0 ;
  wire \old_grant[0]_i_4__0_n_0 ;
  wire \old_grant[0]_i_5_0 ;
  wire \old_grant[0]_i_5_1 ;
  wire \old_grant[0]_i_5_2 ;
  wire \old_grant[0]_i_5_3 ;
  wire \old_grant[0]_i_5_n_0 ;
  wire \old_grant[0]_i_6_n_0 ;
  wire \old_grant[0]_i_7__0_n_0 ;
  wire \old_grant[0]_i_8__0_n_0 ;
  wire \old_grant[0]_i_9_n_0 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire [2:0]p_0_in;
  wire p_12_in;
  wire [7:0]sel0;
  wire [5:0]start_cc_pointer_register_IBUF;
  wire \switch2channel\.valid ;
  wire \tail_reg[4] ;
  wire \tail_reg[4]_0 ;
  wire \tail_reg[4]_1 ;

  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[0]),
        .Q(EXE1_Instr[0]),
        .R(\old_grant_reg[0]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \EXE1_Instr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[10]),
        .Q(p_0_in[2]),
        .S(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[11]),
        .Q(EXE1_Instr[11]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[12]),
        .Q(EXE1_Instr[12]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[13]),
        .Q(EXE1_Instr[13]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[14]),
        .Q(EXE1_Instr[14]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[15]),
        .Q(EXE1_Instr[15]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[1]),
        .Q(EXE1_Instr[1]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[2]),
        .Q(EXE1_Instr[2]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[3]),
        .Q(EXE1_Instr[3]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[4]),
        .Q(EXE1_Instr[4]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[5]),
        .Q(EXE1_Instr[5]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[6]),
        .Q(EXE1_Instr[6]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[7]),
        .Q(EXE1_Instr[7]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[8]),
        .Q(p_0_in[0]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[9]),
        .Q(p_0_in[1]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    EXE1_Instr_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_13),
        .Q(EXE1_Instr_valid_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[0]),
        .Q(EXE1_Pc[0]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[1]),
        .Q(EXE1_Pc[1]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[2]),
        .Q(EXE1_Pc[2]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[3]),
        .Q(EXE1_Pc[3]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[4]),
        .Q(EXE1_Pc[4]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[5]),
        .Q(EXE1_Pc[5]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[6]),
        .Q(EXE1_Pc[6]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[7]),
        .Q(EXE1_Pc[7]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[0]),
        .Q(\EXE2_Instr_reg_n_0_[0] ),
        .R(\old_grant_reg[0]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \EXE2_Instr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in[2]),
        .Q(sel0[2]),
        .S(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[11]),
        .Q(sel0[3]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[12]),
        .Q(sel0[4]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[13]),
        .Q(sel0[5]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[14]),
        .Q(sel0[6]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[15]),
        .Q(sel0[7]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[1]),
        .Q(\EXE2_Instr_reg_n_0_[1] ),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[2]),
        .Q(\EXE2_Instr_reg_n_0_[2] ),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[3]),
        .Q(\EXE2_Instr_reg_n_0_[3] ),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[4]),
        .Q(\EXE2_Instr_reg_n_0_[4] ),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[5]),
        .Q(\EXE2_Instr_reg_n_0_[5] ),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[6]),
        .Q(\EXE2_Instr_reg_n_0_[6] ),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[7]),
        .Q(\EXE2_Instr_reg_n_0_[7] ),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in[0]),
        .Q(sel0[0]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in[1]),
        .Q(sel0[1]),
        .R(\old_grant_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h00000004)) 
    EXE2_Instr_valid_i_2__0
       (.I0(sel0[2]),
        .I1(sel0[0]),
        .I2(sel0[6]),
        .I3(sel0[5]),
        .I4(\old_grant[0]_i_8__0_n_0 ),
        .O(EXE2_Instr_valid_i_2__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    EXE2_Instr_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_43),
        .Q(EXE2_Instr_valid_2),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[0]),
        .Q(EXE2_Pc[0]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[1]),
        .Q(EXE2_Pc[1]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[2]),
        .Q(EXE2_Pc[2]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[3]),
        .Q(EXE2_Pc[3]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[4]),
        .Q(EXE2_Pc[4]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[5]),
        .Q(EXE2_Pc[5]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[6]),
        .Q(EXE2_Pc[6]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[7]),
        .Q(EXE2_Pc[7]),
        .R(\old_grant_reg[0]_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[0]_i_1__0 
       (.I0(FETCH_REC_Instr[0]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[0]_0 ),
        .O(FETCH_REC_Instr_next[0]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[10]_i_1__0 
       (.I0(FETCH_REC_Instr[10]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[10]_2 ),
        .O(FETCH_REC_Instr_next[10]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[11]_i_1__0 
       (.I0(FETCH_REC_Instr[11]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[11]_0 ),
        .O(FETCH_REC_Instr_next[11]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[12]_i_1__0 
       (.I0(FETCH_REC_Instr[12]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[12]_0 ),
        .O(FETCH_REC_Instr_next[12]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[13]_i_1__0 
       (.I0(FETCH_REC_Instr[13]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[13]_0 ),
        .O(FETCH_REC_Instr_next[13]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[14]_i_1__0 
       (.I0(FETCH_REC_Instr[14]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[14]_0 ),
        .O(FETCH_REC_Instr_next[14]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \FETCH_REC_Instr[15]_i_10 
       (.I0(EXE1_Instr[2]),
        .I1(\FETCH_REC_Instr[15]_i_9_0 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [0]),
        .I3(\FETCH_REC_Instr[15]_i_9_1 ),
        .O(\FETCH_REC_Instr[15]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \FETCH_REC_Instr[15]_i_11 
       (.I0(EXE1_Instr[3]),
        .I1(\FETCH_REC_Instr[15]_i_9_2 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [0]),
        .I3(\FETCH_REC_Instr[15]_i_9_3 ),
        .O(\FETCH_REC_Instr[15]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[15]_i_2__0 
       (.I0(FETCH_REC_Instr[15]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[15]_0 ),
        .O(FETCH_REC_Instr_next[15]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \FETCH_REC_Instr[15]_i_5__0 
       (.I0(\old_grant[0]_i_2__0_n_0 ),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .O(\FETCH_REC_Instr[15]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'hE0FEE0F0)) 
    \FETCH_REC_Instr[15]_i_6 
       (.I0(\old_grant[0]_i_4__0_n_0 ),
        .I1(\FETCH_REC_Instr[15]_i_8_n_0 ),
        .I2(WEA),
        .I3(\tail_reg[4] ),
        .I4(\tail_reg[4]_0 ),
        .O(\FETCH_REC_Instr[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \FETCH_REC_Instr[15]_i_7__0 
       (.I0(\old_grant[0]_i_3__0_n_0 ),
        .I1(EXE1_Instr[11]),
        .I2(EXE1_Instr[15]),
        .I3(EXE1_Instr[12]),
        .I4(EXE1_Instr[13]),
        .I5(EXE1_Instr[14]),
        .O(\FETCH_REC_Instr[15]_i_7__0_n_0 ));
  LUT6 #(
    .INIT(64'h5500FF0200000000)) 
    \FETCH_REC_Instr[15]_i_8 
       (.I0(p_0_in[1]),
        .I1(\FETCH_REC_Instr[15]_i_9_n_0 ),
        .I2(\old_grant[0]_i_5_n_0 ),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(\old_grant[0]_i_2__0_n_0 ),
        .O(\FETCH_REC_Instr[15]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FF6)) 
    \FETCH_REC_Instr[15]_i_9 
       (.I0(EXE1_Instr[0]),
        .I1(\old_grant[0]_i_3__0_0 ),
        .I2(EXE1_Instr[1]),
        .I3(\old_grant[0]_i_3__0_1 ),
        .I4(\FETCH_REC_Instr[15]_i_10_n_0 ),
        .I5(\FETCH_REC_Instr[15]_i_11_n_0 ),
        .O(\FETCH_REC_Instr[15]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[1]_i_1__0 
       (.I0(FETCH_REC_Instr[1]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[1]_1 ),
        .O(FETCH_REC_Instr_next[1]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[2]_i_1__0 
       (.I0(FETCH_REC_Instr[2]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[2]_1 ),
        .O(FETCH_REC_Instr_next[2]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[3]_i_1__0 
       (.I0(FETCH_REC_Instr[3]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[3]_1 ),
        .O(FETCH_REC_Instr_next[3]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[4]_i_1__0 
       (.I0(FETCH_REC_Instr[4]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[4]_1 ),
        .O(FETCH_REC_Instr_next[4]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[5]_i_1__0 
       (.I0(FETCH_REC_Instr[5]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[5]_1 ),
        .O(FETCH_REC_Instr_next[5]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[6]_i_1__0 
       (.I0(FETCH_REC_Instr[6]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[6]_1 ),
        .O(FETCH_REC_Instr_next[6]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[7]_i_1__0 
       (.I0(FETCH_REC_Instr[7]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[7]_0 ),
        .O(FETCH_REC_Instr_next[7]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[8]_i_1__0 
       (.I0(FETCH_REC_Instr[8]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[8]_1 ),
        .O(FETCH_REC_Instr_next[8]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[9]_i_1__0 
       (.I0(FETCH_REC_Instr[9]),
        .I1(FETCH_REC_Instr_valid_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[9]_0 ),
        .O(FETCH_REC_Instr_next[9]));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[0]),
        .Q(FETCH_REC_Instr[0]),
        .R(\old_grant_reg[0]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \FETCH_REC_Instr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[10]),
        .Q(FETCH_REC_Instr[10]),
        .S(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[11]),
        .Q(FETCH_REC_Instr[11]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[12]),
        .Q(FETCH_REC_Instr[12]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[13]),
        .Q(FETCH_REC_Instr[13]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[14]),
        .Q(FETCH_REC_Instr[14]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[15]),
        .Q(FETCH_REC_Instr[15]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[1]),
        .Q(FETCH_REC_Instr[1]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[2]),
        .Q(FETCH_REC_Instr[2]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[3]),
        .Q(FETCH_REC_Instr[3]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[4]),
        .Q(FETCH_REC_Instr[4]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[5]),
        .Q(FETCH_REC_Instr[5]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[6]),
        .Q(FETCH_REC_Instr[6]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[7]),
        .Q(FETCH_REC_Instr[7]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[8]),
        .Q(FETCH_REC_Instr[8]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[9]),
        .Q(FETCH_REC_Instr[9]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    FETCH_REC_Instr_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_11),
        .Q(FETCH_REC_Instr_valid_0),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[0]),
        .Q(FETCH_REC_Pc[0]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[1]),
        .Q(FETCH_REC_Pc[1]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[2]),
        .Q(FETCH_REC_Pc[2]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[3]),
        .Q(FETCH_REC_Pc[3]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[4]),
        .Q(FETCH_REC_Pc[4]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[5]),
        .Q(FETCH_REC_Pc[5]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[6]),
        .Q(FETCH_REC_Pc[6]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[7]),
        .Q(FETCH_REC_Pc[7]),
        .R(\old_grant_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    FETCH_REC_has_to_save_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(E),
        .Q(FETCH_REC_has_to_save),
        .R(\old_grant_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE)) 
    \FSM_sequential_status_register[2]_i_1 
       (.I0(\FSM_sequential_status_register[2]_i_3_n_0 ),
        .I1(\FSM_sequential_status_register_reg[0]_1 ),
        .I2(\FSM_sequential_status_register_reg[0]_2 [0]),
        .I3(\FSM_sequential_status_register_reg[0]_2 [1]),
        .I4(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I5(\FSM_sequential_status_register_reg[0]_3 ),
        .O(\cur_state_reg[0] ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \FSM_sequential_status_register[2]_i_3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I3(\cur_state_reg[2] ),
        .I4(cmd_register_IBUF),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .O(\FSM_sequential_status_register[2]_i_3_n_0 ));
  arbiter_2_rr arbiter_output_pc_port
       (.ADDRARDADDR(ADDRARDADDR[5:1]),
        .D(D[7:3]),
        .DINADIN(DINADIN),
        .E(p_12_in),
        .\EXE1_Instr_reg[10] (\EXE1_Instr_reg[10]_1 ),
        .\EXE1_Instr_reg[1] (\EXE1_Instr_reg[1]_0 ),
        .\EXE1_Instr_reg[2] (\EXE1_Instr_reg[2]_0 ),
        .\EXE1_Instr_reg[3] (\EXE1_Instr_reg[3]_0 ),
        .\EXE1_Instr_reg[4] (\EXE1_Instr_reg[4]_0 ),
        .\EXE1_Instr_reg[5] (\EXE1_Instr_reg[5]_0 ),
        .\EXE1_Instr_reg[6] (\EXE1_Instr_reg[6]_0 ),
        .\EXE1_Instr_reg[8] (EXE2_Instr_valid9_out),
        .EXE1_Instr_valid_1(EXE1_Instr_valid_1),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg_0),
        .\EXE1_Pc_reg[0] (\EXE1_Pc_reg[0]_0 ),
        .\EXE1_Pc_reg[6] (\EXE1_Pc_reg[6]_0 ),
        .\EXE2_Instr_reg[15] ({p_0_in,EXE1_Instr[5:4],EXE1_Instr[0]}),
        .\EXE2_Instr_reg[15]_0 (\old_grant[0]_i_2__0_n_0 ),
        .EXE2_Instr_valid_2(EXE2_Instr_valid_2),
        .EXE2_Instr_valid_reg(arbiter_output_pc_port_n_43),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_i_2__0_n_0),
        .FETCH_REC_Instr_valid_0(FETCH_REC_Instr_valid_0),
        .FETCH_REC_Instr_valid_reg(arbiter_output_pc_port_n_13),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_not_stall),
        .FETCH_REC_Instr_valid_reg_1(FETCH_REC_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid_reg_1),
        .FETCH_REC_Instr_valid_reg_3(FETCH_REC_Instr_valid_reg_2),
        .FETCH_REC_Instr_valid_reg_4(FETCH_REC_Instr_valid_reg_3),
        .FETCH_REC_Instr_valid_reg_5(\FETCH_REC_Instr[15]_i_5__0_n_0 ),
        .FETCH_REC_Instr_valid_reg_6(\FETCH_REC_Instr[15]_i_6_n_0 ),
        .FETCH_REC_Instr_valid_reg_7(\FETCH_REC_Instr[15]_i_7__0_n_0 ),
        .Q(Q),
        .WEA(WEA),
        .bram_r_valid(bram_r_valid),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .content_reg_bram_0(EXE2_Instr_valid_reg_2),
        .content_reg_bram_0_0(content_reg_bram_0),
        .content_reg_bram_0_1(content_reg_bram_0_0),
        .content_reg_bram_0_10(content_reg_bram_0_i_63_n_0),
        .content_reg_bram_0_11(content_reg_bram_0_i_61_n_0),
        .content_reg_bram_0_12(content_reg_bram_0_i_62_n_0),
        .content_reg_bram_0_13(content_reg_bram_0_i_59_n_0),
        .content_reg_bram_0_14(content_reg_bram_0_i_60__0_n_0),
        .content_reg_bram_0_15(content_reg_bram_0_i_57_n_0),
        .content_reg_bram_0_16(content_reg_bram_0_i_58_n_0),
        .content_reg_bram_0_17(content_reg_bram_0_i_55__0_n_0),
        .content_reg_bram_0_18(content_reg_bram_0_i_56_n_0),
        .content_reg_bram_0_19(content_reg_bram_0_i_52__0_n_0),
        .content_reg_bram_0_2(content_reg_bram_0_1),
        .content_reg_bram_0_20(content_reg_bram_0_i_54_n_0),
        .content_reg_bram_0_21(content_reg_bram_0_i_50__0_n_0),
        .content_reg_bram_0_22(content_reg_bram_0_i_51__0_n_0),
        .content_reg_bram_0_23(content_reg_bram_0_i_48__0_n_0),
        .content_reg_bram_0_24(content_reg_bram_0_i_49__0_n_0),
        .content_reg_bram_0_3(content_reg_bram_0_2),
        .content_reg_bram_0_4(content_reg_bram_0_3),
        .content_reg_bram_0_5(content_reg_bram_0_4),
        .content_reg_bram_0_6(content_reg_bram_0_5),
        .content_reg_bram_0_7(content_reg_bram_0_6),
        .content_reg_bram_0_8(EXE1_Pc[0]),
        .content_reg_bram_0_9(content_reg_bram_0_i_53__0_n_0),
        .curState(curState),
        .\curState_reg[0] (\curState_reg[0] ),
        .\curState_reg[0]_0 (arbiter_output_pc_port_n_11),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .fifo_even_data_in_valid(fifo_even_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_67_n_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_64_n_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_15 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_16 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80_n_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_73_n_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_70_n_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .old_grant(old_grant),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_3 (\old_grant[0]_i_4__0_n_0 ),
        .\old_grant_reg[0]_4 (\old_grant[0]_i_3__0_n_0 ),
        .\tail_reg[4] (\tail_reg[4] ),
        .\tail_reg[4]_0 (EXE2_Instr_valid_reg_1),
        .\tail_reg[4]_1 (\tail_reg[4]_0 ),
        .\tail_reg[4]_2 (\tail_reg[4]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'h15)) 
    content_reg_bram_0_i_17__4
       (.I0(\old_grant[0]_i_4__0_n_0 ),
        .I1(\old_grant[0]_i_2__0_n_0 ),
        .I2(\old_grant[0]_i_3__0_n_0 ),
        .O(EXE2_Instr_valid_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT5 #(
    .INIT(32'h15EAFFEA)) 
    content_reg_bram_0_i_18
       (.I0(\old_grant[0]_i_4__0_n_0 ),
        .I1(\old_grant[0]_i_2__0_n_0 ),
        .I2(\old_grant[0]_i_3__0_n_0 ),
        .I3(content_reg_bram_0_7),
        .I4(\tail_reg[4]_0 ),
        .O(EXE2_Instr_valid_reg_2));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT5 #(
    .INIT(32'hFF151500)) 
    content_reg_bram_0_i_19__1
       (.I0(\old_grant[0]_i_4__0_n_0 ),
        .I1(\old_grant[0]_i_2__0_n_0 ),
        .I2(\old_grant[0]_i_3__0_n_0 ),
        .I3(content_reg_bram_0_7),
        .I4(\tail_reg[4]_0 ),
        .O(EXE2_Instr_valid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT1 #(
    .INIT(2'h1)) 
    content_reg_bram_0_i_1__3
       (.I0(EXE2_Instr_valid_reg_0),
        .O(\switch2channel\.valid ));
  LUT5 #(
    .INIT(32'h00FF8787)) 
    content_reg_bram_0_i_48__0
       (.I0(content_reg_bram_0_i_64_n_0),
        .I1(EXE1_Pc[6]),
        .I2(EXE1_Pc[7]),
        .I3(EXE1_Instr[7]),
        .I4(content_reg_bram_0_i_53__0_n_0),
        .O(content_reg_bram_0_i_48__0_n_0));
  LUT5 #(
    .INIT(32'h0087FF87)) 
    content_reg_bram_0_i_49__0
       (.I0(content_reg_bram_0_i_65_n_0),
        .I1(EXE2_Pc[6]),
        .I2(EXE2_Pc[7]),
        .I3(\old_grant[0]_i_4__0_n_0 ),
        .I4(\EXE2_Instr_reg_n_0_[7] ),
        .O(content_reg_bram_0_i_49__0_n_0));
  LUT4 #(
    .INIT(16'h7447)) 
    content_reg_bram_0_i_50__0
       (.I0(EXE1_Instr[6]),
        .I1(content_reg_bram_0_i_53__0_n_0),
        .I2(EXE1_Pc[6]),
        .I3(content_reg_bram_0_i_64_n_0),
        .O(content_reg_bram_0_i_50__0_n_0));
  LUT4 #(
    .INIT(16'h09F9)) 
    content_reg_bram_0_i_51__0
       (.I0(content_reg_bram_0_i_65_n_0),
        .I1(EXE2_Pc[6]),
        .I2(\old_grant[0]_i_4__0_n_0 ),
        .I3(\EXE2_Instr_reg_n_0_[6] ),
        .O(content_reg_bram_0_i_51__0_n_0));
  LUT6 #(
    .INIT(64'h9555555555555555)) 
    content_reg_bram_0_i_52__0
       (.I0(EXE1_Pc[5]),
        .I1(EXE1_Pc[4]),
        .I2(EXE1_Pc[2]),
        .I3(EXE1_Pc[0]),
        .I4(EXE1_Pc[1]),
        .I5(EXE1_Pc[3]),
        .O(content_reg_bram_0_i_52__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    content_reg_bram_0_i_53__0
       (.I0(\old_grant[0]_i_2__0_n_0 ),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .O(content_reg_bram_0_i_53__0_n_0));
  LUT4 #(
    .INIT(16'h09F9)) 
    content_reg_bram_0_i_54
       (.I0(content_reg_bram_0_i_66_n_0),
        .I1(EXE2_Pc[5]),
        .I2(\old_grant[0]_i_4__0_n_0 ),
        .I3(\EXE2_Instr_reg_n_0_[5] ),
        .O(content_reg_bram_0_i_54_n_0));
  LUT5 #(
    .INIT(32'h95555555)) 
    content_reg_bram_0_i_55__0
       (.I0(EXE1_Pc[4]),
        .I1(EXE1_Pc[3]),
        .I2(EXE1_Pc[1]),
        .I3(EXE1_Pc[0]),
        .I4(EXE1_Pc[2]),
        .O(content_reg_bram_0_i_55__0_n_0));
  LUT4 #(
    .INIT(16'h8BB8)) 
    content_reg_bram_0_i_56
       (.I0(\EXE2_Instr_reg_n_0_[4] ),
        .I1(\old_grant[0]_i_4__0_n_0 ),
        .I2(EXE2_Pc[4]),
        .I3(content_reg_bram_0_i_67_n_0),
        .O(content_reg_bram_0_i_56_n_0));
  LUT6 #(
    .INIT(64'h7447474747474747)) 
    content_reg_bram_0_i_57
       (.I0(EXE1_Instr[3]),
        .I1(content_reg_bram_0_i_53__0_n_0),
        .I2(EXE1_Pc[3]),
        .I3(EXE1_Pc[2]),
        .I4(EXE1_Pc[0]),
        .I5(EXE1_Pc[1]),
        .O(content_reg_bram_0_i_57_n_0));
  LUT6 #(
    .INIT(64'h7447474747474747)) 
    content_reg_bram_0_i_58
       (.I0(\EXE2_Instr_reg_n_0_[3] ),
        .I1(\old_grant[0]_i_4__0_n_0 ),
        .I2(EXE2_Pc[3]),
        .I3(EXE2_Pc[0]),
        .I4(EXE2_Pc[1]),
        .I5(EXE2_Pc[2]),
        .O(content_reg_bram_0_i_58_n_0));
  LUT5 #(
    .INIT(32'h74474747)) 
    content_reg_bram_0_i_59
       (.I0(EXE1_Instr[2]),
        .I1(content_reg_bram_0_i_53__0_n_0),
        .I2(EXE1_Pc[2]),
        .I3(EXE1_Pc[1]),
        .I4(EXE1_Pc[0]),
        .O(content_reg_bram_0_i_59_n_0));
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    content_reg_bram_0_i_60__0
       (.I0(\EXE2_Instr_reg_n_0_[2] ),
        .I1(\old_grant[0]_i_4__0_n_0 ),
        .I2(EXE2_Pc[2]),
        .I3(EXE2_Pc[1]),
        .I4(EXE2_Pc[0]),
        .O(content_reg_bram_0_i_60__0_n_0));
  LUT4 #(
    .INIT(16'h8BB8)) 
    content_reg_bram_0_i_61
       (.I0(EXE1_Instr[1]),
        .I1(content_reg_bram_0_i_53__0_n_0),
        .I2(EXE1_Pc[0]),
        .I3(EXE1_Pc[1]),
        .O(content_reg_bram_0_i_61_n_0));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT4 #(
    .INIT(16'h55C3)) 
    content_reg_bram_0_i_62
       (.I0(\EXE2_Instr_reg_n_0_[1] ),
        .I1(EXE2_Pc[0]),
        .I2(EXE2_Pc[1]),
        .I3(\old_grant[0]_i_4__0_n_0 ),
        .O(content_reg_bram_0_i_62_n_0));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'h74)) 
    content_reg_bram_0_i_63
       (.I0(\EXE2_Instr_reg_n_0_[0] ),
        .I1(\old_grant[0]_i_4__0_n_0 ),
        .I2(EXE2_Pc[0]),
        .O(content_reg_bram_0_i_63_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    content_reg_bram_0_i_64
       (.I0(EXE1_Pc[4]),
        .I1(EXE1_Pc[2]),
        .I2(EXE1_Pc[0]),
        .I3(EXE1_Pc[1]),
        .I4(EXE1_Pc[3]),
        .I5(EXE1_Pc[5]),
        .O(content_reg_bram_0_i_64_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    content_reg_bram_0_i_65
       (.I0(EXE2_Pc[0]),
        .I1(EXE2_Pc[1]),
        .I2(EXE2_Pc[2]),
        .I3(EXE2_Pc[3]),
        .I4(EXE2_Pc[4]),
        .I5(EXE2_Pc[5]),
        .O(content_reg_bram_0_i_65_n_0));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    content_reg_bram_0_i_66
       (.I0(EXE2_Pc[4]),
        .I1(EXE2_Pc[3]),
        .I2(EXE2_Pc[2]),
        .I3(EXE2_Pc[1]),
        .I4(EXE2_Pc[0]),
        .O(content_reg_bram_0_i_66_n_0));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    content_reg_bram_0_i_67
       (.I0(EXE2_Pc[0]),
        .I1(EXE2_Pc[1]),
        .I2(EXE2_Pc[2]),
        .I3(EXE2_Pc[3]),
        .O(content_reg_bram_0_i_67_n_0));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \cur_cc_pointer[31]_i_1 
       (.I0(\FSM_sequential_status_register_reg[0]_0 ),
        .I1(\cur_cc_pointer[31]_i_4_n_0 ),
        .O(\FSM_sequential_status_register_reg[0] ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \cur_cc_pointer[31]_i_3 
       (.I0(\cur_state_reg[2] ),
        .I1(cmd_register_IBUF),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I5(\FSM_sequential_status_register_reg[0]_2 [2]),
        .O(\FSM_sequential_status_register_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000000000D00000)) 
    \cur_cc_pointer[31]_i_4 
       (.I0(cur_is_even_character_reg_3),
        .I1(memory_addr_from_coprocessor_ready),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ),
        .I3(\FSM_sequential_status_register_reg[0]_2 [0]),
        .I4(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I5(\FSM_sequential_status_register_reg[0]_2 [1]),
        .O(\cur_cc_pointer[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h6)) 
    cur_is_even_character_i_1
       (.I0(\cur_cc_pointer[31]_i_4_n_0 ),
        .I1(cur_is_even_character),
        .O(cur_is_even_character_reg_2));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \cur_state[0]_i_7 
       (.I0(EXE2_Instr_valid_2),
        .I1(EXE2_Instr_valid),
        .I2(FETCH_REC_Instr_valid_0),
        .I3(EXE1_Instr_valid_1),
        .I4(FETCH_REC_Instr_valid),
        .I5(EXE1_Instr_valid),
        .O(EXE2_Instr_valid_reg_3));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cur_state[2]_i_14 
       (.I0(\old_grant[0]_i_2__0_n_0 ),
        .I1(p_0_in[0]),
        .O(\EXE1_Instr_reg[8]_0 ));
  LUT4 #(
    .INIT(16'h0FFE)) 
    \cur_state[2]_i_15 
       (.I0(\cur_state[2]_i_9 ),
        .I1(\cur_state[2]_i_9_0 ),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .O(\EXE1_Instr_reg[10]_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_12 
       (.I0(address_register_IBUF[0]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_n_0 ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I4(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[0]));
  LUT5 #(
    .INIT(32'hF8888888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_4 
       (.I0(address_register_IBUF[3]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(\cur_state_reg[2] ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 [2]),
        .I4(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[8]));
  LUT5 #(
    .INIT(32'hF8888888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_5 
       (.I0(address_register_IBUF[2]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(\cur_state_reg[2] ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 [1]),
        .I4(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[7]));
  LUT5 #(
    .INIT(32'hF8888888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_6 
       (.I0(address_register_IBUF[1]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(\cur_state_reg[2] ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 [0]),
        .I4(memory_addr_from_coprocessor_ready),
        .O(ADDRARDADDR[6]));
  LUT6 #(
    .INIT(64'h0888880808080808)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_60 
       (.I0(memory_addr_from_coprocessor_ready),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_14 ),
        .I2(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [1]),
        .I4(O[0]),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ),
        .O(\cur_state_reg[2] ));
  LUT4 #(
    .INIT(16'hA808)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_64 
       (.I0(\cur_state_reg[2] ),
        .I1(start_cc_pointer_register_IBUF[5]),
        .I2(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I3(O[5]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_64_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_67 
       (.I0(\cur_state_reg[2] ),
        .I1(start_cc_pointer_register_IBUF[4]),
        .I2(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I3(O[4]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_67_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_70 
       (.I0(\cur_state_reg[2] ),
        .I1(start_cc_pointer_register_IBUF[3]),
        .I2(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I3(O[3]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_70_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_73 
       (.I0(\cur_state_reg[2] ),
        .I1(start_cc_pointer_register_IBUF[2]),
        .I2(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I3(O[2]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_73_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76 
       (.I0(\cur_state_reg[2] ),
        .I1(start_cc_pointer_register_IBUF[1]),
        .I2(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I3(O[1]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ));
  LUT6 #(
    .INIT(64'h0A8A0A0A00800000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 
       (.I0(\cur_state_reg[2] ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ),
        .I2(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [1]),
        .I4(O[0]),
        .I5(start_cc_pointer_register_IBUF[0]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFD700)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ),
        .I1(O[0]),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [1]),
        .I3(\FSM_sequential_status_register_reg[0]_2 [2]),
        .I4(\FSM_sequential_status_register_reg[0]_2 [0]),
        .I5(\FSM_sequential_status_register_reg[0]_2 [1]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84 
       (.I0(EXE2_Instr_valid_reg_0),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_0 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_1 ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_2 ),
        .I4(CO),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \old_grant[0]_i_10 
       (.I0(EXE1_Instr[5]),
        .I1(\old_grant[0]_i_5_2 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [0]),
        .I3(\old_grant[0]_i_5_3 ),
        .O(\old_grant[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \old_grant[0]_i_2__0 
       (.I0(EXE1_Instr_valid_1),
        .I1(EXE1_Instr[11]),
        .I2(EXE1_Instr[15]),
        .I3(EXE1_Instr[12]),
        .I4(EXE1_Instr[13]),
        .I5(EXE1_Instr[14]),
        .O(\old_grant[0]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h44444445CCCCCCCC)) 
    \old_grant[0]_i_3__0 
       (.I0(p_0_in[2]),
        .I1(p_0_in[0]),
        .I2(\old_grant[0]_i_5_n_0 ),
        .I3(\old_grant[0]_i_6_n_0 ),
        .I4(\old_grant[0]_i_7__0_n_0 ),
        .I5(p_0_in[1]),
        .O(\old_grant[0]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \old_grant[0]_i_4__0 
       (.I0(EXE2_Instr_valid_2),
        .I1(\old_grant[0]_i_8__0_n_0 ),
        .I2(sel0[5]),
        .I3(sel0[6]),
        .I4(sel0[0]),
        .I5(sel0[2]),
        .O(\old_grant[0]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FF6)) 
    \old_grant[0]_i_5 
       (.I0(EXE1_Instr[7]),
        .I1(\FETCH_REC_Instr[15]_i_8_0 ),
        .I2(EXE1_Instr[6]),
        .I3(\FETCH_REC_Instr[15]_i_8_1 ),
        .I4(\old_grant[0]_i_9_n_0 ),
        .I5(\old_grant[0]_i_10_n_0 ),
        .O(\old_grant[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \old_grant[0]_i_6 
       (.I0(\old_grant[0]_i_3__0_1 ),
        .I1(EXE1_Instr[1]),
        .I2(\old_grant[0]_i_3__0_0 ),
        .I3(EXE1_Instr[0]),
        .O(\old_grant[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \old_grant[0]_i_7__0 
       (.I0(\old_grant[0]_i_3__0_2 ),
        .I1(EXE1_Instr[3]),
        .I2(\old_grant[0]_i_3__0_3 ),
        .I3(EXE1_Instr[2]),
        .O(\old_grant[0]_i_7__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \old_grant[0]_i_8__0 
       (.I0(sel0[1]),
        .I1(sel0[7]),
        .I2(sel0[4]),
        .I3(sel0[3]),
        .O(\old_grant[0]_i_8__0_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \old_grant[0]_i_9 
       (.I0(EXE1_Instr[4]),
        .I1(\old_grant[0]_i_5_0 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 [0]),
        .I3(\old_grant[0]_i_5_1 ),
        .O(\old_grant[0]_i_9_n_0 ));
endmodule

(* ORIG_REF_NAME = "regex_cpu_pipelined" *) 
module regex_cpu_pipelined_8
   (SR,
    in_ready_packed,
    FETCH_REC_Instr_valid_reg_0,
    EXE1_Instr_valid_reg_0,
    EXE2_Instr_valid,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ,
    EXE1_Instr_valid_reg_1,
    \EXE2_Instr_reg[13]_0 ,
    \old_grant_reg[0] ,
    EXE1_Instr_valid_reg_2,
    \cur_state_reg[0] ,
    \EXE1_Instr_reg[8]_0 ,
    EXE1_Instr_valid_reg_3,
    DINADIN,
    \EXE2_Instr_reg[0]_0 ,
    cur_is_even_character_reg,
    \EXE2_Instr_reg[1]_0 ,
    \EXE2_Instr_reg[2]_0 ,
    \EXE2_Instr_reg[3]_0 ,
    \EXE2_Instr_reg[4]_0 ,
    \EXE2_Instr_reg[5]_0 ,
    \EXE2_Instr_reg[6]_0 ,
    \EXE2_Pc_reg[7]_0 ,
    fifo_odd_data_in_valid,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    \EXE1_Instr_reg[10]_0 ,
    \cur_state_reg[2] ,
    \switch2channel\.valid ,
    p_0_in,
    EXE1_Instr_valid_reg_4,
    FETCH_REC_Instr_valid_reg_1,
    EXE1_Instr_valid_reg_5,
    clk_IBUF_BUFG,
    E,
    cmd_register_IBUF,
    rst_IBUF,
    memory_addr_from_coprocessor_ready,
    old_grant,
    \curState_reg[0] ,
    curState,
    CO,
    \cur_state_reg[0]_0 ,
    \cur_state_reg[0]_1 ,
    O,
    \cur_state_reg[0]_2 ,
    fifo_even_data_in_ready,
    content_reg_bram_0,
    \switch2channel\.ready_0 ,
    FETCH_REC_Instr_valid_reg_2,
    \curState_reg[0]_0 ,
    \curState_reg[0]_1 ,
    cur_is_even_character,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    content_reg_bram_0_3,
    content_reg_bram_0_4,
    content_reg_bram_0_5,
    content_reg_bram_0_6,
    content_reg_bram_0_7,
    content_reg_bram_0_8,
    \tail_reg[4] ,
    content_reg_bram_0_9,
    \cur_state_reg[0]_3 ,
    \cur_state_reg[0]_4 ,
    \cur_state_reg[0]_5 ,
    \cur_state_reg[0]_6 ,
    \tail_reg[0] ,
    \cur_state_reg[0]_7 ,
    \cur_state_reg[0]_8 ,
    content_reg_bram_0_10,
    \head_reg[0] ,
    \head_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_3,
    \cur_state_reg[0]_9 ,
    \cur_state_reg[0]_10 ,
    \cur_state_reg[2]_0 ,
    \cur_state_reg[0]_11 ,
    \cur_state[2]_i_9_0 ,
    \old_grant[0]_i_2_0 ,
    \old_grant[0]_i_2_1 ,
    \old_grant[0]_i_2_2 ,
    \old_grant[0]_i_2_3 ,
    \FETCH_REC_Instr[15]_i_7_0 ,
    \FETCH_REC_Instr[15]_i_7_1 ,
    \old_grant[0]_i_2_4 ,
    \old_grant[0]_i_2_5 ,
    \FETCH_REC_Instr[15]_i_8__0_0 ,
    \FETCH_REC_Instr[15]_i_8__0_1 ,
    \FETCH_REC_Instr[15]_i_8__0_2 ,
    \FETCH_REC_Instr[15]_i_8__0_3 ,
    \FETCH_REC_Instr[15]_i_8__0_4 ,
    \FETCH_REC_Instr[15]_i_8__0_5 ,
    \FETCH_REC_Instr[15]_i_8__0_6 ,
    \FETCH_REC_Instr[15]_i_8__0_7 ,
    \FETCH_REC_Instr[15]_i_8__0_8 ,
    \FETCH_REC_Instr[15]_i_8__0_9 ,
    \FETCH_REC_Instr[15]_i_8__0_10 ,
    \FETCH_REC_Instr[15]_i_8__0_11 ,
    \EXE1_Instr_reg[0]_0 ,
    \EXE1_Instr_reg[1]_0 ,
    \EXE1_Instr_reg[2]_0 ,
    \EXE1_Instr_reg[3]_0 ,
    \EXE1_Instr_reg[4]_0 ,
    \EXE1_Instr_reg[5]_0 ,
    \EXE1_Instr_reg[6]_0 ,
    \EXE1_Instr_reg[7]_0 ,
    \EXE1_Instr_reg[8]_1 ,
    \EXE1_Instr_reg[9]_0 ,
    \EXE1_Instr_reg[10]_1 ,
    \EXE1_Instr_reg[11]_0 ,
    \EXE1_Instr_reg[12]_0 ,
    \EXE1_Instr_reg[13]_0 ,
    \EXE1_Instr_reg[14]_0 ,
    \EXE1_Instr_reg[15]_0 ,
    D);
  output [0:0]SR;
  output [0:0]in_ready_packed;
  output FETCH_REC_Instr_valid_reg_0;
  output EXE1_Instr_valid_reg_0;
  output EXE2_Instr_valid;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  output EXE1_Instr_valid_reg_1;
  output \EXE2_Instr_reg[13]_0 ;
  output \old_grant_reg[0] ;
  output EXE1_Instr_valid_reg_2;
  output [2:0]\cur_state_reg[0] ;
  output \EXE1_Instr_reg[8]_0 ;
  output EXE1_Instr_valid_reg_3;
  output [7:0]DINADIN;
  output \EXE2_Instr_reg[0]_0 ;
  output [7:0]cur_is_even_character_reg;
  output \EXE2_Instr_reg[1]_0 ;
  output \EXE2_Instr_reg[2]_0 ;
  output \EXE2_Instr_reg[3]_0 ;
  output \EXE2_Instr_reg[4]_0 ;
  output \EXE2_Instr_reg[5]_0 ;
  output \EXE2_Instr_reg[6]_0 ;
  output \EXE2_Pc_reg[7]_0 ;
  output fifo_odd_data_in_valid;
  output [0:0]cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output [0:0]\EXE1_Instr_reg[10]_0 ;
  output [0:0]\cur_state_reg[2] ;
  output \switch2channel\.valid ;
  output [0:0]p_0_in;
  output EXE1_Instr_valid_reg_4;
  output FETCH_REC_Instr_valid_reg_1;
  output EXE1_Instr_valid_reg_5;
  input clk_IBUF_BUFG;
  input [0:0]E;
  input [31:0]cmd_register_IBUF;
  input rst_IBUF;
  input memory_addr_from_coprocessor_ready;
  input [0:0]old_grant;
  input \curState_reg[0] ;
  input [0:0]curState;
  input [0:0]CO;
  input [2:0]\cur_state_reg[0]_0 ;
  input [1:0]\cur_state_reg[0]_1 ;
  input [0:0]O;
  input \cur_state_reg[0]_2 ;
  input fifo_even_data_in_ready;
  input content_reg_bram_0;
  input \switch2channel\.ready_0 ;
  input FETCH_REC_Instr_valid_reg_2;
  input \curState_reg[0]_0 ;
  input \curState_reg[0]_1 ;
  input cur_is_even_character;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input content_reg_bram_0_3;
  input content_reg_bram_0_4;
  input content_reg_bram_0_5;
  input content_reg_bram_0_6;
  input content_reg_bram_0_7;
  input content_reg_bram_0_8;
  input \tail_reg[4] ;
  input content_reg_bram_0_9;
  input \cur_state_reg[0]_3 ;
  input \cur_state_reg[0]_4 ;
  input \cur_state_reg[0]_5 ;
  input \cur_state_reg[0]_6 ;
  input \tail_reg[0] ;
  input \cur_state_reg[0]_7 ;
  input \cur_state_reg[0]_8 ;
  input content_reg_bram_0_10;
  input \head_reg[0] ;
  input \head_reg[0]_0 ;
  input FETCH_REC_Instr_valid_reg_3;
  input \cur_state_reg[0]_9 ;
  input \cur_state_reg[0]_10 ;
  input \cur_state_reg[2]_0 ;
  input \cur_state_reg[0]_11 ;
  input \cur_state[2]_i_9_0 ;
  input \old_grant[0]_i_2_0 ;
  input \old_grant[0]_i_2_1 ;
  input \old_grant[0]_i_2_2 ;
  input \old_grant[0]_i_2_3 ;
  input \FETCH_REC_Instr[15]_i_7_0 ;
  input \FETCH_REC_Instr[15]_i_7_1 ;
  input \old_grant[0]_i_2_4 ;
  input \old_grant[0]_i_2_5 ;
  input \FETCH_REC_Instr[15]_i_8__0_0 ;
  input \FETCH_REC_Instr[15]_i_8__0_1 ;
  input \FETCH_REC_Instr[15]_i_8__0_2 ;
  input \FETCH_REC_Instr[15]_i_8__0_3 ;
  input \FETCH_REC_Instr[15]_i_8__0_4 ;
  input \FETCH_REC_Instr[15]_i_8__0_5 ;
  input \FETCH_REC_Instr[15]_i_8__0_6 ;
  input \FETCH_REC_Instr[15]_i_8__0_7 ;
  input \FETCH_REC_Instr[15]_i_8__0_8 ;
  input \FETCH_REC_Instr[15]_i_8__0_9 ;
  input \FETCH_REC_Instr[15]_i_8__0_10 ;
  input \FETCH_REC_Instr[15]_i_8__0_11 ;
  input \EXE1_Instr_reg[0]_0 ;
  input \EXE1_Instr_reg[1]_0 ;
  input \EXE1_Instr_reg[2]_0 ;
  input \EXE1_Instr_reg[3]_0 ;
  input \EXE1_Instr_reg[4]_0 ;
  input \EXE1_Instr_reg[5]_0 ;
  input \EXE1_Instr_reg[6]_0 ;
  input \EXE1_Instr_reg[7]_0 ;
  input \EXE1_Instr_reg[8]_1 ;
  input \EXE1_Instr_reg[9]_0 ;
  input \EXE1_Instr_reg[10]_1 ;
  input \EXE1_Instr_reg[11]_0 ;
  input \EXE1_Instr_reg[12]_0 ;
  input \EXE1_Instr_reg[13]_0 ;
  input \EXE1_Instr_reg[14]_0 ;
  input \EXE1_Instr_reg[15]_0 ;
  input [7:0]D;

  wire [0:0]CO;
  wire [7:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire [15:0]EXE1_Instr;
  wire \EXE1_Instr_reg[0]_0 ;
  wire [0:0]\EXE1_Instr_reg[10]_0 ;
  wire \EXE1_Instr_reg[10]_1 ;
  wire \EXE1_Instr_reg[11]_0 ;
  wire \EXE1_Instr_reg[12]_0 ;
  wire \EXE1_Instr_reg[13]_0 ;
  wire \EXE1_Instr_reg[14]_0 ;
  wire \EXE1_Instr_reg[15]_0 ;
  wire \EXE1_Instr_reg[1]_0 ;
  wire \EXE1_Instr_reg[2]_0 ;
  wire \EXE1_Instr_reg[3]_0 ;
  wire \EXE1_Instr_reg[4]_0 ;
  wire \EXE1_Instr_reg[5]_0 ;
  wire \EXE1_Instr_reg[6]_0 ;
  wire \EXE1_Instr_reg[7]_0 ;
  wire \EXE1_Instr_reg[8]_0 ;
  wire \EXE1_Instr_reg[8]_1 ;
  wire \EXE1_Instr_reg[9]_0 ;
  wire EXE1_Instr_valid_reg_0;
  wire EXE1_Instr_valid_reg_1;
  wire EXE1_Instr_valid_reg_2;
  wire EXE1_Instr_valid_reg_3;
  wire EXE1_Instr_valid_reg_4;
  wire EXE1_Instr_valid_reg_5;
  wire [7:0]EXE1_Pc;
  wire \EXE2_Instr[15]_i_2_n_0 ;
  wire \EXE2_Instr_reg[0]_0 ;
  wire \EXE2_Instr_reg[13]_0 ;
  wire \EXE2_Instr_reg[1]_0 ;
  wire \EXE2_Instr_reg[2]_0 ;
  wire \EXE2_Instr_reg[3]_0 ;
  wire \EXE2_Instr_reg[4]_0 ;
  wire \EXE2_Instr_reg[5]_0 ;
  wire \EXE2_Instr_reg[6]_0 ;
  wire \EXE2_Instr_reg_n_0_[0] ;
  wire \EXE2_Instr_reg_n_0_[1] ;
  wire \EXE2_Instr_reg_n_0_[2] ;
  wire \EXE2_Instr_reg_n_0_[3] ;
  wire \EXE2_Instr_reg_n_0_[4] ;
  wire \EXE2_Instr_reg_n_0_[5] ;
  wire \EXE2_Instr_reg_n_0_[6] ;
  wire \EXE2_Instr_reg_n_0_[7] ;
  wire EXE2_Instr_valid;
  wire EXE2_Instr_valid9_out;
  wire EXE2_Instr_valid_i_2_n_0;
  wire [7:0]EXE2_Pc;
  wire \EXE2_Pc_reg[7]_0 ;
  wire [15:0]FETCH_REC_Instr;
  wire \FETCH_REC_Instr[15]_i_10__0_n_0 ;
  wire \FETCH_REC_Instr[15]_i_11__0_n_0 ;
  wire \FETCH_REC_Instr[15]_i_12_n_0 ;
  wire \FETCH_REC_Instr[15]_i_13_n_0 ;
  wire \FETCH_REC_Instr[15]_i_14_n_0 ;
  wire \FETCH_REC_Instr[15]_i_5_n_0 ;
  wire \FETCH_REC_Instr[15]_i_7_0 ;
  wire \FETCH_REC_Instr[15]_i_7_1 ;
  wire \FETCH_REC_Instr[15]_i_8__0_0 ;
  wire \FETCH_REC_Instr[15]_i_8__0_1 ;
  wire \FETCH_REC_Instr[15]_i_8__0_10 ;
  wire \FETCH_REC_Instr[15]_i_8__0_11 ;
  wire \FETCH_REC_Instr[15]_i_8__0_2 ;
  wire \FETCH_REC_Instr[15]_i_8__0_3 ;
  wire \FETCH_REC_Instr[15]_i_8__0_4 ;
  wire \FETCH_REC_Instr[15]_i_8__0_5 ;
  wire \FETCH_REC_Instr[15]_i_8__0_6 ;
  wire \FETCH_REC_Instr[15]_i_8__0_7 ;
  wire \FETCH_REC_Instr[15]_i_8__0_8 ;
  wire \FETCH_REC_Instr[15]_i_8__0_9 ;
  wire \FETCH_REC_Instr[15]_i_8__0_n_0 ;
  wire \FETCH_REC_Instr[15]_i_9__0_n_0 ;
  wire [15:0]FETCH_REC_Instr_next;
  wire FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire FETCH_REC_Instr_valid_reg_3;
  wire [7:0]FETCH_REC_Pc;
  wire FETCH_REC_has_to_save;
  wire [0:0]O;
  wire [0:0]SR;
  wire arbiter_output_pc_port_n_39;
  wire arbiter_output_pc_port_n_5;
  wire arbiter_output_pc_port_n_7;
  wire arbiter_output_pc_port_n_8;
  wire clk_IBUF_BUFG;
  wire [31:0]cmd_register_IBUF;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire content_reg_bram_0_i_44_n_0;
  wire content_reg_bram_0_i_45_n_0;
  wire content_reg_bram_0_i_46_n_0;
  wire content_reg_bram_0_i_47_n_0;
  wire content_reg_bram_0_i_48_n_0;
  wire content_reg_bram_0_i_49_n_0;
  wire content_reg_bram_0_i_50_n_0;
  wire content_reg_bram_0_i_51_n_0;
  wire content_reg_bram_0_i_52_n_0;
  wire content_reg_bram_0_i_53_n_0;
  wire content_reg_bram_0_i_58__0_n_0;
  wire content_reg_bram_0_i_59__0_n_0;
  wire content_reg_bram_0_i_60_n_0;
  wire content_reg_bram_0_i_61__0_n_0;
  wire content_reg_bram_0_i_62__0_n_0;
  wire content_reg_bram_0_i_63__0_n_0;
  wire [0:0]curState;
  wire \curState_reg[0] ;
  wire \curState_reg[0]_0 ;
  wire \curState_reg[0]_1 ;
  wire cur_is_even_character;
  wire [7:0]cur_is_even_character_reg;
  wire [0:0]cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[0]_i_3_n_0 ;
  wire \cur_state[2]_i_16_n_0 ;
  wire \cur_state[2]_i_17_n_0 ;
  wire \cur_state[2]_i_18_n_0 ;
  wire \cur_state[2]_i_30_n_0 ;
  wire \cur_state[2]_i_3_n_0 ;
  wire \cur_state[2]_i_4_n_0 ;
  wire \cur_state[2]_i_9_0 ;
  wire [2:0]\cur_state_reg[0] ;
  wire [2:0]\cur_state_reg[0]_0 ;
  wire [1:0]\cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_10 ;
  wire \cur_state_reg[0]_11 ;
  wire \cur_state_reg[0]_2 ;
  wire \cur_state_reg[0]_3 ;
  wire \cur_state_reg[0]_4 ;
  wire \cur_state_reg[0]_5 ;
  wire \cur_state_reg[0]_6 ;
  wire \cur_state_reg[0]_7 ;
  wire \cur_state_reg[0]_8 ;
  wire \cur_state_reg[0]_9 ;
  wire [0:0]\cur_state_reg[2] ;
  wire \cur_state_reg[2]_0 ;
  wire fifo_even_data_in_ready;
  wire fifo_odd_data_in_valid;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  wire \head_reg[0] ;
  wire \head_reg[0]_0 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]old_grant;
  wire \old_grant[0]_i_17_n_0 ;
  wire \old_grant[0]_i_2_0 ;
  wire \old_grant[0]_i_2_1 ;
  wire \old_grant[0]_i_2_2 ;
  wire \old_grant[0]_i_2_3 ;
  wire \old_grant[0]_i_2_4 ;
  wire \old_grant[0]_i_2_5 ;
  wire \old_grant[0]_i_2_n_0 ;
  wire \old_grant[0]_i_4_n_0 ;
  wire \old_grant[0]_i_5__0_n_0 ;
  wire \old_grant[0]_i_6__0_n_0 ;
  wire \old_grant[0]_i_7_n_0 ;
  wire \old_grant[0]_i_8_n_0 ;
  wire \old_grant_reg[0] ;
  wire [0:0]p_0_in;
  wire [2:0]p_0_in_0;
  wire p_12_in;
  wire rst_IBUF;
  wire [7:0]sel0;
  wire \switch2channel\.ready_0 ;
  wire \switch2channel\.valid ;
  wire \tail_reg[0] ;
  wire \tail_reg[4] ;

  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[0]),
        .Q(EXE1_Instr[0]),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \EXE1_Instr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[10]),
        .Q(p_0_in_0[2]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[11]),
        .Q(EXE1_Instr[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[12]),
        .Q(EXE1_Instr[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[13]),
        .Q(EXE1_Instr[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[14]),
        .Q(EXE1_Instr[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[15]),
        .Q(EXE1_Instr[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[1]),
        .Q(EXE1_Instr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[2]),
        .Q(EXE1_Instr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[3]),
        .Q(EXE1_Instr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[4]),
        .Q(EXE1_Instr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[5]),
        .Q(EXE1_Instr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[6]),
        .Q(EXE1_Instr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[7]),
        .Q(EXE1_Instr[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[8]),
        .Q(p_0_in_0[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Instr_next[9]),
        .Q(p_0_in_0[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    EXE1_Instr_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_8),
        .Q(EXE1_Instr_valid_reg_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Pc[0]),
        .Q(EXE1_Pc[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Pc[1]),
        .Q(EXE1_Pc[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Pc[2]),
        .Q(EXE1_Pc[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Pc[3]),
        .Q(EXE1_Pc[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Pc[4]),
        .Q(EXE1_Pc[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Pc[5]),
        .Q(EXE1_Pc[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Pc[6]),
        .Q(EXE1_Pc[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(arbiter_output_pc_port_n_5),
        .D(FETCH_REC_Pc[7]),
        .Q(EXE1_Pc[7]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \EXE2_Instr[15]_i_2 
       (.I0(EXE1_Instr[14]),
        .I1(EXE1_Instr[13]),
        .I2(EXE1_Instr[12]),
        .I3(EXE1_Instr[11]),
        .I4(EXE1_Instr[15]),
        .I5(EXE1_Instr_valid_reg_0),
        .O(\EXE2_Instr[15]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[0]),
        .Q(\EXE2_Instr_reg_n_0_[0] ),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \EXE2_Instr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in_0[2]),
        .Q(sel0[2]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[11]),
        .Q(sel0[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[12]),
        .Q(sel0[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[13]),
        .Q(sel0[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[14]),
        .Q(sel0[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[15]),
        .Q(sel0[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[1]),
        .Q(\EXE2_Instr_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[2]),
        .Q(\EXE2_Instr_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[3]),
        .Q(\EXE2_Instr_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[4]),
        .Q(\EXE2_Instr_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[5]),
        .Q(\EXE2_Instr_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[6]),
        .Q(\EXE2_Instr_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Instr[7]),
        .Q(\EXE2_Instr_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in_0[0]),
        .Q(sel0[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in_0[1]),
        .Q(sel0[1]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00000004)) 
    EXE2_Instr_valid_i_2
       (.I0(sel0[2]),
        .I1(sel0[0]),
        .I2(sel0[6]),
        .I3(sel0[5]),
        .I4(\old_grant[0]_i_8_n_0 ),
        .O(EXE2_Instr_valid_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    EXE2_Instr_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_39),
        .Q(EXE2_Instr_valid),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[0]),
        .Q(EXE2_Pc[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[1]),
        .Q(EXE2_Pc[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[2]),
        .Q(EXE2_Pc[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[3]),
        .Q(EXE2_Pc[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[4]),
        .Q(EXE2_Pc[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[5]),
        .Q(EXE2_Pc[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[6]),
        .Q(EXE2_Pc[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[7]),
        .Q(EXE2_Pc[7]),
        .R(SR));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[0]_i_1 
       (.I0(FETCH_REC_Instr[0]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[0]_0 ),
        .O(FETCH_REC_Instr_next[0]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[10]_i_1 
       (.I0(FETCH_REC_Instr[10]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[10]_1 ),
        .O(FETCH_REC_Instr_next[10]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[11]_i_1 
       (.I0(FETCH_REC_Instr[11]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[11]_0 ),
        .O(FETCH_REC_Instr_next[11]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[12]_i_1 
       (.I0(FETCH_REC_Instr[12]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[12]_0 ),
        .O(FETCH_REC_Instr_next[12]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[13]_i_1 
       (.I0(FETCH_REC_Instr[13]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[13]_0 ),
        .O(FETCH_REC_Instr_next[13]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[14]_i_1 
       (.I0(FETCH_REC_Instr[14]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[14]_0 ),
        .O(FETCH_REC_Instr_next[14]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \FETCH_REC_Instr[15]_i_10__0 
       (.I0(EXE1_Instr[2]),
        .I1(\FETCH_REC_Instr[15]_i_8__0_6 ),
        .I2(\cur_state_reg[0]_1 [0]),
        .I3(\FETCH_REC_Instr[15]_i_8__0_7 ),
        .O(\FETCH_REC_Instr[15]_i_10__0_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \FETCH_REC_Instr[15]_i_11__0 
       (.I0(EXE1_Instr[5]),
        .I1(\FETCH_REC_Instr[15]_i_8__0_10 ),
        .I2(\cur_state_reg[0]_1 [0]),
        .I3(\FETCH_REC_Instr[15]_i_8__0_11 ),
        .O(\FETCH_REC_Instr[15]_i_11__0_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \FETCH_REC_Instr[15]_i_12 
       (.I0(EXE1_Instr[1]),
        .I1(\FETCH_REC_Instr[15]_i_8__0_0 ),
        .I2(\cur_state_reg[0]_1 [0]),
        .I3(\FETCH_REC_Instr[15]_i_8__0_1 ),
        .O(\FETCH_REC_Instr[15]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \FETCH_REC_Instr[15]_i_13 
       (.I0(EXE1_Instr[6]),
        .I1(\FETCH_REC_Instr[15]_i_8__0_4 ),
        .I2(\cur_state_reg[0]_1 [0]),
        .I3(\FETCH_REC_Instr[15]_i_8__0_5 ),
        .O(\FETCH_REC_Instr[15]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \FETCH_REC_Instr[15]_i_14 
       (.I0(EXE1_Instr[7]),
        .I1(\FETCH_REC_Instr[15]_i_8__0_2 ),
        .I2(\cur_state_reg[0]_1 [0]),
        .I3(\FETCH_REC_Instr[15]_i_8__0_3 ),
        .O(\FETCH_REC_Instr[15]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[15]_i_2 
       (.I0(FETCH_REC_Instr[15]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[15]_0 ),
        .O(FETCH_REC_Instr_next[15]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \FETCH_REC_Instr[15]_i_5 
       (.I0(\EXE2_Instr[15]_i_2_n_0 ),
        .I1(p_0_in_0[2]),
        .I2(p_0_in_0[1]),
        .I3(p_0_in_0[0]),
        .O(\FETCH_REC_Instr[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2222222200000020)) 
    \FETCH_REC_Instr[15]_i_7 
       (.I0(EXE1_Instr_valid_reg_0),
        .I1(\old_grant[0]_i_7_n_0 ),
        .I2(p_0_in_0[1]),
        .I3(\FETCH_REC_Instr[15]_i_8__0_n_0 ),
        .I4(\old_grant[0]_i_4_n_0 ),
        .I5(p_0_in_0[0]),
        .O(EXE1_Instr_valid_reg_5));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FETCH_REC_Instr[15]_i_8__0 
       (.I0(\FETCH_REC_Instr[15]_i_9__0_n_0 ),
        .I1(\FETCH_REC_Instr[15]_i_10__0_n_0 ),
        .I2(\FETCH_REC_Instr[15]_i_11__0_n_0 ),
        .I3(\FETCH_REC_Instr[15]_i_12_n_0 ),
        .I4(\FETCH_REC_Instr[15]_i_13_n_0 ),
        .I5(\FETCH_REC_Instr[15]_i_14_n_0 ),
        .O(\FETCH_REC_Instr[15]_i_8__0_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \FETCH_REC_Instr[15]_i_9__0 
       (.I0(EXE1_Instr[3]),
        .I1(\FETCH_REC_Instr[15]_i_8__0_8 ),
        .I2(\cur_state_reg[0]_1 [0]),
        .I3(\FETCH_REC_Instr[15]_i_8__0_9 ),
        .O(\FETCH_REC_Instr[15]_i_9__0_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[1]_i_1 
       (.I0(FETCH_REC_Instr[1]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[1]_0 ),
        .O(FETCH_REC_Instr_next[1]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[2]_i_1 
       (.I0(FETCH_REC_Instr[2]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[2]_0 ),
        .O(FETCH_REC_Instr_next[2]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[3]_i_1 
       (.I0(FETCH_REC_Instr[3]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[3]_0 ),
        .O(FETCH_REC_Instr_next[3]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[4]_i_1 
       (.I0(FETCH_REC_Instr[4]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[4]_0 ),
        .O(FETCH_REC_Instr_next[4]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[5]_i_1 
       (.I0(FETCH_REC_Instr[5]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[5]_0 ),
        .O(FETCH_REC_Instr_next[5]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[6]_i_1 
       (.I0(FETCH_REC_Instr[6]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[6]_0 ),
        .O(FETCH_REC_Instr_next[6]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[7]_i_1 
       (.I0(FETCH_REC_Instr[7]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[7]_0 ),
        .O(FETCH_REC_Instr_next[7]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[8]_i_1 
       (.I0(FETCH_REC_Instr[8]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[8]_1 ),
        .O(FETCH_REC_Instr_next[8]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[9]_i_1 
       (.I0(FETCH_REC_Instr[9]),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[9]_0 ),
        .O(FETCH_REC_Instr_next[9]));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[0]),
        .Q(FETCH_REC_Instr[0]),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \FETCH_REC_Instr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[10]),
        .Q(FETCH_REC_Instr[10]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[11]),
        .Q(FETCH_REC_Instr[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[12]),
        .Q(FETCH_REC_Instr[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[13]),
        .Q(FETCH_REC_Instr[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[14]),
        .Q(FETCH_REC_Instr[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[15]),
        .Q(FETCH_REC_Instr[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[1]),
        .Q(FETCH_REC_Instr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[2]),
        .Q(FETCH_REC_Instr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[3]),
        .Q(FETCH_REC_Instr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[4]),
        .Q(FETCH_REC_Instr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[5]),
        .Q(FETCH_REC_Instr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[6]),
        .Q(FETCH_REC_Instr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[7]),
        .Q(FETCH_REC_Instr[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[8]),
        .Q(FETCH_REC_Instr[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[9]),
        .Q(FETCH_REC_Instr[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    FETCH_REC_Instr_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_7),
        .Q(FETCH_REC_Instr_valid_reg_0),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[0]),
        .Q(FETCH_REC_Pc[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[1]),
        .Q(FETCH_REC_Pc[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[2]),
        .Q(FETCH_REC_Pc[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[3]),
        .Q(FETCH_REC_Pc[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[4]),
        .Q(FETCH_REC_Pc[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[5]),
        .Q(FETCH_REC_Pc[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[6]),
        .Q(FETCH_REC_Pc[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[7]),
        .Q(FETCH_REC_Pc[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    FETCH_REC_has_to_save_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(E),
        .Q(FETCH_REC_has_to_save),
        .R(SR));
  arbiter_2_rr_9 arbiter_output_pc_port
       (.DINADIN(DINADIN),
        .E(arbiter_output_pc_port_n_5),
        .\EXE1_Instr_reg[10] (\EXE1_Instr_reg[10]_0 ),
        .\EXE1_Instr_reg[8] (EXE2_Instr_valid9_out),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg_2),
        .EXE1_Instr_valid_reg_0(p_12_in),
        .EXE1_Instr_valid_reg_1(arbiter_output_pc_port_n_7),
        .EXE1_Instr_valid_reg_2(arbiter_output_pc_port_n_8),
        .EXE1_Instr_valid_reg_3(EXE1_Instr_valid_reg_0),
        .EXE1_Instr_valid_reg_4(FETCH_REC_Instr_valid_reg_0),
        .\EXE2_Instr_reg[0] (\EXE2_Instr_reg[0]_0 ),
        .\EXE2_Instr_reg[15] (\EXE2_Instr[15]_i_2_n_0 ),
        .\EXE2_Instr_reg[1] (\EXE2_Instr_reg[1]_0 ),
        .\EXE2_Instr_reg[2] (\EXE2_Instr_reg[2]_0 ),
        .\EXE2_Instr_reg[3] (\EXE2_Instr_reg[3]_0 ),
        .\EXE2_Instr_reg[4] (\EXE2_Instr_reg[4]_0 ),
        .\EXE2_Instr_reg[5] (\EXE2_Instr_reg[5]_0 ),
        .\EXE2_Instr_reg[6] (\EXE2_Instr_reg[6]_0 ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg(arbiter_output_pc_port_n_39),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_i_2_n_0),
        .\EXE2_Pc_reg[7] (\EXE2_Pc_reg[7]_0 ),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg_1),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg_2),
        .FETCH_REC_Instr_valid_reg_1(\FETCH_REC_Instr[15]_i_5_n_0 ),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid_reg_3),
        .Q(p_0_in_0),
        .SR(SR),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(EXE1_Instr_valid_reg_3),
        .content_reg_bram_0_1(content_reg_bram_0_0),
        .content_reg_bram_0_10(content_reg_bram_0_9),
        .content_reg_bram_0_11({\EXE2_Instr_reg_n_0_[6] ,\EXE2_Instr_reg_n_0_[5] ,\EXE2_Instr_reg_n_0_[4] ,\EXE2_Instr_reg_n_0_[2] ,\EXE2_Instr_reg_n_0_[1] ,\EXE2_Instr_reg_n_0_[0] }),
        .content_reg_bram_0_12(content_reg_bram_0_i_53_n_0),
        .content_reg_bram_0_13(content_reg_bram_0_i_52_n_0),
        .content_reg_bram_0_14(content_reg_bram_0_i_51_n_0),
        .content_reg_bram_0_15(content_reg_bram_0_i_49_n_0),
        .content_reg_bram_0_16(content_reg_bram_0_i_50_n_0),
        .content_reg_bram_0_17(content_reg_bram_0_i_48_n_0),
        .content_reg_bram_0_18(content_reg_bram_0_i_47_n_0),
        .content_reg_bram_0_19(content_reg_bram_0_i_46_n_0),
        .content_reg_bram_0_2(content_reg_bram_0_1),
        .content_reg_bram_0_20(content_reg_bram_0_i_44_n_0),
        .content_reg_bram_0_21(content_reg_bram_0_i_45_n_0),
        .content_reg_bram_0_3(content_reg_bram_0_2),
        .content_reg_bram_0_4(content_reg_bram_0_3),
        .content_reg_bram_0_5(content_reg_bram_0_4),
        .content_reg_bram_0_6(content_reg_bram_0_5),
        .content_reg_bram_0_7(content_reg_bram_0_6),
        .content_reg_bram_0_8(content_reg_bram_0_7),
        .content_reg_bram_0_9(content_reg_bram_0_8),
        .curState(curState),
        .\curState_reg[0] (\curState_reg[0] ),
        .\curState_reg[0]_0 (\curState_reg[0]_0 ),
        .\curState_reg[0]_1 (\curState_reg[0]_1 ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .fifo_even_data_in_ready(fifo_even_data_in_ready),
        .fifo_odd_data_in_valid(fifo_odd_data_in_valid),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .\head_reg[0] (\head_reg[0] ),
        .\head_reg[0]_0 (\head_reg[0]_0 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .old_grant(old_grant),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\EXE2_Instr_reg[13]_0 ),
        .\old_grant_reg[0]_1 (\old_grant[0]_i_2_n_0 ),
        .rst_IBUF(rst_IBUF),
        .\switch2channel\.ready_0 (\switch2channel\.ready_0 ),
        .\tail_reg[4] (\tail_reg[4] ));
  LUT3 #(
    .INIT(8'h45)) 
    content_reg_bram_0_i_19__4
       (.I0(\EXE2_Instr_reg[13]_0 ),
        .I1(\old_grant[0]_i_2_n_0 ),
        .I2(EXE1_Instr_valid_reg_0),
        .O(EXE1_Instr_valid_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    content_reg_bram_0_i_1__1
       (.I0(EXE1_Instr_valid_reg_1),
        .I1(EXE1_Instr_valid_reg_3),
        .I2(\tail_reg[0] ),
        .O(\switch2channel\.valid ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h4545BA00)) 
    content_reg_bram_0_i_22
       (.I0(\EXE2_Instr_reg[13]_0 ),
        .I1(\old_grant[0]_i_2_n_0 ),
        .I2(EXE1_Instr_valid_reg_0),
        .I3(\tail_reg[0] ),
        .I4(content_reg_bram_0_10),
        .O(EXE1_Instr_valid_reg_3));
  LUT4 #(
    .INIT(16'h06F6)) 
    content_reg_bram_0_i_44
       (.I0(EXE2_Pc[7]),
        .I1(content_reg_bram_0_i_58__0_n_0),
        .I2(\EXE2_Instr_reg[13]_0 ),
        .I3(\EXE2_Instr_reg_n_0_[7] ),
        .O(content_reg_bram_0_i_44_n_0));
  LUT5 #(
    .INIT(32'h0087FF87)) 
    content_reg_bram_0_i_45
       (.I0(content_reg_bram_0_i_59__0_n_0),
        .I1(EXE1_Pc[6]),
        .I2(EXE1_Pc[7]),
        .I3(content_reg_bram_0_i_60_n_0),
        .I4(EXE1_Instr[7]),
        .O(content_reg_bram_0_i_45_n_0));
  LUT4 #(
    .INIT(16'h7447)) 
    content_reg_bram_0_i_46
       (.I0(EXE1_Instr[6]),
        .I1(content_reg_bram_0_i_60_n_0),
        .I2(EXE1_Pc[6]),
        .I3(content_reg_bram_0_i_59__0_n_0),
        .O(content_reg_bram_0_i_46_n_0));
  LUT4 #(
    .INIT(16'h7447)) 
    content_reg_bram_0_i_47
       (.I0(EXE1_Instr[5]),
        .I1(content_reg_bram_0_i_60_n_0),
        .I2(EXE1_Pc[5]),
        .I3(content_reg_bram_0_i_61__0_n_0),
        .O(content_reg_bram_0_i_47_n_0));
  LUT4 #(
    .INIT(16'h7447)) 
    content_reg_bram_0_i_48
       (.I0(EXE1_Instr[4]),
        .I1(content_reg_bram_0_i_60_n_0),
        .I2(EXE1_Pc[4]),
        .I3(content_reg_bram_0_i_62__0_n_0),
        .O(content_reg_bram_0_i_48_n_0));
  LUT6 #(
    .INIT(64'h7447474747474747)) 
    content_reg_bram_0_i_49
       (.I0(\EXE2_Instr_reg_n_0_[3] ),
        .I1(\EXE2_Instr_reg[13]_0 ),
        .I2(EXE2_Pc[3]),
        .I3(EXE2_Pc[0]),
        .I4(EXE2_Pc[1]),
        .I5(EXE2_Pc[2]),
        .O(content_reg_bram_0_i_49_n_0));
  LUT6 #(
    .INIT(64'h7447474747474747)) 
    content_reg_bram_0_i_50
       (.I0(EXE1_Instr[3]),
        .I1(content_reg_bram_0_i_60_n_0),
        .I2(EXE1_Pc[3]),
        .I3(EXE1_Pc[2]),
        .I4(EXE1_Pc[0]),
        .I5(EXE1_Pc[1]),
        .O(content_reg_bram_0_i_50_n_0));
  LUT5 #(
    .INIT(32'h74474747)) 
    content_reg_bram_0_i_51
       (.I0(EXE1_Instr[2]),
        .I1(content_reg_bram_0_i_60_n_0),
        .I2(EXE1_Pc[2]),
        .I3(EXE1_Pc[1]),
        .I4(EXE1_Pc[0]),
        .O(content_reg_bram_0_i_51_n_0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h55C3)) 
    content_reg_bram_0_i_52
       (.I0(EXE1_Instr[1]),
        .I1(EXE1_Pc[0]),
        .I2(EXE1_Pc[1]),
        .I3(content_reg_bram_0_i_60_n_0),
        .O(content_reg_bram_0_i_52_n_0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h3A)) 
    content_reg_bram_0_i_53
       (.I0(EXE1_Pc[0]),
        .I1(EXE1_Instr[0]),
        .I2(content_reg_bram_0_i_60_n_0),
        .O(content_reg_bram_0_i_53_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    content_reg_bram_0_i_58__0
       (.I0(EXE2_Pc[4]),
        .I1(EXE2_Pc[3]),
        .I2(content_reg_bram_0_i_63__0_n_0),
        .I3(EXE2_Pc[5]),
        .I4(EXE2_Pc[6]),
        .O(content_reg_bram_0_i_58__0_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    content_reg_bram_0_i_59__0
       (.I0(EXE1_Pc[4]),
        .I1(EXE1_Pc[2]),
        .I2(EXE1_Pc[0]),
        .I3(EXE1_Pc[1]),
        .I4(EXE1_Pc[3]),
        .I5(EXE1_Pc[5]),
        .O(content_reg_bram_0_i_59__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    content_reg_bram_0_i_60
       (.I0(\EXE2_Instr[15]_i_2_n_0 ),
        .I1(p_0_in_0[1]),
        .I2(p_0_in_0[2]),
        .I3(p_0_in_0[0]),
        .O(content_reg_bram_0_i_60_n_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    content_reg_bram_0_i_61__0
       (.I0(EXE1_Pc[3]),
        .I1(EXE1_Pc[1]),
        .I2(EXE1_Pc[0]),
        .I3(EXE1_Pc[2]),
        .I4(EXE1_Pc[4]),
        .O(content_reg_bram_0_i_61__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    content_reg_bram_0_i_62__0
       (.I0(EXE1_Pc[2]),
        .I1(EXE1_Pc[0]),
        .I2(EXE1_Pc[1]),
        .I3(EXE1_Pc[3]),
        .O(content_reg_bram_0_i_62__0_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_63__0
       (.I0(EXE2_Pc[2]),
        .I1(EXE2_Pc[1]),
        .I2(EXE2_Pc[0]),
        .O(content_reg_bram_0_i_63__0_n_0));
  LUT6 #(
    .INIT(64'h00000000883B880B)) 
    \cur_state[0]_i_1 
       (.I0(\cur_state_reg[0]_7 ),
        .I1(\cur_state_reg[0]_0 [1]),
        .I2(\cur_state_reg[0]_0 [2]),
        .I3(\cur_state_reg[0]_0 [0]),
        .I4(\cur_state[0]_i_3_n_0 ),
        .I5(\cur_state_reg[0]_8 ),
        .O(\cur_state_reg[0] [0]));
  LUT6 #(
    .INIT(64'hAFFE0000AFFEAFFE)) 
    \cur_state[0]_i_3 
       (.I0(\cur_state[2]_i_18_n_0 ),
        .I1(\cur_state_reg[0]_11 ),
        .I2(p_0_in_0[2]),
        .I3(p_0_in_0[1]),
        .I4(\cur_state_reg[0]_10 ),
        .I5(\cur_state_reg[0]_9 ),
        .O(\cur_state[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h4500FF45)) 
    \cur_state[0]_i_5 
       (.I0(\EXE2_Instr_reg[13]_0 ),
        .I1(\old_grant[0]_i_2_n_0 ),
        .I2(EXE1_Instr_valid_reg_0),
        .I3(\tail_reg[0] ),
        .I4(content_reg_bram_0_10),
        .O(EXE1_Instr_valid_reg_4));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h04000404)) 
    \cur_state[1]_i_1 
       (.I0(\cur_state_reg[0]_0 [1]),
        .I1(\cur_state_reg[0]_0 [2]),
        .I2(\cur_state_reg[0]_0 [0]),
        .I3(\EXE1_Instr_reg[8]_0 ),
        .I4(CO),
        .O(\cur_state_reg[0] [1]));
  LUT6 #(
    .INIT(64'hFFFFFFFF4444FF4F)) 
    \cur_state[2]_i_1 
       (.I0(\cur_state[2]_i_3_n_0 ),
        .I1(\cur_state[2]_i_4_n_0 ),
        .I2(\cur_state_reg[0]_3 ),
        .I3(\cur_state_reg[0]_4 ),
        .I4(\cur_state_reg[0]_5 ),
        .I5(\cur_state_reg[0]_6 ),
        .O(\cur_state_reg[2] ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \cur_state[2]_i_16 
       (.I0(\cur_state[2]_i_30_n_0 ),
        .I1(\cur_state[2]_i_9_0 ),
        .I2(\old_grant[0]_i_2_0 ),
        .I3(\old_grant[0]_i_2_1 ),
        .I4(\old_grant[0]_i_2_2 ),
        .I5(\old_grant[0]_i_2_3 ),
        .O(\cur_state[2]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cur_state[2]_i_17 
       (.I0(p_0_in_0[2]),
        .I1(p_0_in_0[1]),
        .O(\cur_state[2]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \cur_state[2]_i_18 
       (.I0(p_0_in_0[0]),
        .I1(\EXE2_Instr[15]_i_2_n_0 ),
        .O(\cur_state[2]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h00FF0EF0)) 
    \cur_state[2]_i_2 
       (.I0(CO),
        .I1(\EXE1_Instr_reg[8]_0 ),
        .I2(\cur_state_reg[0]_0 [0]),
        .I3(\cur_state_reg[0]_0 [2]),
        .I4(\cur_state_reg[0]_0 [1]),
        .O(\cur_state_reg[0] [2]));
  LUT4 #(
    .INIT(16'hDDDF)) 
    \cur_state[2]_i_3 
       (.I0(\cur_state_reg[0]_0 [2]),
        .I1(\cur_state_reg[0]_0 [1]),
        .I2(\EXE1_Instr_reg[8]_0 ),
        .I3(\cur_state_reg[0]_7 ),
        .O(\cur_state[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \cur_state[2]_i_30 
       (.I0(p_0_in_0[2]),
        .I1(p_0_in_0[1]),
        .O(\cur_state[2]_i_30_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEEF)) 
    \cur_state[2]_i_4 
       (.I0(CO),
        .I1(\EXE1_Instr_reg[8]_0 ),
        .I2(\cur_state_reg[0]_1 [1]),
        .I3(O),
        .I4(\cur_state_reg[0]_2 ),
        .O(\cur_state[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h2222FFF2FFFFFFFF)) 
    \cur_state[2]_i_9 
       (.I0(\cur_state_reg[0]_9 ),
        .I1(\cur_state_reg[0]_10 ),
        .I2(\cur_state[2]_i_16_n_0 ),
        .I3(\cur_state[2]_i_17_n_0 ),
        .I4(\cur_state[2]_i_18_n_0 ),
        .I5(\cur_state_reg[2]_0 ),
        .O(\EXE1_Instr_reg[8]_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \old_grant[0]_i_17 
       (.I0(EXE1_Instr[15]),
        .I1(EXE1_Instr[11]),
        .I2(EXE1_Instr[12]),
        .I3(EXE1_Instr[13]),
        .I4(EXE1_Instr[14]),
        .O(\old_grant[0]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF55545555)) 
    \old_grant[0]_i_2 
       (.I0(p_0_in_0[0]),
        .I1(\old_grant[0]_i_4_n_0 ),
        .I2(\old_grant[0]_i_5__0_n_0 ),
        .I3(\old_grant[0]_i_6__0_n_0 ),
        .I4(p_0_in_0[1]),
        .I5(\old_grant[0]_i_7_n_0 ),
        .O(\old_grant[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \old_grant[0]_i_3__1 
       (.I0(\old_grant[0]_i_8_n_0 ),
        .I1(sel0[5]),
        .I2(sel0[6]),
        .I3(sel0[0]),
        .I4(sel0[2]),
        .I5(EXE2_Instr_valid),
        .O(\EXE2_Instr_reg[13]_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \old_grant[0]_i_4 
       (.I0(\FETCH_REC_Instr[15]_i_7_0 ),
        .I1(EXE1_Instr[4]),
        .I2(\FETCH_REC_Instr[15]_i_7_1 ),
        .I3(EXE1_Instr[0]),
        .O(\old_grant[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \old_grant[0]_i_5__0 
       (.I0(\old_grant[0]_i_2_2 ),
        .I1(EXE1_Instr[5]),
        .I2(EXE1_Instr[2]),
        .I3(\old_grant[0]_i_2_1 ),
        .I4(EXE1_Instr[3]),
        .I5(\old_grant[0]_i_2_3 ),
        .O(\old_grant[0]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \old_grant[0]_i_6__0 
       (.I0(EXE1_Instr[7]),
        .I1(\old_grant[0]_i_2_4 ),
        .I2(EXE1_Instr[6]),
        .I3(\old_grant[0]_i_2_5 ),
        .I4(\old_grant[0]_i_2_0 ),
        .I5(EXE1_Instr[1]),
        .O(\old_grant[0]_i_6__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \old_grant[0]_i_7 
       (.I0(p_0_in_0[1]),
        .I1(p_0_in_0[2]),
        .I2(\old_grant[0]_i_17_n_0 ),
        .O(\old_grant[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \old_grant[0]_i_8 
       (.I0(sel0[1]),
        .I1(sel0[7]),
        .I2(sel0[4]),
        .I3(sel0[3]),
        .O(\old_grant[0]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h02A2)) 
    \tail[6]_i_1 
       (.I0(\switch2channel\.ready_0 ),
        .I1(EXE1_Instr_valid_reg_1),
        .I2(EXE1_Instr_valid_reg_3),
        .I3(\tail_reg[0] ),
        .O(p_0_in));
endmodule

module switch
   (\channel_old_latency_reg[5] ,
    DI,
    S);
  output [0:0]\channel_old_latency_reg[5] ;
  input [3:0]DI;
  input [3:0]S;

  wire [3:0]DI;
  wire [3:0]S;
  wire [0:0]\channel_old_latency_reg[5] ;
  wire min_latency1_carry_n_5;
  wire min_latency1_carry_n_6;
  wire min_latency1_carry_n_7;
  wire [7:4]NLW_min_latency1_carry_CO_UNCONNECTED;
  wire [7:0]NLW_min_latency1_carry_O_UNCONNECTED;

  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    min_latency1_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({NLW_min_latency1_carry_CO_UNCONNECTED[7:4],\channel_old_latency_reg[5] ,min_latency1_carry_n_5,min_latency1_carry_n_6,min_latency1_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,DI}),
        .O(NLW_min_latency1_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,S}));
endmodule

(* ORIG_REF_NAME = "switch" *) 
module switch_4
   (\channel_old_latency_reg[0] ,
    DI,
    S);
  output [0:0]\channel_old_latency_reg[0] ;
  input [2:0]DI;
  input [3:0]S;

  wire [2:0]DI;
  wire [3:0]S;
  wire [0:0]\channel_old_latency_reg[0] ;
  wire min_latency1_carry_n_5;
  wire min_latency1_carry_n_6;
  wire min_latency1_carry_n_7;
  wire [7:4]NLW_min_latency1_carry_CO_UNCONNECTED;
  wire [7:0]NLW_min_latency1_carry_O_UNCONNECTED;

  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    min_latency1_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({NLW_min_latency1_carry_CO_UNCONNECTED[7:4],\channel_old_latency_reg[0] ,min_latency1_carry_n_5,min_latency1_carry_n_6,min_latency1_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b1,DI}),
        .O(NLW_min_latency1_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,S}));
endmodule

module topology_token_ring
   (SR,
    bram_r_valid,
    ADDRARDADDR,
    E,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ,
    \cur_state_reg[0] ,
    \cur_state_reg[2] ,
    \FSM_sequential_status_register_reg[0] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_cc_pointer_reg[2]_1 ,
    \cur_cc_pointer_reg[2]_2 ,
    \cur_cc_pointer_reg[2]_3 ,
    \cur_cc_pointer_reg[2]_4 ,
    \cur_cc_pointer_reg[2]_5 ,
    \cur_cc_pointer_reg[2]_6 ,
    cur_is_even_character_reg,
    clk_IBUF_BUFG,
    memory_data,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    address_register_IBUF,
    memory_addr_from_coprocessor_ready,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    \FSM_sequential_status_register_reg[0]_2 ,
    cmd_register_IBUF,
    D,
    rst_IBUF,
    cur_is_even_character,
    O,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    CO,
    \cur_state_reg[0]_0 ,
    \cur_state_reg[0]_1 ,
    start_cc_pointer_register_IBUF,
    cur_is_even_character_reg_0,
    \cur_state_reg[0]_2 ,
    \cur_state[2]_i_9 ,
    \cur_state[2]_i_9_0 ,
    \FETCH_REC_Instr[15]_i_14 );
  output [0:0]SR;
  output bram_r_valid;
  output [8:0]ADDRARDADDR;
  output [0:0]E;
  output \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  output [2:0]\cur_state_reg[0] ;
  output [0:0]\cur_state_reg[2] ;
  output [0:0]\FSM_sequential_status_register_reg[0] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_cc_pointer_reg[2]_1 ;
  output \cur_cc_pointer_reg[2]_2 ;
  output \cur_cc_pointer_reg[2]_3 ;
  output \cur_cc_pointer_reg[2]_4 ;
  output \cur_cc_pointer_reg[2]_5 ;
  output \cur_cc_pointer_reg[2]_6 ;
  output cur_is_even_character_reg;
  input clk_IBUF_BUFG;
  input [63:0]memory_data;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [2:0]Q;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [3:0]address_register_IBUF;
  input memory_addr_from_coprocessor_ready;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \FSM_sequential_status_register_reg[0]_0 ;
  input [2:0]\FSM_sequential_status_register_reg[0]_1 ;
  input \FSM_sequential_status_register_reg[0]_2 ;
  input [31:0]cmd_register_IBUF;
  input [2:0]D;
  input rst_IBUF;
  input cur_is_even_character;
  input [5:0]O;
  input [3:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input [0:0]CO;
  input \cur_state_reg[0]_0 ;
  input \cur_state_reg[0]_1 ;
  input [5:0]start_cc_pointer_register_IBUF;
  input cur_is_even_character_reg_0;
  input \cur_state_reg[0]_2 ;
  input \cur_state[2]_i_9 ;
  input \cur_state[2]_i_9_0 ;
  input [63:0]\FETCH_REC_Instr[15]_i_14 ;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [2:0]D;
  wire [0:0]E;
  wire [63:0]\FETCH_REC_Instr[15]_i_14 ;
  wire [0:0]\FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire [2:0]\FSM_sequential_status_register_reg[0]_1 ;
  wire \FSM_sequential_status_register_reg[0]_2 ;
  wire [5:0]O;
  wire [2:0]Q;
  wire [0:0]SR;
  wire [0:0]\aChannel/fifo_channel/p_0_in ;
  wire [3:0]address_register_IBUF;
  wire \anEngine/anEngine/g.aregex_cpu/EXE1_Instr_valid ;
  wire \anEngine/anEngine/g.aregex_cpu/EXE2_Instr_valid ;
  wire \anEngine/anEngine/g.aregex_cpu/FETCH_REC_Instr_valid ;
  wire [0:0]\arbitration_logic/old_grant ;
  wire bram_r_valid;
  wire [6:0]channel_old_latency_next;
  wire [6:0]channel_old_latency_next_1;
  wire clk_IBUF_BUFG;
  wire [31:0]cmd_register_IBUF;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_cc_pointer_reg[2]_1 ;
  wire \cur_cc_pointer_reg[2]_2 ;
  wire \cur_cc_pointer_reg[2]_3 ;
  wire \cur_cc_pointer_reg[2]_4 ;
  wire \cur_cc_pointer_reg[2]_5 ;
  wire \cur_cc_pointer_reg[2]_6 ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire \cur_state[2]_i_9 ;
  wire \cur_state[2]_i_9_0 ;
  wire [2:0]\cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire [0:0]\cur_state_reg[2] ;
  wire \genblk1[0].engine_and_station_i_n_0 ;
  wire \genblk1[0].engine_and_station_i_n_13 ;
  wire \genblk1[0].engine_and_station_i_n_17 ;
  wire \genblk1[0].engine_and_station_i_n_18 ;
  wire \genblk1[0].engine_and_station_i_n_19 ;
  wire \genblk1[0].engine_and_station_i_n_20 ;
  wire \genblk1[0].engine_and_station_i_n_21 ;
  wire \genblk1[0].engine_and_station_i_n_22 ;
  wire \genblk1[0].engine_and_station_i_n_23 ;
  wire \genblk1[0].engine_and_station_i_n_24 ;
  wire \genblk1[0].engine_and_station_i_n_25 ;
  wire \genblk1[0].engine_and_station_i_n_26 ;
  wire \genblk1[0].engine_and_station_i_n_27 ;
  wire \genblk1[0].engine_and_station_i_n_28 ;
  wire \genblk1[0].engine_and_station_i_n_29 ;
  wire \genblk1[0].engine_and_station_i_n_30 ;
  wire \genblk1[0].engine_and_station_i_n_31 ;
  wire \genblk1[0].engine_and_station_i_n_32 ;
  wire \genblk1[0].engine_and_station_i_n_33 ;
  wire \genblk1[0].engine_and_station_i_n_35 ;
  wire \genblk1[0].engine_and_station_i_n_36 ;
  wire \genblk1[0].engine_and_station_i_n_50 ;
  wire \genblk1[0].engine_and_station_i_n_51 ;
  wire \genblk1[0].engine_and_station_i_n_54 ;
  wire \genblk1[0].engine_and_station_i_n_55 ;
  wire \genblk1[0].engine_and_station_i_n_56 ;
  wire \genblk1[0].engine_and_station_i_n_57 ;
  wire \genblk1[0].engine_and_station_i_n_58 ;
  wire \genblk1[0].engine_and_station_i_n_59 ;
  wire \genblk1[0].engine_and_station_i_n_60 ;
  wire \genblk1[0].engine_and_station_i_n_61 ;
  wire \genblk1[0].engine_and_station_i_n_62 ;
  wire \genblk1[0].engine_and_station_i_n_63 ;
  wire \genblk1[0].engine_and_station_i_n_64 ;
  wire \genblk1[0].engine_and_station_i_n_65 ;
  wire \genblk1[0].engine_and_station_i_n_66 ;
  wire \genblk1[0].engine_and_station_i_n_67 ;
  wire \genblk1[0].engine_and_station_i_n_68 ;
  wire \genblk1[0].engine_and_station_i_n_69 ;
  wire \genblk1[0].engine_and_station_i_n_70 ;
  wire \genblk1[0].engine_and_station_i_n_9 ;
  wire \genblk1[1].engine_and_station_i_n_13 ;
  wire \genblk1[1].engine_and_station_i_n_14 ;
  wire \genblk1[1].engine_and_station_i_n_22 ;
  wire \genblk1[1].engine_and_station_i_n_23 ;
  wire \genblk1[1].engine_and_station_i_n_24 ;
  wire \genblk1[1].engine_and_station_i_n_25 ;
  wire \genblk1[1].engine_and_station_i_n_35 ;
  wire \genblk1[1].engine_and_station_i_n_36 ;
  wire \genblk1[1].engine_and_station_i_n_37 ;
  wire \genblk1[1].engine_and_station_i_n_38 ;
  wire \genblk1[1].engine_and_station_i_n_39 ;
  wire \genblk1[1].engine_and_station_i_n_40 ;
  wire \genblk1[1].engine_and_station_i_n_41 ;
  wire \genblk1[1].engine_and_station_i_n_42 ;
  wire \genblk1[1].engine_and_station_i_n_43 ;
  wire \genblk1[1].engine_and_station_i_n_45 ;
  wire \genblk1[1].engine_and_station_i_n_46 ;
  wire \genblk1[1].engine_and_station_i_n_47 ;
  wire \genblk1[1].engine_and_station_i_n_48 ;
  wire \genblk1[1].engine_and_station_i_n_49 ;
  wire \genblk1[1].engine_and_station_i_n_50 ;
  wire \genblk1[1].engine_and_station_i_n_51 ;
  wire \genblk1[1].engine_and_station_i_n_52 ;
  wire \genblk1[1].engine_and_station_i_n_53 ;
  wire \genblk1[1].engine_and_station_i_n_54 ;
  wire \genblk1[1].engine_and_station_i_n_56 ;
  wire \genblk1[1].engine_and_station_i_n_57 ;
  wire \genblk1[1].engine_and_station_i_n_60 ;
  wire \genblk1[1].engine_and_station_i_n_61 ;
  wire \genblk1[1].engine_and_station_i_n_62 ;
  wire \genblk1[1].engine_and_station_i_n_63 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire [3:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ;
  wire [0:0]in_ready_packed;
  wire memory_addr_from_coprocessor_ready;
  wire [0:0]\memory_bb\.addr ;
  wire [63:0]memory_data;
  wire rst_IBUF;
  wire [5:0]start_cc_pointer_register_IBUF;
  wire [8:0]\switch2channel\.data ;
  wire [8:1]\switch2channel\.data_0 ;
  wire \switch2channel\.ready ;

  arbiter_rr_n__parameterized0 arbiter_tree_to_cope_with_memory_contention
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .in_ready_packed(in_ready_packed),
        .old_grant(\arbitration_logic/old_grant ),
        .\old_grant_reg[0] (SR));
  engine_and_station \genblk1[0].engine_and_station_i 
       (.CO(CO),
        .D({channel_old_latency_next[6:4],\genblk1[0].engine_and_station_i_n_9 ,channel_old_latency_next[2:0]}),
        .DINADIN(\switch2channel\.data_0 ),
        .E(\aChannel/fifo_channel/p_0_in ),
        .\EXE1_Instr_reg[8] (\genblk1[0].engine_and_station_i_n_17 ),
        .EXE1_Instr_valid(\anEngine/anEngine/g.aregex_cpu/EXE1_Instr_valid ),
        .EXE1_Instr_valid_reg(\genblk1[0].engine_and_station_i_n_13 ),
        .EXE1_Instr_valid_reg_0(\genblk1[0].engine_and_station_i_n_18 ),
        .EXE1_Instr_valid_reg_1(\genblk1[0].engine_and_station_i_n_35 ),
        .\EXE2_Instr_reg[0] (\genblk1[0].engine_and_station_i_n_26 ),
        .\EXE2_Instr_reg[1] (\genblk1[0].engine_and_station_i_n_27 ),
        .\EXE2_Instr_reg[2] (\genblk1[0].engine_and_station_i_n_28 ),
        .\EXE2_Instr_reg[3] (\genblk1[0].engine_and_station_i_n_29 ),
        .\EXE2_Instr_reg[4] (\genblk1[0].engine_and_station_i_n_30 ),
        .\EXE2_Instr_reg[5] (\genblk1[0].engine_and_station_i_n_31 ),
        .\EXE2_Instr_reg[6] (\genblk1[0].engine_and_station_i_n_32 ),
        .EXE2_Instr_valid(\anEngine/anEngine/g.aregex_cpu/EXE2_Instr_valid ),
        .\EXE2_Pc_reg[7] (\genblk1[0].engine_and_station_i_n_33 ),
        .\FETCH_REC_Instr[15]_i_14 ({\FETCH_REC_Instr[15]_i_14 [63:58],\FETCH_REC_Instr[15]_i_14 [55:50],\FETCH_REC_Instr[15]_i_14 [47:42],\FETCH_REC_Instr[15]_i_14 [39:34],\FETCH_REC_Instr[15]_i_14 [31:26],\FETCH_REC_Instr[15]_i_14 [23:18],\FETCH_REC_Instr[15]_i_14 [15:10],\FETCH_REC_Instr[15]_i_14 [7:2]}),
        .\FETCH_REC_Instr[15]_i_7 (\cur_cc_pointer_reg[2]_3 ),
        .\FETCH_REC_Instr[15]_i_8__0 (\genblk1[1].engine_and_station_i_n_60 ),
        .\FETCH_REC_Instr[15]_i_8__0_0 (\genblk1[1].engine_and_station_i_n_61 ),
        .FETCH_REC_Instr_valid(\anEngine/anEngine/g.aregex_cpu/FETCH_REC_Instr_valid ),
        .O(O[0]),
        .WEBWE(\genblk1[0].engine_and_station_i_n_0 ),
        .\channel_old_latency_reg[6] (channel_old_latency_next_1),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\cmd_register[1] (SR),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_bram_0(\switch2channel\.data ),
        .content_reg_bram_0_0(\genblk1[0].engine_and_station_i_n_62 ),
        .content_reg_bram_0_1(\genblk1[0].engine_and_station_i_n_63 ),
        .content_reg_bram_0_10(\genblk1[1].engine_and_station_i_n_36 ),
        .content_reg_bram_0_11(\genblk1[1].engine_and_station_i_n_37 ),
        .content_reg_bram_0_12(\genblk1[1].engine_and_station_i_n_38 ),
        .content_reg_bram_0_13(\genblk1[1].engine_and_station_i_n_39 ),
        .content_reg_bram_0_14(\genblk1[1].engine_and_station_i_n_40 ),
        .content_reg_bram_0_15(\genblk1[1].engine_and_station_i_n_41 ),
        .content_reg_bram_0_16(\genblk1[1].engine_and_station_i_n_42 ),
        .content_reg_bram_0_17(\genblk1[1].engine_and_station_i_n_43 ),
        .content_reg_bram_0_18(\genblk1[1].engine_and_station_i_n_57 ),
        .content_reg_bram_0_19(\genblk1[1].engine_and_station_i_n_23 ),
        .content_reg_bram_0_2(\genblk1[0].engine_and_station_i_n_64 ),
        .content_reg_bram_0_20(\genblk1[1].engine_and_station_i_n_47 ),
        .content_reg_bram_0_21(\genblk1[1].engine_and_station_i_n_48 ),
        .content_reg_bram_0_22(\genblk1[1].engine_and_station_i_n_49 ),
        .content_reg_bram_0_23(\genblk1[1].engine_and_station_i_n_50 ),
        .content_reg_bram_0_24(\genblk1[1].engine_and_station_i_n_51 ),
        .content_reg_bram_0_25(\genblk1[1].engine_and_station_i_n_52 ),
        .content_reg_bram_0_26(\genblk1[1].engine_and_station_i_n_53 ),
        .content_reg_bram_0_27(\genblk1[1].engine_and_station_i_n_54 ),
        .content_reg_bram_0_3(\genblk1[0].engine_and_station_i_n_65 ),
        .content_reg_bram_0_4(\genblk1[0].engine_and_station_i_n_66 ),
        .content_reg_bram_0_5(\genblk1[0].engine_and_station_i_n_67 ),
        .content_reg_bram_0_6(\genblk1[0].engine_and_station_i_n_68 ),
        .content_reg_bram_0_7(\genblk1[0].engine_and_station_i_n_69 ),
        .content_reg_bram_0_8(\genblk1[0].engine_and_station_i_n_70 ),
        .content_reg_bram_0_9(\genblk1[1].engine_and_station_i_n_35 ),
        .\curState_reg[0] (\genblk1[1].engine_and_station_i_n_14 ),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_1 ),
        .\cur_cc_pointer_reg[2]_1 (\cur_cc_pointer_reg[2]_2 ),
        .\cur_cc_pointer_reg[2]_2 (\cur_cc_pointer_reg[2]_4 ),
        .\cur_cc_pointer_reg[2]_3 (\cur_cc_pointer_reg[2]_5 ),
        .\cur_cc_pointer_reg[2]_4 (\cur_cc_pointer_reg[2]_6 ),
        .\cur_ccs_reg[26] (\genblk1[0].engine_and_station_i_n_54 ),
        .\cur_ccs_reg[27] (\genblk1[0].engine_and_station_i_n_56 ),
        .\cur_ccs_reg[28] (\genblk1[0].engine_and_station_i_n_50 ),
        .\cur_ccs_reg[29] (\genblk1[0].engine_and_station_i_n_58 ),
        .\cur_ccs_reg[58] (\genblk1[0].engine_and_station_i_n_55 ),
        .\cur_ccs_reg[59] (\genblk1[0].engine_and_station_i_n_57 ),
        .\cur_ccs_reg[60] (\genblk1[0].engine_and_station_i_n_51 ),
        .\cur_ccs_reg[61] (\genblk1[0].engine_and_station_i_n_59 ),
        .cur_is_even_character(cur_is_even_character),
        .\cur_state[2]_i_9 (\genblk1[1].engine_and_station_i_n_22 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_9 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\FSM_sequential_status_register_reg[0]_1 ),
        .\cur_state_reg[0]_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\cur_state_reg[0]_2 (\genblk1[1].engine_and_station_i_n_13 ),
        .\cur_state_reg[0]_3 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_4 (\genblk1[1].engine_and_station_i_n_45 ),
        .\cur_state_reg[0]_5 (\cur_state_reg[0]_1 ),
        .\cur_state_reg[0]_6 (\genblk1[1].engine_and_station_i_n_25 ),
        .\cur_state_reg[0]_7 (\genblk1[1].engine_and_station_i_n_63 ),
        .\cur_state_reg[0]_8 (\genblk1[1].engine_and_station_i_n_46 ),
        .\cur_state_reg[0]_9 (\cur_state_reg[0]_2 ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\cur_state_reg[2]_0 (\genblk1[0].engine_and_station_i_n_61 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 ),
        .\head_reg[0] (\genblk1[1].engine_and_station_i_n_24 ),
        .\head_reg[2] (\genblk1[0].engine_and_station_i_n_60 ),
        .\head_reg[3] (\genblk1[0].engine_and_station_i_n_19 ),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .\memory_bb\.addr (\memory_bb\.addr ),
        .memory_data(memory_data),
        .old_grant(\arbitration_logic/old_grant ),
        .\old_grant[0]_i_2 (\cur_cc_pointer_reg[2] ),
        .\old_grant_reg[0] (\genblk1[0].engine_and_station_i_n_20 ),
        .\old_grant_reg[0]_0 (\genblk1[0].engine_and_station_i_n_21 ),
        .\old_grant_reg[0]_1 (\genblk1[0].engine_and_station_i_n_22 ),
        .\old_grant_reg[0]_2 (\genblk1[0].engine_and_station_i_n_23 ),
        .\old_grant_reg[0]_3 (\genblk1[0].engine_and_station_i_n_24 ),
        .\old_grant_reg[0]_4 (\genblk1[0].engine_and_station_i_n_25 ),
        .rst_IBUF(rst_IBUF),
        .\state_cur_reg[0] (\genblk1[1].engine_and_station_i_n_56 ),
        .\switch2channel\.ready (\switch2channel\.ready ),
        .\tail_reg[0] (\genblk1[1].engine_and_station_i_n_62 ),
        .\tail_reg[3] (\genblk1[0].engine_and_station_i_n_36 ));
  engine_and_station_0 \genblk1[1].engine_and_station_i 
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(CO),
        .D(D),
        .DINADIN(\switch2channel\.data_0 ),
        .E(E),
        .\EXE1_Instr_reg[10] (\genblk1[1].engine_and_station_i_n_46 ),
        .\EXE1_Instr_reg[10]_0 (\genblk1[1].engine_and_station_i_n_57 ),
        .\EXE1_Instr_reg[1] (\genblk1[1].engine_and_station_i_n_48 ),
        .\EXE1_Instr_reg[2] (\genblk1[1].engine_and_station_i_n_49 ),
        .\EXE1_Instr_reg[3] (\genblk1[1].engine_and_station_i_n_50 ),
        .\EXE1_Instr_reg[4] (\genblk1[1].engine_and_station_i_n_51 ),
        .\EXE1_Instr_reg[5] (\genblk1[1].engine_and_station_i_n_52 ),
        .\EXE1_Instr_reg[6] (\genblk1[1].engine_and_station_i_n_53 ),
        .\EXE1_Instr_reg[8] (\genblk1[1].engine_and_station_i_n_63 ),
        .EXE1_Instr_valid(\anEngine/anEngine/g.aregex_cpu/EXE1_Instr_valid ),
        .\EXE1_Pc_reg[0] (\genblk1[1].engine_and_station_i_n_47 ),
        .\EXE1_Pc_reg[6] (\genblk1[1].engine_and_station_i_n_54 ),
        .EXE2_Instr_valid(\anEngine/anEngine/g.aregex_cpu/EXE2_Instr_valid ),
        .EXE2_Instr_valid_reg(\genblk1[1].engine_and_station_i_n_23 ),
        .\FETCH_REC_Instr[15]_i_12 ({\FETCH_REC_Instr[15]_i_14 [57:56],\FETCH_REC_Instr[15]_i_14 [49:48],\FETCH_REC_Instr[15]_i_14 [41:40],\FETCH_REC_Instr[15]_i_14 [33:32],\FETCH_REC_Instr[15]_i_14 [25:24],\FETCH_REC_Instr[15]_i_14 [17:16],\FETCH_REC_Instr[15]_i_14 [9:8],\FETCH_REC_Instr[15]_i_14 [1:0]}),
        .\FETCH_REC_Instr[15]_i_8 (\cur_cc_pointer_reg[2]_5 ),
        .\FETCH_REC_Instr[15]_i_8_0 (\cur_cc_pointer_reg[2]_6 ),
        .\FETCH_REC_Instr[15]_i_9 (\genblk1[0].engine_and_station_i_n_54 ),
        .\FETCH_REC_Instr[15]_i_9_0 (\genblk1[0].engine_and_station_i_n_55 ),
        .\FETCH_REC_Instr[15]_i_9_1 (\genblk1[0].engine_and_station_i_n_56 ),
        .\FETCH_REC_Instr[15]_i_9_2 (\genblk1[0].engine_and_station_i_n_57 ),
        .FETCH_REC_Instr_valid(\anEngine/anEngine/g.aregex_cpu/FETCH_REC_Instr_valid ),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_0 (\genblk1[1].engine_and_station_i_n_45 ),
        .\FSM_sequential_status_register_reg[0]_1 (\FSM_sequential_status_register_reg[0]_0 ),
        .\FSM_sequential_status_register_reg[0]_2 (\FSM_sequential_status_register_reg[0]_1 ),
        .\FSM_sequential_status_register_reg[0]_3 (\FSM_sequential_status_register_reg[0]_2 ),
        .O(O),
        .Q(Q),
        .WEBWE(\genblk1[0].engine_and_station_i_n_0 ),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .\channel_old_latency_reg[3] (channel_old_latency_next_1),
        .\channel_old_latency_reg[6] ({channel_old_latency_next[6:4],\genblk1[0].engine_and_station_i_n_9 ,channel_old_latency_next[2:0]}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cmd_register_IBUF(cmd_register_IBUF[0]),
        .content_reg_bram_0(\memory_bb\.addr ),
        .content_reg_bram_0_0(\genblk1[1].engine_and_station_i_n_35 ),
        .content_reg_bram_0_1(\switch2channel\.data ),
        .content_reg_bram_0_10(\genblk1[0].engine_and_station_i_n_26 ),
        .content_reg_bram_0_11(\genblk1[0].engine_and_station_i_n_61 ),
        .content_reg_bram_0_12(\genblk1[0].engine_and_station_i_n_19 ),
        .content_reg_bram_0_13(\genblk1[0].engine_and_station_i_n_62 ),
        .content_reg_bram_0_14(\genblk1[0].engine_and_station_i_n_63 ),
        .content_reg_bram_0_15(\genblk1[0].engine_and_station_i_n_64 ),
        .content_reg_bram_0_16(\genblk1[0].engine_and_station_i_n_65 ),
        .content_reg_bram_0_17(\genblk1[0].engine_and_station_i_n_66 ),
        .content_reg_bram_0_18(\genblk1[0].engine_and_station_i_n_67 ),
        .content_reg_bram_0_19(\genblk1[0].engine_and_station_i_n_68 ),
        .content_reg_bram_0_2(\genblk1[0].engine_and_station_i_n_33 ),
        .content_reg_bram_0_20(\genblk1[0].engine_and_station_i_n_69 ),
        .content_reg_bram_0_3(\genblk1[0].engine_and_station_i_n_18 ),
        .content_reg_bram_0_4(\genblk1[0].engine_and_station_i_n_32 ),
        .content_reg_bram_0_5(\genblk1[0].engine_and_station_i_n_31 ),
        .content_reg_bram_0_6(\genblk1[0].engine_and_station_i_n_30 ),
        .content_reg_bram_0_7(\genblk1[0].engine_and_station_i_n_29 ),
        .content_reg_bram_0_8(\genblk1[0].engine_and_station_i_n_28 ),
        .content_reg_bram_0_9(\genblk1[0].engine_and_station_i_n_27 ),
        .content_reg_bram_0_i_24__2(\aChannel/fifo_channel/p_0_in ),
        .\curState_reg[0] (\genblk1[1].engine_and_station_i_n_14 ),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2]_3 ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2] ),
        .\cur_ccs_reg[25] (\genblk1[1].engine_and_station_i_n_60 ),
        .\cur_ccs_reg[57] (\genblk1[1].engine_and_station_i_n_61 ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(\genblk1[1].engine_and_station_i_n_25 ),
        .cur_is_even_character_reg_0(cur_is_even_character_reg),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_0),
        .\cur_state[2]_i_9 (\cur_state[2]_i_9_0 ),
        .\cur_state[2]_i_9_0 (\cur_state[2]_i_9 ),
        .\cur_state_reg[0] (\genblk1[0].engine_and_station_i_n_35 ),
        .\cur_state_reg[0]_0 (\genblk1[0].engine_and_station_i_n_36 ),
        .\cur_state_reg[1] (\genblk1[1].engine_and_station_i_n_24 ),
        .\cur_state_reg[1]_0 (\genblk1[1].engine_and_station_i_n_62 ),
        .\cur_state_reg[2] (\genblk1[1].engine_and_station_i_n_13 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk1[0].engine_and_station_i_n_20 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk1[0].engine_and_station_i_n_25 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 (\cur_state_reg[0]_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk1[0].engine_and_station_i_n_21 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk1[0].engine_and_station_i_n_22 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk1[0].engine_and_station_i_n_23 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk1[0].engine_and_station_i_n_24 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 (\genblk1[0].engine_and_station_i_n_17 ),
        .\head_reg[2] (\genblk1[1].engine_and_station_i_n_56 ),
        .\head_reg[3] (\genblk1[1].engine_and_station_i_n_22 ),
        .in_ready_packed(in_ready_packed),
        .memory_addr_from_coprocessor_ready(memory_addr_from_coprocessor_ready),
        .memory_data(memory_data),
        .\middle_reg[1] (\genblk1[1].engine_and_station_i_n_36 ),
        .\middle_reg[2] (\genblk1[1].engine_and_station_i_n_37 ),
        .\middle_reg[3] (\genblk1[1].engine_and_station_i_n_38 ),
        .\middle_reg[4] (\genblk1[1].engine_and_station_i_n_39 ),
        .\middle_reg[5] (\genblk1[1].engine_and_station_i_n_40 ),
        .\middle_reg[6] (\genblk1[1].engine_and_station_i_n_41 ),
        .\middle_reg[7] (\genblk1[1].engine_and_station_i_n_42 ),
        .\middle_reg[8] (\genblk1[1].engine_and_station_i_n_43 ),
        .old_grant(\arbitration_logic/old_grant ),
        .\old_grant[0]_i_3__0 (\cur_cc_pointer_reg[2]_2 ),
        .\old_grant[0]_i_3__0_0 (\cur_cc_pointer_reg[2]_0 ),
        .\old_grant[0]_i_5 (\genblk1[0].engine_and_station_i_n_50 ),
        .\old_grant[0]_i_5_0 (\genblk1[0].engine_and_station_i_n_51 ),
        .\old_grant[0]_i_5_1 (\genblk1[0].engine_and_station_i_n_58 ),
        .\old_grant[0]_i_5_2 (\genblk1[0].engine_and_station_i_n_59 ),
        .\old_grant_reg[0] (SR),
        .\old_grant_reg[0]_0 (\genblk1[0].engine_and_station_i_n_13 ),
        .start_cc_pointer_register_IBUF(start_cc_pointer_register_IBUF),
        .\switch2channel\.ready (\switch2channel\.ready ),
        .\tail_reg[4] (\genblk1[0].engine_and_station_i_n_60 ),
        .\tail_reg[4]_0 (\genblk1[0].engine_and_station_i_n_70 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
