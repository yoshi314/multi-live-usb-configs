#!/bin/sh

base="http://mirrors.kernel.org/archlinux/iso/archboot/latest/boot/"

rm -v vmlinuz_{i686,x86_64} initramfs_{i686,x86_64}.img

wget ${base}/{vmlinuz_{i686,x86_64},initramfs_{i686,x86_64}.img}
