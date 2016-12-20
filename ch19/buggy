#!/usr/bin/env bash
# cookbook filename: buggy
#

set -x

result=$1

[ $result = 1 ] \
  && { echo "Result is 1; excellent." ; exit 0;   } \
  || { echo "Uh-oh, ummm, RUN AWAY! " ; exit 120; }
