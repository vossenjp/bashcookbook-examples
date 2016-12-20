#!/usr/bin/env bash
# cookbook filename: check_arg_count
#
# Check for the correct # of arguments:
# Use this syntax or use: if [ $# -lt 3 ]
if (( $# < 3 ))
then
    printf "%b" "Error. Not enough arguments.\n" >&2
    printf "%b" "usage: myscript file1 op file2\n" >&2
    exit 1
elif (( $# > 3 ))
then
    printf "%b" "Error. Too many arguments.\n" >&2
    printf "%b" "usage: myscript file1 op file2\n" >&2
    exit 2
else
    printf "%b" "Argument count correct. Proceeding...\n"
fi
