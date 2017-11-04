#!/usr/bin/awk -f
# cookbook filename: asar.awk
# Associative arrays in Awk
# Usage: ls -lR /usr/local | asar.awk

NF > 7 {
    user[$3]++
}
END {
    for (i in user) {
        printf "%s owns %d files\n", i, user[i]
    }
}
