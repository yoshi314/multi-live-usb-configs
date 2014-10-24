#!/bin/bash

baseurlgtk="http://ftp.@XX@.debian.org/debian/dists/squeeze/main/installer-@arch@/current/images/netboot/gtk/debian-installer/@arch@"
baseurltxt="http://ftp.@XX@.debian.org/debian/dists/squeeze/main/installer-@arch@/current/images/netboot/debian-installer/@arch@"


for arch in i386 amd64 ; do 
    if [ "$arch" = "i386" ] ; 
    then 
	archsuffix=""
    else
	archsuffix="64"
    fi

    url=$(echo "$baseurlgtk" | sed -e "s/@XX@/pl/g" -e "s/@arch@/$arch/g")
    mkdir gtk
    wget "$url/linux" -O gtk/vmlinuz${archsuffix}
    wget "$url/initrd.gz" -O gtk/initrd${archsuffix}.gz
    url=$(echo "$baseurltxt" | sed -e "s/@XX@/pl/g" -e "s/@arch@/$arch/g")
    wget "$url/linux" -O vmlinuz${archsuffix}
    wget "$url/initrd.gz" -O initrd${archsuffix}.gz
done

