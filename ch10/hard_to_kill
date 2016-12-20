#!/usr/bin/env bash
# cookbook filename: hard_to_kill

function trapped {
    if [ "$1" = "USR1" ]; then
        echo "Got me with a $1 trap!"
        exit
    else
        echo "Received $1 trap--neener, neener"
    fi
}

trap "trapped ABRT" ABRT
trap "trapped EXIT" EXIT
trap "trapped HUP"  HUP
trap "trapped INT"  INT
trap "trapped KILL" KILL   # This won't actually work
trap "trapped QUIT" QUIT
trap "trapped TERM" TERM
trap "trapped USR1" USR1   # This one is special

# Just hang out and do nothing, without introducing "third-party"
# trap behavior, such as if we used 'sleep'
while (( 1 )); do
    :  # : is a NOOP
done
