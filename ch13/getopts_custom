#!/usr/bin/env bash
# cookbook filename: getopts_custom
#
# using getopts - with custom error messages
#
aflag=
bflag=
# since we don't want getopts to generate error
# messages, but want this script to issue its
# own messages, we will put, in the option list, a
# leading ':' to silence getopts.
while getopts :ab: FOUND
do
    case $FOUND in
        a)  aflag=1
            ;;
        b)  bflag=1
            bval="$OPTARG"
            ;;
        \:) printf "argument missing from -%s option\n" $OPTARG
            printf "Usage: %s: [-a] [-b value] args\n" ${0##*/}
            exit 2
            ;;
        \?) printf "unknown option: -%s\n" $OPTARG
            printf "Usage: %s: [-a] [-b value] args\n" ${0##*/}
            exit 2
            ;;
        esac >&2
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
