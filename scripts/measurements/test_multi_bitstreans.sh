#!/bin/bash
windows=(1 2 3)
benchmarks=(snort)
for bench in ${benchmarks[@]}
do
for i in ${windows[@]};
do
       	for j in $(ls /home/xilinx/test_cicero/queue_$i)
       	do 
		for l in $(ls  /home/xilinx/test_cicero/queue_$i/$j/*.bit)
	       	do 
			python3 measure.py -copro -bitstream $l -benchmark=${bench} -strfile="${bench}.input" -regfile="${bench}.regex" -format=pcre -skipException -window_value=queue_$i;
		done
       done
done
done
