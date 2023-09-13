#!/bin/sh

base="http://mirrors.kernel.org/archlinux/iso/latest/arch/boot/x86_64"

rm -v vmlinuz-linux initramfs-linux.img

wget ${base}/vmlinuz-linux
wget ${base}/initramfs-linux.img
