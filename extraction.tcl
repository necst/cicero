if { $argc < 4} {
 puts "Expected <prj_dir> < basick block number> <out sources> <mesh|ring>"
 exit
}
set prj_dir [lindex $argv 0]
set bb_nr [lindex $argv 1]
set out_dir [lindex $argv 2]
set topology [lindex $argv 3]

set prj_name_location ${prj_dir}/u96_${topology}_${bb_nr}
set ip_prj_dir ${prj_dir}/ip_dir_${topology}_${bb_nr}

puts "$prj_dir"
puts "$bb_nr"
puts "$out_dir"
puts "$prj_name_location"


open_project ${prj_name_location}/u96_${topology}_${bb_nr}.xpr
update_compile_order -fileset sources_1

open_bd_design ${prj_name_location}/u96_${topology}_${bb_nr}.srcs/sources_1/bd/cicero_top_${topology}_${bb_nr}/cicero_top_${topology}_${bb_nr}.bd

write_bd_tcl -force ${out_dir}/cicero_top_${topology}_${bb_nr}_wrapper.tcl
close_bd_design [get_bd_designs cicero_top_${topology}_${bb_nr}]

write_hw_platform -fixed -force  -include_bit -file ${out_dir}/cicero_top_${topology}_${bb_nr}_wrapper.xsa

file copy -force ${prj_name_location}/u96_${topology}_${bb_nr}.runs/impl_1/cicero_top_${topology}_${bb_nr}_wrapper.bit ${out_dir}/cicero_top_${topology}_${bb_nr}_wrapper.bit

puts "\[*\]Exiting from export script"
