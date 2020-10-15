#!/bin/bash
#example time bash ./test.sh 'a*' aaaaaaaaaaaaaaaaaaaaaaaaaaaaa 10
report() {
        err=1
        
}
trap report ERR

for n in $(seq 1 $3); 
do
    # grep -x -E -q \'$1\' $2 
    #grep -q quiet
    #echo $n
    #echo $2
    #echo $2 | grep  -E --colour=auto $1
    echo $2 | grep -q -E --colour=auto $1
done
