-makelib xcelium_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../regex_copro.srcs/sources_1/bd/re2_copro/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_6 -sv \
  "../../../../regex_copro.srcs/sources_1/bd/re2_copro/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/zynq_ultra_ps_e_vip_v1_0_6 -sv \
  "../../../../regex_copro.srcs/sources_1/bd/re2_copro/ipshared/0eaf/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/re2_copro/ip/re2_copro_zynq_ultra_ps_e_0_0/sim/re2_copro_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
  "../../../bd/re2_copro/ipshared/7671/hdl/re2_copro_v1_S00_AXI.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/AXI/AXI_package.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/AXI/AXI_top.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/arbiters/arbiter_2_fixed.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/arbiters/arbiter_2_rr.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/arbiters/arbiter_fixed.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/arbiters/arbiter_rr_n.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/arbiters/arbitration_logic_fixed.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/arbiters/arbitration_logic_rr.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/memories/bram.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/memories/cache_block_directly_mapped.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/channel.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/channel_iface.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/engine.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/engine_and_station.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/engine_interfaced.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/fifo.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/CPU/instruction.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/memories/memory_read_iface.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/ping_pong_buffer.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/regex_coprocessor_package.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/regex_coprocessor_top.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/CPU/regex_cpu.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/CPU/regex_cpu_pipelined.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/switch.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/topology_single.sv" \
  "../../../../regex_copro.srcs/sources_1/bd/hdl_src/rtl/coprocessor/topology_token_ring.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/re2_copro/ipshared/7671/hdl/re2_copro_v1.v" \
  "../../../bd/re2_copro/ip/re2_copro_re2_copro_0_1/sim/re2_copro_re2_copro_0_1.v" \
  "c:/Users/danie/Documents/GitHub/regex_coprocessor_safe/proj/regex_copro/regex_copro.srcs/sources_1/bd/re2_copro/ip/re2_copro_xbar_1/re2_copro_xbar_1_sim_netlist.v" \
  "c:/Users/danie/Documents/GitHub/regex_coprocessor_safe/proj/regex_copro/regex_copro.srcs/sources_1/bd/re2_copro/ip/re2_copro_rst_ps8_0_100M_0/re2_copro_rst_ps8_0_100M_0_sim_netlist.v" \
  "c:/Users/danie/Documents/GitHub/regex_coprocessor_safe/proj/regex_copro/regex_copro.srcs/sources_1/bd/re2_copro/ip/re2_copro_auto_ds_0/re2_copro_auto_ds_0_sim_netlist.v" \
  "c:/Users/danie/Documents/GitHub/regex_coprocessor_safe/proj/regex_copro/regex_copro.srcs/sources_1/bd/re2_copro/ip/re2_copro_auto_pc_0/re2_copro_auto_pc_0_sim_netlist.v" \
  "c:/Users/danie/Documents/GitHub/regex_coprocessor_safe/proj/regex_copro/regex_copro.srcs/sources_1/bd/re2_copro/ip/re2_copro_auto_ds_1/re2_copro_auto_ds_1_sim_netlist.v" \
  "c:/Users/danie/Documents/GitHub/regex_coprocessor_safe/proj/regex_copro/regex_copro.srcs/sources_1/bd/re2_copro/ip/re2_copro_auto_pc_1/re2_copro_auto_pc_1_sim_netlist.v" \
  "../../../bd/re2_copro/sim/re2_copro.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

