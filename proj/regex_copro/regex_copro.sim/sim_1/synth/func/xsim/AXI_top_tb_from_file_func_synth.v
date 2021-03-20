// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Feb 12 15:14:55 2021
// Host        : DESKTOP-K2FOLNH running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/danie/Documents/GitHub/regex_coprocessor_safe/proj/regex_copro/regex_copro.sim/sim_1/synth/func/xsim/AXI_top_tb_from_file_func_synth.v
// Design      : AXI_top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* BASIC_BLOCK_PIPELINED = "1" *) (* BB_N = "1" *) (* BRAM_READ_ADDR_WIDTH = "9" *) 
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

  wire \FSM_sequential_status_register[2]_i_3_n_0 ;
  wire \FSM_sequential_status_register[2]_i_5_n_0 ;
  wire a_regex_coprocessor_n_1;
  wire a_regex_coprocessor_n_11;
  wire a_regex_coprocessor_n_13;
  wire abram_n_100;
  wire abram_n_101;
  wire abram_n_102;
  wire abram_n_103;
  wire abram_n_104;
  wire abram_n_105;
  wire abram_n_106;
  wire abram_n_107;
  wire abram_n_108;
  wire abram_n_109;
  wire abram_n_96;
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
  wire \elapsed_cc[31]_i_11_n_0 ;
  wire \elapsed_cc[31]_i_2_n_0 ;
  wire \elapsed_cc[31]_i_3_n_0 ;
  wire \elapsed_cc[31]_i_4_n_0 ;
  wire \elapsed_cc[31]_i_6_n_0 ;
  wire \elapsed_cc[31]_i_7_n_0 ;
  wire \elapsed_cc[31]_i_8_n_0 ;
  wire \elapsed_cc[31]_i_9_n_0 ;
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
  wire \elapsed_cc_reg[31]_i_5_n_2 ;
  wire \elapsed_cc_reg[31]_i_5_n_3 ;
  wire \elapsed_cc_reg[31]_i_5_n_4 ;
  wire \elapsed_cc_reg[31]_i_5_n_5 ;
  wire \elapsed_cc_reg[31]_i_5_n_6 ;
  wire \elapsed_cc_reg[31]_i_5_n_7 ;
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
  wire rst;
  wire rst_IBUF;
  wire rst_master;
  wire [31:0]start_cc_pointer_register;
  wire [31:0]start_cc_pointer_register_IBUF;
  wire [31:0]status_register;
  wire [2:0]status_register_OBUF;
  wire [2:0]status_register__0;
  wire [2:0]status_register_next;
  wire [7:6]\NLW_elapsed_cc_reg[31]_i_5_CO_UNCONNECTED ;
  wire [7:7]\NLW_elapsed_cc_reg[31]_i_5_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0080008000008000)) 
    \FSM_sequential_status_register[2]_i_3 
       (.I0(a_regex_coprocessor_n_13),
        .I1(cmd_register_IBUF[1]),
        .I2(cmd_register_IBUF[2]),
        .I3(status_register__0[2]),
        .I4(status_register__0[0]),
        .I5(status_register__0[1]),
        .O(\FSM_sequential_status_register[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \FSM_sequential_status_register[2]_i_5 
       (.I0(status_register__0[1]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\FSM_sequential_status_register[2]_i_5_n_0 ));
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
        .D(bram_r),
        .E(a_regex_coprocessor_n_11),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register[2]_i_3_n_0 ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register[2]_i_5_n_0 ),
        .\FSM_sequential_status_register_reg[1] (a_regex_coprocessor_n_1),
        .\FSM_sequential_status_register_reg[2] (status_register_next),
        .Q(status_register__0),
        .SR(rst_master),
        .address_register_IBUF(address_register_IBUF[9:7]),
        .bram_r_valid(bram_r_valid),
        .clk(clk_IBUF_BUFG),
        .\cmd_register[0] (a_regex_coprocessor_n_13),
        .cmd_register_IBUF(cmd_register_IBUF[2:0]),
        .content_reg(abram_n_103),
        .\cur_cc_pointer_reg[0]_0 (abram_n_107),
        .end_cc_pointer_register_IBUF(end_cc_pointer_register_IBUF),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (abram_n_109),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (abram_n_96),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (abram_n_98),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (abram_n_108),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (abram_n_99),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (abram_n_100),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (abram_n_101),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (abram_n_102),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (abram_n_104),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (abram_n_97),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (abram_n_105),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (abram_n_106),
        .rst_IBUF(rst_IBUF),
        .start_cc_pointer_register_IBUF(start_cc_pointer_register_IBUF));
  bram abram
       (.ADDRARDADDR(bram_r_addr),
        .CLK(clk_IBUF_BUFG),
        .D(bram_r),
        .\FSM_sequential_status_register_reg[0] (abram_n_109),
        .\FSM_sequential_status_register_reg[1] (abram_n_97),
        .\FSM_sequential_status_register_reg[2] (abram_n_104),
        .\FSM_sequential_status_register_reg[2]_0 (abram_n_105),
        .\FSM_sequential_status_register_reg[2]_1 (abram_n_106),
        .\FSM_sequential_status_register_reg[2]_2 (abram_n_108),
        .Q(elapsed_cc),
        .SR(rst_master),
        .\address_register[1] (abram_n_96),
        .\address_register[2] (abram_n_98),
        .\address_register[3] (abram_n_99),
        .\address_register[4] (abram_n_100),
        .\address_register[5] (abram_n_101),
        .\address_register[6] (abram_n_102),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .\cmd_register[0] (abram_n_107),
        .\cmd_register[11] (abram_n_103),
        .cmd_register_IBUF(cmd_register_IBUF),
        .data_in_register_IBUF(data_in_register_IBUF),
        .\data_o_register[31] (\data_o_register_OBUF[31]_inst_i_2_n_0 ),
        .data_o_register_OBUF(data_o_register_OBUF),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (status_register__0));
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
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h082A)) 
    \data_o_register_OBUF[31]_inst_i_2 
       (.I0(abram_n_103),
        .I1(status_register__0[1]),
        .I2(status_register__0[2]),
        .I3(status_register__0[0]),
        .O(\data_o_register_OBUF[31]_inst_i_2_n_0 ));
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
  LUT3 #(
    .INIT(8'h04)) 
    \elapsed_cc[0]_i_1 
       (.I0(elapsed_cc[0]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[10]_i_1 
       (.I0(in6[10]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[11]_i_1 
       (.I0(in6[11]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[12]_i_1 
       (.I0(in6[12]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[13]_i_1 
       (.I0(in6[13]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[14]_i_1 
       (.I0(in6[14]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[15]_i_1 
       (.I0(in6[15]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[16]_i_1 
       (.I0(in6[16]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[17]_i_1 
       (.I0(in6[17]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[18]_i_1 
       (.I0(in6[18]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[19]_i_1 
       (.I0(in6[19]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[1]_i_1 
       (.I0(in6[1]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[20]_i_1 
       (.I0(in6[20]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[21]_i_1 
       (.I0(in6[21]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[22]_i_1 
       (.I0(in6[22]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[23]_i_1 
       (.I0(in6[23]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[24]_i_1 
       (.I0(in6[24]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[25]_i_1 
       (.I0(in6[25]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[26]_i_1 
       (.I0(in6[26]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[27]_i_1 
       (.I0(in6[27]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[28]_i_1 
       (.I0(in6[28]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[29]_i_1 
       (.I0(in6[29]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[2]_i_1 
       (.I0(in6[2]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[30]_i_1 
       (.I0(in6[30]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAFBAAAA)) 
    \elapsed_cc[31]_i_1 
       (.I0(a_regex_coprocessor_n_1),
        .I1(\elapsed_cc[31]_i_3_n_0 ),
        .I2(\elapsed_cc[31]_i_4_n_0 ),
        .I3(status_register__0[1]),
        .I4(status_register__0[0]),
        .I5(status_register__0[2]),
        .O(elapsed_cc_next));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \elapsed_cc[31]_i_10 
       (.I0(elapsed_cc[4]),
        .I1(elapsed_cc[12]),
        .I2(elapsed_cc[10]),
        .I3(elapsed_cc[23]),
        .O(\elapsed_cc[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \elapsed_cc[31]_i_11 
       (.I0(elapsed_cc[21]),
        .I1(elapsed_cc[27]),
        .I2(elapsed_cc[9]),
        .I3(elapsed_cc[19]),
        .O(\elapsed_cc[31]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[31]_i_2 
       (.I0(in6[31]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \elapsed_cc[31]_i_3 
       (.I0(\elapsed_cc[31]_i_6_n_0 ),
        .I1(elapsed_cc[15]),
        .I2(elapsed_cc[28]),
        .I3(elapsed_cc[2]),
        .I4(elapsed_cc[13]),
        .I5(\elapsed_cc[31]_i_7_n_0 ),
        .O(\elapsed_cc[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBFFFFFFF)) 
    \elapsed_cc[31]_i_4 
       (.I0(\elapsed_cc[31]_i_8_n_0 ),
        .I1(elapsed_cc[1]),
        .I2(elapsed_cc[8]),
        .I3(elapsed_cc[6]),
        .I4(elapsed_cc[29]),
        .I5(\elapsed_cc[31]_i_9_n_0 ),
        .O(\elapsed_cc[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \elapsed_cc[31]_i_6 
       (.I0(elapsed_cc[18]),
        .I1(elapsed_cc[0]),
        .I2(elapsed_cc[14]),
        .I3(elapsed_cc[26]),
        .O(\elapsed_cc[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \elapsed_cc[31]_i_7 
       (.I0(elapsed_cc[25]),
        .I1(elapsed_cc[3]),
        .I2(elapsed_cc[17]),
        .I3(elapsed_cc[16]),
        .I4(\elapsed_cc[31]_i_10_n_0 ),
        .O(\elapsed_cc[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \elapsed_cc[31]_i_8 
       (.I0(elapsed_cc[24]),
        .I1(elapsed_cc[30]),
        .I2(elapsed_cc[7]),
        .I3(elapsed_cc[20]),
        .O(\elapsed_cc[31]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \elapsed_cc[31]_i_9 
       (.I0(elapsed_cc[11]),
        .I1(elapsed_cc[5]),
        .I2(elapsed_cc[31]),
        .I3(elapsed_cc[22]),
        .I4(\elapsed_cc[31]_i_11_n_0 ),
        .O(\elapsed_cc[31]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[3]_i_1 
       (.I0(in6[3]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[4]_i_1 
       (.I0(in6[4]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[5]_i_1 
       (.I0(in6[5]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[6]_i_1 
       (.I0(in6[6]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[7]_i_1 
       (.I0(in6[7]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[8]_i_1 
       (.I0(in6[8]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
        .O(\elapsed_cc[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \elapsed_cc[9]_i_1 
       (.I0(in6[9]),
        .I1(status_register__0[0]),
        .I2(status_register__0[2]),
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
    \elapsed_cc_reg[31]_i_5 
       (.CI(\elapsed_cc_reg[24]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_elapsed_cc_reg[31]_i_5_CO_UNCONNECTED [7:6],\elapsed_cc_reg[31]_i_5_n_2 ,\elapsed_cc_reg[31]_i_5_n_3 ,\elapsed_cc_reg[31]_i_5_n_4 ,\elapsed_cc_reg[31]_i_5_n_5 ,\elapsed_cc_reg[31]_i_5_n_6 ,\elapsed_cc_reg[31]_i_5_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_elapsed_cc_reg[31]_i_5_O_UNCONNECTED [7],in6[31:25]}),
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
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
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
   (D,
    data_o_register_OBUF,
    \address_register[1] ,
    \FSM_sequential_status_register_reg[1] ,
    \address_register[2] ,
    \address_register[3] ,
    \address_register[4] ,
    \address_register[5] ,
    \address_register[6] ,
    \cmd_register[11] ,
    \FSM_sequential_status_register_reg[2] ,
    \FSM_sequential_status_register_reg[2]_0 ,
    \FSM_sequential_status_register_reg[2]_1 ,
    \cmd_register[0] ,
    \FSM_sequential_status_register_reg[2]_2 ,
    \FSM_sequential_status_register_reg[0] ,
    CLK,
    bram_r_valid,
    SR,
    ADDRARDADDR,
    \data_o_register[31] ,
    cmd_register_IBUF,
    Q,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    data_in_register_IBUF);
  output [63:0]D;
  output [31:0]data_o_register_OBUF;
  output \address_register[1] ;
  output \FSM_sequential_status_register_reg[1] ;
  output \address_register[2] ;
  output \address_register[3] ;
  output \address_register[4] ;
  output \address_register[5] ;
  output \address_register[6] ;
  output \cmd_register[11] ;
  output \FSM_sequential_status_register_reg[2] ;
  output \FSM_sequential_status_register_reg[2]_0 ;
  output \FSM_sequential_status_register_reg[2]_1 ;
  output \cmd_register[0] ;
  output \FSM_sequential_status_register_reg[2]_2 ;
  output \FSM_sequential_status_register_reg[0] ;
  input CLK;
  input bram_r_valid;
  input [0:0]SR;
  input [8:0]ADDRARDADDR;
  input \data_o_register[31] ;
  input [31:0]cmd_register_IBUF;
  input [31:0]Q;
  input [9:0]address_register_IBUF;
  input [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [31:0]data_in_register_IBUF;

  wire [8:0]ADDRARDADDR;
  wire CLK;
  wire [63:0]D;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[1] ;
  wire \FSM_sequential_status_register_reg[2] ;
  wire \FSM_sequential_status_register_reg[2]_0 ;
  wire \FSM_sequential_status_register_reg[2]_1 ;
  wire \FSM_sequential_status_register_reg[2]_2 ;
  wire [31:0]Q;
  wire [0:0]SR;
  wire \address_register[1] ;
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
  wire \cmd_register[0] ;
  wire \cmd_register[11] ;
  wire [31:0]cmd_register_IBUF;
  wire [31:0]data_in_register_IBUF;
  wire \data_o_register[31] ;
  wire [31:0]data_o_register_OBUF;
  wire \data_o_register_OBUF[0]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[10]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[11]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[12]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[13]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[14]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[15]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[16]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[17]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[18]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[19]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[1]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[20]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[21]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[22]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[23]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[24]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[25]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[26]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[27]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[28]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[29]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[2]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[30]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_10_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_3_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_5_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_6_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_7_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_8_n_0 ;
  wire \data_o_register_OBUF[31]_inst_i_9_n_0 ;
  wire \data_o_register_OBUF[3]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[4]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[5]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[6]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[7]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[8]_inst_i_2_n_0 ;
  wire \data_o_register_OBUF[9]_inst_i_2_n_0 ;
  wire [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_74_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_n_0 ;
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
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[0]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[0]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[0]),
        .O(data_o_register_OBUF[0]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[0]_inst_i_2 
       (.I0(D[0]),
        .I1(address_register_IBUF[0]),
        .I2(D[32]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[0]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[10]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[10]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[10]),
        .O(data_o_register_OBUF[10]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[10]_inst_i_2 
       (.I0(D[10]),
        .I1(address_register_IBUF[0]),
        .I2(D[42]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[10]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[11]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[11]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[11]),
        .O(data_o_register_OBUF[11]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[11]_inst_i_2 
       (.I0(D[11]),
        .I1(address_register_IBUF[0]),
        .I2(D[43]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[11]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[12]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[12]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[12]),
        .O(data_o_register_OBUF[12]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[12]_inst_i_2 
       (.I0(D[12]),
        .I1(address_register_IBUF[0]),
        .I2(D[44]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[12]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[13]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[13]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[13]),
        .O(data_o_register_OBUF[13]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[13]_inst_i_2 
       (.I0(D[13]),
        .I1(address_register_IBUF[0]),
        .I2(D[45]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[13]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[14]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[14]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[14]),
        .O(data_o_register_OBUF[14]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[14]_inst_i_2 
       (.I0(D[14]),
        .I1(address_register_IBUF[0]),
        .I2(D[46]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[14]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[15]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[15]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[15]),
        .O(data_o_register_OBUF[15]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[15]_inst_i_2 
       (.I0(D[15]),
        .I1(address_register_IBUF[0]),
        .I2(D[47]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[15]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[16]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[16]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[16]),
        .O(data_o_register_OBUF[16]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[16]_inst_i_2 
       (.I0(D[16]),
        .I1(address_register_IBUF[0]),
        .I2(D[48]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[16]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[17]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[17]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[17]),
        .O(data_o_register_OBUF[17]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[17]_inst_i_2 
       (.I0(D[17]),
        .I1(address_register_IBUF[0]),
        .I2(D[49]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[17]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[18]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[18]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[18]),
        .O(data_o_register_OBUF[18]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[18]_inst_i_2 
       (.I0(D[18]),
        .I1(address_register_IBUF[0]),
        .I2(D[50]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[18]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[19]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[19]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[19]),
        .O(data_o_register_OBUF[19]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[19]_inst_i_2 
       (.I0(D[19]),
        .I1(address_register_IBUF[0]),
        .I2(D[51]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[19]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[1]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[1]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[1]),
        .O(data_o_register_OBUF[1]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[1]_inst_i_2 
       (.I0(D[1]),
        .I1(address_register_IBUF[0]),
        .I2(D[33]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[20]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[20]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[20]),
        .O(data_o_register_OBUF[20]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[20]_inst_i_2 
       (.I0(D[20]),
        .I1(address_register_IBUF[0]),
        .I2(D[52]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[20]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[21]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[21]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[21]),
        .O(data_o_register_OBUF[21]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[21]_inst_i_2 
       (.I0(D[21]),
        .I1(address_register_IBUF[0]),
        .I2(D[53]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[21]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[22]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[22]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[22]),
        .O(data_o_register_OBUF[22]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[22]_inst_i_2 
       (.I0(D[22]),
        .I1(address_register_IBUF[0]),
        .I2(D[54]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[22]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[23]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[23]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[23]),
        .O(data_o_register_OBUF[23]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[23]_inst_i_2 
       (.I0(D[23]),
        .I1(address_register_IBUF[0]),
        .I2(D[55]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[23]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[24]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[24]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[24]),
        .O(data_o_register_OBUF[24]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[24]_inst_i_2 
       (.I0(D[24]),
        .I1(address_register_IBUF[0]),
        .I2(D[56]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[24]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[25]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[25]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[25]),
        .O(data_o_register_OBUF[25]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[25]_inst_i_2 
       (.I0(D[25]),
        .I1(address_register_IBUF[0]),
        .I2(D[57]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[25]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[26]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[26]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[26]),
        .O(data_o_register_OBUF[26]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[26]_inst_i_2 
       (.I0(D[26]),
        .I1(address_register_IBUF[0]),
        .I2(D[58]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[26]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[27]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[27]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[27]),
        .O(data_o_register_OBUF[27]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[27]_inst_i_2 
       (.I0(D[27]),
        .I1(address_register_IBUF[0]),
        .I2(D[59]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[27]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[28]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[28]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[28]),
        .O(data_o_register_OBUF[28]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[28]_inst_i_2 
       (.I0(D[28]),
        .I1(address_register_IBUF[0]),
        .I2(D[60]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[28]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[29]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[29]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[29]),
        .O(data_o_register_OBUF[29]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[29]_inst_i_2 
       (.I0(D[29]),
        .I1(address_register_IBUF[0]),
        .I2(D[61]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[29]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[2]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[2]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[2]),
        .O(data_o_register_OBUF[2]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[2]_inst_i_2 
       (.I0(D[2]),
        .I1(address_register_IBUF[0]),
        .I2(D[34]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[30]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[30]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[30]),
        .O(data_o_register_OBUF[30]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[30]_inst_i_2 
       (.I0(D[30]),
        .I1(address_register_IBUF[0]),
        .I2(D[62]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[30]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8888A88888888888)) 
    \data_o_register_OBUF[31]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[31]_inst_i_3_n_0 ),
        .I2(Q[31]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(data_o_register_OBUF[31]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \data_o_register_OBUF[31]_inst_i_10 
       (.I0(cmd_register_IBUF[30]),
        .I1(cmd_register_IBUF[25]),
        .I2(cmd_register_IBUF[28]),
        .I3(cmd_register_IBUF[14]),
        .O(\data_o_register_OBUF[31]_inst_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[31]_inst_i_3 
       (.I0(D[31]),
        .I1(address_register_IBUF[0]),
        .I2(D[63]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[31]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \data_o_register_OBUF[31]_inst_i_4 
       (.I0(cmd_register_IBUF[11]),
        .I1(cmd_register_IBUF[22]),
        .I2(cmd_register_IBUF[9]),
        .I3(\data_o_register_OBUF[31]_inst_i_5_n_0 ),
        .I4(\data_o_register_OBUF[31]_inst_i_6_n_0 ),
        .I5(\data_o_register_OBUF[31]_inst_i_7_n_0 ),
        .O(\cmd_register[11] ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \data_o_register_OBUF[31]_inst_i_5 
       (.I0(cmd_register_IBUF[20]),
        .I1(cmd_register_IBUF[15]),
        .I2(cmd_register_IBUF[27]),
        .I3(cmd_register_IBUF[7]),
        .O(\data_o_register_OBUF[31]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \data_o_register_OBUF[31]_inst_i_6 
       (.I0(cmd_register_IBUF[8]),
        .I1(cmd_register_IBUF[31]),
        .I2(cmd_register_IBUF[4]),
        .I3(cmd_register_IBUF[21]),
        .I4(\data_o_register_OBUF[31]_inst_i_8_n_0 ),
        .O(\data_o_register_OBUF[31]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \data_o_register_OBUF[31]_inst_i_7 
       (.I0(\data_o_register_OBUF[31]_inst_i_9_n_0 ),
        .I1(\data_o_register_OBUF[31]_inst_i_10_n_0 ),
        .I2(cmd_register_IBUF[13]),
        .I3(cmd_register_IBUF[12]),
        .I4(cmd_register_IBUF[29]),
        .I5(cmd_register_IBUF[6]),
        .O(\data_o_register_OBUF[31]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \data_o_register_OBUF[31]_inst_i_8 
       (.I0(cmd_register_IBUF[10]),
        .I1(cmd_register_IBUF[5]),
        .I2(cmd_register_IBUF[23]),
        .I3(cmd_register_IBUF[18]),
        .O(\data_o_register_OBUF[31]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \data_o_register_OBUF[31]_inst_i_9 
       (.I0(cmd_register_IBUF[24]),
        .I1(cmd_register_IBUF[17]),
        .I2(cmd_register_IBUF[16]),
        .I3(cmd_register_IBUF[26]),
        .I4(cmd_register_IBUF[3]),
        .I5(cmd_register_IBUF[19]),
        .O(\data_o_register_OBUF[31]_inst_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[3]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[3]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[3]),
        .O(data_o_register_OBUF[3]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[3]_inst_i_2 
       (.I0(D[3]),
        .I1(address_register_IBUF[0]),
        .I2(D[35]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[3]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[4]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[4]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[4]),
        .O(data_o_register_OBUF[4]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[4]_inst_i_2 
       (.I0(D[4]),
        .I1(address_register_IBUF[0]),
        .I2(D[36]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[4]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[5]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[5]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[5]),
        .O(data_o_register_OBUF[5]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[5]_inst_i_2 
       (.I0(D[5]),
        .I1(address_register_IBUF[0]),
        .I2(D[37]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[5]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[6]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[6]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[6]),
        .O(data_o_register_OBUF[6]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[6]_inst_i_2 
       (.I0(D[6]),
        .I1(address_register_IBUF[0]),
        .I2(D[38]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[6]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[7]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[7]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[7]),
        .O(data_o_register_OBUF[7]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[7]_inst_i_2 
       (.I0(D[7]),
        .I1(address_register_IBUF[0]),
        .I2(D[39]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[7]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[8]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[8]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[8]),
        .O(data_o_register_OBUF[8]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[8]_inst_i_2 
       (.I0(D[8]),
        .I1(address_register_IBUF[0]),
        .I2(D[40]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[8]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8888888888888)) 
    \data_o_register_OBUF[9]_inst_i_1 
       (.I0(\data_o_register[31] ),
        .I1(\data_o_register_OBUF[9]_inst_i_2_n_0 ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .I4(cmd_register_IBUF[0]),
        .I5(Q[9]),
        .O(data_o_register_OBUF[9]));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \data_o_register_OBUF[9]_inst_i_2 
       (.I0(D[9]),
        .I1(address_register_IBUF[0]),
        .I2(D[41]),
        .I3(cmd_register_IBUF[2]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[0]),
        .O(\data_o_register_OBUF[9]_inst_i_2_n_0 ));
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
        .DOUTADOUT(D[31:0]),
        .DOUTBDOUT(D[63:32]),
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
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_13 
       (.I0(address_register_IBUF[9]),
        .I1(bram_w_valid),
        .O(bram_w_addr[9]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_14 
       (.I0(address_register_IBUF[8]),
        .I1(bram_w_valid),
        .O(bram_w_addr[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_15 
       (.I0(address_register_IBUF[7]),
        .I1(bram_w_valid),
        .O(bram_w_addr[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_16 
       (.I0(address_register_IBUF[6]),
        .I1(bram_w_valid),
        .O(bram_w_addr[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_17 
       (.I0(address_register_IBUF[5]),
        .I1(bram_w_valid),
        .O(bram_w_addr[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_18 
       (.I0(address_register_IBUF[4]),
        .I1(bram_w_valid),
        .O(bram_w_addr[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_19 
       (.I0(address_register_IBUF[3]),
        .I1(bram_w_valid),
        .O(bram_w_addr[3]));
  LUT6 #(
    .INIT(64'h0000000000000A22)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_2 
       (.I0(\cmd_register[0] ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [0]),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [2]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [1]),
        .I4(cmd_register_IBUF[1]),
        .I5(cmd_register_IBUF[2]),
        .O(bram_w_valid));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_20 
       (.I0(address_register_IBUF[2]),
        .I1(bram_w_valid),
        .O(bram_w_addr[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_21 
       (.I0(address_register_IBUF[1]),
        .I1(bram_w_valid),
        .O(bram_w_addr[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_22 
       (.I0(address_register_IBUF[0]),
        .I1(bram_w_valid),
        .O(bram_w_addr[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_23 
       (.I0(data_in_register_IBUF[31]),
        .I1(bram_w_valid),
        .O(bram_w[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_24 
       (.I0(data_in_register_IBUF[30]),
        .I1(bram_w_valid),
        .O(bram_w[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_25 
       (.I0(data_in_register_IBUF[29]),
        .I1(bram_w_valid),
        .O(bram_w[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_26 
       (.I0(data_in_register_IBUF[28]),
        .I1(bram_w_valid),
        .O(bram_w[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_27 
       (.I0(data_in_register_IBUF[27]),
        .I1(bram_w_valid),
        .O(bram_w[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_28 
       (.I0(data_in_register_IBUF[26]),
        .I1(bram_w_valid),
        .O(bram_w[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_29 
       (.I0(data_in_register_IBUF[25]),
        .I1(bram_w_valid),
        .O(bram_w[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_30 
       (.I0(data_in_register_IBUF[24]),
        .I1(bram_w_valid),
        .O(bram_w[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_31 
       (.I0(data_in_register_IBUF[23]),
        .I1(bram_w_valid),
        .O(bram_w[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_32 
       (.I0(data_in_register_IBUF[22]),
        .I1(bram_w_valid),
        .O(bram_w[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_33 
       (.I0(data_in_register_IBUF[21]),
        .I1(bram_w_valid),
        .O(bram_w[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_34 
       (.I0(data_in_register_IBUF[20]),
        .I1(bram_w_valid),
        .O(bram_w[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_35 
       (.I0(data_in_register_IBUF[19]),
        .I1(bram_w_valid),
        .O(bram_w[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_36 
       (.I0(data_in_register_IBUF[18]),
        .I1(bram_w_valid),
        .O(bram_w[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_37 
       (.I0(data_in_register_IBUF[17]),
        .I1(bram_w_valid),
        .O(bram_w[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_38 
       (.I0(data_in_register_IBUF[16]),
        .I1(bram_w_valid),
        .O(bram_w[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_39 
       (.I0(data_in_register_IBUF[15]),
        .I1(bram_w_valid),
        .O(bram_w[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_40 
       (.I0(data_in_register_IBUF[14]),
        .I1(bram_w_valid),
        .O(bram_w[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_41 
       (.I0(data_in_register_IBUF[13]),
        .I1(bram_w_valid),
        .O(bram_w[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_42 
       (.I0(data_in_register_IBUF[12]),
        .I1(bram_w_valid),
        .O(bram_w[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_43 
       (.I0(data_in_register_IBUF[11]),
        .I1(bram_w_valid),
        .O(bram_w[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_44 
       (.I0(data_in_register_IBUF[10]),
        .I1(bram_w_valid),
        .O(bram_w[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_45 
       (.I0(data_in_register_IBUF[9]),
        .I1(bram_w_valid),
        .O(bram_w[9]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_46 
       (.I0(data_in_register_IBUF[8]),
        .I1(bram_w_valid),
        .O(bram_w[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_47 
       (.I0(data_in_register_IBUF[7]),
        .I1(bram_w_valid),
        .O(bram_w[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_48 
       (.I0(data_in_register_IBUF[6]),
        .I1(bram_w_valid),
        .O(bram_w[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_49 
       (.I0(data_in_register_IBUF[5]),
        .I1(bram_w_valid),
        .O(bram_w[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_50 
       (.I0(data_in_register_IBUF[4]),
        .I1(bram_w_valid),
        .O(bram_w[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_51 
       (.I0(data_in_register_IBUF[3]),
        .I1(bram_w_valid),
        .O(bram_w[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_52 
       (.I0(data_in_register_IBUF[2]),
        .I1(bram_w_valid),
        .O(bram_w[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_53 
       (.I0(data_in_register_IBUF[1]),
        .I1(bram_w_valid),
        .O(bram_w[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_54 
       (.I0(data_in_register_IBUF[0]),
        .I1(bram_w_valid),
        .O(bram_w[0]));
  LUT4 #(
    .INIT(16'h00FB)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_55 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [2]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [0]),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [1]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_74_n_0 ),
        .O(\FSM_sequential_status_register_reg[2]_2 ));
  LUT6 #(
    .INIT(64'hFFFFFBFFFFFBFBFB)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_59 
       (.I0(cmd_register_IBUF[0]),
        .I1(\cmd_register[11] ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_n_0 ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [1]),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [2]),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [0]),
        .O(\FSM_sequential_status_register_reg[1] ));
  LUT2 #(
    .INIT(4'h8)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_60 
       (.I0(cmd_register_IBUF[0]),
        .I1(\cmd_register[11] ),
        .O(\cmd_register[0] ));
  LUT6 #(
    .INIT(64'hFFFFFF0404040404)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_61 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [2]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [0]),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[9]),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_74_n_0 ),
        .O(\FSM_sequential_status_register_reg[2]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFF0404040404)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_63 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [2]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [0]),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[8]),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_74_n_0 ),
        .O(\FSM_sequential_status_register_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF0404040404)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_64 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [2]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [0]),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [1]),
        .I3(cmd_register_IBUF[0]),
        .I4(address_register_IBUF[7]),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_74_n_0 ),
        .O(\FSM_sequential_status_register_reg[2] ));
  LUT6 #(
    .INIT(64'hFFFFFF51FFFFFF55)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_66 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [0]),
        .I1(cmd_register_IBUF[1]),
        .I2(cmd_register_IBUF[2]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [1]),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [2]),
        .I5(\cmd_register[0] ),
        .O(\FSM_sequential_status_register_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_67 
       (.I0(address_register_IBUF[6]),
        .I1(\FSM_sequential_status_register_reg[1] ),
        .O(\address_register[6] ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_68 
       (.I0(address_register_IBUF[5]),
        .I1(\FSM_sequential_status_register_reg[1] ),
        .O(\address_register[5] ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_69 
       (.I0(address_register_IBUF[4]),
        .I1(\FSM_sequential_status_register_reg[1] ),
        .O(\address_register[4] ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_70 
       (.I0(address_register_IBUF[3]),
        .I1(\FSM_sequential_status_register_reg[1] ),
        .O(\address_register[3] ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_71 
       (.I0(address_register_IBUF[2]),
        .I1(\FSM_sequential_status_register_reg[1] ),
        .O(\address_register[2] ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_73 
       (.I0(address_register_IBUF[1]),
        .I1(\FSM_sequential_status_register_reg[1] ),
        .O(\address_register[1] ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_74 
       (.I0(\cmd_register[11] ),
        .I1(cmd_register_IBUF[1]),
        .I2(cmd_register_IBUF[2]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [1]),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [2]),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 [0]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_74_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78 
       (.I0(cmd_register_IBUF[2]),
        .I1(cmd_register_IBUF[1]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_78_n_0 ));
endmodule

module arbiter_2_rr
   (SS,
    FETCH_REC_Instr_valid_reg,
    EXE1_Instr_valid_reg,
    E,
    \EXE1_Instr_reg[9] ,
    cur_is_even_character_reg,
    \old_grant_reg[0] ,
    cur_is_even_character_reg_0,
    \state_cur_reg[0] ,
    cur_is_even_character_reg_1,
    DINADIN,
    cur_is_even_character_reg_2,
    \EXE1_Instr_reg[7] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \EXE2_Instr_reg[9] ,
    EXE1_Instr_valid_reg_0,
    cur_is_even_character_reg_3,
    \state_cur_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_0,
    FETCH_REC_Instr_valid_reg_1,
    clk,
    \old_grant_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_2,
    EXE1_Instr_valid,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \EXE2_Instr_reg[15] ,
    FETCH_REC_Instr_valid_reg_3,
    FETCH_REC_Instr_valid_reg_4,
    FETCH_REC_Instr_valid_reg_5,
    content_reg_bram_0,
    \tail_reg[4] ,
    cur_is_even_character,
    \state_cur_reg[0]_1 ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    EXE2_Instr_valid_reg,
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
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    \old_grant_reg[0]_1 ,
    \old_grant[0]_i_3 ,
    \old_grant_reg[0]_i_10 ,
    \old_grant_reg[0]_2 ,
    \old_grant_reg[0]_3 ,
    \old_grant[0]_i_3_0 ,
    \old_grant[0]_i_3_1 ,
    \old_grant[0]_i_3_2 ,
    \old_grant[0]_i_3_3 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid,
    \state_cur_reg[0]_2 ,
    FETCH_REC_Instr_valid_reg_6);
  output [0:0]SS;
  output FETCH_REC_Instr_valid_reg;
  output EXE1_Instr_valid_reg;
  output [0:0]E;
  output [0:0]\EXE1_Instr_reg[9] ;
  output [0:0]cur_is_even_character_reg;
  output \old_grant_reg[0] ;
  output cur_is_even_character_reg_0;
  output \state_cur_reg[0] ;
  output [0:0]cur_is_even_character_reg_1;
  output [7:0]DINADIN;
  output [7:0]cur_is_even_character_reg_2;
  output \EXE1_Instr_reg[7] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \EXE2_Instr_reg[9] ;
  output EXE1_Instr_valid_reg_0;
  output cur_is_even_character_reg_3;
  output \state_cur_reg[0]_0 ;
  output [0:0]FETCH_REC_Instr_valid_reg_0;
  output FETCH_REC_Instr_valid_reg_1;
  input clk;
  input \old_grant_reg[0]_0 ;
  input FETCH_REC_Instr_valid_reg_2;
  input EXE1_Instr_valid;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [10:0]Q;
  input \EXE2_Instr_reg[15] ;
  input FETCH_REC_Instr_valid_reg_3;
  input FETCH_REC_Instr_valid_reg_4;
  input FETCH_REC_Instr_valid_reg_5;
  input content_reg_bram_0;
  input \tail_reg[4] ;
  input cur_is_even_character;
  input [0:0]\state_cur_reg[0]_1 ;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input [6:0]EXE2_Instr_valid_reg;
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
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input \old_grant_reg[0]_1 ;
  input [2:0]\old_grant[0]_i_3 ;
  input [31:0]\old_grant_reg[0]_i_10 ;
  input \old_grant_reg[0]_2 ;
  input \old_grant_reg[0]_3 ;
  input \old_grant[0]_i_3_0 ;
  input \old_grant[0]_i_3_1 ;
  input \old_grant[0]_i_3_2 ;
  input \old_grant[0]_i_3_3 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid;
  input [0:0]\state_cur_reg[0]_2 ;
  input FETCH_REC_Instr_valid_reg_6;

  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[7] ;
  wire [0:0]\EXE1_Instr_reg[9] ;
  wire EXE1_Instr_valid;
  wire EXE1_Instr_valid_reg;
  wire EXE1_Instr_valid_reg_0;
  wire \EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[9] ;
  wire EXE2_Instr_valid;
  wire [6:0]EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg;
  wire [0:0]FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire FETCH_REC_Instr_valid_reg_3;
  wire FETCH_REC_Instr_valid_reg_4;
  wire FETCH_REC_Instr_valid_reg_5;
  wire FETCH_REC_Instr_valid_reg_6;
  wire [10:0]Q;
  wire [0:0]SS;
  wire clk;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire [0:0]cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire [0:0]cur_is_even_character_reg_1;
  wire [7:0]cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire [2:0]\old_grant[0]_i_3 ;
  wire \old_grant[0]_i_3_0 ;
  wire \old_grant[0]_i_3_1 ;
  wire \old_grant[0]_i_3_2 ;
  wire \old_grant[0]_i_3_3 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire [31:0]\old_grant_reg[0]_i_10 ;
  wire \state_cur_reg[0] ;
  wire \state_cur_reg[0]_0 ;
  wire [0:0]\state_cur_reg[0]_1 ;
  wire [0:0]\state_cur_reg[0]_2 ;
  wire \tail_reg[4] ;

  arbiter_rr_n arbiter
       (.DINADIN(DINADIN),
        .E(E),
        .\EXE1_Instr_reg[7] (\EXE1_Instr_reg[7] ),
        .\EXE1_Instr_reg[9] (\EXE1_Instr_reg[9] ),
        .EXE1_Instr_valid(EXE1_Instr_valid),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg),
        .EXE1_Instr_valid_reg_0(EXE1_Instr_valid_reg_0),
        .\EXE2_Instr_reg[15] (\EXE2_Instr_reg[15] ),
        .\EXE2_Instr_reg[9] (\EXE2_Instr_reg[9] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg(EXE2_Instr_valid_reg),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg_1(FETCH_REC_Instr_valid_reg_1),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid_reg_2),
        .FETCH_REC_Instr_valid_reg_3(FETCH_REC_Instr_valid_reg_3),
        .FETCH_REC_Instr_valid_reg_4(FETCH_REC_Instr_valid_reg_4),
        .FETCH_REC_Instr_valid_reg_5(FETCH_REC_Instr_valid_reg_5),
        .FETCH_REC_Instr_valid_reg_6(FETCH_REC_Instr_valid_reg_6),
        .Q(Q),
        .SS(SS),
        .clk(clk),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .content_reg_bram_0_1(content_reg_bram_0_1),
        .content_reg_bram_0_10(content_reg_bram_0_10),
        .content_reg_bram_0_11(content_reg_bram_0_11),
        .content_reg_bram_0_12(content_reg_bram_0_12),
        .content_reg_bram_0_13(content_reg_bram_0_13),
        .content_reg_bram_0_14(content_reg_bram_0_14),
        .content_reg_bram_0_2(content_reg_bram_0_2),
        .content_reg_bram_0_3(content_reg_bram_0_3),
        .content_reg_bram_0_4(content_reg_bram_0_4),
        .content_reg_bram_0_5(content_reg_bram_0_5),
        .content_reg_bram_0_6(content_reg_bram_0_6),
        .content_reg_bram_0_7(content_reg_bram_0_7),
        .content_reg_bram_0_8(content_reg_bram_0_8),
        .content_reg_bram_0_9(content_reg_bram_0_9),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .cur_is_even_character_reg_2(cur_is_even_character_reg_2),
        .cur_is_even_character_reg_3(cur_is_even_character_reg_3),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\old_grant[0]_i_3 (\old_grant[0]_i_3 ),
        .\old_grant[0]_i_3_0 (\old_grant[0]_i_3_0 ),
        .\old_grant[0]_i_3_1 (\old_grant[0]_i_3_1 ),
        .\old_grant[0]_i_3_2 (\old_grant[0]_i_3_2 ),
        .\old_grant[0]_i_3_3 (\old_grant[0]_i_3_3 ),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_3 ),
        .\old_grant_reg[0]_i_10 (\old_grant_reg[0]_i_10 ),
        .\state_cur_reg[0] (\state_cur_reg[0] ),
        .\state_cur_reg[0]_0 (\state_cur_reg[0]_0 ),
        .\state_cur_reg[0]_1 (\state_cur_reg[0]_1 ),
        .\state_cur_reg[0]_2 (\state_cur_reg[0]_2 ),
        .\tail_reg[4] (\tail_reg[4] ));
endmodule

module arbiter_rr_n
   (SS,
    FETCH_REC_Instr_valid_reg,
    EXE1_Instr_valid_reg,
    E,
    \EXE1_Instr_reg[9] ,
    cur_is_even_character_reg,
    \old_grant_reg[0] ,
    cur_is_even_character_reg_0,
    \state_cur_reg[0] ,
    cur_is_even_character_reg_1,
    DINADIN,
    cur_is_even_character_reg_2,
    \EXE1_Instr_reg[7] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \EXE2_Instr_reg[9] ,
    EXE1_Instr_valid_reg_0,
    cur_is_even_character_reg_3,
    \state_cur_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_0,
    FETCH_REC_Instr_valid_reg_1,
    clk,
    \old_grant_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_2,
    EXE1_Instr_valid,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \EXE2_Instr_reg[15] ,
    FETCH_REC_Instr_valid_reg_3,
    FETCH_REC_Instr_valid_reg_4,
    FETCH_REC_Instr_valid_reg_5,
    content_reg_bram_0,
    \tail_reg[4] ,
    cur_is_even_character,
    \state_cur_reg[0]_1 ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    EXE2_Instr_valid_reg,
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
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    \old_grant_reg[0]_1 ,
    \old_grant[0]_i_3 ,
    \old_grant_reg[0]_i_10 ,
    \old_grant_reg[0]_2 ,
    \old_grant_reg[0]_3 ,
    \old_grant[0]_i_3_0 ,
    \old_grant[0]_i_3_1 ,
    \old_grant[0]_i_3_2 ,
    \old_grant[0]_i_3_3 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid,
    \state_cur_reg[0]_2 ,
    FETCH_REC_Instr_valid_reg_6);
  output [0:0]SS;
  output FETCH_REC_Instr_valid_reg;
  output EXE1_Instr_valid_reg;
  output [0:0]E;
  output [0:0]\EXE1_Instr_reg[9] ;
  output [0:0]cur_is_even_character_reg;
  output \old_grant_reg[0] ;
  output cur_is_even_character_reg_0;
  output \state_cur_reg[0] ;
  output [0:0]cur_is_even_character_reg_1;
  output [7:0]DINADIN;
  output [7:0]cur_is_even_character_reg_2;
  output \EXE1_Instr_reg[7] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \EXE2_Instr_reg[9] ;
  output EXE1_Instr_valid_reg_0;
  output cur_is_even_character_reg_3;
  output \state_cur_reg[0]_0 ;
  output [0:0]FETCH_REC_Instr_valid_reg_0;
  output FETCH_REC_Instr_valid_reg_1;
  input clk;
  input \old_grant_reg[0]_0 ;
  input FETCH_REC_Instr_valid_reg_2;
  input EXE1_Instr_valid;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [10:0]Q;
  input \EXE2_Instr_reg[15] ;
  input FETCH_REC_Instr_valid_reg_3;
  input FETCH_REC_Instr_valid_reg_4;
  input FETCH_REC_Instr_valid_reg_5;
  input content_reg_bram_0;
  input \tail_reg[4] ;
  input cur_is_even_character;
  input [0:0]\state_cur_reg[0]_1 ;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input [6:0]EXE2_Instr_valid_reg;
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
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input \old_grant_reg[0]_1 ;
  input [2:0]\old_grant[0]_i_3 ;
  input [31:0]\old_grant_reg[0]_i_10 ;
  input \old_grant_reg[0]_2 ;
  input \old_grant_reg[0]_3 ;
  input \old_grant[0]_i_3_0 ;
  input \old_grant[0]_i_3_1 ;
  input \old_grant[0]_i_3_2 ;
  input \old_grant[0]_i_3_3 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid;
  input [0:0]\state_cur_reg[0]_2 ;
  input FETCH_REC_Instr_valid_reg_6;

  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[7] ;
  wire [0:0]\EXE1_Instr_reg[9] ;
  wire EXE1_Instr_valid;
  wire EXE1_Instr_valid_reg;
  wire EXE1_Instr_valid_reg_0;
  wire \EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[9] ;
  wire EXE2_Instr_valid;
  wire [6:0]EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg;
  wire [0:0]FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire FETCH_REC_Instr_valid_reg_3;
  wire FETCH_REC_Instr_valid_reg_4;
  wire FETCH_REC_Instr_valid_reg_5;
  wire FETCH_REC_Instr_valid_reg_6;
  wire [10:0]Q;
  wire [0:0]SS;
  wire clk;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire [0:0]cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire [0:0]cur_is_even_character_reg_1;
  wire [7:0]cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire [2:0]\old_grant[0]_i_3 ;
  wire \old_grant[0]_i_3_0 ;
  wire \old_grant[0]_i_3_1 ;
  wire \old_grant[0]_i_3_2 ;
  wire \old_grant[0]_i_3_3 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire [31:0]\old_grant_reg[0]_i_10 ;
  wire \state_cur_reg[0] ;
  wire \state_cur_reg[0]_0 ;
  wire [0:0]\state_cur_reg[0]_1 ;
  wire [0:0]\state_cur_reg[0]_2 ;
  wire \tail_reg[4] ;

  arbitration_logic_rr arbitration_logic
       (.DINADIN(DINADIN),
        .E(E),
        .\EXE1_Instr_reg[7] (\EXE1_Instr_reg[7] ),
        .\EXE1_Instr_reg[9] (\EXE1_Instr_reg[9] ),
        .EXE1_Instr_valid(EXE1_Instr_valid),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg),
        .EXE1_Instr_valid_reg_0(EXE1_Instr_valid_reg_0),
        .\EXE2_Instr_reg[15] (\EXE2_Instr_reg[15] ),
        .\EXE2_Instr_reg[9] (\EXE2_Instr_reg[9] ),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg(EXE2_Instr_valid_reg),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg_0),
        .FETCH_REC_Instr_valid_reg_1(FETCH_REC_Instr_valid_reg_1),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid_reg_2),
        .FETCH_REC_Instr_valid_reg_3(FETCH_REC_Instr_valid_reg_3),
        .FETCH_REC_Instr_valid_reg_4(FETCH_REC_Instr_valid_reg_4),
        .FETCH_REC_Instr_valid_reg_5(FETCH_REC_Instr_valid_reg_5),
        .FETCH_REC_Instr_valid_reg_6(FETCH_REC_Instr_valid_reg_6),
        .Q(Q),
        .SS(SS),
        .clk(clk),
        .content_reg_bram_0(content_reg_bram_0),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .content_reg_bram_0_1(content_reg_bram_0_1),
        .content_reg_bram_0_10(content_reg_bram_0_10),
        .content_reg_bram_0_11(content_reg_bram_0_11),
        .content_reg_bram_0_12(content_reg_bram_0_12),
        .content_reg_bram_0_13(content_reg_bram_0_13),
        .content_reg_bram_0_14(content_reg_bram_0_14),
        .content_reg_bram_0_2(content_reg_bram_0_2),
        .content_reg_bram_0_3(content_reg_bram_0_3),
        .content_reg_bram_0_4(content_reg_bram_0_4),
        .content_reg_bram_0_5(content_reg_bram_0_5),
        .content_reg_bram_0_6(content_reg_bram_0_6),
        .content_reg_bram_0_7(content_reg_bram_0_7),
        .content_reg_bram_0_8(content_reg_bram_0_8),
        .content_reg_bram_0_9(content_reg_bram_0_9),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .cur_is_even_character_reg_2(cur_is_even_character_reg_2),
        .cur_is_even_character_reg_3(cur_is_even_character_reg_3),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\old_grant[0]_i_3_0 (\old_grant[0]_i_3 ),
        .\old_grant[0]_i_3_1 (\old_grant[0]_i_3_0 ),
        .\old_grant[0]_i_3_2 (\old_grant[0]_i_3_1 ),
        .\old_grant[0]_i_3_3 (\old_grant[0]_i_3_2 ),
        .\old_grant[0]_i_3_4 (\old_grant[0]_i_3_3 ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0] ),
        .\old_grant_reg[0]_1 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_4 (\old_grant_reg[0]_3 ),
        .\old_grant_reg[0]_i_10_0 (\old_grant_reg[0]_i_10 ),
        .\state_cur_reg[0] (\state_cur_reg[0] ),
        .\state_cur_reg[0]_0 (\state_cur_reg[0]_0 ),
        .\state_cur_reg[0]_1 (\state_cur_reg[0]_1 ),
        .\state_cur_reg[0]_2 (\state_cur_reg[0]_2 ),
        .\tail_reg[4] (\tail_reg[4] ));
endmodule

module arbitration_logic_rr
   (SS,
    FETCH_REC_Instr_valid_reg,
    EXE1_Instr_valid_reg,
    E,
    \EXE1_Instr_reg[9] ,
    cur_is_even_character_reg,
    \old_grant_reg[0]_0 ,
    cur_is_even_character_reg_0,
    \state_cur_reg[0] ,
    cur_is_even_character_reg_1,
    DINADIN,
    cur_is_even_character_reg_2,
    \EXE1_Instr_reg[7] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \EXE2_Instr_reg[9] ,
    EXE1_Instr_valid_reg_0,
    cur_is_even_character_reg_3,
    \state_cur_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg_0,
    FETCH_REC_Instr_valid_reg_1,
    clk,
    \old_grant_reg[0]_1 ,
    FETCH_REC_Instr_valid_reg_2,
    EXE1_Instr_valid,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    Q,
    \EXE2_Instr_reg[15] ,
    FETCH_REC_Instr_valid_reg_3,
    FETCH_REC_Instr_valid_reg_4,
    FETCH_REC_Instr_valid_reg_5,
    content_reg_bram_0,
    \tail_reg[4] ,
    cur_is_even_character,
    \state_cur_reg[0]_1 ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    content_reg_bram_0_2,
    EXE2_Instr_valid_reg,
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
    content_reg_bram_0_13,
    content_reg_bram_0_14,
    \old_grant_reg[0]_2 ,
    \old_grant[0]_i_3_0 ,
    \old_grant_reg[0]_i_10_0 ,
    \old_grant_reg[0]_3 ,
    \old_grant_reg[0]_4 ,
    \old_grant[0]_i_3_1 ,
    \old_grant[0]_i_3_2 ,
    \old_grant[0]_i_3_3 ,
    \old_grant[0]_i_3_4 ,
    EXE2_Instr_valid_reg_0,
    EXE2_Instr_valid,
    \state_cur_reg[0]_2 ,
    FETCH_REC_Instr_valid_reg_6);
  output [0:0]SS;
  output FETCH_REC_Instr_valid_reg;
  output EXE1_Instr_valid_reg;
  output [0:0]E;
  output [0:0]\EXE1_Instr_reg[9] ;
  output [0:0]cur_is_even_character_reg;
  output \old_grant_reg[0]_0 ;
  output cur_is_even_character_reg_0;
  output \state_cur_reg[0] ;
  output [0:0]cur_is_even_character_reg_1;
  output [7:0]DINADIN;
  output [7:0]cur_is_even_character_reg_2;
  output \EXE1_Instr_reg[7] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \EXE2_Instr_reg[9] ;
  output EXE1_Instr_valid_reg_0;
  output cur_is_even_character_reg_3;
  output \state_cur_reg[0]_0 ;
  output [0:0]FETCH_REC_Instr_valid_reg_0;
  output FETCH_REC_Instr_valid_reg_1;
  input clk;
  input \old_grant_reg[0]_1 ;
  input FETCH_REC_Instr_valid_reg_2;
  input EXE1_Instr_valid;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [10:0]Q;
  input \EXE2_Instr_reg[15] ;
  input FETCH_REC_Instr_valid_reg_3;
  input FETCH_REC_Instr_valid_reg_4;
  input FETCH_REC_Instr_valid_reg_5;
  input content_reg_bram_0;
  input \tail_reg[4] ;
  input cur_is_even_character;
  input [0:0]\state_cur_reg[0]_1 ;
  input content_reg_bram_0_0;
  input content_reg_bram_0_1;
  input content_reg_bram_0_2;
  input [6:0]EXE2_Instr_valid_reg;
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
  input content_reg_bram_0_13;
  input content_reg_bram_0_14;
  input \old_grant_reg[0]_2 ;
  input [2:0]\old_grant[0]_i_3_0 ;
  input [31:0]\old_grant_reg[0]_i_10_0 ;
  input \old_grant_reg[0]_3 ;
  input \old_grant_reg[0]_4 ;
  input \old_grant[0]_i_3_1 ;
  input \old_grant[0]_i_3_2 ;
  input \old_grant[0]_i_3_3 ;
  input \old_grant[0]_i_3_4 ;
  input EXE2_Instr_valid_reg_0;
  input EXE2_Instr_valid;
  input [0:0]\state_cur_reg[0]_2 ;
  input FETCH_REC_Instr_valid_reg_6;

  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[7] ;
  wire [0:0]\EXE1_Instr_reg[9] ;
  wire EXE1_Instr_valid;
  wire EXE1_Instr_valid_reg;
  wire EXE1_Instr_valid_reg_0;
  wire \EXE2_Instr_reg[15] ;
  wire \EXE2_Instr_reg[9] ;
  wire EXE2_Instr_valid;
  wire [6:0]EXE2_Instr_valid_reg;
  wire EXE2_Instr_valid_reg_0;
  wire \FETCH_REC_Instr[15]_i_3_n_0 ;
  wire FETCH_REC_Instr_valid_reg;
  wire [0:0]FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire FETCH_REC_Instr_valid_reg_2;
  wire FETCH_REC_Instr_valid_reg_3;
  wire FETCH_REC_Instr_valid_reg_4;
  wire FETCH_REC_Instr_valid_reg_5;
  wire FETCH_REC_Instr_valid_reg_6;
  wire [10:0]Q;
  wire [0:0]SS;
  wire clk;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_10;
  wire content_reg_bram_0_11;
  wire content_reg_bram_0_12;
  wire content_reg_bram_0_13;
  wire content_reg_bram_0_14;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_6;
  wire content_reg_bram_0_7;
  wire content_reg_bram_0_8;
  wire content_reg_bram_0_9;
  wire content_reg_bram_0_i_25_n_0;
  wire content_reg_bram_0_i_27_n_0;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire [0:0]cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire [0:0]cur_is_even_character_reg_1;
  wire [7:0]cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire [0:0]in_ready_packed;
  wire [1:1]mask;
  wire \old_grant[0]_i_12_n_0 ;
  wire \old_grant[0]_i_13_n_0 ;
  wire \old_grant[0]_i_22_n_0 ;
  wire \old_grant[0]_i_23_n_0 ;
  wire \old_grant[0]_i_24_n_0 ;
  wire \old_grant[0]_i_25_n_0 ;
  wire \old_grant[0]_i_2_n_0 ;
  wire [2:0]\old_grant[0]_i_3_0 ;
  wire \old_grant[0]_i_3_1 ;
  wire \old_grant[0]_i_3_2 ;
  wire \old_grant[0]_i_3_3 ;
  wire \old_grant[0]_i_3_4 ;
  wire \old_grant[0]_i_3_n_0 ;
  wire \old_grant[0]_i_8_n_0 ;
  wire \old_grant[0]_i_9_n_0 ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire \old_grant_reg[0]_3 ;
  wire \old_grant_reg[0]_4 ;
  wire [31:0]\old_grant_reg[0]_i_10_0 ;
  wire \state_cur_reg[0] ;
  wire \state_cur_reg[0]_0 ;
  wire [0:0]\state_cur_reg[0]_1 ;
  wire [0:0]\state_cur_reg[0]_2 ;
  wire \tail_reg[4] ;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hA2)) 
    \EXE1_Instr[15]_i_1 
       (.I0(FETCH_REC_Instr_valid_reg_2),
        .I1(EXE1_Instr_valid),
        .I2(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h88A8)) 
    EXE1_Instr_valid_i_1
       (.I0(\old_grant_reg[0]_1 ),
        .I1(FETCH_REC_Instr_valid_reg_2),
        .I2(EXE1_Instr_valid),
        .I3(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .O(FETCH_REC_Instr_valid_reg));
  LUT5 #(
    .INIT(32'h10000000)) 
    \EXE2_Instr[15]_i_1 
       (.I0(Q[9]),
        .I1(Q[10]),
        .I2(Q[8]),
        .I3(\EXE2_Instr_reg[15] ),
        .I4(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .O(\EXE1_Instr_reg[9] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF02000000)) 
    EXE2_Instr_valid_i_1
       (.I0(EXE2_Instr_valid_reg_0),
        .I1(content_reg_bram_0_i_25_n_0),
        .I2(EXE2_Instr_valid_reg[6]),
        .I3(EXE2_Instr_valid_reg[5]),
        .I4(EXE2_Instr_valid),
        .I5(\EXE1_Instr_reg[9] ),
        .O(\EXE2_Instr_reg[9] ));
  LUT3 #(
    .INIT(8'h5D)) 
    \FETCH_REC_Instr[15]_i_1 
       (.I0(FETCH_REC_Instr_valid_reg_2),
        .I1(EXE1_Instr_valid),
        .I2(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .O(FETCH_REC_Instr_valid_reg_0));
  LUT6 #(
    .INIT(64'h00707070007000F0)) 
    \FETCH_REC_Instr[15]_i_3 
       (.I0(FETCH_REC_Instr_valid_reg_3),
        .I1(FETCH_REC_Instr_valid_reg_4),
        .I2(EXE1_Instr_valid),
        .I3(FETCH_REC_Instr_valid_reg_5),
        .I4(content_reg_bram_0),
        .I5(in_ready_packed),
        .O(\FETCH_REC_Instr[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h08FF)) 
    FETCH_REC_Instr_valid_i_1
       (.I0(FETCH_REC_Instr_valid_reg_2),
        .I1(EXE1_Instr_valid),
        .I2(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .I3(FETCH_REC_Instr_valid_reg_6),
        .O(FETCH_REC_Instr_valid_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h38)) 
    content_reg_bram_0_i_1
       (.I0(\tail_reg[4] ),
        .I1(\old_grant_reg[0]_0 ),
        .I2(cur_is_even_character),
        .O(cur_is_even_character_reg));
  LUT6 #(
    .INIT(64'h6666600060006000)) 
    content_reg_bram_0_i_10
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(EXE2_Instr_valid_reg[2]),
        .I3(content_reg_bram_0_i_25_n_0),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_6),
        .O(DINADIN[4]));
  LUT6 #(
    .INIT(64'h9999900090009000)) 
    content_reg_bram_0_i_10__0
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(EXE2_Instr_valid_reg[2]),
        .I3(content_reg_bram_0_i_25_n_0),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_6),
        .O(cur_is_even_character_reg_2[4]));
  LUT6 #(
    .INIT(64'h6666006000600060)) 
    content_reg_bram_0_i_11
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_25_n_0),
        .I3(content_reg_bram_0_4),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_5),
        .O(DINADIN[3]));
  LUT6 #(
    .INIT(64'h9999009000900090)) 
    content_reg_bram_0_i_11__0
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_25_n_0),
        .I3(content_reg_bram_0_4),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_5),
        .O(cur_is_even_character_reg_2[3]));
  LUT6 #(
    .INIT(64'h6666600060006000)) 
    content_reg_bram_0_i_12
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_27_n_0),
        .I3(content_reg_bram_0_3),
        .I4(EXE2_Instr_valid_reg[1]),
        .I5(content_reg_bram_0_i_25_n_0),
        .O(DINADIN[2]));
  LUT6 #(
    .INIT(64'h9999900090009000)) 
    content_reg_bram_0_i_12__0
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_27_n_0),
        .I3(content_reg_bram_0_3),
        .I4(EXE2_Instr_valid_reg[1]),
        .I5(content_reg_bram_0_i_25_n_0),
        .O(cur_is_even_character_reg_2[2]));
  LUT6 #(
    .INIT(64'h6666600060006000)) 
    content_reg_bram_0_i_13
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_27_n_0),
        .I3(content_reg_bram_0_2),
        .I4(EXE2_Instr_valid_reg[0]),
        .I5(content_reg_bram_0_i_25_n_0),
        .O(DINADIN[1]));
  LUT6 #(
    .INIT(64'h9999900090009000)) 
    content_reg_bram_0_i_13__0
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_27_n_0),
        .I3(content_reg_bram_0_2),
        .I4(EXE2_Instr_valid_reg[0]),
        .I5(content_reg_bram_0_i_25_n_0),
        .O(cur_is_even_character_reg_2[1]));
  LUT6 #(
    .INIT(64'h6666006000600060)) 
    content_reg_bram_0_i_14
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_25_n_0),
        .I3(content_reg_bram_0_0),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_1),
        .O(DINADIN[0]));
  LUT6 #(
    .INIT(64'h9999009000900090)) 
    content_reg_bram_0_i_14__0
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_25_n_0),
        .I3(content_reg_bram_0_0),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_1),
        .O(cur_is_even_character_reg_2[0]));
  LUT6 #(
    .INIT(64'h3737377737373333)) 
    content_reg_bram_0_i_17
       (.I0(content_reg_bram_0_11),
        .I1(content_reg_bram_0_12),
        .I2(FETCH_REC_Instr_valid_reg_3),
        .I3(mask),
        .I4(content_reg_bram_0_13),
        .I5(content_reg_bram_0_14),
        .O(\old_grant_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h83)) 
    content_reg_bram_0_i_1__0
       (.I0(\tail_reg[4] ),
        .I1(\old_grant_reg[0]_0 ),
        .I2(cur_is_even_character),
        .O(cur_is_even_character_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h00E0)) 
    content_reg_bram_0_i_25
       (.I0(content_reg_bram_0_13),
        .I1(mask),
        .I2(FETCH_REC_Instr_valid_reg_3),
        .I3(content_reg_bram_0),
        .O(content_reg_bram_0_i_25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0015)) 
    content_reg_bram_0_i_27
       (.I0(content_reg_bram_0_13),
        .I1(mask),
        .I2(FETCH_REC_Instr_valid_reg_3),
        .I3(content_reg_bram_0),
        .O(content_reg_bram_0_i_27_n_0));
  LUT6 #(
    .INIT(64'h6666006000600060)) 
    content_reg_bram_0_i_7
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_25_n_0),
        .I3(content_reg_bram_0_9),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_10),
        .O(DINADIN[7]));
  LUT6 #(
    .INIT(64'h9999009000900090)) 
    content_reg_bram_0_i_7__0
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(content_reg_bram_0_i_25_n_0),
        .I3(content_reg_bram_0_9),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_10),
        .O(cur_is_even_character_reg_2[7]));
  LUT6 #(
    .INIT(64'h6666600060006000)) 
    content_reg_bram_0_i_8
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(EXE2_Instr_valid_reg[4]),
        .I3(content_reg_bram_0_i_25_n_0),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_8),
        .O(DINADIN[6]));
  LUT6 #(
    .INIT(64'h9999900090009000)) 
    content_reg_bram_0_i_8__0
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(EXE2_Instr_valid_reg[4]),
        .I3(content_reg_bram_0_i_25_n_0),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_8),
        .O(cur_is_even_character_reg_2[6]));
  LUT6 #(
    .INIT(64'h6666600060006000)) 
    content_reg_bram_0_i_9
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(EXE2_Instr_valid_reg[3]),
        .I3(content_reg_bram_0_i_25_n_0),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_7),
        .O(DINADIN[5]));
  LUT6 #(
    .INIT(64'h9999900090009000)) 
    content_reg_bram_0_i_9__0
       (.I0(\old_grant_reg[0]_0 ),
        .I1(cur_is_even_character),
        .I2(EXE2_Instr_valid_reg[3]),
        .I3(content_reg_bram_0_i_25_n_0),
        .I4(content_reg_bram_0_i_27_n_0),
        .I5(content_reg_bram_0_7),
        .O(cur_is_even_character_reg_2[5]));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_3 
       (.I0(\old_grant_reg[0]_1 ),
        .O(SS));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFF40)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_57 
       (.I0(\FETCH_REC_Instr[15]_i_3_n_0 ),
        .I1(EXE1_Instr_valid),
        .I2(FETCH_REC_Instr_valid_reg_2),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .O(EXE1_Instr_valid_reg));
  LUT6 #(
    .INIT(64'h012F2F2FFFFFFFFF)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_79 
       (.I0(in_ready_packed),
        .I1(content_reg_bram_0),
        .I2(FETCH_REC_Instr_valid_reg_5),
        .I3(FETCH_REC_Instr_valid_reg_4),
        .I4(FETCH_REC_Instr_valid_reg_3),
        .I5(EXE1_Instr_valid),
        .O(EXE1_Instr_valid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0091)) 
    \middle[7]_i_4 
       (.I0(cur_is_even_character),
        .I1(\old_grant_reg[0]_0 ),
        .I2(\tail_reg[4] ),
        .I3(\state_cur_reg[0]_1 ),
        .O(cur_is_even_character_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0062)) 
    \middle[7]_i_4__0 
       (.I0(cur_is_even_character),
        .I1(\old_grant_reg[0]_0 ),
        .I2(\tail_reg[4] ),
        .I3(\state_cur_reg[0]_2 ),
        .O(cur_is_even_character_reg_3));
  LUT6 #(
    .INIT(64'h00000000888A8888)) 
    \old_grant[0]_i_1 
       (.I0(\old_grant[0]_i_2_n_0 ),
        .I1(Q[8]),
        .I2(\old_grant[0]_i_3_n_0 ),
        .I3(\EXE1_Instr_reg[7] ),
        .I4(Q[9]),
        .I5(\old_grant_reg[0]_2 ),
        .O(in_ready_packed));
  LUT4 #(
    .INIT(16'h56A6)) 
    \old_grant[0]_i_12 
       (.I0(Q[5]),
        .I1(\cur_ccs_reg[29] ),
        .I2(\old_grant[0]_i_3_0 [2]),
        .I3(\cur_ccs_reg[61] ),
        .O(\old_grant[0]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \old_grant[0]_i_13 
       (.I0(Q[4]),
        .I1(\cur_ccs_reg[28] ),
        .I2(\old_grant[0]_i_3_0 [2]),
        .I3(\cur_ccs_reg[60] ),
        .O(\old_grant[0]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \old_grant[0]_i_2 
       (.I0(mask),
        .I1(FETCH_REC_Instr_valid_reg_3),
        .O(\old_grant[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_22 
       (.I0(\old_grant_reg[0]_i_10_0 [15]),
        .I1(\old_grant_reg[0]_i_10_0 [11]),
        .I2(\old_grant[0]_i_3_0 [1]),
        .I3(\old_grant_reg[0]_i_10_0 [7]),
        .I4(\old_grant[0]_i_3_0 [0]),
        .I5(\old_grant_reg[0]_i_10_0 [3]),
        .O(\old_grant[0]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_23 
       (.I0(\old_grant_reg[0]_i_10_0 [31]),
        .I1(\old_grant_reg[0]_i_10_0 [27]),
        .I2(\old_grant[0]_i_3_0 [1]),
        .I3(\old_grant_reg[0]_i_10_0 [23]),
        .I4(\old_grant[0]_i_3_0 [0]),
        .I5(\old_grant_reg[0]_i_10_0 [19]),
        .O(\old_grant[0]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_24 
       (.I0(\old_grant_reg[0]_i_10_0 [14]),
        .I1(\old_grant_reg[0]_i_10_0 [10]),
        .I2(\old_grant[0]_i_3_0 [1]),
        .I3(\old_grant_reg[0]_i_10_0 [6]),
        .I4(\old_grant[0]_i_3_0 [0]),
        .I5(\old_grant_reg[0]_i_10_0 [2]),
        .O(\old_grant[0]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_25 
       (.I0(\old_grant_reg[0]_i_10_0 [30]),
        .I1(\old_grant_reg[0]_i_10_0 [26]),
        .I2(\old_grant[0]_i_3_0 [1]),
        .I3(\old_grant_reg[0]_i_10_0 [22]),
        .I4(\old_grant[0]_i_3_0 [0]),
        .I5(\old_grant_reg[0]_i_10_0 [18]),
        .O(\old_grant[0]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_26 
       (.I0(\old_grant_reg[0]_i_10_0 [13]),
        .I1(\old_grant_reg[0]_i_10_0 [9]),
        .I2(\old_grant[0]_i_3_0 [1]),
        .I3(\old_grant_reg[0]_i_10_0 [5]),
        .I4(\old_grant[0]_i_3_0 [0]),
        .I5(\old_grant_reg[0]_i_10_0 [1]),
        .O(\cur_ccs_reg[29] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_27 
       (.I0(\old_grant_reg[0]_i_10_0 [29]),
        .I1(\old_grant_reg[0]_i_10_0 [25]),
        .I2(\old_grant[0]_i_3_0 [1]),
        .I3(\old_grant_reg[0]_i_10_0 [21]),
        .I4(\old_grant[0]_i_3_0 [0]),
        .I5(\old_grant_reg[0]_i_10_0 [17]),
        .O(\cur_ccs_reg[61] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_28 
       (.I0(\old_grant_reg[0]_i_10_0 [12]),
        .I1(\old_grant_reg[0]_i_10_0 [8]),
        .I2(\old_grant[0]_i_3_0 [1]),
        .I3(\old_grant_reg[0]_i_10_0 [4]),
        .I4(\old_grant[0]_i_3_0 [0]),
        .I5(\old_grant_reg[0]_i_10_0 [0]),
        .O(\cur_ccs_reg[28] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_29 
       (.I0(\old_grant_reg[0]_i_10_0 [28]),
        .I1(\old_grant_reg[0]_i_10_0 [24]),
        .I2(\old_grant[0]_i_3_0 [1]),
        .I3(\old_grant_reg[0]_i_10_0 [20]),
        .I4(\old_grant[0]_i_3_0 [0]),
        .I5(\old_grant_reg[0]_i_10_0 [16]),
        .O(\cur_ccs_reg[60] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FF6)) 
    \old_grant[0]_i_3 
       (.I0(Q[0]),
        .I1(\old_grant_reg[0]_3 ),
        .I2(Q[1]),
        .I3(\old_grant_reg[0]_4 ),
        .I4(\old_grant[0]_i_8_n_0 ),
        .I5(\old_grant[0]_i_9_n_0 ),
        .O(\old_grant[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FF6)) 
    \old_grant[0]_i_4 
       (.I0(Q[7]),
        .I1(\cur_cc_pointer_reg[2] ),
        .I2(Q[6]),
        .I3(\cur_cc_pointer_reg[2]_0 ),
        .I4(\old_grant[0]_i_12_n_0 ),
        .I5(\old_grant[0]_i_13_n_0 ),
        .O(\EXE1_Instr_reg[7] ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \old_grant[0]_i_8 
       (.I0(Q[2]),
        .I1(\old_grant[0]_i_3_1 ),
        .I2(\old_grant[0]_i_3_0 [2]),
        .I3(\old_grant[0]_i_3_2 ),
        .O(\old_grant[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \old_grant[0]_i_9 
       (.I0(Q[3]),
        .I1(\old_grant[0]_i_3_3 ),
        .I2(\old_grant[0]_i_3_0 [2]),
        .I3(\old_grant[0]_i_3_4 ),
        .O(\old_grant[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_grant_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(in_ready_packed),
        .Q(mask),
        .R(SS));
  MUXF7 \old_grant_reg[0]_i_10 
       (.I0(\old_grant[0]_i_22_n_0 ),
        .I1(\old_grant[0]_i_23_n_0 ),
        .O(\cur_cc_pointer_reg[2] ),
        .S(\old_grant[0]_i_3_0 [2]));
  MUXF7 \old_grant_reg[0]_i_11 
       (.I0(\old_grant[0]_i_24_n_0 ),
        .I1(\old_grant[0]_i_25_n_0 ),
        .O(\cur_cc_pointer_reg[2]_0 ),
        .S(\old_grant[0]_i_3_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hEBAB)) 
    \state_cur[2]_i_3 
       (.I0(\state_cur_reg[0]_1 ),
        .I1(cur_is_even_character),
        .I2(\old_grant_reg[0]_0 ),
        .I3(\tail_reg[4] ),
        .O(\state_cur_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h4151)) 
    \state_cur[2]_i_3__0 
       (.I0(\state_cur_reg[0]_2 ),
        .I1(cur_is_even_character),
        .I2(\old_grant_reg[0]_0 ),
        .I3(\tail_reg[4] ),
        .O(\state_cur_reg[0]_0 ));
endmodule

module bram
   (D,
    data_o_register_OBUF,
    \address_register[1] ,
    \FSM_sequential_status_register_reg[1] ,
    \address_register[2] ,
    \address_register[3] ,
    \address_register[4] ,
    \address_register[5] ,
    \address_register[6] ,
    \cmd_register[11] ,
    \FSM_sequential_status_register_reg[2] ,
    \FSM_sequential_status_register_reg[2]_0 ,
    \FSM_sequential_status_register_reg[2]_1 ,
    \cmd_register[0] ,
    \FSM_sequential_status_register_reg[2]_2 ,
    \FSM_sequential_status_register_reg[0] ,
    CLK,
    bram_r_valid,
    SR,
    ADDRARDADDR,
    \data_o_register[31] ,
    cmd_register_IBUF,
    Q,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    data_in_register_IBUF);
  output [63:0]D;
  output [31:0]data_o_register_OBUF;
  output \address_register[1] ;
  output \FSM_sequential_status_register_reg[1] ;
  output \address_register[2] ;
  output \address_register[3] ;
  output \address_register[4] ;
  output \address_register[5] ;
  output \address_register[6] ;
  output \cmd_register[11] ;
  output \FSM_sequential_status_register_reg[2] ;
  output \FSM_sequential_status_register_reg[2]_0 ;
  output \FSM_sequential_status_register_reg[2]_1 ;
  output \cmd_register[0] ;
  output \FSM_sequential_status_register_reg[2]_2 ;
  output \FSM_sequential_status_register_reg[0] ;
  input CLK;
  input bram_r_valid;
  input [0:0]SR;
  input [8:0]ADDRARDADDR;
  input \data_o_register[31] ;
  input [31:0]cmd_register_IBUF;
  input [31:0]Q;
  input [9:0]address_register_IBUF;
  input [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input [31:0]data_in_register_IBUF;

  wire [8:0]ADDRARDADDR;
  wire CLK;
  wire [63:0]D;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[1] ;
  wire \FSM_sequential_status_register_reg[2] ;
  wire \FSM_sequential_status_register_reg[2]_0 ;
  wire \FSM_sequential_status_register_reg[2]_1 ;
  wire \FSM_sequential_status_register_reg[2]_2 ;
  wire [31:0]Q;
  wire [0:0]SR;
  wire \address_register[1] ;
  wire \address_register[2] ;
  wire \address_register[3] ;
  wire \address_register[4] ;
  wire \address_register[5] ;
  wire \address_register[6] ;
  wire [9:0]address_register_IBUF;
  wire bram_r_valid;
  wire \cmd_register[0] ;
  wire \cmd_register[11] ;
  wire [31:0]cmd_register_IBUF;
  wire [31:0]data_in_register_IBUF;
  wire \data_o_register[31] ;
  wire [31:0]data_o_register_OBUF;
  wire [2:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;

  BRAM_SDP_MACRO_viv_ BRAM_SDP_MACRO_inst
       (.ADDRARDADDR(ADDRARDADDR),
        .CLK(CLK),
        .D(D),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[1] (\FSM_sequential_status_register_reg[1] ),
        .\FSM_sequential_status_register_reg[2] (\FSM_sequential_status_register_reg[2] ),
        .\FSM_sequential_status_register_reg[2]_0 (\FSM_sequential_status_register_reg[2]_0 ),
        .\FSM_sequential_status_register_reg[2]_1 (\FSM_sequential_status_register_reg[2]_1 ),
        .\FSM_sequential_status_register_reg[2]_2 (\FSM_sequential_status_register_reg[2]_2 ),
        .Q(Q),
        .SR(SR),
        .\address_register[1] (\address_register[1] ),
        .\address_register[2] (\address_register[2] ),
        .\address_register[3] (\address_register[3] ),
        .\address_register[4] (\address_register[4] ),
        .\address_register[5] (\address_register[5] ),
        .\address_register[6] (\address_register[6] ),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .\cmd_register[0] (\cmd_register[0] ),
        .\cmd_register[11] (\cmd_register[11] ),
        .cmd_register_IBUF(cmd_register_IBUF),
        .data_in_register_IBUF(data_in_register_IBUF),
        .\data_o_register[31] (\data_o_register[31] ),
        .data_o_register_OBUF(data_o_register_OBUF),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ));
endmodule

module cache_block_directly_mapped
   (rst,
    bram_r_valid,
    \curState_reg[0]_0 ,
    FETCH_REC_Instr_valid_reg,
    E,
    FETCH_REC_Instr_valid_reg_0,
    \cmd_register[0] ,
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
    clk,
    \memory_bb\.addr ,
    D,
    SR,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    content_reg_bram_0,
    FETCH_REC_Instr_valid,
    content_reg_bram_0_0,
    rst_IBUF,
    cmd_register_IBUF,
    content_reg_16,
    \curState_reg[0]_1 ,
    \block_sel_saved_reg[1]_0 );
  output rst;
  output bram_r_valid;
  output \curState_reg[0]_0 ;
  output FETCH_REC_Instr_valid_reg;
  output [0:0]E;
  output FETCH_REC_Instr_valid_reg_0;
  output \cmd_register[0] ;
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
  input clk;
  input [5:0]\memory_bb\.addr ;
  input [63:0]D;
  input [0:0]SR;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input content_reg_bram_0;
  input FETCH_REC_Instr_valid;
  input content_reg_bram_0_0;
  input rst_IBUF;
  input [2:0]cmd_register_IBUF;
  input content_reg_16;
  input \curState_reg[0]_1 ;
  input [1:0]\block_sel_saved_reg[1]_0 ;

  wire [63:0]D;
  wire [0:0]E;
  wire FETCH_REC_Instr_valid;
  wire FETCH_REC_Instr_valid_reg;
  wire FETCH_REC_Instr_valid_reg_0;
  wire [0:0]SR;
  wire [1:0]block_sel_saved;
  wire [1:0]\block_sel_saved_reg[1]_0 ;
  wire bram_r_valid;
  wire [3:0]cache_line_saved;
  wire cache_line_saved__0;
  wire clk;
  wire \cmd_register[0] ;
  wire [2:0]cmd_register_IBUF;
  wire content_reg_0;
  wire content_reg_1;
  wire content_reg_10;
  wire content_reg_11;
  wire content_reg_12;
  wire content_reg_13;
  wire content_reg_14;
  wire content_reg_15;
  wire content_reg_16;
  wire content_reg_2;
  wire content_reg_3;
  wire content_reg_4;
  wire content_reg_5;
  wire content_reg_6;
  wire content_reg_7;
  wire content_reg_8;
  wire content_reg_9;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire [0:0]curState;
  wire \curState[0]_i_1_n_0 ;
  wire \curState_reg[0]_0 ;
  wire \curState_reg[0]_1 ;
  wire [63:0]data_from_memory;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_56_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_75_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_82_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_85_n_0 ;
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
  wire [5:0]\memory_bb\.addr ;
  wire p_0_in0_out;
  wire rst;
  wire rst_IBUF;
  wire [1:0]tag_saved;
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
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \FETCH_REC_Instr[7]_i_2 
       (.I0(data_from_memory[7]),
        .I1(data_from_memory[23]),
        .I2(data_from_memory[39]),
        .I3(block_sel_saved[1]),
        .I4(block_sel_saved[0]),
        .I5(data_from_memory[55]),
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
       (.I0(FETCH_REC_Instr_valid_reg_0),
        .O(E));
  FDRE #(
    .INIT(1'b0)) 
    \block_sel_saved_reg[0] 
       (.C(clk),
        .CE(cache_line_saved__0),
        .D(\block_sel_saved_reg[1]_0 [0]),
        .Q(block_sel_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \block_sel_saved_reg[1] 
       (.C(clk),
        .CE(cache_line_saved__0),
        .D(\block_sel_saved_reg[1]_0 [1]),
        .Q(block_sel_saved[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \cache_line_saved[3]_i_1 
       (.I0(rst),
        .I1(curState),
        .O(cache_line_saved__0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[0] 
       (.C(clk),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [0]),
        .Q(cache_line_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[1] 
       (.C(clk),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [1]),
        .Q(cache_line_saved[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[2] 
       (.C(clk),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [2]),
        .Q(cache_line_saved[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cache_line_saved_reg[3] 
       (.C(clk),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [3]),
        .Q(cache_line_saved[3]),
        .R(1'b0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "a_regex_coprocessor/a_topology/engine_interfaced/anEngine/a_cache/content" *) 
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
       (.ADDRARDADDR({1'b1,1'b1,1'b1,1'b1,1'b1,\memory_bb\.addr [3:0],1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
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
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(NLW_content_reg_DBITERR_UNCONNECTED),
        .DINADIN(D[31:0]),
        .DINBDIN(D[63:32]),
        .DINPADINP({1'b1,1'b1,1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(data_from_memory[31:0]),
        .DOUTBDOUT(data_from_memory[63:32]),
        .DOUTPADOUTP(NLW_content_reg_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_content_reg_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_content_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(rst),
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
        .WEBWE({rst,rst,rst,rst,rst,rst,rst,rst}));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFAE)) 
    content_reg_bram_0_i_18
       (.I0(content_reg_bram_0_0),
        .I1(FETCH_REC_Instr_valid),
        .I2(content_reg_bram_0),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80_n_0 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ),
        .I5(curState),
        .O(FETCH_REC_Instr_valid_reg_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFEFE)) 
    content_reg_bram_0_i_22
       (.I0(curState),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80_n_0 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ),
        .I3(content_reg_bram_0),
        .I4(FETCH_REC_Instr_valid),
        .I5(content_reg_bram_0_0),
        .O(\curState_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h5515)) 
    content_reg_i_1
       (.I0(rst_IBUF),
        .I1(\cmd_register[0] ),
        .I2(cmd_register_IBUF[2]),
        .I3(cmd_register_IBUF[1]),
        .O(rst));
  LUT2 #(
    .INIT(4'h2)) 
    content_reg_i_6
       (.I0(content_reg_16),
        .I1(cmd_register_IBUF[0]),
        .O(\cmd_register[0] ));
  LUT4 #(
    .INIT(16'h0004)) 
    \curState[0]_i_1 
       (.I0(\curState_reg[0]_1 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_56_n_0 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I3(curState),
        .O(\curState[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \curState_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\curState[0]_i_1_n_0 ),
        .Q(curState),
        .R(SR));
  LUT6 #(
    .INIT(64'h00105555FFFFFFFF)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_1 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I1(curState),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_56_n_0 ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .O(bram_r_valid));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_56 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_75_n_0 ),
        .I1(hit1[3]),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_56_n_0 ));
  LUT6 #(
    .INIT(64'h0000000051515100)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_65 
       (.I0(content_reg_bram_0_0),
        .I1(FETCH_REC_Instr_valid),
        .I2(content_reg_bram_0),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80_n_0 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ),
        .I5(curState),
        .O(FETCH_REC_Instr_valid_reg));
  LUT6 #(
    .INIT(64'hEFFEFFFFFFFFEFFE)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_75 
       (.I0(hit1[4]),
        .I1(hit1[2]),
        .I2(\memory_bb\.addr [5]),
        .I3(hit1[1]),
        .I4(hit1[0]),
        .I5(\memory_bb\.addr [4]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_75_n_0 ));
  LUT6 #(
    .INIT(64'h505F505F30303F3F)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_82_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_n_0 ),
        .I2(\memory_bb\.addr [3]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_85_n_0 ),
        .I5(\memory_bb\.addr [2]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_76_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80 
       (.I0(hit1[3]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_75_n_0 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_80_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_82 
       (.I0(\is_present_reg[15]_0 ),
        .I1(\is_present_reg[14]_1 ),
        .I2(\memory_bb\.addr [1]),
        .I3(\is_present_reg[13]_2 ),
        .I4(\memory_bb\.addr [0]),
        .I5(\is_present_reg[12]_3 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_82_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83 
       (.I0(\is_present_reg[11]_4 ),
        .I1(\is_present_reg[10]_5 ),
        .I2(\memory_bb\.addr [1]),
        .I3(\is_present_reg[9]_6 ),
        .I4(\memory_bb\.addr [0]),
        .I5(\is_present_reg[8]_7 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_83_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84 
       (.I0(\is_present_reg[7]_8 ),
        .I1(\is_present_reg[6]_9 ),
        .I2(\memory_bb\.addr [1]),
        .I3(\is_present_reg[5]_10 ),
        .I4(\memory_bb\.addr [0]),
        .I5(\is_present_reg[4]_11 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_84_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_85 
       (.I0(\is_present_reg[3]_12 ),
        .I1(\is_present_reg[2]_13 ),
        .I2(\memory_bb\.addr [1]),
        .I3(\is_present_reg[1]_14 ),
        .I4(\memory_bb\.addr [0]),
        .I5(\is_present_reg[0]_15 ),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_85_n_0 ));
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
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[0]_i_1_n_0 ),
        .Q(\is_present_reg[0]_15 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[10]_i_1_n_0 ),
        .Q(\is_present_reg[10]_5 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[11]_i_1_n_0 ),
        .Q(\is_present_reg[11]_4 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[12]_i_1_n_0 ),
        .Q(\is_present_reg[12]_3 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[13]_i_1_n_0 ),
        .Q(\is_present_reg[13]_2 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[14]_i_1_n_0 ),
        .Q(\is_present_reg[14]_1 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[15]_i_1_n_0 ),
        .Q(\is_present_reg[15]_0 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[1]_i_1_n_0 ),
        .Q(\is_present_reg[1]_14 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[2]_i_1_n_0 ),
        .Q(\is_present_reg[2]_13 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[3]_i_1_n_0 ),
        .Q(\is_present_reg[3]_12 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[4]_i_1_n_0 ),
        .Q(\is_present_reg[4]_11 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[5]_i_1_n_0 ),
        .Q(\is_present_reg[5]_10 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[6]_i_1_n_0 ),
        .Q(\is_present_reg[6]_9 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[7]_i_1_n_0 ),
        .Q(\is_present_reg[7]_8 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[8]_i_1_n_0 ),
        .Q(\is_present_reg[8]_7 ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \is_present_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\is_present[9]_i_1_n_0 ),
        .Q(\is_present_reg[9]_6 ),
        .R(SR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "80" *) 
  (* RTL_RAM_NAME = "a_regex_coprocessor/a_topology/engine_interfaced/anEngine/a_cache/tag" *) 
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
       (.ADDRA({1'b0,\memory_bb\.addr [3:0]}),
        .ADDRB({1'b0,\memory_bb\.addr [3:0]}),
        .ADDRC({1'b0,\memory_bb\.addr [3:0]}),
        .ADDRD({1'b0,\memory_bb\.addr [3:0]}),
        .ADDRE({1'b0,\memory_bb\.addr [3:0]}),
        .ADDRF({1'b0,\memory_bb\.addr [3:0]}),
        .ADDRG({1'b0,\memory_bb\.addr [3:0]}),
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
        .WCLK(clk),
        .WE(p_0_in0_out));
  LUT2 #(
    .INIT(4'h8)) 
    tag_reg_0_15_0_4_i_1
       (.I0(curState),
        .I1(rst),
        .O(p_0_in0_out));
  FDRE #(
    .INIT(1'b0)) 
    \tag_saved_reg[0] 
       (.C(clk),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [4]),
        .Q(tag_saved[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tag_saved_reg[1] 
       (.C(clk),
        .CE(cache_line_saved__0),
        .D(\memory_bb\.addr [5]),
        .Q(tag_saved[1]),
        .R(1'b0));
endmodule

module engine
   (SR,
    \cur_state_reg[0] ,
    FETCH_REC_Instr_valid_reg,
    E,
    \cur_cc_pointer_reg[3] ,
    ADDRARDADDR,
    \cur_state_reg[2] ,
    bram_r_valid,
    \head_reg[3] ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cmd_register[0] ,
    cur_is_even_character_reg,
    clk,
    D,
    \cur_state_reg[0]_0 ,
    Q,
    \cur_state_reg[0]_1 ,
    cur_is_even_character_reg_0,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    \FSM_sequential_status_register_reg[0] ,
    O,
    \cur_cc_pointer_reg[0] ,
    \cur_cc_pointer_reg[0]_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    CO,
    \cur_state_reg[0]_2 ,
    \cur_state[1]_i_3 ,
    cur_is_even_character,
    \old_grant_reg[0]_i_10 ,
    rst_IBUF,
    cmd_register_IBUF,
    content_reg,
    cur_is_even_character_reg_1);
  output [0:0]SR;
  output [2:0]\cur_state_reg[0] ;
  output FETCH_REC_Instr_valid_reg;
  output [0:0]E;
  output [0:0]\cur_cc_pointer_reg[3] ;
  output [8:0]ADDRARDADDR;
  output [0:0]\cur_state_reg[2] ;
  output bram_r_valid;
  output \head_reg[3] ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cmd_register[0] ;
  output cur_is_even_character_reg;
  input clk;
  input [63:0]D;
  input \cur_state_reg[0]_0 ;
  input [2:0]Q;
  input \cur_state_reg[0]_1 ;
  input cur_is_even_character_reg_0;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input \FSM_sequential_status_register_reg[0] ;
  input [0:0]O;
  input [3:0]\cur_cc_pointer_reg[0] ;
  input \cur_cc_pointer_reg[0]_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input [7:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input [2:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \FSM_sequential_status_register_reg[0]_0 ;
  input \FSM_sequential_status_register_reg[0]_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input [0:0]CO;
  input \cur_state_reg[0]_2 ;
  input \cur_state[1]_i_3 ;
  input cur_is_even_character;
  input [63:0]\old_grant_reg[0]_i_10 ;
  input rst_IBUF;
  input [2:0]cmd_register_IBUF;
  input content_reg;
  input cur_is_even_character_reg_1;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [63:0]D;
  wire [0:0]E;
  wire FETCH_REC_Instr_valid;
  wire FETCH_REC_Instr_valid_reg;
  wire FETCH_SEND_not_stall;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[0]_1 ;
  wire [0:0]O;
  wire [2:0]Q;
  wire [0:0]SR;
  wire a_cache_n_0;
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
  wire a_cache_n_3;
  wire a_cache_n_5;
  wire a_cache_n_7;
  wire a_cache_n_8;
  wire a_cache_n_9;
  wire [2:0]address_register_IBUF;
  wire bram_r_valid;
  wire clk;
  wire \cmd_register[0] ;
  wire [2:0]cmd_register_IBUF;
  wire content_reg;
  wire [3:0]\cur_cc_pointer_reg[0] ;
  wire \cur_cc_pointer_reg[0]_0 ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire [0:0]\cur_cc_pointer_reg[3] ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[1]_i_3 ;
  wire [2:0]\cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire [0:0]\cur_state_reg[2] ;
  wire [0:0]\fifo_even/state_cur ;
  wire [7:0]fifo_even_data_in;
  wire fifo_even_data_in_valid;
  wire [0:0]\fifo_odd/state_cur ;
  wire [7:0]fifo_odd_data_in;
  wire fifo_odd_data_in_valid;
  wire \g.aregex_cpu_n_18 ;
  wire \g.aregex_cpu_n_20 ;
  wire \g.aregex_cpu_n_21 ;
  wire \g.aregex_cpu_n_22 ;
  wire \g.aregex_cpu_n_23 ;
  wire \g.aregex_cpu_n_4 ;
  wire \g.aregex_cpu_n_46 ;
  wire \g.aregex_cpu_n_47 ;
  wire \g.aregex_cpu_n_48 ;
  wire \g.aregex_cpu_n_49 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire [7:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \head_reg[3] ;
  wire [5:0]\memory_bb\.addr ;
  wire nolabel_line119_n_1;
  wire nolabel_line119_n_10;
  wire nolabel_line119_n_18;
  wire nolabel_line119_n_19;
  wire nolabel_line119_n_2;
  wire nolabel_line119_n_20;
  wire nolabel_line119_n_22;
  wire nolabel_line119_n_23;
  wire nolabel_line119_n_25;
  wire nolabel_line119_n_5;
  wire nolabel_line119_n_6;
  wire nolabel_line119_n_7;
  wire nolabel_line119_n_8;
  wire nolabel_line119_n_9;
  wire [63:0]\old_grant_reg[0]_i_10 ;
  wire rst_IBUF;

  cache_block_directly_mapped a_cache
       (.D(D),
        .E(FETCH_SEND_not_stall),
        .FETCH_REC_Instr_valid(FETCH_REC_Instr_valid),
        .FETCH_REC_Instr_valid_reg(a_cache_n_3),
        .FETCH_REC_Instr_valid_reg_0(a_cache_n_5),
        .SR(SR),
        .\block_sel_saved_reg[1]_0 ({nolabel_line119_n_18,nolabel_line119_n_19}),
        .bram_r_valid(bram_r_valid),
        .clk(clk),
        .\cmd_register[0] (\cmd_register[0] ),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg_0(a_cache_n_7),
        .content_reg_1(a_cache_n_8),
        .content_reg_10(a_cache_n_17),
        .content_reg_11(a_cache_n_18),
        .content_reg_12(a_cache_n_19),
        .content_reg_13(a_cache_n_20),
        .content_reg_14(a_cache_n_21),
        .content_reg_15(a_cache_n_22),
        .content_reg_16(content_reg),
        .content_reg_2(a_cache_n_9),
        .content_reg_3(a_cache_n_10),
        .content_reg_4(a_cache_n_11),
        .content_reg_5(a_cache_n_12),
        .content_reg_6(a_cache_n_13),
        .content_reg_7(a_cache_n_14),
        .content_reg_8(a_cache_n_15),
        .content_reg_9(a_cache_n_16),
        .content_reg_bram_0(\g.aregex_cpu_n_47 ),
        .content_reg_bram_0_0(nolabel_line119_n_25),
        .\curState_reg[0]_0 (a_cache_n_2),
        .\curState_reg[0]_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\g.aregex_cpu_n_18 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\g.aregex_cpu_n_46 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\memory_bb\.addr (\memory_bb\.addr ),
        .rst(a_cache_n_0),
        .rst_IBUF(rst_IBUF));
  regex_cpu_pipelined \g.aregex_cpu 
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(CO),
        .D({\memory_bb\.addr ,nolabel_line119_n_18,nolabel_line119_n_19}),
        .DINADIN(fifo_even_data_in),
        .E(FETCH_SEND_not_stall),
        .\EXE1_Instr_reg[0]_0 (a_cache_n_7),
        .\EXE1_Instr_reg[10]_0 (\g.aregex_cpu_n_4 ),
        .\EXE1_Instr_reg[10]_1 (a_cache_n_17),
        .\EXE1_Instr_reg[11]_0 (a_cache_n_18),
        .\EXE1_Instr_reg[12]_0 (a_cache_n_19),
        .\EXE1_Instr_reg[13]_0 (a_cache_n_20),
        .\EXE1_Instr_reg[14]_0 (a_cache_n_21),
        .\EXE1_Instr_reg[15]_0 (a_cache_n_22),
        .\EXE1_Instr_reg[1]_0 (a_cache_n_8),
        .\EXE1_Instr_reg[2]_0 (a_cache_n_9),
        .\EXE1_Instr_reg[3]_0 (a_cache_n_10),
        .\EXE1_Instr_reg[4]_0 (a_cache_n_11),
        .\EXE1_Instr_reg[5]_0 (a_cache_n_12),
        .\EXE1_Instr_reg[6]_0 (a_cache_n_13),
        .\EXE1_Instr_reg[7]_0 (a_cache_n_14),
        .\EXE1_Instr_reg[8]_0 (a_cache_n_15),
        .\EXE1_Instr_reg[9]_0 (a_cache_n_16),
        .EXE1_Instr_valid_reg_0(\g.aregex_cpu_n_18 ),
        .EXE1_Instr_valid_reg_1(\g.aregex_cpu_n_47 ),
        .EXE2_Instr_valid_reg_0(\g.aregex_cpu_n_20 ),
        .\FETCH_REC_Instr[15]_i_6_0 (nolabel_line119_n_7),
        .\FETCH_REC_Instr[15]_i_6_1 (\cur_cc_pointer_reg[2]_0 ),
        .FETCH_REC_Instr_valid(FETCH_REC_Instr_valid),
        .FETCH_REC_Instr_valid_reg_0(FETCH_REC_Instr_valid_reg),
        .FETCH_REC_Instr_valid_reg_1(a_cache_n_5),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0]_0 ),
        .\FSM_sequential_status_register_reg[0]_1 (\FSM_sequential_status_register_reg[0]_1 ),
        .O(O),
        .Q(Q),
        .SR(SR),
        .address_register_IBUF(address_register_IBUF),
        .clk(clk),
        .content_reg_bram_0(\head_reg[3] ),
        .content_reg_bram_0_0(nolabel_line119_n_22),
        .content_reg_bram_0_1(nolabel_line119_n_23),
        .\cur_cc_pointer_reg[0] (\cur_cc_pointer_reg[0] ),
        .\cur_cc_pointer_reg[0]_0 (\cur_cc_pointer_reg[0]_0 ),
        .\cur_cc_pointer_reg[3] (\cur_cc_pointer_reg[3] ),
        .\cur_cc_pointer_reg[3]_0 (\g.aregex_cpu_n_46 ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(fifo_even_data_in_valid),
        .cur_is_even_character_reg_0(\g.aregex_cpu_n_22 ),
        .cur_is_even_character_reg_1(fifo_odd_data_in_valid),
        .cur_is_even_character_reg_2(fifo_odd_data_in),
        .cur_is_even_character_reg_3(cur_is_even_character_reg),
        .cur_is_even_character_reg_4(\g.aregex_cpu_n_48 ),
        .cur_is_even_character_reg_5(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_6(cur_is_even_character_reg_1),
        .cur_is_even_character_reg_7(nolabel_line119_n_1),
        .cur_is_even_character_reg_8(nolabel_line119_n_2),
        .\cur_state[1]_i_3_0 (\cur_state[1]_i_3 ),
        .\cur_state_reg[0] ({\cur_state_reg[0] [2],\cur_state_reg[0] [0]}),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (nolabel_line119_n_20),
        .\cur_state_reg[0]_2 (\cur_state_reg[0]_1 ),
        .\cur_state_reg[0]_3 (\cur_state_reg[0]_2 ),
        .\cur_state_reg[1] (E),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (a_cache_n_3),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 (nolabel_line119_n_25),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\old_grant[0]_i_3 (nolabel_line119_n_5),
        .\old_grant[0]_i_3_0 (nolabel_line119_n_6),
        .\old_grant[0]_i_3_1 (nolabel_line119_n_8),
        .\old_grant[0]_i_3_2 (nolabel_line119_n_9),
        .\old_grant_reg[0] (\g.aregex_cpu_n_21 ),
        .\old_grant_reg[0]_0 (a_cache_n_0),
        .\old_grant_reg[0]_1 (nolabel_line119_n_10),
        .\old_grant_reg[0]_2 (\cur_cc_pointer_reg[2] ),
        .\old_grant_reg[0]_i_10 ({\old_grant_reg[0]_i_10 [63:60],\old_grant_reg[0]_i_10 [55:52],\old_grant_reg[0]_i_10 [47:44],\old_grant_reg[0]_i_10 [39:36],\old_grant_reg[0]_i_10 [31:28],\old_grant_reg[0]_i_10 [23:20],\old_grant_reg[0]_i_10 [15:12],\old_grant_reg[0]_i_10 [7:4]}),
        .\state_cur_reg[0] (\g.aregex_cpu_n_23 ),
        .\state_cur_reg[0]_0 (\g.aregex_cpu_n_49 ),
        .\state_cur_reg[0]_1 (\fifo_odd/state_cur ),
        .\state_cur_reg[0]_2 (\fifo_even/state_cur ));
  ping_pong_buffer nolabel_line119
       (.CO(CO),
        .D({\memory_bb\.addr ,nolabel_line119_n_18,nolabel_line119_n_19}),
        .DINADIN(fifo_even_data_in),
        .E(fifo_even_data_in_valid),
        .Q(\fifo_odd/state_cur ),
        .SR(SR),
        .clk(clk),
        .content_reg_bram_0(fifo_odd_data_in),
        .content_reg_bram_0_0(a_cache_n_2),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[2]_0 (nolabel_line119_n_7),
        .\cur_cc_pointer_reg[2]_1 (nolabel_line119_n_10),
        .\cur_cc_pointer_reg[2]_2 (\cur_cc_pointer_reg[2] ),
        .\cur_ccs_reg[26] (nolabel_line119_n_5),
        .\cur_ccs_reg[27] (nolabel_line119_n_8),
        .\cur_ccs_reg[58] (nolabel_line119_n_6),
        .\cur_ccs_reg[59] (nolabel_line119_n_9),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(nolabel_line119_n_1),
        .cur_is_even_character_reg_0(nolabel_line119_n_2),
        .\cur_state[1]_i_4 (\cur_cc_pointer_reg[0] [2:0]),
        .\cur_state_reg[1] (nolabel_line119_n_20),
        .\cur_state_reg[1]_0 (nolabel_line119_n_23),
        .\cur_state_reg[1]_1 (Q),
        .\cur_state_reg[1]_2 (\g.aregex_cpu_n_4 ),
        .\cur_state_reg[2] (nolabel_line119_n_22),
        .\cur_state_reg[2]_0 (\cur_state_reg[0] [1]),
        .\cur_state_reg[2]_1 (nolabel_line119_n_25),
        .\head_reg[0] (a_cache_n_5),
        .\head_reg[3] (\head_reg[3] ),
        .\middle_reg[0] (\g.aregex_cpu_n_22 ),
        .\middle_reg[0]_0 (\g.aregex_cpu_n_48 ),
        .\middle_reg[0]_1 (a_cache_n_0),
        .\old_grant[0]_i_9 ({\old_grant_reg[0]_i_10 [59:56],\old_grant_reg[0]_i_10 [51:48],\old_grant_reg[0]_i_10 [43:40],\old_grant_reg[0]_i_10 [35:32],\old_grant_reg[0]_i_10 [27:24],\old_grant_reg[0]_i_10 [19:16],\old_grant_reg[0]_i_10 [11:8],\old_grant_reg[0]_i_10 [3:0]}),
        .\state_cur_reg[0] (\fifo_even/state_cur ),
        .\state_cur_reg[0]_0 (\g.aregex_cpu_n_23 ),
        .\state_cur_reg[0]_1 (\g.aregex_cpu_n_49 ),
        .\state_cur_reg[0]_2 (\g.aregex_cpu_n_20 ),
        .\state_cur_reg[0]_3 (\g.aregex_cpu_n_21 ),
        .\tail_reg[4] (fifo_odd_data_in_valid));
endmodule

module engine_interfaced
   (SR,
    \cur_state_reg[0] ,
    FETCH_REC_Instr_valid_reg,
    E,
    \cur_cc_pointer_reg[3] ,
    ADDRARDADDR,
    \cur_state_reg[2] ,
    bram_r_valid,
    \head_reg[3] ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cmd_register[0] ,
    cur_is_even_character_reg,
    clk,
    D,
    \cur_state_reg[0]_0 ,
    Q,
    \cur_state_reg[0]_1 ,
    cur_is_even_character_reg_0,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    \FSM_sequential_status_register_reg[0] ,
    O,
    \cur_cc_pointer_reg[0] ,
    \cur_cc_pointer_reg[0]_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    CO,
    \cur_state_reg[0]_2 ,
    \cur_state[1]_i_3 ,
    cur_is_even_character,
    \old_grant_reg[0]_i_10 ,
    rst_IBUF,
    cmd_register_IBUF,
    content_reg,
    cur_is_even_character_reg_1);
  output [0:0]SR;
  output [2:0]\cur_state_reg[0] ;
  output FETCH_REC_Instr_valid_reg;
  output [0:0]E;
  output [0:0]\cur_cc_pointer_reg[3] ;
  output [8:0]ADDRARDADDR;
  output [0:0]\cur_state_reg[2] ;
  output bram_r_valid;
  output \head_reg[3] ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cmd_register[0] ;
  output cur_is_even_character_reg;
  input clk;
  input [63:0]D;
  input \cur_state_reg[0]_0 ;
  input [2:0]Q;
  input \cur_state_reg[0]_1 ;
  input cur_is_even_character_reg_0;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input \FSM_sequential_status_register_reg[0] ;
  input [0:0]O;
  input [3:0]\cur_cc_pointer_reg[0] ;
  input \cur_cc_pointer_reg[0]_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input [7:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input [2:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \FSM_sequential_status_register_reg[0]_0 ;
  input \FSM_sequential_status_register_reg[0]_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input [0:0]CO;
  input \cur_state_reg[0]_2 ;
  input \cur_state[1]_i_3 ;
  input cur_is_even_character;
  input [63:0]\old_grant_reg[0]_i_10 ;
  input rst_IBUF;
  input [2:0]cmd_register_IBUF;
  input content_reg;
  input cur_is_even_character_reg_1;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [63:0]D;
  wire [0:0]E;
  wire FETCH_REC_Instr_valid_reg;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[0]_1 ;
  wire [0:0]O;
  wire [2:0]Q;
  wire [0:0]SR;
  wire [2:0]address_register_IBUF;
  wire bram_r_valid;
  wire clk;
  wire \cmd_register[0] ;
  wire [2:0]cmd_register_IBUF;
  wire content_reg;
  wire [3:0]\cur_cc_pointer_reg[0] ;
  wire \cur_cc_pointer_reg[0]_0 ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire [0:0]\cur_cc_pointer_reg[3] ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[1]_i_3 ;
  wire [2:0]\cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire [0:0]\cur_state_reg[2] ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire [7:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \head_reg[3] ;
  wire [63:0]\old_grant_reg[0]_i_10 ;
  wire rst_IBUF;

  engine anEngine
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(CO),
        .D(D),
        .E(E),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0]_0 ),
        .\FSM_sequential_status_register_reg[0]_1 (\FSM_sequential_status_register_reg[0]_1 ),
        .O(O),
        .Q(Q),
        .SR(SR),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .clk(clk),
        .\cmd_register[0] (\cmd_register[0] ),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg(content_reg),
        .\cur_cc_pointer_reg[0] (\cur_cc_pointer_reg[0] ),
        .\cur_cc_pointer_reg[0]_0 (\cur_cc_pointer_reg[0]_0 ),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[3] (\cur_cc_pointer_reg[3] ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .\cur_state[1]_i_3 (\cur_state[1]_i_3 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (\cur_state_reg[0]_1 ),
        .\cur_state_reg[0]_2 (\cur_state_reg[0]_2 ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\head_reg[3] (\head_reg[3] ),
        .\old_grant_reg[0]_i_10 (\old_grant_reg[0]_i_10 ),
        .rst_IBUF(rst_IBUF));
endmodule

module fifo
   (cur_is_even_character_reg,
    Q,
    D,
    \cur_state_reg[1] ,
    \head_reg[3]_0 ,
    \cur_state_reg[2] ,
    \cur_state_reg[2]_0 ,
    clk,
    E,
    DINADIN,
    content_reg_bram_0_0,
    cur_is_even_character,
    \head_reg[0]_0 ,
    \middle_reg[0]_0 ,
    \state_cur_reg[0]_0 ,
    \state_cur_reg[0]_1 ,
    \state_cur_reg[0]_2 ,
    \FETCH_REC_Pc_reg[0] ,
    \FETCH_REC_Pc_reg[1] ,
    \FETCH_REC_Pc_reg[6] ,
    DOUTBDOUT,
    \FETCH_REC_Pc_reg[6]_0 ,
    \FETCH_REC_Pc_reg[7] ,
    \FETCH_REC_Pc_reg[4] ,
    \FETCH_REC_Pc_reg[2] ,
    \FETCH_REC_Pc_reg[3] ,
    \FETCH_REC_Pc_reg[5] ,
    \cur_state_reg[1]_0 ,
    \cur_state_reg[1]_1 ,
    \middle_reg[0]_1 ,
    \cur_state_reg[1]_2 ,
    CO,
    SR);
  output cur_is_even_character_reg;
  output [0:0]Q;
  output [7:0]D;
  output \cur_state_reg[1] ;
  output \head_reg[3]_0 ;
  output \cur_state_reg[2] ;
  output [0:0]\cur_state_reg[2]_0 ;
  input clk;
  input [0:0]E;
  input [7:0]DINADIN;
  input content_reg_bram_0_0;
  input cur_is_even_character;
  input \head_reg[0]_0 ;
  input \middle_reg[0]_0 ;
  input \state_cur_reg[0]_0 ;
  input \state_cur_reg[0]_1 ;
  input \state_cur_reg[0]_2 ;
  input \FETCH_REC_Pc_reg[0] ;
  input \FETCH_REC_Pc_reg[1] ;
  input \FETCH_REC_Pc_reg[6] ;
  input [3:0]DOUTBDOUT;
  input \FETCH_REC_Pc_reg[6]_0 ;
  input \FETCH_REC_Pc_reg[7] ;
  input \FETCH_REC_Pc_reg[4] ;
  input \FETCH_REC_Pc_reg[2] ;
  input \FETCH_REC_Pc_reg[3] ;
  input \FETCH_REC_Pc_reg[5] ;
  input [2:0]\cur_state_reg[1]_0 ;
  input \cur_state_reg[1]_1 ;
  input \middle_reg[0]_1 ;
  input \cur_state_reg[1]_2 ;
  input [0:0]CO;
  input [0:0]SR;

  wire [0:0]CO;
  wire [7:0]D;
  wire [7:0]DINADIN;
  wire [3:0]DOUTBDOUT;
  wire [0:0]E;
  wire \FETCH_REC_Pc_reg[0] ;
  wire \FETCH_REC_Pc_reg[1] ;
  wire \FETCH_REC_Pc_reg[2] ;
  wire \FETCH_REC_Pc_reg[3] ;
  wire \FETCH_REC_Pc_reg[4] ;
  wire \FETCH_REC_Pc_reg[5] ;
  wire \FETCH_REC_Pc_reg[6] ;
  wire \FETCH_REC_Pc_reg[6]_0 ;
  wire \FETCH_REC_Pc_reg[7] ;
  wire [0:0]Q;
  wire [0:0]SR;
  wire clk;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_i_20_n_0;
  wire content_reg_bram_0_i_21__0_n_0;
  wire content_reg_bram_0_i_23__0_n_0;
  wire content_reg_bram_0_i_24__0_n_0;
  wire content_reg_bram_0_i_38_n_0;
  wire content_reg_bram_0_i_39_n_0;
  wire content_reg_bram_0_i_44_n_0;
  wire content_reg_bram_0_i_45_n_0;
  wire content_reg_bram_0_i_46_n_0;
  wire content_reg_bram_0_i_6__0_n_0;
  wire content_reg_i_10_n_0;
  wire content_reg_i_13_n_0;
  wire content_reg_i_9_n_0;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire \cur_state_reg[1] ;
  wire [2:0]\cur_state_reg[1]_0 ;
  wire \cur_state_reg[1]_1 ;
  wire \cur_state_reg[1]_2 ;
  wire \cur_state_reg[2] ;
  wire [0:0]\cur_state_reg[2]_0 ;
  wire fifo_even_data_in_ready;
  wire [7:0]from_memory;
  wire [4:0]head_reg;
  wire \head_reg[0]_0 ;
  wire \head_reg[3]_0 ;
  wire [7:0]middle;
  wire \middle[7]_i_3_n_0 ;
  wire middle_0;
  wire [7:0]middle_next;
  wire \middle_reg[0]_0 ;
  wire \middle_reg[0]_1 ;
  wire [4:0]p_0_in;
  wire [0:0]p_0_in_1;
  wire [2:1]state_cur;
  wire state_cur0;
  wire \state_cur[0]_i_2_n_0 ;
  wire \state_cur[0]_i_3_n_0 ;
  wire \state_cur[2]_i_4_n_0 ;
  wire \state_cur[2]_i_5_n_0 ;
  wire \state_cur[2]_i_6_n_0 ;
  wire \state_cur[2]_i_7_n_0 ;
  wire \state_cur[2]_i_8_n_0 ;
  wire \state_cur_reg[0]_0 ;
  wire \state_cur_reg[0]_1 ;
  wire \state_cur_reg[0]_2 ;
  wire [2:0]state_next;
  wire [4:0]state_next4;
  wire \tag_saved[0]_i_2_n_0 ;
  wire \tag_saved[1]_i_2_n_0 ;
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

  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \block_sel_saved[0]_i_1 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(middle[0]),
        .I3(cur_is_even_character),
        .I4(from_memory[0]),
        .I5(\FETCH_REC_Pc_reg[0] ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    \block_sel_saved[1]_i_1 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(middle[1]),
        .I3(cur_is_even_character),
        .I4(from_memory[1]),
        .I5(\FETCH_REC_Pc_reg[1] ),
        .O(D[1]));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "a_regex_coprocessor/a_topology/engine_interfaced/anEngine/nolabel_line119/fifo_even/content" *) 
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
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,where_to_read,content_reg_bram_0_i_6__0_n_0,1'b1,1'b1,1'b1,1'b1}),
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
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
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
        .WEA({fifo_even_data_in_ready,fifo_even_data_in_ready}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'hFDDEEFFFEFFFFDDE)) 
    content_reg_bram_0_i_15
       (.I0(head_reg[3]),
        .I1(content_reg_bram_0_i_38_n_0),
        .I2(content_reg_bram_0_i_39_n_0),
        .I3(tail_reg[3]),
        .I4(head_reg[4]),
        .I5(tail_reg[4]),
        .O(fifo_even_data_in_ready));
  LUT4 #(
    .INIT(16'hA8AA)) 
    content_reg_bram_0_i_19
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_44_n_0),
        .I2(content_reg_bram_0_i_45_n_0),
        .I3(content_reg_bram_0_i_46_n_0),
        .O(cur_is_even_character_reg));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    content_reg_bram_0_i_20
       (.I0(Q),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(content_reg_bram_0_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_21__0
       (.I0(head_reg[3]),
        .I1(head_reg[2]),
        .I2(head_reg[1]),
        .O(content_reg_bram_0_i_21__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    content_reg_bram_0_i_23__0
       (.I0(head_reg[1]),
        .I1(head_reg[2]),
        .O(content_reg_bram_0_i_23__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    content_reg_bram_0_i_24__0
       (.I0(state_cur[2]),
        .I1(state_cur[1]),
        .O(content_reg_bram_0_i_24__0_n_0));
  LUT6 #(
    .INIT(64'h00FFFB04FF00FF00)) 
    content_reg_bram_0_i_2__0
       (.I0(\head_reg[0]_0 ),
        .I1(cur_is_even_character_reg),
        .I2(content_reg_bram_0_i_20_n_0),
        .I3(head_reg[4]),
        .I4(head_reg[0]),
        .I5(content_reg_bram_0_i_21__0_n_0),
        .O(where_to_read[4]));
  LUT6 #(
    .INIT(64'h3233CDCCFFFF0000)) 
    content_reg_bram_0_i_3
       (.I0(content_reg_bram_0_i_20_n_0),
        .I1(head_reg[0]),
        .I2(content_reg_bram_0_0),
        .I3(cur_is_even_character),
        .I4(head_reg[3]),
        .I5(content_reg_bram_0_i_23__0_n_0),
        .O(where_to_read[3]));
  LUT6 #(
    .INIT(64'hF6FFFFF6DFBFBFDF)) 
    content_reg_bram_0_i_38
       (.I0(head_reg[1]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .I3(head_reg[2]),
        .I4(tail_reg[2]),
        .I5(head_reg[0]),
        .O(content_reg_bram_0_i_38_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_39
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(content_reg_bram_0_i_39_n_0));
  LUT6 #(
    .INIT(64'h3233FFFFCDCC0000)) 
    content_reg_bram_0_i_4
       (.I0(content_reg_bram_0_i_20_n_0),
        .I1(head_reg[0]),
        .I2(content_reg_bram_0_0),
        .I3(cur_is_even_character),
        .I4(head_reg[1]),
        .I5(head_reg[2]),
        .O(where_to_read[2]));
  LUT4 #(
    .INIT(16'h6F66)) 
    content_reg_bram_0_i_44
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .O(content_reg_bram_0_i_44_n_0));
  LUT6 #(
    .INIT(64'h22F2FFFFFFFF22F2)) 
    content_reg_bram_0_i_45
       (.I0(head_reg[1]),
        .I1(tail_reg[1]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .I4(head_reg[0]),
        .I5(tail_reg[0]),
        .O(content_reg_bram_0_i_45_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hD00D)) 
    content_reg_bram_0_i_46
       (.I0(tail_reg[1]),
        .I1(head_reg[1]),
        .I2(tail_reg[2]),
        .I3(head_reg[2]),
        .O(content_reg_bram_0_i_46_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h04FF)) 
    content_reg_bram_0_i_47
       (.I0(\cur_state_reg[1]_0 [2]),
        .I1(\cur_state_reg[1]_0 [0]),
        .I2(\cur_state_reg[1]_0 [1]),
        .I3(\head_reg[3]_0 ),
        .O(\cur_state_reg[2] ));
  LUT6 #(
    .INIT(64'h555555559AAAAAAA)) 
    content_reg_bram_0_i_5__0
       (.I0(head_reg[1]),
        .I1(\head_reg[0]_0 ),
        .I2(cur_is_even_character_reg),
        .I3(content_reg_bram_0_i_24__0_n_0),
        .I4(Q),
        .I5(head_reg[0]),
        .O(where_to_read[1]));
  LUT6 #(
    .INIT(64'h5555555595555555)) 
    content_reg_bram_0_i_6__0
       (.I0(head_reg[0]),
        .I1(Q),
        .I2(state_cur[1]),
        .I3(state_cur[2]),
        .I4(cur_is_even_character_reg),
        .I5(\head_reg[0]_0 ),
        .O(content_reg_bram_0_i_6__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    content_reg_i_10
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .O(content_reg_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hD0FF)) 
    content_reg_i_13
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(middle[2]),
        .I3(cur_is_even_character),
        .O(content_reg_i_13_n_0));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    content_reg_i_2
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(middle[5]),
        .I3(cur_is_even_character),
        .I4(from_memory[5]),
        .I5(\FETCH_REC_Pc_reg[5] ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h00000000F2FFD0FF)) 
    content_reg_i_3
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(middle[4]),
        .I3(cur_is_even_character),
        .I4(from_memory[4]),
        .I5(\FETCH_REC_Pc_reg[4] ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hEAEAEA00EA00EA00)) 
    content_reg_i_4
       (.I0(content_reg_i_9_n_0),
        .I1(from_memory[3]),
        .I2(content_reg_i_10_n_0),
        .I3(\FETCH_REC_Pc_reg[3] ),
        .I4(DOUTBDOUT[1]),
        .I5(\FETCH_REC_Pc_reg[6]_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hEAEAEA00EA00EA00)) 
    content_reg_i_5
       (.I0(content_reg_i_13_n_0),
        .I1(from_memory[2]),
        .I2(content_reg_i_10_n_0),
        .I3(\FETCH_REC_Pc_reg[2] ),
        .I4(DOUTBDOUT[0]),
        .I5(\FETCH_REC_Pc_reg[6]_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hD0FF)) 
    content_reg_i_9
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(middle[3]),
        .I3(cur_is_even_character),
        .O(content_reg_i_9_n_0));
  LUT6 #(
    .INIT(64'h000000E0000000F0)) 
    \cur_state[1]_i_1 
       (.I0(\head_reg[3]_0 ),
        .I1(\cur_state_reg[1]_2 ),
        .I2(\cur_state_reg[1]_0 [2]),
        .I3(\cur_state_reg[1]_0 [1]),
        .I4(\cur_state_reg[1]_0 [0]),
        .I5(CO),
        .O(\cur_state_reg[2]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cur_state[1]_i_2 
       (.I0(fifo_even_data_in_ready),
        .I1(\cur_state_reg[1]_1 ),
        .O(\head_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hA0B0)) 
    \cur_state[2]_i_3 
       (.I0(\cur_state_reg[1]_0 [1]),
        .I1(\cur_state_reg[1]_0 [2]),
        .I2(\cur_state_reg[1]_0 [0]),
        .I3(\head_reg[3]_0 ),
        .O(\cur_state_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1__0 
       (.I0(head_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1__0 
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[2]_i_1__0 
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \head[3]_i_1__0 
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .O(p_0_in[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \head[4]_i_1__0 
       (.I0(cur_is_even_character_reg),
        .I1(\head_reg[0]_0 ),
        .O(p_0_in_1));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \head[4]_i_2__0 
       (.I0(head_reg[4]),
        .I1(head_reg[0]),
        .I2(head_reg[3]),
        .I3(head_reg[2]),
        .I4(head_reg[1]),
        .O(p_0_in[4]));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(clk),
        .CE(p_0_in_1),
        .D(p_0_in[0]),
        .Q(head_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(clk),
        .CE(p_0_in_1),
        .D(p_0_in[1]),
        .Q(head_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(clk),
        .CE(p_0_in_1),
        .D(p_0_in[2]),
        .Q(head_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[3] 
       (.C(clk),
        .CE(p_0_in_1),
        .D(p_0_in[3]),
        .Q(head_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[4] 
       (.C(clk),
        .CE(p_0_in_1),
        .D(p_0_in[4]),
        .Q(head_reg[4]),
        .R(SR));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[0]_i_1__0 
       (.I0(from_memory[0]),
        .I1(state_cur[1]),
        .I2(Q),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(DINADIN[0]),
        .O(middle_next[0]));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[1]_i_1__0 
       (.I0(from_memory[1]),
        .I1(state_cur[1]),
        .I2(Q),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(DINADIN[1]),
        .O(middle_next[1]));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[2]_i_1__0 
       (.I0(from_memory[2]),
        .I1(state_cur[1]),
        .I2(Q),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(DINADIN[2]),
        .O(middle_next[2]));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[3]_i_1__0 
       (.I0(from_memory[3]),
        .I1(state_cur[1]),
        .I2(Q),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(DINADIN[3]),
        .O(middle_next[3]));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[4]_i_1__0 
       (.I0(from_memory[4]),
        .I1(state_cur[1]),
        .I2(Q),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(DINADIN[4]),
        .O(middle_next[4]));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[5]_i_1__0 
       (.I0(from_memory[5]),
        .I1(state_cur[1]),
        .I2(Q),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(DINADIN[5]),
        .O(middle_next[5]));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[6]_i_1__0 
       (.I0(from_memory[6]),
        .I1(state_cur[1]),
        .I2(Q),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(DINADIN[6]),
        .O(middle_next[6]));
  LUT6 #(
    .INIT(64'h002F002F002D0000)) 
    \middle[7]_i_1__0 
       (.I0(cur_is_even_character_reg),
        .I1(\head_reg[0]_0 ),
        .I2(state_cur[2]),
        .I3(\middle[7]_i_3_n_0 ),
        .I4(state_cur[1]),
        .I5(\middle_reg[0]_0 ),
        .O(middle_0));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[7]_i_2__0 
       (.I0(from_memory[7]),
        .I1(state_cur[1]),
        .I2(Q),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(DINADIN[7]),
        .O(middle_next[7]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h55D5)) 
    \middle[7]_i_3 
       (.I0(\middle_reg[0]_1 ),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(Q),
        .O(\middle[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[0] 
       (.C(clk),
        .CE(middle_0),
        .D(middle_next[0]),
        .Q(middle[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[1] 
       (.C(clk),
        .CE(middle_0),
        .D(middle_next[1]),
        .Q(middle[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[2] 
       (.C(clk),
        .CE(middle_0),
        .D(middle_next[2]),
        .Q(middle[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[3] 
       (.C(clk),
        .CE(middle_0),
        .D(middle_next[3]),
        .Q(middle[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[4] 
       (.C(clk),
        .CE(middle_0),
        .D(middle_next[4]),
        .Q(middle[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[5] 
       (.C(clk),
        .CE(middle_0),
        .D(middle_next[5]),
        .Q(middle[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[6] 
       (.C(clk),
        .CE(middle_0),
        .D(middle_next[6]),
        .Q(middle[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[7] 
       (.C(clk),
        .CE(middle_0),
        .D(middle_next[7]),
        .Q(middle[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFEFEFEFAAAAAAAA)) 
    \state_cur[0]_i_1__0 
       (.I0(\state_cur[0]_i_2_n_0 ),
        .I1(\head_reg[0]_0 ),
        .I2(cur_is_even_character_reg),
        .I3(E),
        .I4(Q),
        .I5(\state_cur[0]_i_3_n_0 ),
        .O(state_next[0]));
  LUT6 #(
    .INIT(64'h8080888888808080)) 
    \state_cur[0]_i_2 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\state_cur[2]_i_6_n_0 ),
        .I3(\state_cur_reg[0]_1 ),
        .I4(\state_cur_reg[0]_2 ),
        .I5(cur_is_even_character),
        .O(\state_cur[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFFBEAE0000)) 
    \state_cur[0]_i_3 
       (.I0(Q),
        .I1(cur_is_even_character),
        .I2(\state_cur_reg[0]_2 ),
        .I3(\state_cur_reg[0]_1 ),
        .I4(state_cur[1]),
        .I5(state_cur[2]),
        .O(\state_cur[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \state_cur[1]_i_1 
       (.I0(Q),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(state_next[1]));
  LUT6 #(
    .INIT(64'hB0B0F0FFB0B0B0B0)) 
    \state_cur[2]_i_1__0 
       (.I0(state_cur[1]),
        .I1(\state_cur_reg[0]_0 ),
        .I2(\state_cur[2]_i_4_n_0 ),
        .I3(\state_cur[2]_i_5_n_0 ),
        .I4(\head_reg[0]_0 ),
        .I5(cur_is_even_character_reg),
        .O(state_cur0));
  LUT6 #(
    .INIT(64'hFFFBC3EBFFFBFFFB)) 
    \state_cur[2]_i_2__0 
       (.I0(E),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(Q),
        .I4(\head_reg[0]_0 ),
        .I5(cur_is_even_character_reg),
        .O(state_next[2]));
  LUT6 #(
    .INIT(64'h0000FFFFFFFF0062)) 
    \state_cur[2]_i_4 
       (.I0(cur_is_even_character),
        .I1(\state_cur_reg[0]_2 ),
        .I2(\state_cur_reg[0]_1 ),
        .I3(Q),
        .I4(state_cur[2]),
        .I5(state_cur[1]),
        .O(\state_cur[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \state_cur[2]_i_5 
       (.I0(Q),
        .I1(state_cur[2]),
        .I2(\state_cur[2]_i_6_n_0 ),
        .O(\state_cur[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBFFBEFFEFEEFBFFB)) 
    \state_cur[2]_i_6 
       (.I0(\state_cur[2]_i_7_n_0 ),
        .I1(\state_cur[2]_i_8_n_0 ),
        .I2(head_reg[4]),
        .I3(tail_reg[4]),
        .I4(head_reg[3]),
        .I5(tail_reg[3]),
        .O(\state_cur[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFF6FF6FFF6FFFF6F)) 
    \state_cur[2]_i_7 
       (.I0(tail_reg[0]),
        .I1(head_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\state_cur[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hD0FDFFFF0000D0FD)) 
    \state_cur[2]_i_8 
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(\state_cur[2]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[0] 
       (.C(clk),
        .CE(state_cur0),
        .D(state_next[0]),
        .Q(Q),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[1] 
       (.C(clk),
        .CE(state_cur0),
        .D(state_next[1]),
        .Q(state_cur[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[2] 
       (.C(clk),
        .CE(state_cur0),
        .D(state_next[2]),
        .Q(state_cur[2]),
        .R(SR));
  LUT6 #(
    .INIT(64'hEAEAEA00EA00EA00)) 
    \tag_saved[0]_i_1 
       (.I0(\tag_saved[0]_i_2_n_0 ),
        .I1(from_memory[6]),
        .I2(content_reg_i_10_n_0),
        .I3(\FETCH_REC_Pc_reg[6] ),
        .I4(DOUTBDOUT[2]),
        .I5(\FETCH_REC_Pc_reg[6]_0 ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hD0FF)) 
    \tag_saved[0]_i_2 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(middle[6]),
        .I3(cur_is_even_character),
        .O(\tag_saved[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEAEAEA00EA00EA00)) 
    \tag_saved[1]_i_1 
       (.I0(\tag_saved[1]_i_2_n_0 ),
        .I1(from_memory[7]),
        .I2(content_reg_i_10_n_0),
        .I3(\FETCH_REC_Pc_reg[7] ),
        .I4(DOUTBDOUT[3]),
        .I5(\FETCH_REC_Pc_reg[6]_0 ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hD0FF)) 
    \tag_saved[1]_i_2 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(middle[7]),
        .I3(cur_is_even_character),
        .O(\tag_saved[1]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tail[0]_i_1__0 
       (.I0(tail_reg[0]),
        .O(state_next4[0]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[1]_i_1__0 
       (.I0(tail_reg[0]),
        .I1(tail_reg[1]),
        .O(state_next4[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[2]_i_1__0 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(state_next4[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \tail[3]_i_1__0 
       (.I0(tail_reg[3]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(tail_reg[2]),
        .O(state_next4[3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \tail[4]_i_1__0 
       (.I0(tail_reg[4]),
        .I1(tail_reg[2]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(tail_reg[3]),
        .O(state_next4[4]));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[0] 
       (.C(clk),
        .CE(E),
        .D(state_next4[0]),
        .Q(tail_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[1] 
       (.C(clk),
        .CE(E),
        .D(state_next4[1]),
        .Q(tail_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[2] 
       (.C(clk),
        .CE(E),
        .D(state_next4[2]),
        .Q(tail_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[3] 
       (.C(clk),
        .CE(E),
        .D(state_next4[3]),
        .Q(tail_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[4] 
       (.C(clk),
        .CE(E),
        .D(state_next4[4]),
        .Q(tail_reg[4]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "fifo" *) 
module fifo_0
   (DOUTBDOUT,
    cur_is_even_character_reg,
    Q,
    \cur_cc_pointer_reg[2] ,
    \cur_ccs_reg[26] ,
    \cur_ccs_reg[58] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[27] ,
    \cur_ccs_reg[59] ,
    \cur_cc_pointer_reg[2]_1 ,
    \cur_cc_pointer_reg[2]_2 ,
    content_reg_bram_0_0,
    content_reg_bram_0_1,
    cur_is_even_character_reg_0,
    cur_is_even_character_reg_1,
    content_reg_bram_0_2,
    cur_is_even_character_reg_2,
    cur_is_even_character_reg_3,
    content_reg_bram_0_3,
    \state_cur_reg[1]_0 ,
    \head_reg[4]_0 ,
    \cur_state_reg[1] ,
    \cur_state_reg[2] ,
    clk,
    \tail_reg[4]_0 ,
    content_reg_bram_0_4,
    cur_is_even_character,
    content_reg_bram_0_5,
    \head_reg[0]_0 ,
    \state_cur_reg[0]_0 ,
    \middle_reg[0]_0 ,
    \state_cur_reg[0]_1 ,
    \state_cur_reg[0]_2 ,
    \cur_state[1]_i_4 ,
    \old_grant[0]_i_9 ,
    \middle_reg[0]_1 ,
    content_reg_bram_0_i_18,
    content_reg_bram_0_i_18_0,
    SR);
  output [3:0]DOUTBDOUT;
  output cur_is_even_character_reg;
  output [0:0]Q;
  output \cur_cc_pointer_reg[2] ;
  output \cur_ccs_reg[26] ;
  output \cur_ccs_reg[58] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[27] ;
  output \cur_ccs_reg[59] ;
  output \cur_cc_pointer_reg[2]_1 ;
  output \cur_cc_pointer_reg[2]_2 ;
  output content_reg_bram_0_0;
  output content_reg_bram_0_1;
  output cur_is_even_character_reg_0;
  output cur_is_even_character_reg_1;
  output content_reg_bram_0_2;
  output cur_is_even_character_reg_2;
  output cur_is_even_character_reg_3;
  output content_reg_bram_0_3;
  output \state_cur_reg[1]_0 ;
  output \head_reg[4]_0 ;
  output \cur_state_reg[1] ;
  output \cur_state_reg[2] ;
  input clk;
  input [0:0]\tail_reg[4]_0 ;
  input [7:0]content_reg_bram_0_4;
  input cur_is_even_character;
  input content_reg_bram_0_5;
  input \head_reg[0]_0 ;
  input \state_cur_reg[0]_0 ;
  input \middle_reg[0]_0 ;
  input \state_cur_reg[0]_1 ;
  input \state_cur_reg[0]_2 ;
  input [2:0]\cur_state[1]_i_4 ;
  input [31:0]\old_grant[0]_i_9 ;
  input \middle_reg[0]_1 ;
  input [2:0]content_reg_bram_0_i_18;
  input content_reg_bram_0_i_18_0;
  input [0:0]SR;

  wire [3:0]DOUTBDOUT;
  wire [0:0]Q;
  wire [0:0]SR;
  wire clk;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_2;
  wire content_reg_bram_0_3;
  wire [7:0]content_reg_bram_0_4;
  wire content_reg_bram_0_5;
  wire content_reg_bram_0_i_16__0_n_0;
  wire [2:0]content_reg_bram_0_i_18;
  wire content_reg_bram_0_i_18_0;
  wire content_reg_bram_0_i_18__0_n_0;
  wire content_reg_bram_0_i_19__0_n_0;
  wire content_reg_bram_0_i_20__0_n_0;
  wire content_reg_bram_0_i_22__0_n_0;
  wire content_reg_bram_0_i_23_n_0;
  wire content_reg_bram_0_i_24_n_0;
  wire content_reg_bram_0_i_25__0_n_0;
  wire content_reg_bram_0_i_26__0_n_0;
  wire content_reg_bram_0_i_6_n_0;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_cc_pointer_reg[2]_1 ;
  wire \cur_cc_pointer_reg[2]_2 ;
  wire \cur_ccs_reg[26] ;
  wire \cur_ccs_reg[27] ;
  wire \cur_ccs_reg[58] ;
  wire \cur_ccs_reg[59] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire [2:0]\cur_state[1]_i_4 ;
  wire \cur_state_reg[1] ;
  wire \cur_state_reg[2] ;
  wire fifo_odd_data_in_ready;
  wire [5:0]from_memory;
  wire [4:0]head_reg;
  wire \head_reg[0]_0 ;
  wire \head_reg[4]_0 ;
  wire middle;
  wire \middle[0]_i_1_n_0 ;
  wire \middle[1]_i_1_n_0 ;
  wire \middle[2]_i_1_n_0 ;
  wire \middle[3]_i_1_n_0 ;
  wire \middle[4]_i_1_n_0 ;
  wire \middle[5]_i_1_n_0 ;
  wire \middle[6]_i_1_n_0 ;
  wire \middle[7]_i_2_n_0 ;
  wire \middle[7]_i_3__0_n_0 ;
  wire \middle_reg[0]_0 ;
  wire \middle_reg[0]_1 ;
  wire \middle_reg_n_0_[0] ;
  wire \middle_reg_n_0_[1] ;
  wire \middle_reg_n_0_[2] ;
  wire \middle_reg_n_0_[3] ;
  wire \middle_reg_n_0_[4] ;
  wire \middle_reg_n_0_[5] ;
  wire \middle_reg_n_0_[6] ;
  wire \middle_reg_n_0_[7] ;
  wire \old_grant[0]_i_14_n_0 ;
  wire \old_grant[0]_i_15_n_0 ;
  wire \old_grant[0]_i_16_n_0 ;
  wire \old_grant[0]_i_17_n_0 ;
  wire [31:0]\old_grant[0]_i_9 ;
  wire [0:0]p_0_in;
  wire [4:0]p_0_in__0;
  wire [2:1]state_cur;
  wire \state_cur[0]_i_2__0_n_0 ;
  wire \state_cur[0]_i_3__0_n_0 ;
  wire \state_cur[2]_i_1_n_0 ;
  wire \state_cur[2]_i_4__0_n_0 ;
  wire \state_cur[2]_i_5__0_n_0 ;
  wire \state_cur[2]_i_6__0_n_0 ;
  wire \state_cur[2]_i_7__0_n_0 ;
  wire \state_cur[2]_i_8__0_n_0 ;
  wire \state_cur_reg[0]_0 ;
  wire \state_cur_reg[0]_1 ;
  wire \state_cur_reg[0]_2 ;
  wire \state_cur_reg[1]_0 ;
  wire [2:0]state_next;
  wire \tail[0]_i_1_n_0 ;
  wire \tail[1]_i_1_n_0 ;
  wire \tail[2]_i_1_n_0 ;
  wire \tail[3]_i_1_n_0 ;
  wire \tail[4]_i_1_n_0 ;
  wire [4:0]tail_reg;
  wire [0:0]\tail_reg[4]_0 ;
  wire [4:1]where_to_read;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:8]NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h00003533)) 
    \block_sel_saved[0]_i_2 
       (.I0(from_memory[0]),
        .I1(\middle_reg_n_0_[0] ),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h00003533)) 
    \block_sel_saved[1]_i_2 
       (.I0(from_memory[1]),
        .I1(\middle_reg_n_0_[1] ),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_1));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "a_regex_coprocessor/a_topology/engine_interfaced/anEngine/nolabel_line119/fifo_odd/content" *) 
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
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,where_to_read,content_reg_bram_0_i_6_n_0,1'b1,1'b1,1'b1,1'b1}),
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
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,content_reg_bram_0_4}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_content_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT({NLW_content_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:8],DOUTBDOUT[3:2],from_memory[5:4],DOUTBDOUT[1:0],from_memory[1:0]}),
        .DOUTPADOUTP(NLW_content_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_content_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(\tail_reg[4]_0 ),
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
    content_reg_bram_0_i_15__0
       (.I0(\head_reg[4]_0 ),
        .O(fifo_odd_data_in_ready));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_16__0
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(Q),
        .O(content_reg_bram_0_i_16__0_n_0));
  LUT4 #(
    .INIT(16'h5545)) 
    content_reg_bram_0_i_17__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_i_22__0_n_0),
        .I2(content_reg_bram_0_i_23_n_0),
        .I3(content_reg_bram_0_i_24_n_0),
        .O(cur_is_even_character_reg));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_18__0
       (.I0(head_reg[3]),
        .I1(head_reg[2]),
        .I2(head_reg[1]),
        .O(content_reg_bram_0_i_18__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    content_reg_bram_0_i_19__0
       (.I0(head_reg[1]),
        .I1(head_reg[2]),
        .O(content_reg_bram_0_i_19__0_n_0));
  LUT6 #(
    .INIT(64'h00FFF708FF00FF00)) 
    content_reg_bram_0_i_2
       (.I0(content_reg_bram_0_i_16__0_n_0),
        .I1(cur_is_even_character_reg),
        .I2(\head_reg[0]_0 ),
        .I3(head_reg[4]),
        .I4(head_reg[0]),
        .I5(content_reg_bram_0_i_18__0_n_0),
        .O(where_to_read[4]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    content_reg_bram_0_i_20__0
       (.I0(state_cur[2]),
        .I1(state_cur[1]),
        .O(content_reg_bram_0_i_20__0_n_0));
  LUT6 #(
    .INIT(64'h0041410014000041)) 
    content_reg_bram_0_i_21
       (.I0(content_reg_bram_0_i_25__0_n_0),
        .I1(head_reg[4]),
        .I2(tail_reg[4]),
        .I3(tail_reg[3]),
        .I4(content_reg_bram_0_i_26__0_n_0),
        .I5(head_reg[3]),
        .O(\head_reg[4]_0 ));
  LUT4 #(
    .INIT(16'h6F66)) 
    content_reg_bram_0_i_22__0
       (.I0(head_reg[4]),
        .I1(tail_reg[4]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .O(content_reg_bram_0_i_22__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hD00D)) 
    content_reg_bram_0_i_23
       (.I0(tail_reg[1]),
        .I1(head_reg[1]),
        .I2(tail_reg[2]),
        .I3(head_reg[2]),
        .O(content_reg_bram_0_i_23_n_0));
  LUT6 #(
    .INIT(64'h22F2FFFFFFFF22F2)) 
    content_reg_bram_0_i_24
       (.I0(head_reg[1]),
        .I1(tail_reg[1]),
        .I2(head_reg[3]),
        .I3(tail_reg[3]),
        .I4(head_reg[0]),
        .I5(tail_reg[0]),
        .O(content_reg_bram_0_i_24_n_0));
  LUT6 #(
    .INIT(64'hFFFF6FF6F96FFFFF)) 
    content_reg_bram_0_i_25__0
       (.I0(tail_reg[2]),
        .I1(head_reg[2]),
        .I2(head_reg[1]),
        .I3(tail_reg[1]),
        .I4(tail_reg[0]),
        .I5(head_reg[0]),
        .O(content_reg_bram_0_i_25__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_26__0
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(content_reg_bram_0_i_26__0_n_0));
  LUT6 #(
    .INIT(64'h65666666AAAAAAAA)) 
    content_reg_bram_0_i_3__0
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(content_reg_bram_0_i_16__0_n_0),
        .I5(content_reg_bram_0_i_19__0_n_0),
        .O(where_to_read[3]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h04)) 
    content_reg_bram_0_i_42
       (.I0(content_reg_bram_0_i_18[1]),
        .I1(content_reg_bram_0_i_18[0]),
        .I2(content_reg_bram_0_i_18[2]),
        .O(\cur_state_reg[1] ));
  LUT6 #(
    .INIT(64'h00FFFF00EF10FF00)) 
    content_reg_bram_0_i_4__0
       (.I0(cur_is_even_character),
        .I1(content_reg_bram_0_5),
        .I2(content_reg_bram_0_i_16__0_n_0),
        .I3(head_reg[2]),
        .I4(head_reg[1]),
        .I5(head_reg[0]),
        .O(where_to_read[2]));
  LUT6 #(
    .INIT(64'h55555555AAAA6AAA)) 
    content_reg_bram_0_i_5
       (.I0(head_reg[1]),
        .I1(Q),
        .I2(content_reg_bram_0_i_20__0_n_0),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(head_reg[0]),
        .O(where_to_read[1]));
  LUT6 #(
    .INIT(64'h6555555555555555)) 
    content_reg_bram_0_i_6
       (.I0(head_reg[0]),
        .I1(\head_reg[0]_0 ),
        .I2(cur_is_even_character_reg),
        .I3(state_cur[1]),
        .I4(state_cur[2]),
        .I5(Q),
        .O(content_reg_bram_0_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hFBAA)) 
    content_reg_i_11
       (.I0(cur_is_even_character),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[3] ),
        .O(cur_is_even_character_reg_3));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    content_reg_i_12
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .O(\state_cur_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hFBAA)) 
    content_reg_i_14
       (.I0(cur_is_even_character),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[2] ),
        .O(cur_is_even_character_reg_2));
  LUT5 #(
    .INIT(32'h00003533)) 
    content_reg_i_7
       (.I0(from_memory[5]),
        .I1(\middle_reg_n_0_[5] ),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_3));
  LUT5 #(
    .INIT(32'h00003533)) 
    content_reg_i_8
       (.I0(from_memory[4]),
        .I1(\middle_reg_n_0_[4] ),
        .I2(state_cur[2]),
        .I3(state_cur[1]),
        .I4(cur_is_even_character),
        .O(content_reg_bram_0_2));
  MUXF7 \cur_state_reg[1]_i_10 
       (.I0(\cur_ccs_reg[27] ),
        .I1(\cur_ccs_reg[59] ),
        .O(\cur_cc_pointer_reg[2]_0 ),
        .S(\cur_state[1]_i_4 [2]));
  MUXF7 \cur_state_reg[1]_i_6 
       (.I0(\cur_ccs_reg[26] ),
        .I1(\cur_ccs_reg[58] ),
        .O(\cur_cc_pointer_reg[2] ),
        .S(\cur_state[1]_i_4 [2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'hF1FFFF1F)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_77 
       (.I0(cur_is_even_character_reg),
        .I1(content_reg_bram_0_i_18_0),
        .I2(content_reg_bram_0_i_18[2]),
        .I3(content_reg_bram_0_i_18[0]),
        .I4(content_reg_bram_0_i_18[1]),
        .O(\cur_state_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1 
       (.I0(head_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1 
       (.I0(head_reg[0]),
        .I1(head_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \head[2]_i_1 
       (.I0(head_reg[2]),
        .I1(head_reg[1]),
        .I2(head_reg[0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \head[3]_i_1 
       (.I0(head_reg[3]),
        .I1(head_reg[0]),
        .I2(head_reg[1]),
        .I3(head_reg[2]),
        .O(p_0_in__0[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \head[4]_i_1 
       (.I0(cur_is_even_character_reg),
        .I1(\head_reg[0]_0 ),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \head[4]_i_2 
       (.I0(head_reg[4]),
        .I1(head_reg[0]),
        .I2(head_reg[3]),
        .I3(head_reg[2]),
        .I4(head_reg[1]),
        .O(p_0_in__0[4]));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(clk),
        .CE(p_0_in),
        .D(p_0_in__0[0]),
        .Q(head_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(clk),
        .CE(p_0_in),
        .D(p_0_in__0[1]),
        .Q(head_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(clk),
        .CE(p_0_in),
        .D(p_0_in__0[2]),
        .Q(head_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[3] 
       (.C(clk),
        .CE(p_0_in),
        .D(p_0_in__0[3]),
        .Q(head_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \head_reg[4] 
       (.C(clk),
        .CE(p_0_in),
        .D(p_0_in__0[4]),
        .Q(head_reg[4]),
        .R(SR));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[0]_i_1 
       (.I0(from_memory[0]),
        .I1(state_cur[1]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(Q),
        .I5(content_reg_bram_0_4[0]),
        .O(\middle[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[1]_i_1 
       (.I0(from_memory[1]),
        .I1(state_cur[1]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(Q),
        .I5(content_reg_bram_0_4[1]),
        .O(\middle[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[2]_i_1 
       (.I0(DOUTBDOUT[0]),
        .I1(state_cur[1]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(Q),
        .I5(content_reg_bram_0_4[2]),
        .O(\middle[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[3]_i_1 
       (.I0(DOUTBDOUT[1]),
        .I1(state_cur[1]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(Q),
        .I5(content_reg_bram_0_4[3]),
        .O(\middle[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[4]_i_1 
       (.I0(from_memory[4]),
        .I1(state_cur[1]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(Q),
        .I5(content_reg_bram_0_4[4]),
        .O(\middle[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[5]_i_1 
       (.I0(from_memory[5]),
        .I1(state_cur[1]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(Q),
        .I5(content_reg_bram_0_4[5]),
        .O(\middle[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[6]_i_1 
       (.I0(DOUTBDOUT[2]),
        .I1(state_cur[1]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(Q),
        .I5(content_reg_bram_0_4[6]),
        .O(\middle[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02020F0F02000D00)) 
    \middle[7]_i_1 
       (.I0(cur_is_even_character_reg),
        .I1(\head_reg[0]_0 ),
        .I2(\middle[7]_i_3__0_n_0 ),
        .I3(state_cur[1]),
        .I4(state_cur[2]),
        .I5(\middle_reg[0]_0 ),
        .O(middle));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888088)) 
    \middle[7]_i_2 
       (.I0(DOUTBDOUT[3]),
        .I1(state_cur[1]),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(Q),
        .I5(content_reg_bram_0_4[7]),
        .O(\middle[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h55D5)) 
    \middle[7]_i_3__0 
       (.I0(\middle_reg[0]_1 ),
        .I1(state_cur[2]),
        .I2(state_cur[1]),
        .I3(Q),
        .O(\middle[7]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[0] 
       (.C(clk),
        .CE(middle),
        .D(\middle[0]_i_1_n_0 ),
        .Q(\middle_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[1] 
       (.C(clk),
        .CE(middle),
        .D(\middle[1]_i_1_n_0 ),
        .Q(\middle_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[2] 
       (.C(clk),
        .CE(middle),
        .D(\middle[2]_i_1_n_0 ),
        .Q(\middle_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[3] 
       (.C(clk),
        .CE(middle),
        .D(\middle[3]_i_1_n_0 ),
        .Q(\middle_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[4] 
       (.C(clk),
        .CE(middle),
        .D(\middle[4]_i_1_n_0 ),
        .Q(\middle_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[5] 
       (.C(clk),
        .CE(middle),
        .D(\middle[5]_i_1_n_0 ),
        .Q(\middle_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[6] 
       (.C(clk),
        .CE(middle),
        .D(\middle[6]_i_1_n_0 ),
        .Q(\middle_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \middle_reg[7] 
       (.C(clk),
        .CE(middle),
        .D(\middle[7]_i_2_n_0 ),
        .Q(\middle_reg_n_0_[7] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_14 
       (.I0(\old_grant[0]_i_9 [12]),
        .I1(\old_grant[0]_i_9 [8]),
        .I2(\cur_state[1]_i_4 [1]),
        .I3(\old_grant[0]_i_9 [4]),
        .I4(\cur_state[1]_i_4 [0]),
        .I5(\old_grant[0]_i_9 [0]),
        .O(\old_grant[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_15 
       (.I0(\old_grant[0]_i_9 [28]),
        .I1(\old_grant[0]_i_9 [24]),
        .I2(\cur_state[1]_i_4 [1]),
        .I3(\old_grant[0]_i_9 [20]),
        .I4(\cur_state[1]_i_4 [0]),
        .I5(\old_grant[0]_i_9 [16]),
        .O(\old_grant[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_16 
       (.I0(\old_grant[0]_i_9 [13]),
        .I1(\old_grant[0]_i_9 [9]),
        .I2(\cur_state[1]_i_4 [1]),
        .I3(\old_grant[0]_i_9 [5]),
        .I4(\cur_state[1]_i_4 [0]),
        .I5(\old_grant[0]_i_9 [1]),
        .O(\old_grant[0]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_17 
       (.I0(\old_grant[0]_i_9 [29]),
        .I1(\old_grant[0]_i_9 [25]),
        .I2(\cur_state[1]_i_4 [1]),
        .I3(\old_grant[0]_i_9 [21]),
        .I4(\cur_state[1]_i_4 [0]),
        .I5(\old_grant[0]_i_9 [17]),
        .O(\old_grant[0]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_18 
       (.I0(\old_grant[0]_i_9 [14]),
        .I1(\old_grant[0]_i_9 [10]),
        .I2(\cur_state[1]_i_4 [1]),
        .I3(\old_grant[0]_i_9 [6]),
        .I4(\cur_state[1]_i_4 [0]),
        .I5(\old_grant[0]_i_9 [2]),
        .O(\cur_ccs_reg[26] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_19 
       (.I0(\old_grant[0]_i_9 [30]),
        .I1(\old_grant[0]_i_9 [26]),
        .I2(\cur_state[1]_i_4 [1]),
        .I3(\old_grant[0]_i_9 [22]),
        .I4(\cur_state[1]_i_4 [0]),
        .I5(\old_grant[0]_i_9 [18]),
        .O(\cur_ccs_reg[58] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_20 
       (.I0(\old_grant[0]_i_9 [15]),
        .I1(\old_grant[0]_i_9 [11]),
        .I2(\cur_state[1]_i_4 [1]),
        .I3(\old_grant[0]_i_9 [7]),
        .I4(\cur_state[1]_i_4 [0]),
        .I5(\old_grant[0]_i_9 [3]),
        .O(\cur_ccs_reg[27] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \old_grant[0]_i_21 
       (.I0(\old_grant[0]_i_9 [31]),
        .I1(\old_grant[0]_i_9 [27]),
        .I2(\cur_state[1]_i_4 [1]),
        .I3(\old_grant[0]_i_9 [23]),
        .I4(\cur_state[1]_i_4 [0]),
        .I5(\old_grant[0]_i_9 [19]),
        .O(\cur_ccs_reg[59] ));
  MUXF7 \old_grant_reg[0]_i_6 
       (.I0(\old_grant[0]_i_14_n_0 ),
        .I1(\old_grant[0]_i_15_n_0 ),
        .O(\cur_cc_pointer_reg[2]_1 ),
        .S(\cur_state[1]_i_4 [2]));
  MUXF7 \old_grant_reg[0]_i_7 
       (.I0(\old_grant[0]_i_16_n_0 ),
        .I1(\old_grant[0]_i_17_n_0 ),
        .O(\cur_cc_pointer_reg[2]_2 ),
        .S(\cur_state[1]_i_4 [2]));
  LUT6 #(
    .INIT(64'hBBBBBBABBBABBBAB)) 
    \state_cur[0]_i_1 
       (.I0(\state_cur[0]_i_2__0_n_0 ),
        .I1(\state_cur[0]_i_3__0_n_0 ),
        .I2(cur_is_even_character_reg),
        .I3(\head_reg[0]_0 ),
        .I4(Q),
        .I5(\tail_reg[4]_0 ),
        .O(state_next[0]));
  LUT6 #(
    .INIT(64'h8880808080808888)) 
    \state_cur[0]_i_2__0 
       (.I0(state_cur[1]),
        .I1(state_cur[2]),
        .I2(\state_cur[2]_i_6__0_n_0 ),
        .I3(\state_cur_reg[0]_2 ),
        .I4(\state_cur_reg[0]_1 ),
        .I5(cur_is_even_character),
        .O(\state_cur[0]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA57757775)) 
    \state_cur[0]_i_3__0 
       (.I0(state_cur[1]),
        .I1(Q),
        .I2(cur_is_even_character),
        .I3(\state_cur_reg[0]_1 ),
        .I4(\state_cur_reg[0]_2 ),
        .I5(state_cur[2]),
        .O(\state_cur[0]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \state_cur[1]_i_1__0 
       (.I0(Q),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .O(state_next[1]));
  LUT6 #(
    .INIT(64'hE0E0F0E0E0E0FFE0)) 
    \state_cur[2]_i_1 
       (.I0(state_cur[1]),
        .I1(\state_cur_reg[0]_0 ),
        .I2(\state_cur[2]_i_4__0_n_0 ),
        .I3(cur_is_even_character_reg),
        .I4(\head_reg[0]_0 ),
        .I5(\state_cur[2]_i_5__0_n_0 ),
        .O(\state_cur[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAFFF5FFFEFFDDDD)) 
    \state_cur[2]_i_2 
       (.I0(state_cur[2]),
        .I1(\tail_reg[4]_0 ),
        .I2(\head_reg[0]_0 ),
        .I3(cur_is_even_character_reg),
        .I4(state_cur[1]),
        .I5(Q),
        .O(state_next[2]));
  LUT6 #(
    .INIT(64'h0000FFFFFFFF0091)) 
    \state_cur[2]_i_4__0 
       (.I0(cur_is_even_character),
        .I1(\state_cur_reg[0]_1 ),
        .I2(\state_cur_reg[0]_2 ),
        .I3(Q),
        .I4(state_cur[2]),
        .I5(state_cur[1]),
        .O(\state_cur[2]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \state_cur[2]_i_5__0 
       (.I0(Q),
        .I1(state_cur[2]),
        .I2(\state_cur[2]_i_6__0_n_0 ),
        .O(\state_cur[2]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'hBFFBEFFEFEEFBFFB)) 
    \state_cur[2]_i_6__0 
       (.I0(\state_cur[2]_i_7__0_n_0 ),
        .I1(\state_cur[2]_i_8__0_n_0 ),
        .I2(head_reg[4]),
        .I3(tail_reg[4]),
        .I4(head_reg[3]),
        .I5(tail_reg[3]),
        .O(\state_cur[2]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF6FF6FFF6FFFF6F)) 
    \state_cur[2]_i_7__0 
       (.I0(tail_reg[0]),
        .I1(head_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(tail_reg[2]),
        .I5(head_reg[2]),
        .O(\state_cur[2]_i_7__0_n_0 ));
  LUT6 #(
    .INIT(64'hD0FDFFFF0000D0FD)) 
    \state_cur[2]_i_8__0 
       (.I0(head_reg[0]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(head_reg[1]),
        .I4(head_reg[2]),
        .I5(tail_reg[2]),
        .O(\state_cur[2]_i_8__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[0] 
       (.C(clk),
        .CE(\state_cur[2]_i_1_n_0 ),
        .D(state_next[0]),
        .Q(Q),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[1] 
       (.C(clk),
        .CE(\state_cur[2]_i_1_n_0 ),
        .D(state_next[1]),
        .Q(state_cur[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_cur_reg[2] 
       (.C(clk),
        .CE(\state_cur[2]_i_1_n_0 ),
        .D(state_next[2]),
        .Q(state_cur[2]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hFBAA)) 
    \tag_saved[0]_i_3 
       (.I0(cur_is_even_character),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[6] ),
        .O(cur_is_even_character_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hFBAA)) 
    \tag_saved[1]_i_3 
       (.I0(cur_is_even_character),
        .I1(state_cur[1]),
        .I2(state_cur[2]),
        .I3(\middle_reg_n_0_[7] ),
        .O(cur_is_even_character_reg_1));
  LUT1 #(
    .INIT(2'h1)) 
    \tail[0]_i_1 
       (.I0(tail_reg[0]),
        .O(\tail[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tail[1]_i_1 
       (.I0(tail_reg[0]),
        .I1(tail_reg[1]),
        .O(\tail[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \tail[2]_i_1 
       (.I0(tail_reg[2]),
        .I1(tail_reg[1]),
        .I2(tail_reg[0]),
        .O(\tail[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \tail[3]_i_1 
       (.I0(tail_reg[3]),
        .I1(tail_reg[0]),
        .I2(tail_reg[1]),
        .I3(tail_reg[2]),
        .O(\tail[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \tail[4]_i_1 
       (.I0(tail_reg[4]),
        .I1(tail_reg[2]),
        .I2(tail_reg[1]),
        .I3(tail_reg[0]),
        .I4(tail_reg[3]),
        .O(\tail[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[0] 
       (.C(clk),
        .CE(\tail_reg[4]_0 ),
        .D(\tail[0]_i_1_n_0 ),
        .Q(tail_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[1] 
       (.C(clk),
        .CE(\tail_reg[4]_0 ),
        .D(\tail[1]_i_1_n_0 ),
        .Q(tail_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[2] 
       (.C(clk),
        .CE(\tail_reg[4]_0 ),
        .D(\tail[2]_i_1_n_0 ),
        .Q(tail_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[3] 
       (.C(clk),
        .CE(\tail_reg[4]_0 ),
        .D(\tail[3]_i_1_n_0 ),
        .Q(tail_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tail_reg[4] 
       (.C(clk),
        .CE(\tail_reg[4]_0 ),
        .D(\tail[4]_i_1_n_0 ),
        .Q(tail_reg[4]),
        .R(SR));
endmodule

module ping_pong_buffer
   (Q,
    cur_is_even_character_reg,
    cur_is_even_character_reg_0,
    \state_cur_reg[0] ,
    \cur_cc_pointer_reg[2] ,
    \cur_ccs_reg[26] ,
    \cur_ccs_reg[58] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cur_ccs_reg[27] ,
    \cur_ccs_reg[59] ,
    \cur_cc_pointer_reg[2]_1 ,
    \cur_cc_pointer_reg[2]_2 ,
    D,
    \cur_state_reg[1] ,
    \head_reg[3] ,
    \cur_state_reg[2] ,
    \cur_state_reg[1]_0 ,
    \cur_state_reg[2]_0 ,
    \cur_state_reg[2]_1 ,
    clk,
    E,
    DINADIN,
    \tail_reg[4] ,
    content_reg_bram_0,
    content_reg_bram_0_0,
    cur_is_even_character,
    \head_reg[0] ,
    \state_cur_reg[0]_0 ,
    \middle_reg[0] ,
    \middle_reg[0]_0 ,
    \state_cur_reg[0]_1 ,
    \state_cur_reg[0]_2 ,
    \state_cur_reg[0]_3 ,
    \cur_state[1]_i_4 ,
    \old_grant[0]_i_9 ,
    \cur_state_reg[1]_1 ,
    \middle_reg[0]_1 ,
    \cur_state_reg[1]_2 ,
    CO,
    SR);
  output [0:0]Q;
  output cur_is_even_character_reg;
  output cur_is_even_character_reg_0;
  output [0:0]\state_cur_reg[0] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_ccs_reg[26] ;
  output \cur_ccs_reg[58] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cur_ccs_reg[27] ;
  output \cur_ccs_reg[59] ;
  output \cur_cc_pointer_reg[2]_1 ;
  output \cur_cc_pointer_reg[2]_2 ;
  output [7:0]D;
  output \cur_state_reg[1] ;
  output \head_reg[3] ;
  output \cur_state_reg[2] ;
  output \cur_state_reg[1]_0 ;
  output [0:0]\cur_state_reg[2]_0 ;
  output \cur_state_reg[2]_1 ;
  input clk;
  input [0:0]E;
  input [7:0]DINADIN;
  input [0:0]\tail_reg[4] ;
  input [7:0]content_reg_bram_0;
  input content_reg_bram_0_0;
  input cur_is_even_character;
  input \head_reg[0] ;
  input \state_cur_reg[0]_0 ;
  input \middle_reg[0] ;
  input \middle_reg[0]_0 ;
  input \state_cur_reg[0]_1 ;
  input \state_cur_reg[0]_2 ;
  input \state_cur_reg[0]_3 ;
  input [2:0]\cur_state[1]_i_4 ;
  input [31:0]\old_grant[0]_i_9 ;
  input [2:0]\cur_state_reg[1]_1 ;
  input \middle_reg[0]_1 ;
  input \cur_state_reg[1]_2 ;
  input [0:0]CO;
  input [0:0]SR;

  wire [0:0]CO;
  wire [7:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]SR;
  wire clk;
  wire [7:0]content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire \cur_cc_pointer_reg[2]_1 ;
  wire \cur_cc_pointer_reg[2]_2 ;
  wire \cur_ccs_reg[26] ;
  wire \cur_ccs_reg[27] ;
  wire \cur_ccs_reg[58] ;
  wire \cur_ccs_reg[59] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire [2:0]\cur_state[1]_i_4 ;
  wire \cur_state_reg[1] ;
  wire \cur_state_reg[1]_0 ;
  wire [2:0]\cur_state_reg[1]_1 ;
  wire \cur_state_reg[1]_2 ;
  wire \cur_state_reg[2] ;
  wire [0:0]\cur_state_reg[2]_0 ;
  wire \cur_state_reg[2]_1 ;
  wire fifo_odd_n_14;
  wire fifo_odd_n_15;
  wire fifo_odd_n_16;
  wire fifo_odd_n_17;
  wire fifo_odd_n_18;
  wire fifo_odd_n_19;
  wire fifo_odd_n_20;
  wire fifo_odd_n_21;
  wire fifo_odd_n_22;
  wire fifo_odd_n_23;
  wire [7:2]from_memory;
  wire \head_reg[0] ;
  wire \head_reg[3] ;
  wire \middle_reg[0] ;
  wire \middle_reg[0]_0 ;
  wire \middle_reg[0]_1 ;
  wire [31:0]\old_grant[0]_i_9 ;
  wire [0:0]\state_cur_reg[0] ;
  wire \state_cur_reg[0]_0 ;
  wire \state_cur_reg[0]_1 ;
  wire \state_cur_reg[0]_2 ;
  wire \state_cur_reg[0]_3 ;
  wire [0:0]\tail_reg[4] ;

  fifo fifo_even
       (.CO(CO),
        .D(D),
        .DINADIN(DINADIN),
        .DOUTBDOUT({from_memory[7:6],from_memory[3:2]}),
        .E(E),
        .\FETCH_REC_Pc_reg[0] (fifo_odd_n_14),
        .\FETCH_REC_Pc_reg[1] (fifo_odd_n_15),
        .\FETCH_REC_Pc_reg[2] (fifo_odd_n_19),
        .\FETCH_REC_Pc_reg[3] (fifo_odd_n_20),
        .\FETCH_REC_Pc_reg[4] (fifo_odd_n_18),
        .\FETCH_REC_Pc_reg[5] (fifo_odd_n_21),
        .\FETCH_REC_Pc_reg[6] (fifo_odd_n_16),
        .\FETCH_REC_Pc_reg[6]_0 (fifo_odd_n_22),
        .\FETCH_REC_Pc_reg[7] (fifo_odd_n_17),
        .Q(\state_cur_reg[0] ),
        .SR(SR),
        .clk(clk),
        .content_reg_bram_0_0(content_reg_bram_0_0),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg_0),
        .\cur_state_reg[1] (\cur_state_reg[1] ),
        .\cur_state_reg[1]_0 (\cur_state_reg[1]_1 ),
        .\cur_state_reg[1]_1 (fifo_odd_n_23),
        .\cur_state_reg[1]_2 (\cur_state_reg[1]_2 ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\cur_state_reg[2]_0 (\cur_state_reg[2]_0 ),
        .\head_reg[0]_0 (\head_reg[0] ),
        .\head_reg[3]_0 (\head_reg[3] ),
        .\middle_reg[0]_0 (\middle_reg[0]_0 ),
        .\middle_reg[0]_1 (\middle_reg[0]_1 ),
        .\state_cur_reg[0]_0 (\state_cur_reg[0]_1 ),
        .\state_cur_reg[0]_1 (\state_cur_reg[0]_2 ),
        .\state_cur_reg[0]_2 (\state_cur_reg[0]_3 ));
  fifo_0 fifo_odd
       (.DOUTBDOUT({from_memory[7:6],from_memory[3:2]}),
        .Q(Q),
        .SR(SR),
        .clk(clk),
        .content_reg_bram_0_0(fifo_odd_n_14),
        .content_reg_bram_0_1(fifo_odd_n_15),
        .content_reg_bram_0_2(fifo_odd_n_18),
        .content_reg_bram_0_3(fifo_odd_n_21),
        .content_reg_bram_0_4(content_reg_bram_0),
        .content_reg_bram_0_5(content_reg_bram_0_0),
        .content_reg_bram_0_i_18(\cur_state_reg[1]_1 ),
        .content_reg_bram_0_i_18_0(cur_is_even_character_reg_0),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[2]_1 (\cur_cc_pointer_reg[2]_1 ),
        .\cur_cc_pointer_reg[2]_2 (\cur_cc_pointer_reg[2]_2 ),
        .\cur_ccs_reg[26] (\cur_ccs_reg[26] ),
        .\cur_ccs_reg[27] (\cur_ccs_reg[27] ),
        .\cur_ccs_reg[58] (\cur_ccs_reg[58] ),
        .\cur_ccs_reg[59] (\cur_ccs_reg[59] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(fifo_odd_n_16),
        .cur_is_even_character_reg_1(fifo_odd_n_17),
        .cur_is_even_character_reg_2(fifo_odd_n_19),
        .cur_is_even_character_reg_3(fifo_odd_n_20),
        .\cur_state[1]_i_4 (\cur_state[1]_i_4 ),
        .\cur_state_reg[1] (\cur_state_reg[1]_0 ),
        .\cur_state_reg[2] (\cur_state_reg[2]_1 ),
        .\head_reg[0]_0 (\head_reg[0] ),
        .\head_reg[4]_0 (fifo_odd_n_23),
        .\middle_reg[0]_0 (\middle_reg[0] ),
        .\middle_reg[0]_1 (\middle_reg[0]_1 ),
        .\old_grant[0]_i_9 (\old_grant[0]_i_9 ),
        .\state_cur_reg[0]_0 (\state_cur_reg[0]_0 ),
        .\state_cur_reg[0]_1 (\state_cur_reg[0]_3 ),
        .\state_cur_reg[0]_2 (\state_cur_reg[0]_2 ),
        .\state_cur_reg[1]_0 (fifo_odd_n_22),
        .\tail_reg[4]_0 (\tail_reg[4] ));
endmodule

module regex_coprocessor_top
   (SR,
    \FSM_sequential_status_register_reg[1] ,
    ADDRARDADDR,
    E,
    bram_r_valid,
    \cmd_register[0] ,
    \FSM_sequential_status_register_reg[2] ,
    clk,
    D,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \FSM_sequential_status_register_reg[0] ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    start_cc_pointer_register_IBUF,
    \cur_cc_pointer_reg[0]_0 ,
    cmd_register_IBUF,
    Q,
    rst_IBUF,
    content_reg,
    end_cc_pointer_register_IBUF);
  output [0:0]SR;
  output \FSM_sequential_status_register_reg[1] ;
  output [8:0]ADDRARDADDR;
  output [0:0]E;
  output bram_r_valid;
  output \cmd_register[0] ;
  output [2:0]\FSM_sequential_status_register_reg[2] ;
  input clk;
  input [63:0]D;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input [2:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \FSM_sequential_status_register_reg[0] ;
  input \FSM_sequential_status_register_reg[0]_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input [31:0]start_cc_pointer_register_IBUF;
  input \cur_cc_pointer_reg[0]_0 ;
  input [2:0]cmd_register_IBUF;
  input [2:0]Q;
  input rst_IBUF;
  input content_reg;
  input [31:0]end_cc_pointer_register_IBUF;

  wire [8:0]ADDRARDADDR;
  wire [63:0]D;
  wire [0:0]E;
  wire \FSM_sequential_status_register[2]_i_4_n_0 ;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[1] ;
  wire [2:0]\FSM_sequential_status_register_reg[2] ;
  wire [2:0]Q;
  wire [0:0]SR;
  wire a_topology_n_1;
  wire a_topology_n_18;
  wire a_topology_n_19;
  wire a_topology_n_2;
  wire a_topology_n_20;
  wire a_topology_n_21;
  wire a_topology_n_22;
  wire a_topology_n_23;
  wire a_topology_n_24;
  wire a_topology_n_26;
  wire a_topology_n_3;
  wire a_topology_n_4;
  wire a_topology_n_5;
  wire a_topology_n_6;
  wire \addr1_inferred__0/i__carry__0_n_5 ;
  wire \addr1_inferred__0/i__carry__0_n_6 ;
  wire \addr1_inferred__0/i__carry__0_n_7 ;
  wire \addr1_inferred__0/i__carry_n_0 ;
  wire \addr1_inferred__0/i__carry_n_1 ;
  wire \addr1_inferred__0/i__carry_n_2 ;
  wire \addr1_inferred__0/i__carry_n_3 ;
  wire \addr1_inferred__0/i__carry_n_4 ;
  wire \addr1_inferred__0/i__carry_n_5 ;
  wire \addr1_inferred__0/i__carry_n_6 ;
  wire \addr1_inferred__0/i__carry_n_7 ;
  wire addr2_carry__0_n_0;
  wire addr2_carry__0_n_1;
  wire addr2_carry__0_n_2;
  wire addr2_carry__0_n_3;
  wire addr2_carry__0_n_4;
  wire addr2_carry__0_n_5;
  wire addr2_carry__0_n_6;
  wire addr2_carry__0_n_7;
  wire addr2_carry__1_n_0;
  wire addr2_carry__1_n_1;
  wire addr2_carry__1_n_2;
  wire addr2_carry__1_n_3;
  wire addr2_carry__1_n_4;
  wire addr2_carry__1_n_5;
  wire addr2_carry__1_n_6;
  wire addr2_carry__1_n_7;
  wire addr2_carry__2_n_2;
  wire addr2_carry__2_n_3;
  wire addr2_carry__2_n_4;
  wire addr2_carry__2_n_5;
  wire addr2_carry__2_n_6;
  wire addr2_carry__2_n_7;
  wire addr2_carry_n_0;
  wire addr2_carry_n_1;
  wire addr2_carry_n_2;
  wire addr2_carry_n_3;
  wire addr2_carry_n_4;
  wire addr2_carry_n_5;
  wire addr2_carry_n_6;
  wire addr2_carry_n_7;
  wire [2:0]address_register_IBUF;
  wire bram_r_valid;
  wire clk;
  wire \cmd_register[0] ;
  wire [2:0]cmd_register_IBUF;
  wire content_reg;
  wire \cur_cc_pointer_reg[0]_0 ;
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
  wire cur_is_even_character_i_2_n_0;
  wire cur_is_even_character_i_3_n_0;
  wire [2:0]cur_state;
  wire \cur_state[0]_i_2_n_0 ;
  wire \cur_state[1]_i_4_n_0 ;
  wire \cur_state[2]_i_4_n_0 ;
  wire \cur_state_reg[1]_i_7_n_0 ;
  wire \cur_state_reg[1]_i_9_n_0 ;
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
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_72_n_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_81_n_0 ;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire [31:0]next_cc_pointer;
  wire p_1_in;
  wire rst_IBUF;
  wire [31:0]start_cc_pointer_register_IBUF;
  wire [31:1]tmp_cur_cc_increment;
  wire [7:0]\NLW_addr1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [7:3]\NLW_addr1_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [7:0]\NLW_addr1_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [7:6]NLW_addr2_carry__2_CO_UNCONNECTED;
  wire [7:7]NLW_addr2_carry__2_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0000100011111111)) 
    \FSM_sequential_status_register[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(cur_state[2]),
        .I3(cur_state[1]),
        .I4(cur_state[0]),
        .I5(Q[0]),
        .O(\FSM_sequential_status_register_reg[2] [0]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    \FSM_sequential_status_register[1]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(cur_state[2]),
        .I4(cur_state[1]),
        .O(\FSM_sequential_status_register_reg[2] [1]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'h00040404)) 
    \FSM_sequential_status_register[2]_i_2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(cur_state[2]),
        .I4(cur_state[1]),
        .O(\FSM_sequential_status_register_reg[2] [2]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_status_register[2]_i_4 
       (.I0(cur_state[1]),
        .I1(cur_state[0]),
        .O(\FSM_sequential_status_register[2]_i_4_n_0 ));
  topology_single a_topology
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(\addr1_inferred__0/i__carry__0_n_5 ),
        .D(D),
        .E(a_topology_n_5),
        .FETCH_REC_Instr_valid_reg(a_topology_n_4),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register[2]_i_4_n_0 ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_1 (\FSM_sequential_status_register_reg[0]_0 ),
        .O(tmp_cur_cc_increment[3]),
        .Q(cur_state),
        .SR(SR),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .clk(clk),
        .\cmd_register[0] (\cmd_register[0] ),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg(content_reg),
        .\cur_cc_pointer_reg[0] ({p_1_in,\cur_cc_pointer_reg_n_0_[2] ,\cur_cc_pointer_reg_n_0_[1] ,\cur_cc_pointer_reg_n_0_[0] }),
        .\cur_cc_pointer_reg[0]_0 (\FSM_sequential_status_register_reg[1] ),
        .\cur_cc_pointer_reg[2] (a_topology_n_23),
        .\cur_cc_pointer_reg[2]_0 (a_topology_n_24),
        .\cur_cc_pointer_reg[3] (a_topology_n_6),
        .\cur_ccs_reg[28] (a_topology_n_21),
        .\cur_ccs_reg[29] (a_topology_n_19),
        .\cur_ccs_reg[60] (a_topology_n_22),
        .\cur_ccs_reg[61] (a_topology_n_20),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(a_topology_n_26),
        .cur_is_even_character_reg_0(cur_is_even_character_i_3_n_0),
        .cur_is_even_character_reg_1(cur_is_even_character_i_2_n_0),
        .\cur_state[1]_i_3 (\cur_state_reg[1]_i_9_n_0 ),
        .\cur_state_reg[0] ({a_topology_n_1,a_topology_n_2,a_topology_n_3}),
        .\cur_state_reg[0]_0 (\cur_state[0]_i_2_n_0 ),
        .\cur_state_reg[0]_1 (\cur_state[2]_i_4_n_0 ),
        .\cur_state_reg[0]_2 (\cur_state[1]_i_4_n_0 ),
        .\cur_state_reg[2] (E),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_72_n_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (next_cc_pointer[11:4]),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\head_reg[3] (a_topology_n_18),
        .\old_grant_reg[0]_i_10 ({data7,data6,data5,data4,data3,data2,data1,\cur_ccs_reg_n_0_[7] ,\cur_ccs_reg_n_0_[6] ,\cur_ccs_reg_n_0_[5] ,\cur_ccs_reg_n_0_[4] ,\cur_ccs_reg_n_0_[3] ,\cur_ccs_reg_n_0_[2] ,\cur_ccs_reg_n_0_[1] ,\cur_ccs_reg_n_0_[0] }),
        .rst_IBUF(rst_IBUF));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \addr1_inferred__0/i__carry 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\addr1_inferred__0/i__carry_n_0 ,\addr1_inferred__0/i__carry_n_1 ,\addr1_inferred__0/i__carry_n_2 ,\addr1_inferred__0/i__carry_n_3 ,\addr1_inferred__0/i__carry_n_4 ,\addr1_inferred__0/i__carry_n_5 ,\addr1_inferred__0/i__carry_n_6 ,\addr1_inferred__0/i__carry_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_addr1_inferred__0/i__carry_O_UNCONNECTED [7:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0,i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \addr1_inferred__0/i__carry__0 
       (.CI(\addr1_inferred__0/i__carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_addr1_inferred__0/i__carry__0_CO_UNCONNECTED [7:3],\addr1_inferred__0/i__carry__0_n_5 ,\addr1_inferred__0/i__carry__0_n_6 ,\addr1_inferred__0/i__carry__0_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_addr1_inferred__0/i__carry__0_O_UNCONNECTED [7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0}));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    addr2_carry
       (.CI(\cur_cc_pointer_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({addr2_carry_n_0,addr2_carry_n_1,addr2_carry_n_2,addr2_carry_n_3,addr2_carry_n_4,addr2_carry_n_5,addr2_carry_n_6,addr2_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_cur_cc_increment[8:1]),
        .S({\cur_cc_pointer_reg_n_0_[8] ,\cur_cc_pointer_reg_n_0_[7] ,\cur_cc_pointer_reg_n_0_[6] ,\cur_cc_pointer_reg_n_0_[5] ,\cur_cc_pointer_reg_n_0_[4] ,p_1_in,\cur_cc_pointer_reg_n_0_[2] ,\cur_cc_pointer_reg_n_0_[1] }));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    addr2_carry__0
       (.CI(addr2_carry_n_0),
        .CI_TOP(1'b0),
        .CO({addr2_carry__0_n_0,addr2_carry__0_n_1,addr2_carry__0_n_2,addr2_carry__0_n_3,addr2_carry__0_n_4,addr2_carry__0_n_5,addr2_carry__0_n_6,addr2_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_cur_cc_increment[16:9]),
        .S({\cur_cc_pointer_reg_n_0_[16] ,\cur_cc_pointer_reg_n_0_[15] ,\cur_cc_pointer_reg_n_0_[14] ,\cur_cc_pointer_reg_n_0_[13] ,\cur_cc_pointer_reg_n_0_[12] ,\cur_cc_pointer_reg_n_0_[11] ,\cur_cc_pointer_reg_n_0_[10] ,\cur_cc_pointer_reg_n_0_[9] }));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    addr2_carry__1
       (.CI(addr2_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({addr2_carry__1_n_0,addr2_carry__1_n_1,addr2_carry__1_n_2,addr2_carry__1_n_3,addr2_carry__1_n_4,addr2_carry__1_n_5,addr2_carry__1_n_6,addr2_carry__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_cur_cc_increment[24:17]),
        .S({\cur_cc_pointer_reg_n_0_[24] ,\cur_cc_pointer_reg_n_0_[23] ,\cur_cc_pointer_reg_n_0_[22] ,\cur_cc_pointer_reg_n_0_[21] ,\cur_cc_pointer_reg_n_0_[20] ,\cur_cc_pointer_reg_n_0_[19] ,\cur_cc_pointer_reg_n_0_[18] ,\cur_cc_pointer_reg_n_0_[17] }));
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    addr2_carry__2
       (.CI(addr2_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_addr2_carry__2_CO_UNCONNECTED[7:6],addr2_carry__2_n_2,addr2_carry__2_n_3,addr2_carry__2_n_4,addr2_carry__2_n_5,addr2_carry__2_n_6,addr2_carry__2_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_addr2_carry__2_O_UNCONNECTED[7],tmp_cur_cc_increment[31:25]}),
        .S({1'b0,\cur_cc_pointer_reg_n_0_[31] ,\cur_cc_pointer_reg_n_0_[30] ,\cur_cc_pointer_reg_n_0_[29] ,\cur_cc_pointer_reg_n_0_[28] ,\cur_cc_pointer_reg_n_0_[27] ,\cur_cc_pointer_reg_n_0_[26] ,\cur_cc_pointer_reg_n_0_[25] }));
  LUT3 #(
    .INIT(8'h3A)) 
    \cur_cc_pointer[0]_i_1 
       (.I0(start_cc_pointer_register_IBUF[0]),
        .I1(\cur_cc_pointer_reg_n_0_[0] ),
        .I2(cur_state[2]),
        .O(next_cc_pointer[0]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[10]_i_1 
       (.I0(tmp_cur_cc_increment[10]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[10]),
        .O(next_cc_pointer[10]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[11]_i_1 
       (.I0(tmp_cur_cc_increment[11]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[11]),
        .O(next_cc_pointer[11]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[12]_i_1 
       (.I0(tmp_cur_cc_increment[12]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[12]),
        .O(next_cc_pointer[12]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[13]_i_1 
       (.I0(tmp_cur_cc_increment[13]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[13]),
        .O(next_cc_pointer[13]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[14]_i_1 
       (.I0(tmp_cur_cc_increment[14]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[14]),
        .O(next_cc_pointer[14]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[15]_i_1 
       (.I0(tmp_cur_cc_increment[15]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[15]),
        .O(next_cc_pointer[15]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[16]_i_1 
       (.I0(tmp_cur_cc_increment[16]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[16]),
        .O(next_cc_pointer[16]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[17]_i_1 
       (.I0(tmp_cur_cc_increment[17]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[17]),
        .O(next_cc_pointer[17]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[18]_i_1 
       (.I0(tmp_cur_cc_increment[18]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[18]),
        .O(next_cc_pointer[18]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[19]_i_1 
       (.I0(tmp_cur_cc_increment[19]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[19]),
        .O(next_cc_pointer[19]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[1]_i_1 
       (.I0(tmp_cur_cc_increment[1]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[1]),
        .O(next_cc_pointer[1]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[20]_i_1 
       (.I0(tmp_cur_cc_increment[20]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[20]),
        .O(next_cc_pointer[20]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[21]_i_1 
       (.I0(tmp_cur_cc_increment[21]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[21]),
        .O(next_cc_pointer[21]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[22]_i_1 
       (.I0(tmp_cur_cc_increment[22]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[22]),
        .O(next_cc_pointer[22]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[23]_i_1 
       (.I0(tmp_cur_cc_increment[23]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[23]),
        .O(next_cc_pointer[23]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[24]_i_1 
       (.I0(tmp_cur_cc_increment[24]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[24]),
        .O(next_cc_pointer[24]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[25]_i_1 
       (.I0(tmp_cur_cc_increment[25]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[25]),
        .O(next_cc_pointer[25]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[26]_i_1 
       (.I0(tmp_cur_cc_increment[26]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[26]),
        .O(next_cc_pointer[26]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[27]_i_1 
       (.I0(tmp_cur_cc_increment[27]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[27]),
        .O(next_cc_pointer[27]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[28]_i_1 
       (.I0(tmp_cur_cc_increment[28]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[28]),
        .O(next_cc_pointer[28]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[29]_i_1 
       (.I0(tmp_cur_cc_increment[29]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[29]),
        .O(next_cc_pointer[29]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[2]_i_1 
       (.I0(tmp_cur_cc_increment[2]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[2]),
        .O(next_cc_pointer[2]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[30]_i_1 
       (.I0(tmp_cur_cc_increment[30]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[30]),
        .O(next_cc_pointer[30]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[31]_i_2 
       (.I0(tmp_cur_cc_increment[31]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[31]),
        .O(next_cc_pointer[31]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \cur_cc_pointer[31]_i_4 
       (.I0(\cur_cc_pointer_reg[0]_0 ),
        .I1(cmd_register_IBUF[1]),
        .I2(cmd_register_IBUF[2]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\FSM_sequential_status_register_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[3]_i_1 
       (.I0(tmp_cur_cc_increment[3]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[3]),
        .O(next_cc_pointer[3]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[4]_i_1 
       (.I0(tmp_cur_cc_increment[4]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[4]),
        .O(next_cc_pointer[4]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[5]_i_1 
       (.I0(tmp_cur_cc_increment[5]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[5]),
        .O(next_cc_pointer[5]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[6]_i_1 
       (.I0(tmp_cur_cc_increment[6]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[6]),
        .O(next_cc_pointer[6]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[7]_i_1 
       (.I0(tmp_cur_cc_increment[7]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[7]),
        .O(next_cc_pointer[7]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \cur_cc_pointer[8]_i_1 
       (.I0(tmp_cur_cc_increment[8]),
        .I1(cur_state[2]),
        .I2(start_cc_pointer_register_IBUF[8]),
        .O(next_cc_pointer[8]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
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
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[0]),
        .Q(\cur_cc_pointer_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[10] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[10]),
        .Q(\cur_cc_pointer_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[11] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[11]),
        .Q(\cur_cc_pointer_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[12] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[12]),
        .Q(\cur_cc_pointer_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[13] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[13]),
        .Q(\cur_cc_pointer_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[14] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[14]),
        .Q(\cur_cc_pointer_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[15] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[15]),
        .Q(\cur_cc_pointer_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[16] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[16]),
        .Q(\cur_cc_pointer_reg_n_0_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[17] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[17]),
        .Q(\cur_cc_pointer_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[18] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[18]),
        .Q(\cur_cc_pointer_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[19] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[19]),
        .Q(\cur_cc_pointer_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[1] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[1]),
        .Q(\cur_cc_pointer_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[20] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[20]),
        .Q(\cur_cc_pointer_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[21] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[21]),
        .Q(\cur_cc_pointer_reg_n_0_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[22] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[22]),
        .Q(\cur_cc_pointer_reg_n_0_[22] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[23] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[23]),
        .Q(\cur_cc_pointer_reg_n_0_[23] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[24] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[24]),
        .Q(\cur_cc_pointer_reg_n_0_[24] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[25] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[25]),
        .Q(\cur_cc_pointer_reg_n_0_[25] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[26] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[26]),
        .Q(\cur_cc_pointer_reg_n_0_[26] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[27] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[27]),
        .Q(\cur_cc_pointer_reg_n_0_[27] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[28] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[28]),
        .Q(\cur_cc_pointer_reg_n_0_[28] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[29] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[29]),
        .Q(\cur_cc_pointer_reg_n_0_[29] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[2] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[2]),
        .Q(\cur_cc_pointer_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[30] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[30]),
        .Q(\cur_cc_pointer_reg_n_0_[30] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[31] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[31]),
        .Q(\cur_cc_pointer_reg_n_0_[31] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[3] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[3]),
        .Q(p_1_in),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[4] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[4]),
        .Q(\cur_cc_pointer_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[5] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[5]),
        .Q(\cur_cc_pointer_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[6] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[6]),
        .Q(\cur_cc_pointer_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[7] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[7]),
        .Q(\cur_cc_pointer_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[8] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[8]),
        .Q(\cur_cc_pointer_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_cc_pointer_reg[9] 
       (.C(clk),
        .CE(a_topology_n_6),
        .D(next_cc_pointer[9]),
        .Q(\cur_cc_pointer_reg_n_0_[9] ),
        .R(SR));
  LUT3 #(
    .INIT(8'h14)) 
    \cur_ccs[63]_i_1 
       (.I0(cur_state[2]),
        .I1(cur_state[0]),
        .I2(cur_state[1]),
        .O(\cur_ccs[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[0] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[0]),
        .Q(\cur_ccs_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[10] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[10]),
        .Q(data1[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[11] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[11]),
        .Q(data1[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[12] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[12]),
        .Q(data1[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[13] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[13]),
        .Q(data1[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[14] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[14]),
        .Q(data1[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[15] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[15]),
        .Q(data1[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[16] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[16]),
        .Q(data2[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[17] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[17]),
        .Q(data2[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[18] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[18]),
        .Q(data2[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[19] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[19]),
        .Q(data2[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[1] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[1]),
        .Q(\cur_ccs_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[20] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[20]),
        .Q(data2[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[21] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[21]),
        .Q(data2[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[22] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[22]),
        .Q(data2[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[23] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[23]),
        .Q(data2[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[24] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[24]),
        .Q(data3[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[25] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[25]),
        .Q(data3[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[26] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[26]),
        .Q(data3[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[27] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[27]),
        .Q(data3[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[28] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[28]),
        .Q(data3[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[29] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[29]),
        .Q(data3[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[2] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[2]),
        .Q(\cur_ccs_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[30] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[30]),
        .Q(data3[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[31] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[31]),
        .Q(data3[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[32] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[32]),
        .Q(data4[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[33] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[33]),
        .Q(data4[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[34] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[34]),
        .Q(data4[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[35] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[35]),
        .Q(data4[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[36] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[36]),
        .Q(data4[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[37] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[37]),
        .Q(data4[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[38] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[38]),
        .Q(data4[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[39] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[39]),
        .Q(data4[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[3] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[3]),
        .Q(\cur_ccs_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[40] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[40]),
        .Q(data5[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[41] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[41]),
        .Q(data5[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[42] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[42]),
        .Q(data5[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[43] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[43]),
        .Q(data5[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[44] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[44]),
        .Q(data5[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[45] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[45]),
        .Q(data5[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[46] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[46]),
        .Q(data5[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[47] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[47]),
        .Q(data5[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[48] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[48]),
        .Q(data6[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[49] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[49]),
        .Q(data6[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[4] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[4]),
        .Q(\cur_ccs_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[50] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[50]),
        .Q(data6[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[51] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[51]),
        .Q(data6[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[52] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[52]),
        .Q(data6[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[53] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[53]),
        .Q(data6[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[54] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[54]),
        .Q(data6[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[55] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[55]),
        .Q(data6[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[56] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[56]),
        .Q(data7[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[57] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[57]),
        .Q(data7[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[58] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[58]),
        .Q(data7[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[59] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[59]),
        .Q(data7[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[5] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[5]),
        .Q(\cur_ccs_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[60] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[60]),
        .Q(data7[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[61] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[61]),
        .Q(data7[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[62] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[62]),
        .Q(data7[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[63] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[63]),
        .Q(data7[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[6] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[6]),
        .Q(\cur_ccs_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[7] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[7]),
        .Q(\cur_ccs_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[8] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[8]),
        .Q(data1[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_ccs_reg[9] 
       (.C(clk),
        .CE(\cur_ccs[63]_i_1_n_0 ),
        .D(D[9]),
        .Q(data1[1]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h10)) 
    cur_is_even_character_i_2
       (.I0(cur_state[0]),
        .I1(cur_state[1]),
        .I2(cur_state[2]),
        .O(cur_is_even_character_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h6)) 
    cur_is_even_character_i_3
       (.I0(p_1_in),
        .I1(tmp_cur_cc_increment[3]),
        .O(cur_is_even_character_i_3_n_0));
  FDSE #(
    .INIT(1'b1)) 
    cur_is_even_character_reg
       (.C(clk),
        .CE(1'b1),
        .D(a_topology_n_26),
        .Q(cur_is_even_character),
        .S(SR));
  LUT6 #(
    .INIT(64'h0000000000000060)) 
    \cur_state[0]_i_2 
       (.I0(tmp_cur_cc_increment[3]),
        .I1(p_1_in),
        .I2(cur_state[2]),
        .I3(cur_state[0]),
        .I4(\addr1_inferred__0/i__carry__0_n_5 ),
        .I5(a_topology_n_18),
        .O(\cur_state[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \cur_state[1]_i_4 
       (.I0(a_topology_n_23),
        .I1(a_topology_n_24),
        .I2(\cur_state_reg[1]_i_7_n_0 ),
        .O(\cur_state[1]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h04FF)) 
    \cur_state[2]_i_4 
       (.I0(cur_state[2]),
        .I1(\FSM_sequential_status_register_reg[1] ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I3(\FSM_sequential_status_register[2]_i_4_n_0 ),
        .O(\cur_state[2]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cur_state_reg[0] 
       (.C(clk),
        .CE(a_topology_n_5),
        .D(a_topology_n_3),
        .Q(cur_state[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cur_state_reg[1] 
       (.C(clk),
        .CE(a_topology_n_5),
        .D(a_topology_n_2),
        .Q(cur_state[1]),
        .R(SR));
  MUXF7 \cur_state_reg[1]_i_7 
       (.I0(a_topology_n_21),
        .I1(a_topology_n_22),
        .O(\cur_state_reg[1]_i_7_n_0 ),
        .S(\cur_cc_pointer_reg_n_0_[2] ));
  MUXF7 \cur_state_reg[1]_i_9 
       (.I0(a_topology_n_19),
        .I1(a_topology_n_20),
        .O(\cur_state_reg[1]_i_9_n_0 ),
        .S(\cur_cc_pointer_reg_n_0_[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \cur_state_reg[2] 
       (.C(clk),
        .CE(a_topology_n_5),
        .D(a_topology_n_1),
        .Q(cur_state[2]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0002FFFF00020000)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_72 
       (.I0(tmp_cur_cc_increment[3]),
        .I1(p_1_in),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_81_n_0 ),
        .I3(a_topology_n_4),
        .I4(cur_state[2]),
        .I5(start_cc_pointer_register_IBUF[3]),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_72_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_81 
       (.I0(\addr1_inferred__0/i__carry__0_n_5 ),
        .I1(a_topology_n_18),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_81_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_1
       (.I0(end_cc_pointer_register_IBUF[31]),
        .I1(\cur_cc_pointer_reg_n_0_[31] ),
        .I2(end_cc_pointer_register_IBUF[30]),
        .I3(\cur_cc_pointer_reg_n_0_[30] ),
        .O(i__carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2
       (.I0(\cur_cc_pointer_reg_n_0_[28] ),
        .I1(end_cc_pointer_register_IBUF[28]),
        .I2(\cur_cc_pointer_reg_n_0_[27] ),
        .I3(end_cc_pointer_register_IBUF[27]),
        .I4(end_cc_pointer_register_IBUF[29]),
        .I5(\cur_cc_pointer_reg_n_0_[29] ),
        .O(i__carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_3
       (.I0(\cur_cc_pointer_reg_n_0_[24] ),
        .I1(end_cc_pointer_register_IBUF[24]),
        .I2(\cur_cc_pointer_reg_n_0_[25] ),
        .I3(end_cc_pointer_register_IBUF[25]),
        .I4(end_cc_pointer_register_IBUF[26]),
        .I5(\cur_cc_pointer_reg_n_0_[26] ),
        .O(i__carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1
       (.I0(\cur_cc_pointer_reg_n_0_[21] ),
        .I1(end_cc_pointer_register_IBUF[21]),
        .I2(\cur_cc_pointer_reg_n_0_[22] ),
        .I3(end_cc_pointer_register_IBUF[22]),
        .I4(end_cc_pointer_register_IBUF[23]),
        .I5(\cur_cc_pointer_reg_n_0_[23] ),
        .O(i__carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2
       (.I0(\cur_cc_pointer_reg_n_0_[19] ),
        .I1(end_cc_pointer_register_IBUF[19]),
        .I2(\cur_cc_pointer_reg_n_0_[18] ),
        .I3(end_cc_pointer_register_IBUF[18]),
        .I4(end_cc_pointer_register_IBUF[20]),
        .I5(\cur_cc_pointer_reg_n_0_[20] ),
        .O(i__carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3
       (.I0(\cur_cc_pointer_reg_n_0_[15] ),
        .I1(end_cc_pointer_register_IBUF[15]),
        .I2(\cur_cc_pointer_reg_n_0_[16] ),
        .I3(end_cc_pointer_register_IBUF[16]),
        .I4(end_cc_pointer_register_IBUF[17]),
        .I5(\cur_cc_pointer_reg_n_0_[17] ),
        .O(i__carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4
       (.I0(\cur_cc_pointer_reg_n_0_[14] ),
        .I1(end_cc_pointer_register_IBUF[14]),
        .I2(\cur_cc_pointer_reg_n_0_[12] ),
        .I3(end_cc_pointer_register_IBUF[12]),
        .I4(end_cc_pointer_register_IBUF[13]),
        .I5(\cur_cc_pointer_reg_n_0_[13] ),
        .O(i__carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_5
       (.I0(\cur_cc_pointer_reg_n_0_[11] ),
        .I1(end_cc_pointer_register_IBUF[11]),
        .I2(\cur_cc_pointer_reg_n_0_[9] ),
        .I3(end_cc_pointer_register_IBUF[9]),
        .I4(end_cc_pointer_register_IBUF[10]),
        .I5(\cur_cc_pointer_reg_n_0_[10] ),
        .O(i__carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_6
       (.I0(\cur_cc_pointer_reg_n_0_[6] ),
        .I1(end_cc_pointer_register_IBUF[6]),
        .I2(\cur_cc_pointer_reg_n_0_[7] ),
        .I3(end_cc_pointer_register_IBUF[7]),
        .I4(end_cc_pointer_register_IBUF[8]),
        .I5(\cur_cc_pointer_reg_n_0_[8] ),
        .O(i__carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_7
       (.I0(p_1_in),
        .I1(end_cc_pointer_register_IBUF[3]),
        .I2(\cur_cc_pointer_reg_n_0_[4] ),
        .I3(end_cc_pointer_register_IBUF[4]),
        .I4(end_cc_pointer_register_IBUF[5]),
        .I5(\cur_cc_pointer_reg_n_0_[5] ),
        .O(i__carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_8
       (.I0(\cur_cc_pointer_reg_n_0_[0] ),
        .I1(end_cc_pointer_register_IBUF[0]),
        .I2(\cur_cc_pointer_reg_n_0_[1] ),
        .I3(end_cc_pointer_register_IBUF[1]),
        .I4(end_cc_pointer_register_IBUF[2]),
        .I5(\cur_cc_pointer_reg_n_0_[2] ),
        .O(i__carry_i_8_n_0));
endmodule

module regex_cpu_pipelined
   (SR,
    FETCH_REC_Instr_valid,
    \cur_state_reg[0] ,
    \EXE1_Instr_reg[10]_0 ,
    FETCH_REC_Instr_valid_reg_0,
    \cur_state_reg[1] ,
    \cur_cc_pointer_reg[3] ,
    ADDRARDADDR,
    \cur_state_reg[2] ,
    EXE1_Instr_valid_reg_0,
    cur_is_even_character_reg,
    EXE2_Instr_valid_reg_0,
    \old_grant_reg[0] ,
    cur_is_even_character_reg_0,
    \state_cur_reg[0] ,
    cur_is_even_character_reg_1,
    DINADIN,
    cur_is_even_character_reg_2,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    cur_is_even_character_reg_3,
    \cur_cc_pointer_reg[3]_0 ,
    EXE1_Instr_valid_reg_1,
    cur_is_even_character_reg_4,
    \state_cur_reg[0]_0 ,
    clk,
    E,
    \old_grant_reg[0]_0 ,
    \cur_state_reg[0]_0 ,
    Q,
    \cur_state_reg[0]_1 ,
    \cur_state_reg[0]_2 ,
    cur_is_even_character_reg_5,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    \FSM_sequential_status_register_reg[0] ,
    O,
    \cur_cc_pointer_reg[0] ,
    \cur_cc_pointer_reg[0]_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    D,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    CO,
    content_reg_bram_0,
    \cur_state_reg[0]_3 ,
    \cur_state[1]_i_3_0 ,
    \FETCH_REC_Instr[15]_i_6_0 ,
    \old_grant_reg[0]_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ,
    content_reg_bram_0_0,
    cur_is_even_character,
    \state_cur_reg[0]_1 ,
    content_reg_bram_0_1,
    \old_grant_reg[0]_i_10 ,
    \old_grant_reg[0]_2 ,
    \FETCH_REC_Instr[15]_i_6_1 ,
    \old_grant[0]_i_3 ,
    \old_grant[0]_i_3_0 ,
    \old_grant[0]_i_3_1 ,
    \old_grant[0]_i_3_2 ,
    \EXE1_Instr_reg[0]_0 ,
    \EXE1_Instr_reg[1]_0 ,
    \EXE1_Instr_reg[2]_0 ,
    \EXE1_Instr_reg[3]_0 ,
    \EXE1_Instr_reg[4]_0 ,
    \EXE1_Instr_reg[5]_0 ,
    \EXE1_Instr_reg[6]_0 ,
    \EXE1_Instr_reg[7]_0 ,
    \EXE1_Instr_reg[8]_0 ,
    \EXE1_Instr_reg[9]_0 ,
    \EXE1_Instr_reg[10]_1 ,
    \EXE1_Instr_reg[11]_0 ,
    \EXE1_Instr_reg[12]_0 ,
    \EXE1_Instr_reg[13]_0 ,
    \EXE1_Instr_reg[14]_0 ,
    \EXE1_Instr_reg[15]_0 ,
    cur_is_even_character_reg_6,
    \state_cur_reg[0]_2 ,
    FETCH_REC_Instr_valid_reg_1,
    cur_is_even_character_reg_7,
    cur_is_even_character_reg_8);
  output [0:0]SR;
  output FETCH_REC_Instr_valid;
  output [1:0]\cur_state_reg[0] ;
  output \EXE1_Instr_reg[10]_0 ;
  output FETCH_REC_Instr_valid_reg_0;
  output [0:0]\cur_state_reg[1] ;
  output [0:0]\cur_cc_pointer_reg[3] ;
  output [8:0]ADDRARDADDR;
  output [0:0]\cur_state_reg[2] ;
  output EXE1_Instr_valid_reg_0;
  output [0:0]cur_is_even_character_reg;
  output EXE2_Instr_valid_reg_0;
  output \old_grant_reg[0] ;
  output cur_is_even_character_reg_0;
  output \state_cur_reg[0] ;
  output [0:0]cur_is_even_character_reg_1;
  output [7:0]DINADIN;
  output [7:0]cur_is_even_character_reg_2;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output cur_is_even_character_reg_3;
  output \cur_cc_pointer_reg[3]_0 ;
  output EXE1_Instr_valid_reg_1;
  output cur_is_even_character_reg_4;
  output \state_cur_reg[0]_0 ;
  input clk;
  input [0:0]E;
  input \old_grant_reg[0]_0 ;
  input \cur_state_reg[0]_0 ;
  input [2:0]Q;
  input \cur_state_reg[0]_1 ;
  input \cur_state_reg[0]_2 ;
  input cur_is_even_character_reg_5;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input \FSM_sequential_status_register_reg[0] ;
  input [0:0]O;
  input [3:0]\cur_cc_pointer_reg[0] ;
  input \cur_cc_pointer_reg[0]_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input [7:0]D;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input [7:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input [2:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input \FSM_sequential_status_register_reg[0]_0 ;
  input \FSM_sequential_status_register_reg[0]_1 ;
  input [0:0]CO;
  input content_reg_bram_0;
  input \cur_state_reg[0]_3 ;
  input \cur_state[1]_i_3_0 ;
  input \FETCH_REC_Instr[15]_i_6_0 ;
  input \old_grant_reg[0]_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  input content_reg_bram_0_0;
  input cur_is_even_character;
  input [0:0]\state_cur_reg[0]_1 ;
  input content_reg_bram_0_1;
  input [31:0]\old_grant_reg[0]_i_10 ;
  input \old_grant_reg[0]_2 ;
  input \FETCH_REC_Instr[15]_i_6_1 ;
  input \old_grant[0]_i_3 ;
  input \old_grant[0]_i_3_0 ;
  input \old_grant[0]_i_3_1 ;
  input \old_grant[0]_i_3_2 ;
  input \EXE1_Instr_reg[0]_0 ;
  input \EXE1_Instr_reg[1]_0 ;
  input \EXE1_Instr_reg[2]_0 ;
  input \EXE1_Instr_reg[3]_0 ;
  input \EXE1_Instr_reg[4]_0 ;
  input \EXE1_Instr_reg[5]_0 ;
  input \EXE1_Instr_reg[6]_0 ;
  input \EXE1_Instr_reg[7]_0 ;
  input \EXE1_Instr_reg[8]_0 ;
  input \EXE1_Instr_reg[9]_0 ;
  input \EXE1_Instr_reg[10]_1 ;
  input \EXE1_Instr_reg[11]_0 ;
  input \EXE1_Instr_reg[12]_0 ;
  input \EXE1_Instr_reg[13]_0 ;
  input \EXE1_Instr_reg[14]_0 ;
  input \EXE1_Instr_reg[15]_0 ;
  input cur_is_even_character_reg_6;
  input [0:0]\state_cur_reg[0]_2 ;
  input FETCH_REC_Instr_valid_reg_1;
  input cur_is_even_character_reg_7;
  input cur_is_even_character_reg_8;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [7:0]D;
  wire [7:0]DINADIN;
  wire [0:0]E;
  wire \EXE1_Instr_reg[0]_0 ;
  wire \EXE1_Instr_reg[10]_0 ;
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
  wire \EXE1_Instr_reg[9]_0 ;
  wire \EXE1_Instr_reg_n_0_[0] ;
  wire \EXE1_Instr_reg_n_0_[12] ;
  wire \EXE1_Instr_reg_n_0_[13] ;
  wire \EXE1_Instr_reg_n_0_[14] ;
  wire \EXE1_Instr_reg_n_0_[15] ;
  wire \EXE1_Instr_reg_n_0_[1] ;
  wire \EXE1_Instr_reg_n_0_[2] ;
  wire \EXE1_Instr_reg_n_0_[3] ;
  wire \EXE1_Instr_reg_n_0_[4] ;
  wire \EXE1_Instr_reg_n_0_[5] ;
  wire \EXE1_Instr_reg_n_0_[6] ;
  wire \EXE1_Instr_reg_n_0_[7] ;
  wire EXE1_Instr_valid;
  wire EXE1_Instr_valid_reg_0;
  wire EXE1_Instr_valid_reg_1;
  wire [7:0]EXE1_Pc;
  wire \EXE2_Instr[15]_i_2_n_0 ;
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
  wire EXE2_Instr_valid_reg_0;
  wire [7:0]EXE2_Pc;
  wire [15:0]FETCH_REC_Instr;
  wire \FETCH_REC_Instr[15]_i_5_n_0 ;
  wire \FETCH_REC_Instr[15]_i_6_0 ;
  wire \FETCH_REC_Instr[15]_i_6_1 ;
  wire \FETCH_REC_Instr[15]_i_6_n_0 ;
  wire \FETCH_REC_Instr[15]_i_7_n_0 ;
  wire \FETCH_REC_Instr[15]_i_8_n_0 ;
  wire [15:0]FETCH_REC_Instr_next;
  wire FETCH_REC_Instr_valid;
  wire FETCH_REC_Instr_valid_reg_0;
  wire FETCH_REC_Instr_valid_reg_1;
  wire [7:0]FETCH_REC_Pc;
  wire FETCH_REC_has_to_save;
  wire FETCH_REC_not_stall;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[0]_1 ;
  wire [0:0]O;
  wire [2:0]Q;
  wire [0:0]SR;
  wire [2:0]address_register_IBUF;
  wire arbiter_output_pc_port_n_1;
  wire arbiter_output_pc_port_n_26;
  wire arbiter_output_pc_port_n_27;
  wire arbiter_output_pc_port_n_28;
  wire arbiter_output_pc_port_n_33;
  wire arbiter_output_pc_port_n_38;
  wire clk;
  wire content_reg_bram_0;
  wire content_reg_bram_0_0;
  wire content_reg_bram_0_1;
  wire content_reg_bram_0_i_26_n_0;
  wire content_reg_bram_0_i_28_n_0;
  wire content_reg_bram_0_i_29_n_0;
  wire content_reg_bram_0_i_30_n_0;
  wire content_reg_bram_0_i_31_n_0;
  wire content_reg_bram_0_i_32_n_0;
  wire content_reg_bram_0_i_33_n_0;
  wire content_reg_bram_0_i_34_n_0;
  wire content_reg_bram_0_i_35_n_0;
  wire content_reg_bram_0_i_36_n_0;
  wire content_reg_bram_0_i_37_n_0;
  wire content_reg_bram_0_i_40_n_0;
  wire content_reg_bram_0_i_41_n_0;
  wire content_reg_bram_0_i_43_n_0;
  wire content_reg_bram_0_i_48_n_0;
  wire content_reg_bram_0_i_49_n_0;
  wire content_reg_bram_0_i_50_n_0;
  wire content_reg_bram_0_i_51_n_0;
  wire content_reg_bram_0_i_52_n_0;
  wire content_reg_bram_0_i_53_n_0;
  wire content_reg_bram_0_i_54_n_0;
  wire content_reg_bram_0_i_55_n_0;
  wire content_reg_bram_0_i_56_n_0;
  wire \cur_cc_pointer[31]_i_3_n_0 ;
  wire [3:0]\cur_cc_pointer_reg[0] ;
  wire \cur_cc_pointer_reg[0]_0 ;
  wire [0:0]\cur_cc_pointer_reg[3] ;
  wire \cur_cc_pointer_reg[3]_0 ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire [0:0]cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire [0:0]cur_is_even_character_reg_1;
  wire [7:0]cur_is_even_character_reg_2;
  wire cur_is_even_character_reg_3;
  wire cur_is_even_character_reg_4;
  wire cur_is_even_character_reg_5;
  wire cur_is_even_character_reg_6;
  wire cur_is_even_character_reg_7;
  wire cur_is_even_character_reg_8;
  wire \cur_state[1]_i_3_0 ;
  wire \cur_state[1]_i_5_n_0 ;
  wire \cur_state[1]_i_8_n_0 ;
  wire \cur_state[2]_i_5_n_0 ;
  wire \cur_state[2]_i_6_n_0 ;
  wire \cur_state[2]_i_7_n_0 ;
  wire [1:0]\cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire \cur_state_reg[0]_3 ;
  wire [0:0]\cur_state_reg[1] ;
  wire [0:0]\cur_state_reg[2] ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire [7:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ;
  wire \old_grant[0]_i_3 ;
  wire \old_grant[0]_i_3_0 ;
  wire \old_grant[0]_i_3_1 ;
  wire \old_grant[0]_i_3_2 ;
  wire \old_grant[0]_i_5_n_0 ;
  wire \old_grant_reg[0] ;
  wire \old_grant_reg[0]_0 ;
  wire \old_grant_reg[0]_1 ;
  wire \old_grant_reg[0]_2 ;
  wire [31:0]\old_grant_reg[0]_i_10 ;
  wire [2:0]p_0_in;
  wire p_0_in0;
  wire p_12_in;
  wire [7:0]sel0;
  wire \state_cur_reg[0] ;
  wire \state_cur_reg[0]_0 ;
  wire [0:0]\state_cur_reg[0]_1 ;
  wire [0:0]\state_cur_reg[0]_2 ;

  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[0] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[0]),
        .Q(\EXE1_Instr_reg_n_0_[0] ),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \EXE1_Instr_reg[10] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[10]),
        .Q(p_0_in[2]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[11] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[11]),
        .Q(p_0_in0),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[12] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[12]),
        .Q(\EXE1_Instr_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[13] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[13]),
        .Q(\EXE1_Instr_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[14] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[14]),
        .Q(\EXE1_Instr_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[15] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[15]),
        .Q(\EXE1_Instr_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[1] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[1]),
        .Q(\EXE1_Instr_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[2] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[2]),
        .Q(\EXE1_Instr_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[3] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[3]),
        .Q(\EXE1_Instr_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[4] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[4]),
        .Q(\EXE1_Instr_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[5] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[5]),
        .Q(\EXE1_Instr_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[6] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[6]),
        .Q(\EXE1_Instr_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[7] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[7]),
        .Q(\EXE1_Instr_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[8] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[8]),
        .Q(p_0_in[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Instr_reg[9] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Instr_next[9]),
        .Q(p_0_in[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    EXE1_Instr_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_1),
        .Q(EXE1_Instr_valid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[0] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[0]),
        .Q(EXE1_Pc[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[1] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[1]),
        .Q(EXE1_Pc[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[2] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[2]),
        .Q(EXE1_Pc[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[3] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[3]),
        .Q(EXE1_Pc[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[4] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[4]),
        .Q(EXE1_Pc[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[5] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[5]),
        .Q(EXE1_Pc[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[6] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[6]),
        .Q(EXE1_Pc[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE1_Pc_reg[7] 
       (.C(clk),
        .CE(FETCH_REC_not_stall),
        .D(FETCH_REC_Pc[7]),
        .Q(EXE1_Pc[7]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \EXE2_Instr[15]_i_2 
       (.I0(EXE1_Instr_valid),
        .I1(p_0_in0),
        .I2(\EXE1_Instr_reg_n_0_[15] ),
        .I3(\EXE1_Instr_reg_n_0_[12] ),
        .I4(\EXE1_Instr_reg_n_0_[13] ),
        .I5(\EXE1_Instr_reg_n_0_[14] ),
        .O(\EXE2_Instr[15]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[0] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[0] ),
        .Q(\EXE2_Instr_reg_n_0_[0] ),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \EXE2_Instr_reg[10] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in[2]),
        .Q(sel0[2]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[11] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in0),
        .Q(sel0[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[12] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[12] ),
        .Q(sel0[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[13] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[13] ),
        .Q(sel0[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[14] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[14] ),
        .Q(sel0[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[15] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[15] ),
        .Q(sel0[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[1] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[1] ),
        .Q(\EXE2_Instr_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[2] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[2] ),
        .Q(\EXE2_Instr_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[3] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[3] ),
        .Q(\EXE2_Instr_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[4] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[4] ),
        .Q(\EXE2_Instr_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[5] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[5] ),
        .Q(\EXE2_Instr_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[6] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[6] ),
        .Q(\EXE2_Instr_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[7] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(\EXE1_Instr_reg_n_0_[7] ),
        .Q(\EXE2_Instr_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[8] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in[0]),
        .Q(sel0[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Instr_reg[9] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(p_0_in[1]),
        .Q(sel0[1]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    EXE2_Instr_valid_i_2
       (.I0(sel0[6]),
        .I1(sel0[2]),
        .I2(sel0[3]),
        .I3(sel0[5]),
        .I4(sel0[4]),
        .I5(sel0[7]),
        .O(EXE2_Instr_valid_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    EXE2_Instr_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_33),
        .Q(EXE2_Instr_valid),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[0] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[0]),
        .Q(EXE2_Pc[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[1] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[1]),
        .Q(EXE2_Pc[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[2] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[2]),
        .Q(EXE2_Pc[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[3] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[3]),
        .Q(EXE2_Pc[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[4] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[4]),
        .Q(EXE2_Pc[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[5] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[5]),
        .Q(EXE2_Pc[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[6] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[6]),
        .Q(EXE2_Pc[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \EXE2_Pc_reg[7] 
       (.C(clk),
        .CE(EXE2_Instr_valid9_out),
        .D(EXE1_Pc[7]),
        .Q(EXE2_Pc[7]),
        .R(SR));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[0]_i_1 
       (.I0(FETCH_REC_Instr[0]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[0]_0 ),
        .O(FETCH_REC_Instr_next[0]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[10]_i_1 
       (.I0(FETCH_REC_Instr[10]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[10]_1 ),
        .O(FETCH_REC_Instr_next[10]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[11]_i_1 
       (.I0(FETCH_REC_Instr[11]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[11]_0 ),
        .O(FETCH_REC_Instr_next[11]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[12]_i_1 
       (.I0(FETCH_REC_Instr[12]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[12]_0 ),
        .O(FETCH_REC_Instr_next[12]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[13]_i_1 
       (.I0(FETCH_REC_Instr[13]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[13]_0 ),
        .O(FETCH_REC_Instr_next[13]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[14]_i_1 
       (.I0(FETCH_REC_Instr[14]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[14]_0 ),
        .O(FETCH_REC_Instr_next[14]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[15]_i_2 
       (.I0(FETCH_REC_Instr[15]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[15]_0 ),
        .O(FETCH_REC_Instr_next[15]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \FETCH_REC_Instr[15]_i_5 
       (.I0(\EXE2_Instr[15]_i_2_n_0 ),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .O(\FETCH_REC_Instr[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF0002)) 
    \FETCH_REC_Instr[15]_i_6 
       (.I0(p_0_in[1]),
        .I1(arbiter_output_pc_port_n_26),
        .I2(content_reg_bram_0_i_54_n_0),
        .I3(content_reg_bram_0_i_55_n_0),
        .I4(p_0_in[0]),
        .I5(\FETCH_REC_Instr[15]_i_7_n_0 ),
        .O(\FETCH_REC_Instr[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FETCH_REC_Instr[15]_i_7 
       (.I0(\FETCH_REC_Instr[15]_i_8_n_0 ),
        .I1(p_0_in0),
        .I2(\EXE1_Instr_reg_n_0_[15] ),
        .I3(\EXE1_Instr_reg_n_0_[12] ),
        .I4(\EXE1_Instr_reg_n_0_[13] ),
        .I5(\EXE1_Instr_reg_n_0_[14] ),
        .O(\FETCH_REC_Instr[15]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FETCH_REC_Instr[15]_i_8 
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .O(\FETCH_REC_Instr[15]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[1]_i_1 
       (.I0(FETCH_REC_Instr[1]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[1]_0 ),
        .O(FETCH_REC_Instr_next[1]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[2]_i_1 
       (.I0(FETCH_REC_Instr[2]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[2]_0 ),
        .O(FETCH_REC_Instr_next[2]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[3]_i_1 
       (.I0(FETCH_REC_Instr[3]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[3]_0 ),
        .O(FETCH_REC_Instr_next[3]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[4]_i_1 
       (.I0(FETCH_REC_Instr[4]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[4]_0 ),
        .O(FETCH_REC_Instr_next[4]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[5]_i_1 
       (.I0(FETCH_REC_Instr[5]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[5]_0 ),
        .O(FETCH_REC_Instr_next[5]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[6]_i_1 
       (.I0(FETCH_REC_Instr[6]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[6]_0 ),
        .O(FETCH_REC_Instr_next[6]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[7]_i_1 
       (.I0(FETCH_REC_Instr[7]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[7]_0 ),
        .O(FETCH_REC_Instr_next[7]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[8]_i_1 
       (.I0(FETCH_REC_Instr[8]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[8]_0 ),
        .O(FETCH_REC_Instr_next[8]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \FETCH_REC_Instr[9]_i_1 
       (.I0(FETCH_REC_Instr[9]),
        .I1(FETCH_REC_Instr_valid),
        .I2(FETCH_REC_has_to_save),
        .I3(\EXE1_Instr_reg[9]_0 ),
        .O(FETCH_REC_Instr_next[9]));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[0] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[0]),
        .Q(FETCH_REC_Instr[0]),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    \FETCH_REC_Instr_reg[10] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[10]),
        .Q(FETCH_REC_Instr[10]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[11] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[11]),
        .Q(FETCH_REC_Instr[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[12] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[12]),
        .Q(FETCH_REC_Instr[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[13] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[13]),
        .Q(FETCH_REC_Instr[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[14] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[14]),
        .Q(FETCH_REC_Instr[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[15] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[15]),
        .Q(FETCH_REC_Instr[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[1] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[1]),
        .Q(FETCH_REC_Instr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[2] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[2]),
        .Q(FETCH_REC_Instr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[3] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[3]),
        .Q(FETCH_REC_Instr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[4] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[4]),
        .Q(FETCH_REC_Instr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[5] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[5]),
        .Q(FETCH_REC_Instr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[6] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[6]),
        .Q(FETCH_REC_Instr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[7] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[7]),
        .Q(FETCH_REC_Instr[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[8] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[8]),
        .Q(FETCH_REC_Instr[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Instr_reg[9] 
       (.C(clk),
        .CE(p_12_in),
        .D(FETCH_REC_Instr_next[9]),
        .Q(FETCH_REC_Instr[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    FETCH_REC_Instr_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(arbiter_output_pc_port_n_38),
        .Q(FETCH_REC_Instr_valid),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(FETCH_REC_Pc[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(FETCH_REC_Pc[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(FETCH_REC_Pc[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(FETCH_REC_Pc[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(FETCH_REC_Pc[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(FETCH_REC_Pc[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(FETCH_REC_Pc[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \FETCH_REC_Pc_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(FETCH_REC_Pc[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    FETCH_REC_has_to_save_reg
       (.C(clk),
        .CE(1'b1),
        .D(E),
        .Q(FETCH_REC_has_to_save),
        .R(SR));
  LUT6 #(
    .INIT(64'hF0FFF8F8F0F0F8F8)) 
    \FSM_sequential_status_register[2]_i_1 
       (.I0(\cur_cc_pointer_reg[0]_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I2(\FSM_sequential_status_register_reg[0]_0 ),
        .I3(\FSM_sequential_status_register_reg[0] ),
        .I4(Q[2]),
        .I5(\FSM_sequential_status_register_reg[0]_1 ),
        .O(\cur_state_reg[2] ));
  arbiter_2_rr arbiter_output_pc_port
       (.DINADIN(DINADIN),
        .E(FETCH_REC_not_stall),
        .\EXE1_Instr_reg[7] (arbiter_output_pc_port_n_26),
        .\EXE1_Instr_reg[9] (EXE2_Instr_valid9_out),
        .EXE1_Instr_valid(EXE1_Instr_valid),
        .EXE1_Instr_valid_reg(EXE1_Instr_valid_reg_0),
        .EXE1_Instr_valid_reg_0(EXE1_Instr_valid_reg_1),
        .\EXE2_Instr_reg[15] (\EXE2_Instr[15]_i_2_n_0 ),
        .\EXE2_Instr_reg[9] (arbiter_output_pc_port_n_33),
        .EXE2_Instr_valid(EXE2_Instr_valid),
        .EXE2_Instr_valid_reg({sel0[1:0],\EXE2_Instr_reg_n_0_[6] ,\EXE2_Instr_reg_n_0_[5] ,\EXE2_Instr_reg_n_0_[4] ,\EXE2_Instr_reg_n_0_[2] ,\EXE2_Instr_reg_n_0_[1] }),
        .EXE2_Instr_valid_reg_0(EXE2_Instr_valid_i_2_n_0),
        .FETCH_REC_Instr_valid_reg(arbiter_output_pc_port_n_1),
        .FETCH_REC_Instr_valid_reg_0(p_12_in),
        .FETCH_REC_Instr_valid_reg_1(arbiter_output_pc_port_n_38),
        .FETCH_REC_Instr_valid_reg_2(FETCH_REC_Instr_valid),
        .FETCH_REC_Instr_valid_reg_3(content_reg_bram_0_i_40_n_0),
        .FETCH_REC_Instr_valid_reg_4(\FETCH_REC_Instr[15]_i_5_n_0 ),
        .FETCH_REC_Instr_valid_reg_5(\FETCH_REC_Instr[15]_i_6_n_0 ),
        .FETCH_REC_Instr_valid_reg_6(FETCH_REC_Instr_valid_reg_1),
        .Q({p_0_in,\EXE1_Instr_reg_n_0_[7] ,\EXE1_Instr_reg_n_0_[6] ,\EXE1_Instr_reg_n_0_[5] ,\EXE1_Instr_reg_n_0_[4] ,\EXE1_Instr_reg_n_0_[3] ,\EXE1_Instr_reg_n_0_[2] ,\EXE1_Instr_reg_n_0_[1] ,\EXE1_Instr_reg_n_0_[0] }),
        .SS(SR),
        .clk(clk),
        .content_reg_bram_0(content_reg_bram_0_0),
        .content_reg_bram_0_0(content_reg_bram_0_i_36_n_0),
        .content_reg_bram_0_1(content_reg_bram_0_i_37_n_0),
        .content_reg_bram_0_10(content_reg_bram_0_i_28_n_0),
        .content_reg_bram_0_11(content_reg_bram_0_1),
        .content_reg_bram_0_12(content_reg_bram_0),
        .content_reg_bram_0_13(content_reg_bram_0_i_41_n_0),
        .content_reg_bram_0_14(content_reg_bram_0_i_43_n_0),
        .content_reg_bram_0_2(content_reg_bram_0_i_35_n_0),
        .content_reg_bram_0_3(content_reg_bram_0_i_34_n_0),
        .content_reg_bram_0_4(content_reg_bram_0_i_32_n_0),
        .content_reg_bram_0_5(content_reg_bram_0_i_33_n_0),
        .content_reg_bram_0_6(content_reg_bram_0_i_31_n_0),
        .content_reg_bram_0_7(content_reg_bram_0_i_30_n_0),
        .content_reg_bram_0_8(content_reg_bram_0_i_29_n_0),
        .content_reg_bram_0_9(content_reg_bram_0_i_26_n_0),
        .\cur_cc_pointer_reg[2] (arbiter_output_pc_port_n_27),
        .\cur_cc_pointer_reg[2]_0 (arbiter_output_pc_port_n_28),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .cur_is_even_character_reg_2(cur_is_even_character_reg_2),
        .cur_is_even_character_reg_3(cur_is_even_character_reg_4),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_13 ),
        .\old_grant[0]_i_3 (\cur_cc_pointer_reg[0] [2:0]),
        .\old_grant[0]_i_3_0 (\old_grant[0]_i_3 ),
        .\old_grant[0]_i_3_1 (\old_grant[0]_i_3_0 ),
        .\old_grant[0]_i_3_2 (\old_grant[0]_i_3_1 ),
        .\old_grant[0]_i_3_3 (\old_grant[0]_i_3_2 ),
        .\old_grant_reg[0] (\old_grant_reg[0] ),
        .\old_grant_reg[0]_0 (\old_grant_reg[0]_0 ),
        .\old_grant_reg[0]_1 (\old_grant[0]_i_5_n_0 ),
        .\old_grant_reg[0]_2 (\old_grant_reg[0]_1 ),
        .\old_grant_reg[0]_3 (\old_grant_reg[0]_2 ),
        .\old_grant_reg[0]_i_10 (\old_grant_reg[0]_i_10 ),
        .\state_cur_reg[0] (\state_cur_reg[0] ),
        .\state_cur_reg[0]_0 (\state_cur_reg[0]_0 ),
        .\state_cur_reg[0]_1 (\state_cur_reg[0]_1 ),
        .\state_cur_reg[0]_2 (\state_cur_reg[0]_2 ),
        .\tail_reg[4] (EXE2_Instr_valid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    content_reg_bram_0_i_16
       (.I0(content_reg_bram_0),
        .I1(content_reg_bram_0_i_40_n_0),
        .I2(content_reg_bram_0_i_41_n_0),
        .O(EXE2_Instr_valid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h57)) 
    content_reg_bram_0_i_26
       (.I0(\EXE2_Instr_reg_n_0_[7] ),
        .I1(content_reg_bram_0_i_48_n_0),
        .I2(content_reg_bram_0_i_40_n_0),
        .O(content_reg_bram_0_i_26_n_0));
  LUT5 #(
    .INIT(32'hFF006A6A)) 
    content_reg_bram_0_i_28
       (.I0(EXE1_Pc[7]),
        .I1(EXE1_Pc[6]),
        .I2(content_reg_bram_0_i_49_n_0),
        .I3(\EXE1_Instr_reg_n_0_[7] ),
        .I4(content_reg_bram_0_i_50_n_0),
        .O(content_reg_bram_0_i_28_n_0));
  LUT4 #(
    .INIT(16'h8BB8)) 
    content_reg_bram_0_i_29
       (.I0(\EXE1_Instr_reg_n_0_[6] ),
        .I1(content_reg_bram_0_i_50_n_0),
        .I2(EXE1_Pc[6]),
        .I3(content_reg_bram_0_i_49_n_0),
        .O(content_reg_bram_0_i_29_n_0));
  LUT4 #(
    .INIT(16'h8BB8)) 
    content_reg_bram_0_i_30
       (.I0(\EXE1_Instr_reg_n_0_[5] ),
        .I1(content_reg_bram_0_i_50_n_0),
        .I2(EXE1_Pc[5]),
        .I3(content_reg_bram_0_i_51_n_0),
        .O(content_reg_bram_0_i_30_n_0));
  LUT4 #(
    .INIT(16'h8BB8)) 
    content_reg_bram_0_i_31
       (.I0(\EXE1_Instr_reg_n_0_[4] ),
        .I1(content_reg_bram_0_i_50_n_0),
        .I2(EXE1_Pc[4]),
        .I3(content_reg_bram_0_i_52_n_0),
        .O(content_reg_bram_0_i_31_n_0));
  LUT6 #(
    .INIT(64'h7447474747474747)) 
    content_reg_bram_0_i_32
       (.I0(\EXE2_Instr_reg_n_0_[3] ),
        .I1(content_reg_bram_0_i_40_n_0),
        .I2(EXE2_Pc[3]),
        .I3(EXE2_Pc[0]),
        .I4(EXE2_Pc[1]),
        .I5(EXE2_Pc[2]),
        .O(content_reg_bram_0_i_32_n_0));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    content_reg_bram_0_i_33
       (.I0(\EXE1_Instr_reg_n_0_[3] ),
        .I1(content_reg_bram_0_i_50_n_0),
        .I2(EXE1_Pc[3]),
        .I3(EXE1_Pc[0]),
        .I4(EXE1_Pc[1]),
        .I5(EXE1_Pc[2]),
        .O(content_reg_bram_0_i_33_n_0));
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    content_reg_bram_0_i_34
       (.I0(\EXE1_Instr_reg_n_0_[2] ),
        .I1(content_reg_bram_0_i_50_n_0),
        .I2(EXE1_Pc[2]),
        .I3(EXE1_Pc[1]),
        .I4(EXE1_Pc[0]),
        .O(content_reg_bram_0_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    content_reg_bram_0_i_35
       (.I0(\EXE1_Instr_reg_n_0_[1] ),
        .I1(content_reg_bram_0_i_50_n_0),
        .I2(EXE1_Pc[0]),
        .I3(EXE1_Pc[1]),
        .O(content_reg_bram_0_i_35_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h5D)) 
    content_reg_bram_0_i_36
       (.I0(\EXE2_Instr_reg_n_0_[0] ),
        .I1(EXE2_Pc[0]),
        .I2(content_reg_bram_0_i_40_n_0),
        .O(content_reg_bram_0_i_36_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    content_reg_bram_0_i_37
       (.I0(\EXE1_Instr_reg_n_0_[0] ),
        .I1(content_reg_bram_0_i_50_n_0),
        .I2(EXE1_Pc[0]),
        .O(content_reg_bram_0_i_37_n_0));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    content_reg_bram_0_i_40
       (.I0(EXE2_Instr_valid),
        .I1(content_reg_bram_0_i_53_n_0),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(sel0[3]),
        .I5(sel0[2]),
        .O(content_reg_bram_0_i_40_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAFFFFFFFB)) 
    content_reg_bram_0_i_41
       (.I0(\old_grant[0]_i_5_n_0 ),
        .I1(p_0_in[1]),
        .I2(arbiter_output_pc_port_n_26),
        .I3(content_reg_bram_0_i_54_n_0),
        .I4(content_reg_bram_0_i_55_n_0),
        .I5(p_0_in[0]),
        .O(content_reg_bram_0_i_41_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hB)) 
    content_reg_bram_0_i_43
       (.I0(p_0_in[2]),
        .I1(p_0_in[0]),
        .O(content_reg_bram_0_i_43_n_0));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    content_reg_bram_0_i_48
       (.I0(EXE2_Pc[7]),
        .I1(EXE2_Pc[6]),
        .I2(EXE2_Pc[5]),
        .I3(EXE2_Pc[4]),
        .I4(content_reg_bram_0_i_56_n_0),
        .I5(EXE2_Pc[3]),
        .O(content_reg_bram_0_i_48_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    content_reg_bram_0_i_49
       (.I0(EXE1_Pc[5]),
        .I1(EXE1_Pc[3]),
        .I2(EXE1_Pc[0]),
        .I3(EXE1_Pc[1]),
        .I4(EXE1_Pc[2]),
        .I5(EXE1_Pc[4]),
        .O(content_reg_bram_0_i_49_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    content_reg_bram_0_i_50
       (.I0(\EXE2_Instr[15]_i_2_n_0 ),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .O(content_reg_bram_0_i_50_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    content_reg_bram_0_i_51
       (.I0(EXE1_Pc[4]),
        .I1(EXE1_Pc[2]),
        .I2(EXE1_Pc[1]),
        .I3(EXE1_Pc[0]),
        .I4(EXE1_Pc[3]),
        .O(content_reg_bram_0_i_51_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    content_reg_bram_0_i_52
       (.I0(EXE1_Pc[3]),
        .I1(EXE1_Pc[0]),
        .I2(EXE1_Pc[1]),
        .I3(EXE1_Pc[2]),
        .O(content_reg_bram_0_i_52_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    content_reg_bram_0_i_53
       (.I0(sel0[6]),
        .I1(sel0[7]),
        .I2(sel0[5]),
        .I3(sel0[4]),
        .O(content_reg_bram_0_i_53_n_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    content_reg_bram_0_i_54
       (.I0(\old_grant_reg[0]_2 ),
        .I1(\EXE1_Instr_reg_n_0_[1] ),
        .I2(\old_grant_reg[0]_1 ),
        .I3(\EXE1_Instr_reg_n_0_[0] ),
        .O(content_reg_bram_0_i_54_n_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    content_reg_bram_0_i_55
       (.I0(\FETCH_REC_Instr[15]_i_6_0 ),
        .I1(\EXE1_Instr_reg_n_0_[3] ),
        .I2(\FETCH_REC_Instr[15]_i_6_1 ),
        .I3(\EXE1_Instr_reg_n_0_[2] ),
        .O(content_reg_bram_0_i_55_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    content_reg_bram_0_i_56
       (.I0(EXE2_Pc[2]),
        .I1(EXE2_Pc[1]),
        .I2(EXE2_Pc[0]),
        .O(content_reg_bram_0_i_56_n_0));
  LUT6 #(
    .INIT(64'h55FF555541414141)) 
    \cur_cc_pointer[31]_i_1 
       (.I0(\cur_cc_pointer[31]_i_3_n_0 ),
        .I1(O),
        .I2(\cur_cc_pointer_reg[0] [3]),
        .I3(Q[2]),
        .I4(\cur_cc_pointer_reg[0]_0 ),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .O(\cur_cc_pointer_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    \cur_cc_pointer[31]_i_3 
       (.I0(\cur_state[2]_i_7_n_0 ),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(\cur_cc_pointer[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFEFEF10001010)) 
    cur_is_even_character_i_1
       (.I0(\cur_state[2]_i_7_n_0 ),
        .I1(FETCH_REC_Instr_valid_reg_0),
        .I2(cur_is_even_character_reg_6),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I4(cur_is_even_character_reg_5),
        .I5(cur_is_even_character),
        .O(cur_is_even_character_reg_3));
  LUT6 #(
    .INIT(64'h0000010330330103)) 
    \cur_state[0]_i_1 
       (.I0(\EXE1_Instr_reg[10]_0 ),
        .I1(\cur_state_reg[0]_0 ),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(FETCH_REC_Instr_valid_reg_0),
        .O(\cur_state_reg[0] [0]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cur_state[0]_i_3 
       (.I0(cur_is_even_character_reg_7),
        .I1(cur_is_even_character_reg_8),
        .I2(FETCH_REC_Instr_valid),
        .I3(EXE1_Instr_valid),
        .I4(EXE2_Instr_valid),
        .O(FETCH_REC_Instr_valid_reg_0));
  LUT6 #(
    .INIT(64'h00000000F2220000)) 
    \cur_state[1]_i_3 
       (.I0(\cur_state_reg[0]_3 ),
        .I1(\cur_state[1]_i_5_n_0 ),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .I4(\EXE2_Instr[15]_i_2_n_0 ),
        .I5(p_0_in[0]),
        .O(\EXE1_Instr_reg[10]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cur_state[1]_i_5 
       (.I0(\cur_state[1]_i_8_n_0 ),
        .I1(\cur_state[1]_i_3_0 ),
        .I2(arbiter_output_pc_port_n_27),
        .I3(\FETCH_REC_Instr[15]_i_6_0 ),
        .I4(arbiter_output_pc_port_n_28),
        .I5(\old_grant_reg[0]_1 ),
        .O(\cur_state[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \cur_state[1]_i_8 
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .O(\cur_state[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h44444F44FFFF4F44)) 
    \cur_state[2]_i_1 
       (.I0(\cur_state_reg[0]_1 ),
        .I1(\cur_state_reg[0]_2 ),
        .I2(\cur_state[2]_i_5_n_0 ),
        .I3(\cur_state[2]_i_6_n_0 ),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\cur_state_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h1E0E)) 
    \cur_state[2]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\cur_state[2]_i_7_n_0 ),
        .O(\cur_state_reg[0] [1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h10FF)) 
    \cur_state[2]_i_5 
       (.I0(content_reg_bram_0),
        .I1(\EXE1_Instr_reg[10]_0 ),
        .I2(FETCH_REC_Instr_valid_reg_0),
        .I3(Q[2]),
        .O(\cur_state[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF55757575)) 
    \cur_state[2]_i_6 
       (.I0(cur_is_even_character_reg_5),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I2(\FSM_sequential_status_register_reg[0] ),
        .I3(Q[2]),
        .I4(FETCH_REC_Instr_valid_reg_0),
        .I5(\cur_state[2]_i_7_n_0 ),
        .O(\cur_state[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \cur_state[2]_i_7 
       (.I0(CO),
        .I1(\EXE1_Instr_reg[10]_0 ),
        .I2(content_reg_bram_0),
        .O(\cur_state[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF8888F888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_10 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 [1]),
        .I2(D[4]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .O(ADDRARDADDR[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF8888F888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_11 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 [0]),
        .I2(D[3]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .O(ADDRARDADDR[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFF8888F888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_12 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .I2(D[2]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .O(ADDRARDADDR[0]));
  LUT5 #(
    .INIT(32'h80FF8080)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_4 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 [7]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .I4(address_register_IBUF[2]),
        .O(ADDRARDADDR[8]));
  LUT5 #(
    .INIT(32'h80FF8080)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_5 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 [6]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .I4(address_register_IBUF[1]),
        .O(ADDRARDADDR[7]));
  LUT6 #(
    .INIT(64'hFFF90000FFFFFFFF)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_58 
       (.I0(O),
        .I1(\cur_cc_pointer_reg[0] [3]),
        .I2(\cur_state[2]_i_7_n_0 ),
        .I3(FETCH_REC_Instr_valid_reg_0),
        .I4(Q[2]),
        .I5(\FSM_sequential_status_register_reg[0] ),
        .O(\cur_cc_pointer_reg[3]_0 ));
  LUT5 #(
    .INIT(32'h80FF8080)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_6 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 [5]),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .I2(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .I4(address_register_IBUF[0]),
        .O(ADDRARDADDR[6]));
  LUT6 #(
    .INIT(64'h0404044404040404)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I1(\FSM_sequential_status_register_reg[0] ),
        .I2(Q[2]),
        .I3(FETCH_REC_Instr_valid_reg_0),
        .I4(\cur_state[2]_i_7_n_0 ),
        .I5(cur_is_even_character_reg_5),
        .O(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF8888F888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_7 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 [4]),
        .I2(D[7]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .O(ADDRARDADDR[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFF8888F888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_8 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 [3]),
        .I2(D[6]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .O(ADDRARDADDR[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFF8888F888)) 
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_9 
       (.I0(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_i_62_n_0 ),
        .I1(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 [2]),
        .I2(D[5]),
        .I3(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .I4(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .I5(\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .O(ADDRARDADDR[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    \old_grant[0]_i_5 
       (.I0(p_0_in[1]),
        .I1(p_0_in[2]),
        .I2(\EXE2_Instr[15]_i_2_n_0 ),
        .O(\old_grant[0]_i_5_n_0 ));
endmodule

module topology_single
   (SR,
    \cur_state_reg[0] ,
    FETCH_REC_Instr_valid_reg,
    E,
    \cur_cc_pointer_reg[3] ,
    ADDRARDADDR,
    \cur_state_reg[2] ,
    bram_r_valid,
    \head_reg[3] ,
    \cur_ccs_reg[29] ,
    \cur_ccs_reg[61] ,
    \cur_ccs_reg[28] ,
    \cur_ccs_reg[60] ,
    \cur_cc_pointer_reg[2] ,
    \cur_cc_pointer_reg[2]_0 ,
    \cmd_register[0] ,
    cur_is_even_character_reg,
    clk,
    D,
    \cur_state_reg[0]_0 ,
    Q,
    \cur_state_reg[0]_1 ,
    cur_is_even_character_reg_0,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ,
    \FSM_sequential_status_register_reg[0] ,
    O,
    \cur_cc_pointer_reg[0] ,
    \cur_cc_pointer_reg[0]_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ,
    address_register_IBUF,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ,
    \FSM_sequential_status_register_reg[0]_0 ,
    \FSM_sequential_status_register_reg[0]_1 ,
    \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ,
    CO,
    \cur_state_reg[0]_2 ,
    \cur_state[1]_i_3 ,
    cur_is_even_character,
    \old_grant_reg[0]_i_10 ,
    rst_IBUF,
    cmd_register_IBUF,
    content_reg,
    cur_is_even_character_reg_1);
  output [0:0]SR;
  output [2:0]\cur_state_reg[0] ;
  output FETCH_REC_Instr_valid_reg;
  output [0:0]E;
  output [0:0]\cur_cc_pointer_reg[3] ;
  output [8:0]ADDRARDADDR;
  output [0:0]\cur_state_reg[2] ;
  output bram_r_valid;
  output \head_reg[3] ;
  output \cur_ccs_reg[29] ;
  output \cur_ccs_reg[61] ;
  output \cur_ccs_reg[28] ;
  output \cur_ccs_reg[60] ;
  output \cur_cc_pointer_reg[2] ;
  output \cur_cc_pointer_reg[2]_0 ;
  output \cmd_register[0] ;
  output cur_is_even_character_reg;
  input clk;
  input [63:0]D;
  input \cur_state_reg[0]_0 ;
  input [2:0]Q;
  input \cur_state_reg[0]_1 ;
  input cur_is_even_character_reg_0;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  input \FSM_sequential_status_register_reg[0] ;
  input [0:0]O;
  input [3:0]\cur_cc_pointer_reg[0] ;
  input \cur_cc_pointer_reg[0]_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  input [7:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  input [2:0]address_register_IBUF;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  input \FSM_sequential_status_register_reg[0]_0 ;
  input \FSM_sequential_status_register_reg[0]_1 ;
  input \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  input [0:0]CO;
  input \cur_state_reg[0]_2 ;
  input \cur_state[1]_i_3 ;
  input cur_is_even_character;
  input [63:0]\old_grant_reg[0]_i_10 ;
  input rst_IBUF;
  input [2:0]cmd_register_IBUF;
  input content_reg;
  input cur_is_even_character_reg_1;

  wire [8:0]ADDRARDADDR;
  wire [0:0]CO;
  wire [63:0]D;
  wire [0:0]E;
  wire FETCH_REC_Instr_valid_reg;
  wire \FSM_sequential_status_register_reg[0] ;
  wire \FSM_sequential_status_register_reg[0]_0 ;
  wire \FSM_sequential_status_register_reg[0]_1 ;
  wire [0:0]O;
  wire [2:0]Q;
  wire [0:0]SR;
  wire [2:0]address_register_IBUF;
  wire bram_r_valid;
  wire clk;
  wire \cmd_register[0] ;
  wire [2:0]cmd_register_IBUF;
  wire content_reg;
  wire [3:0]\cur_cc_pointer_reg[0] ;
  wire \cur_cc_pointer_reg[0]_0 ;
  wire \cur_cc_pointer_reg[2] ;
  wire \cur_cc_pointer_reg[2]_0 ;
  wire [0:0]\cur_cc_pointer_reg[3] ;
  wire \cur_ccs_reg[28] ;
  wire \cur_ccs_reg[29] ;
  wire \cur_ccs_reg[60] ;
  wire \cur_ccs_reg[61] ;
  wire cur_is_even_character;
  wire cur_is_even_character_reg;
  wire cur_is_even_character_reg_0;
  wire cur_is_even_character_reg_1;
  wire \cur_state[1]_i_3 ;
  wire [2:0]\cur_state_reg[0] ;
  wire \cur_state_reg[0]_0 ;
  wire \cur_state_reg[0]_1 ;
  wire \cur_state_reg[0]_2 ;
  wire [0:0]\cur_state_reg[2] ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ;
  wire [7:0]\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ;
  wire \genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ;
  wire \head_reg[3] ;
  wire [63:0]\old_grant_reg[0]_i_10 ;
  wire rst_IBUF;

  engine_interfaced engine_interfaced
       (.ADDRARDADDR(ADDRARDADDR),
        .CO(CO),
        .D(D),
        .E(E),
        .FETCH_REC_Instr_valid_reg(FETCH_REC_Instr_valid_reg),
        .\FSM_sequential_status_register_reg[0] (\FSM_sequential_status_register_reg[0] ),
        .\FSM_sequential_status_register_reg[0]_0 (\FSM_sequential_status_register_reg[0]_0 ),
        .\FSM_sequential_status_register_reg[0]_1 (\FSM_sequential_status_register_reg[0]_1 ),
        .O(O),
        .Q(Q),
        .SR(SR),
        .address_register_IBUF(address_register_IBUF),
        .bram_r_valid(bram_r_valid),
        .clk(clk),
        .\cmd_register[0] (\cmd_register[0] ),
        .cmd_register_IBUF(cmd_register_IBUF),
        .content_reg(content_reg),
        .\cur_cc_pointer_reg[0] (\cur_cc_pointer_reg[0] ),
        .\cur_cc_pointer_reg[0]_0 (\cur_cc_pointer_reg[0]_0 ),
        .\cur_cc_pointer_reg[2] (\cur_cc_pointer_reg[2] ),
        .\cur_cc_pointer_reg[2]_0 (\cur_cc_pointer_reg[2]_0 ),
        .\cur_cc_pointer_reg[3] (\cur_cc_pointer_reg[3] ),
        .\cur_ccs_reg[28] (\cur_ccs_reg[28] ),
        .\cur_ccs_reg[29] (\cur_ccs_reg[29] ),
        .\cur_ccs_reg[60] (\cur_ccs_reg[60] ),
        .\cur_ccs_reg[61] (\cur_ccs_reg[61] ),
        .cur_is_even_character(cur_is_even_character),
        .cur_is_even_character_reg(cur_is_even_character_reg),
        .cur_is_even_character_reg_0(cur_is_even_character_reg_0),
        .cur_is_even_character_reg_1(cur_is_even_character_reg_1),
        .\cur_state[1]_i_3 (\cur_state[1]_i_3 ),
        .\cur_state_reg[0] (\cur_state_reg[0] ),
        .\cur_state_reg[0]_0 (\cur_state_reg[0]_0 ),
        .\cur_state_reg[0]_1 (\cur_state_reg[0]_1 ),
        .\cur_state_reg[0]_2 (\cur_state_reg[0]_2 ),
        .\cur_state_reg[2] (\cur_state_reg[2] ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_0 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_1 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_10 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_11 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_12 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_2 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_3 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_4 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_5 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_6 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_7 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_8 ),
        .\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 (\genblk3_0.bram36_sdp_bl_1.bram36_sdp_bl_1_9 ),
        .\head_reg[3] (\head_reg[3] ),
        .\old_grant_reg[0]_i_10 (\old_grant_reg[0]_i_10 ),
        .rst_IBUF(rst_IBUF));
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
