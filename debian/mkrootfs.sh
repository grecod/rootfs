#!/bin/bash -xe

ROOTFSDIR=$1
#SOUR_PATH=$(readlink $0)

#1.qemu-aarch64-static
sudo cp -f /usr/bin/qemu-aarch64-static $ROOTFSDIR/usr/bin/

#2.Network DNS
# echo 'nameserver 8.8.8.8' >> $ROOTFSDIR/etc/resolv.conf

#3.chroot
sudo LANG=C.UTF-8 chroot $ROOTFSDIR qemu-aarch64-static /bin/bash

#4. cd $ROOTFSDIR/dev & sudo rm console full null ptmx random tty urandom zero

#5. mk rootfs img
sudo make_ext4fs -l 512M -L rootfs rootfs.img $ROOTFSDIR
sudo chmod 777 rootfs.img
