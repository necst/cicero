#!/bin/bash
windows=(1)
for j in ${windows[@]}
do

#for i in $(ls build_$j | grep u96_mesh_*)
for i in 1
do
	dsgn_name=u96_mesh_${i//u96_mesh_/}
	prj_name=u96_mesh_${i//u96_mesh_/}
	top_name=cicero_top_${i//u96_mesh_/}
	#echo "vivado -mode batch -source extraction.tcl -tclargs $(pwd)/build_$j/u96_mesh_${i//u96_mesh_/} ${i//u96_mesh_/} $(pwd)/build_$j mesh"
	#vivado -mode batch -source extraction.tcl -tclargs $(pwd)/build_$j/u96_mesh_${i//u96_mesh_/} ${i//u96_mesh_/} $(pwd)/build_$j mesh
	#vivado -mode batch -source extract.tcl -tclargs $(pwd)/build_$j/u96_mesh_${i//u96_mesh_/} ${i//u96_mesh_/} $(pwd)/build_$j mesh

	cp $(pwd)/build_$j/$dsgn_name/$prj_name/${prj_name}.srcs/sources_1/bd/$top_name/hw_handoff/${top_name}.hwh $(pwd)/build_$j/cicero_top_mesh_${i//u96_mesh_/}_wrapper.hwh 

done
for i in $(ls build_$j | grep u96_ring_10)
#for i in 10
do

	echo $i
	dsgn_name=u96_ring_${i//u96_ring_/}
	prj_name=u96_ring_${i//u96_ring_/}
	top_name=cicero_top_ring_${i//u96_ring_/}
	echo " $dsgm_name    $prj_name     $top_name"
	#echo "vivado -mode batch -source extraction.tcl -tclargs $(pwd)/build_$j/u96_ring_${i//u96_ring_/} ${i//u96_ring_/} $(pwd)/build_$j ring"
	#vivado -mode batch -source extraction.tcl -tclargs $(pwd)/build_$j/u96_ring_${i//u96_ring_/} ${i//u96_ring_/} $(pwd)/build_$j ring
	#vivado -mode batch -source extract.tcl -tclargs $(pwd)/build_$j/u96_ring_${i//u96_ring_/} ${i//u96_ring_/} $(pwd)/build_$j ring
	cp $(pwd)/build_$j/$dsgn_name/$prj_name/${prj_name}.srcs/sources_1/bd/$top_name/hw_handoff/${top_name}.hwh $(pwd)/build_$j/cicero_top_ring_${i//u96_ring_/}_wrapper.hwh 
done
done
