#!/bin/bash

codename="utopic"

baseurltxt="http://archive.ubuntu.com/ubuntu/dists/${codename}/main/installer-@arch@/current/images/netboot/ubuntu-installer/@arch@/"

for arch in i386 amd64 ; do 
    if [ "$arch" = "i386" ] ; 
    then 
	archsuffix=""
    else
	archsuffix="64"
    fi

    url=$(echo "$baseurltxt" | sed -e "s/@XX@/pl/g" -e "s/@arch@/$arch/g")
    wget "$url/linux" -O vmlinuz${archsuffix}
    wget "$url/initrd.gz" -O initrd${archsuffix}.gz
done

