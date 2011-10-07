#!/bin/bash

# this script will generate a simple menu from available .cfg files
# header will be taken from syslinux.cfg

sed -n '/#header start/,/#header end/p' syslinux.cfg

for plik in $( ls -1 *.cfg  | egrep -v '(syslinux.cfg|isolinux.cfg|extlinux.cfg)' )
do
	echo "MENU BEGIN"
	echo "MENU TITLE $(basename $plik .cfg)"
	echo "INCLUDE $plik"
	echo "MENU END"
	echo 
done
