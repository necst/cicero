#!/bin/bash
#example time bash ./test.sh 'a*' aaaaaaaaaaaaaaaaaaaaaaaaaaaaa
for n in {1..1..1}
do
    # grep -x -E -q \'$1\' $2 
    #grep -q quiet
    #echo $n
    #echo $2
    #echo $1
    echo $2 | grep --colour=auto -E  $1
done
