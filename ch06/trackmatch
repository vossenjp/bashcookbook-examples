#!/usr/bin/env bash
# cookbook filename: trackmatch
#
for CDTRACK in *
do
    if [[ "$CDTRACK" =~ "([[:alpha:][:blank:]]*)- ([[:digit:]]*) - (.*)$" ]]
    then
        echo Track ${BASH_REMATCH[2]} is ${BASH_REMATCH[3]}
        mv "$CDTRACK" "Track${BASH_REMATCH[2]}"
    fi
done
