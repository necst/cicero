#!/bin/bash

PY_AGGREGATOR=parser_results.py
for j in $(ls -d *_reduced_*)
do
	#echo $j
	for i in $(ls ${j}/*pcre*);
do
	benchname=${i/"$j/measure_reduced_pcre"/};
	benchname=${benchname/"$j/measure_pcre"/};
	#benchname=${benchname/_queue*/};
	subarchname=${benchname/_wrapper*/}
	subarchname=${subarchname/${benchname/_queue_*/}_queue_[0-9]/}
	subarchname=${subarchname/cicero_top_/}
#snort_queue_3cicero_top_ring_16_wrapper_O1.csv
	#echo $subarchname

	archname=$(echo $j | cut -f 1 -d "_")_$(echo $j | cut -f 3 -d "_")
	#echo $archname
	#echo $benchname;
	#echo ${benchname/_queue_*/}
	echo "python3 ${PY_AGGREGATOR} -irf $i -gv 0 -orf $j/aggregated_${archname}${subarchname}_${benchname/_queue_*/}_reduced.csv -copro";
	python3 ${PY_AGGREGATOR} -irf $i -gv 0 -orf $j/aggregated_${archname}${subarchname}_${benchname/_queue_*/}_reduced.csv -copro;
	sleep 2
done
done
for j in $(ls -d *_reduced)
do
	#echo $j
	for i in $(ls ${j}/*pcre*);
do
	benchname=${i/"$j/measure_reduced_pcre"/};
	benchname=${benchname/"$j/measure_pcre"/};

	archname=$(echo $j | cut -f 1 -d "_")_$(echo $j | cut -f 3 -d "_")
	#echo $archname
	#echo $benchname;
	#echo ${benchname/_queue_*/}
	echo "python3 ${PY_AGGREGATOR} -irf $i -gv 1 -orf $j/aggregated_${archname}_${benchname/_queue_*/}_reduced.csv";
	python3 ${PY_AGGREGATOR} -irf $i -gv 1 -orf $j/aggregated_${archname}_${benchname/_queue_*/}_reduced.csv;
	sleep 2
done
done
for j in $(ls -d *_complete)
do
	#echo $j
	for i in $(ls ${j}/*);
do
	benchname=${i/"$j/measure_"/};
	benchname=${benchname/"$j/measure_"/};

	archname=$(echo $j | cut -f 1 -d "_")_$(echo $j | cut -f 3 -d "_")
	# echo $archname
	# echo $benchname;
	# echo ${benchname/_queue_*/}
	echo "python3 ${PY_AGGREGATOR} -irf $i -gv 1 -orf $j/aggregated_${archname}_${benchname/_queue_*/}_complete.csv";
	python3 ${PY_AGGREGATOR} -irf $i -gv 1 -orf $j/aggregated_${archname}_${benchname/_queue_*/}_complete.csv;
	#sleep 2
done
done
