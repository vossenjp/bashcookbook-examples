#!/usr/bin/env bash
# cookbook filename: archive_meta-data

printf "%b" "Mode\tUser\tGroup\tBytes\tModified\tFileSpec\n" > archive_file
find / \( -path /proc -o -path /mnt -o -path /tmp -o -path /var/tmp \
  -o -path /var/cache -o -path /var/spool \) -prune \
  -o -type d -printf 'd%m\t%u\t%g\t%s\t%t\t%p/\n' \
  -o -type l -printf 'l%m\t%u\t%g\t%s\t%t\t%p -> %l\n' \
  -o         -printf '%m\t%u\t%g\t%s\t%t\t%p\n' >> archive_file
