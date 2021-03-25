#!/bin/bash

j=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32)
#j=(2)
window=(1 2 3)
SYNTHESIS=$2
CREATING=$1

for w in ${window[@]}
do
for n in ${j[@]}
do
mkdir -p build_$w
cp script.tcl build_$w/
v=0
i=1
x=0
while test $i -le $n
do
	x=`expr $i \* $i`

	if test "$x" = "$n"
	then
		v=1
		echo "The Number is a perfect square $n"
		mesh_fldr=build_$w/rtl_src_mesh_$n
		mesh_bld_fldr=build_$w/u96_mesh_$n
		mkdir -p $mesh_fldr
		if $CREATING ; then
			cp -f hdl_src/rtl/arbiters/* $mesh_fldr/
			cp -f hdl_src/rtl/coprocessor/* $mesh_fldr/
			cp -f hdl_src/rtl/AXI/* $mesh_fldr/
			cp -f hdl_src/rtl/CPU/* $mesh_fldr/
			cp -f hdl_src/rtl/memories/* $mesh_fldr/
			cp -f hdl_src/rtl/*.sv $mesh_fldr/
			sed -i "s/localparam BB_N\s*= [0-9]*;/localparam BB_N  = 0;/" $mesh_fldr/AXI_top.sv
			sed -i "s/localparam BB_N_X\s*= [0-9]*;/localparam BB_N_X  = $i;/" $mesh_fldr/AXI_top.sv
			sed -i "s/localparam BB_N_Y\s*= [0-9]*;/localparam BB_N_Y  =$i;/" $mesh_fldr/AXI_top.sv
			sed -i "s/localparam CC_ID_BITS\s*= [0-9]*;/localparam CC_ID_BITS  =$w;/" $mesh_fldr/AXI_top.sv

		fi
		mkdir -p $mesh_bld_fldr
		if $SYNTHESIS ; then
		        echo "vivado -mode batch -source $(pwd)/$mesh_bld_fldr/../script.tcl -tclargs $(pwd)/$mesh_bld_fldr $n $(pwd)/$mesh_fldr mesh"
	        	vivado -mode batch -source $(pwd)/$mesh_bld_fldr/../script.tcl -tclargs $(pwd)/$mesh_bld_fldr $n $(pwd)/$mesh_fldr mesh 
		fi

		ring_fldr=build_$w/rtl_src_ring_$n
		mkdir -p $ring_fldr 
		ring_bld_fldr=build_$w/u96_ring_$n
		echo "Doing also the ring for the perfect square"
		if $CREATING ; then
			cp -f hdl_src/rtl/arbiters/* $ring_fldr/
			cp -f hdl_src/rtl/coprocessor/* $ring_fldr/
			cp -f hdl_src/rtl/AXI/* $ring_fldr/
			cp -f hdl_src/rtl/CPU/* $ring_fldr/
			cp -f hdl_src/rtl/memories/* $ring_fldr/
			cp -f hdl_src/rtl/*.sv $ring_fldr/
			sed -i "s/localparam BB_N\s*= [0-9]*;/localparam BB_N  = $n;/" $ring_fldr/AXI_top.sv
			sed -i "s/localparam BB_N_X\s*= [0-9]*;/localparam BB_N_X  = 0;/" $ring_fldr/AXI_top.sv
			sed -i "s/localparam BB_N_Y\s*= [0-9]*;/localparam BB_N_Y  =0;/" $ring_fldr/AXI_top.sv
			sed -i "s/localparam CC_ID_BITS\s*= [0-9]*;/localparam CC_ID_BITS  =$w;/" $ring_fldr/AXI_top.sv
		fi
		mkdir -p $ring_bld_fldr

		if $SYNTHESIS ; then
			echo "vivado -mode batch -source $(pwd)/$ring_bld_fldr/../script.tcl -tclargs $(pwd)/$ring_bld_fldr $n $(pwd)/$ring_fldr ring"
			vivado -mode batch -source $(pwd)/$ring_bld_fldr/../script.tcl -tclargs $(pwd)/$ring_bld_fldr $n $(pwd)/$ring_fldr ring
		fi

		
	fi

	i=`expr $i + 1`
done
#
#if test $v -eq 0
#then
#	echo "The Number is not a perfect square $n"
#	ring_fldr=build_$w/rtl_src_ring_$n
#	mkdir -p $ring_fldr 
#	ring_bld_fldr=build_$w/u96_ring_$n
#	if $CREATING ; then
#		cp -f hdl_src/rtl/arbiters/* $ring_fldr/
#		cp -f hdl_src/rtl/coprocessor/* $ring_fldr/
#		cp -f hdl_src/rtl/AXI/* $ring_fldr/
#		cp -f hdl_src/rtl/CPU/* $ring_fldr/
#		cp -f hdl_src/rtl/memories/* $ring_fldr/
#		cp -f hdl_src/rtl/*.sv $ring_fldr/
#		sed -i "s/localparam BB_N\s*= [0-9]*;/localparam BB_N  = $n;/" $ring_fldr/AXI_top.sv
#		sed -i "s/localparam BB_N_X\s*= [0-9]*;/localparam BB_N_X  = 0;/" $ring_fldr/AXI_top.sv
#		sed -i "s/localparam BB_N_Y\s*= [0-9]*;/localparam BB_N_Y  =0;/" $ring_fldr/AXI_top.sv
#		sed -i "s/localparam CC_ID_BITS\s*= [0-9]*;/localparam CC_ID_BITS  =$w;/" $ring_fldr/AXI_top.sv
#	fi
#	mkdir -p $ring_bld_fldr
#
#	if $SYNTHESIS ; then
#		echo "vivado -mode batch -source $(pwd)/$ring_bld_fldr/script.tcl -tclargs $(pwd)/$ring_bld_fldr $n $(pwd)/$ring_fldr ring"
#		vivado -mode batch -source $(pwd)/$ring_bld_fldr/script.tcl -tclargs $(pwd)/$ring_bld_fldr $n $(pwd)/$ring_fldr ring
#	fi
#fi
done 
done
