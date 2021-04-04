#!/bin/bash
for i in  1 2 4 8 16 
do
 	echo "vivado -mode batch -source script.tcl -tclargs $(pwd)/u96_$i $i $(pwd)/rtl_src_$i "
 	vivado -mode batch -source script.tcl -tclargs $(pwd)/u96_$i $i $(pwd)/rtl_src_$i 
 	#vivado -mode batch -source script.tcl -tclargs $(pwd)/u96_$i $i rtl_src_$i 
done
