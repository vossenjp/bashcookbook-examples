#!/usr/bin/env bash
# cookbook filename: chkpath.2
# Check your $PATH for world-writable or missing directories, with 'stat'

exit_code=0

for dir in ${PATH//:/ }; do
    [ -L "$dir" ] && printf "%b" "symlink, "
    if [ ! -d "$dir" ]; then
        printf "%b" "missing\t\t\t\t"
        (( exit_code++ ))
    else
        stat=$(ls -lHd $dir | awk '{print $1, $3, $4}')
        if [ -n "$(echo $stat | grep '^d.......w. ')" ]; then
            printf "%b" "world writable\t$stat "
            (( exit_code++ ))
        else
            printf "%b" "ok\t\t$stat "
        fi
    fi
    printf "%b" "$dir\n"

done
exit $exit_code
