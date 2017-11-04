#!/usr/bin/env bash
# cookbook filename: getopts_example
#
# using getopts
#
aflag=
bflag=
while getopts 'ab:' OPTION
do
    case $OPTION in
        a) aflag=1
           ;;
        b) bflag=1
           bval="$OPTARG"
           ;;
        ?) printf "Usage: %s: [-a] [-b value] args\n" ${0##*/} >&2
           exit 2
           ;;
    esac
done
shift $(($OPTIND - 1))

if [ "$aflag" ]
then
    printf "Option -a specified\n"
fi
if [ "$bflag" ]
then
    printf 'Option -b "%s" specified\n' "$bval"
fi
printf "Remaining arguments are: %s\n" "$*"
