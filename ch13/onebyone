#!/usr/bin/env bash
# cookbook filename: onebyone
#
# parsing input one character at a time

while read ALINE
do
    for ((i=0; i < ${#ALINE}; i++))
    do
        ACHAR=${ALINE:i:1}
        # do something here, e.g. echo $ACHAR
        echo $ACHAR
    done
done
