#!/usr/bin/env bash
# cookbook filename: parseViaRead
#
# parse ls -l with a read statement
# an example of output from ls -l follows:
# -rw-r--r--  1 albing users 126 2006-10-10 22:50 fnsize

ls -l "$1" | { read PERMS LCOUNT OWNER GROUP SIZE CRDATE CRTIME FILE ;
                 echo $FILE has $LCOUNT 'link(s)' and is $SIZE bytes long. ;
             }
