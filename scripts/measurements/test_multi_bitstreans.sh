#!/bin/bash
windows=(1)
bit_fldr=/home/xilinx/cicero_scaling_tmp
#benchmarks=(protomata clamAV brill)
benchmarks=(brill)
rank=4
for bench in ${benchmarks[@]}
do
for i in ${windows[@]};
do
       	for j in $(ls ${bit_fldr}/queue_$i)
       	do 
		for l in $(ls  ${bit_fldr}/queue_$i/$j/*.bit)
	       	do 
#			python3 measure_rand.py -copro -bitstream $l -benchmark=${bench} -strfile="${bench}.input" -regfile="${bench}.regex" -format=pcre -skipException -window_value=queue_$i;
			python3 measure_rand.py -copro -bitstream $l -benchmark=${bench}${rank} -strfile="${bench}.input" -regfile="${bench}${rank}.regex" -format=pcre -skipException -window_value=queue_$i;
		done
       done
done
done
