#!/usr/bin/env bash
# cookbook filename: parseViaArray
#
# find the file size
# use an array to parse the ls -l output into words

LSL=$(ls -ld $1)

declare -a MYRA
MYRA=($LSL)

echo the file $1 is ${MYRA[4]} bytes.
