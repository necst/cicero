#!/bin/bash

#example time bash ./test.sh 'a*' aaaaaaaaaaaaaaaaaaaaaaaaaaaaa
for n in {1..10000..1}
do
    # grep -x -E -q \'$1\' $2 
    echo \'$2\' | grep -x -E -q \'$1\'
 

done
