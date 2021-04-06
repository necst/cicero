#!/bin/bash
windows=(3)
bit_fldr=/home/xilinx/cicero_test
#benchmarks=(protomata clamAV brill)
benchmarks=(protomata)
#rank=4
startidx=(0 100 200 300 400)
endidx=(100 200 300 400 500)
for bench in ${benchmarks[@]}
do
for i in ${windows[@]};
do
       	for j in $(ls ${bit_fldr}/queue_$i)
       	do 
		for l in $(ls  ${bit_fldr}/queue_$i/$j/*.bit)
	       	do 
			        for j in 0 1 2 3 4 5 6 7 8 9 10 11 12
				do
				python3 measure.py -copro -bitstream $l -benchmark=${bench} -strfile="${bench}.input" -regfile="${bench}.regex" -format=pcre -skipException -window_value=queue_$i -copro_not_check -startreg=${startidx[$j]} -endreg=${endidx[$j]};
			done
		done
       done
done
done
