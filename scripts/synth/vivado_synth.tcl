

if { $argc < 3} {
 puts "Expected <prj_dir> < basick block number> <rtl sources>"
 exit
}
set prj_dir [lindex $argv 0]
set bb_nr [lindex $argv 1]
set src_dir [lindex $argv 2]
set topology [lindex $argv 3]

set prj_name_location ${prj_dir}/u96_${topology}_${bb_nr}
set ip_prj_dir ${prj_dir}/ip_dir_${topology}_${bb_nr}

puts "$prj_dir"
puts "$bb_nr"
puts "$src_dir"
puts "$prj_name_location"

create_project -force u96_${topology}_${bb_nr} ${prj_name_location} -part xczu3eg-sbva484-1-i
set_property board_part avnet.com:ultra96v2:part0:1.1 [current_project]

add_files -norecurse $src_dir
set_property top cicero_core [current_fileset]

update_compile_order -fileset sources_1

ipx::package_project -root_dir $ip_prj_dir -vendor user.org -library user -taxonomy /UserIP -import_files -set_current false
ipx::unload_core ${ip_prj_dir}/component.xml
ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory $ip_prj_dir  ${ip_prj_dir}/component.xml
set_property core_revision 2 [ipx::current_core]
ipx::update_source_project_archive -component [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::move_temp_component_back -component [ipx::current_core]
close_project -delete
set_property ip_repo_paths $ip_prj_dir [current_project]
update_ip_catalog




create_bd_design "cicero_top_${topology}_${bb_nr}"
update_compile_order -fileset sources_1
create_bd_cell -type ip -vlnv user.org:user:cicero_core:1.0 cicero_core_0
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e_0
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1" }  [get_bd_cells zynq_ultra_ps_e_0]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_FPD} Slave {/cicero_core_0/s00_axi} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins cicero_core_0/s00_axi]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/zynq_ultra_ps_e_0/pl_clk0 (100 MHz)} Clk_xbar {/zynq_ultra_ps_e_0/pl_clk0 (100 MHz)} Master {/zynq_ultra_ps_e_0/M_AXI_HPM1_FPD} Slave {/cicero_core_0/s00_axi} ddr_seg {Auto} intc_ip {/ps8_0_axi_periph} master_apm {0}}  [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM1_FPD]
set_property -dict [list CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {7}] [get_bd_cells zynq_ultra_ps_e_0]
validate_bd_design
regenerate_bd_layout -routing
save_bd_design
write_bd_tcl -force cicero_top_${topology}_${bb_nr}_wrapper.tcl
make_wrapper -files [get_files ${prj_name_location}/u96_${topology}_${bb_nr}.srcs/sources_1/bd/cicero_top_${topology}_${bb_nr}/cicero_top_${topology}_${bb_nr}.bd] -top
add_files -norecurse ${prj_name_location}/u96_${topology}_${bb_nr}.srcs/sources_1/bd/cicero_top_${topology}_${bb_nr}/hdl/cicero_top_${topology}_${bb_nr}_wrapper.v
set_property top cicero_top_${topology}_${bb_nr}_wrapper [current_fileset]
update_compile_order -fileset sources_1
set_property strategy Flow_RuntimeOptimized [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.BUFG 14 [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]
set_property strategy Flow_RunPostRoutePhysOpt [get_runs impl_1]
launch_runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
write_hw_platform -fixed -force  -include_bit -file cicero_top_${topology}_${bb_nr}_wrapper.xsa
