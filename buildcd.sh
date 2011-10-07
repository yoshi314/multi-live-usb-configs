#!/bin/sh

# copy this script somewhere and make a directory called image to accompany it

# put all the files that you want to include on the disk into directory "image" - this will become the root directory of the disk image.

# file called 'live.iso' will be produced.

# put all configs and .c32 files into isolinux subdirectory of the image/ dir
# you also will need to copy isolinux.bin into isolinux from your syslinux package there
# on arch linux it's in /usr/lib/syslinux on gentoo it's (IIRC) in /usr/share/syslinux

# rename syslinux.cfg into isolinux.cfg optionally

# so you need a layout like this : 

# image/
# image/isolinux
# image/isolinux/isolinux.bin
# image/isolinux/isolinux.cfg (or syslinux.cfg)
# image/isolinux/*.c32

# you can copy over distribution files into image/ according to instructions in .cfg files, as if it were the usb 

# it will have label 'livedisk' . adapt all necessary configs accordingly to this, or alter the command below



# things you can change here : 
# live.iso 	- final image file
# livedisk 	- label of the cd/dvd filesystem
# image 	- source directory

mkisofs -R -l -o live.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -V livedisk -A livedisk image
