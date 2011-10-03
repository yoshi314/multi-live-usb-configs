#!/bin/bash

# a simple script that will sort the menu entries

tempfile=$(mktemp)

grep TITLE syslinux.cfg | sort > "$tempfile"

sed -n '/#header start/,/#header end/p' syslinux.cfg

exec < "$tempfile"
while read line 
do
	grep -A 2 "$line" syslinux.cfg
	echo
done

rm "$tempfile"
