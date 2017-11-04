#!/usr/bin/awk -f
# cookbook filename: hist.awk
# Histograms in Awk
# Usage: ls -lR /usr/local | hist.awk

function max(arr, big)
{
    big = 0;
    for (i in user)
    {
        if (user[i] > big) { big=user[i];}
    }
    return big
}

NF > 7 {
    user[$3]++
}
END {
    # for scaling
    maxm = max(user);
    for (i in user) {
        #printf "%s owns %d files\n", i, user[i]
        scaled = 60 * user[i] / maxm ;
        printf "%-10.10s [%8d]:", i, user[i]
        for (i=0; i<scaled; i++) {
            printf "#";
        }
        printf "\n";
    }
}
