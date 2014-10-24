#!/bin/bash

# this script will generate a simple menu from available .cfg files
# header will be taken from syslinux.cfg

if [ ! -f "syslinux.cfg" ] ; then
	echo "syslinux.cfg file was not found. please copy it over from repository and try again"
	exit 1
fi

sed -n '/#header start/,/#header end/p' syslinux.cfg

for plik in $( ls -1 *.cfg  | egrep -v '(syslinux.cfg|isolinux.cfg|extlinux.cfg)' )
do
	echo "MENU BEGIN"
	echo "MENU TITLE $(basename $plik .cfg)"
	echo "INCLUDE $plik"
	echo "MENU END"
	echo 
done
