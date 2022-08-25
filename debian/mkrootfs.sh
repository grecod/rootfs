#!/bin/bash
#err exit
set -e 

ROOTFS_DIR=$1
#SOUR_PATH=$(readlink $0)

echo "1.file copy"
#1.qemu-aarch64-static
sudo cp -f /usr/bin/qemu-aarch64-static $ROOTFS_DIR/usr/bin/
#2.Network DNS
#sudo cp -f config/resolv.conf $ROOTFS_DIR/etc/
#3.apt-get sources.list
#sudo cp -f ${SOUR_PATH%/*}/sources.list $ROOTFS_DIR/etc/apt/
#4.mount share dir
#sudo cp -f ${SOUR_PATH%/*}/rc.local $ROOTFS_DIR/etc/
#5.init rootfs sh

echo "2.mount dir"
#1.mount
#sudo mount -o bind  $ROOTFS_DIR $MOUNT_DIR
sudo mount -o bind  /dev  $ROOTFS_DIR/dev

echo -e "3.** chroot **\n"
sudo LC_ALL=C LANGUAGE=C LANG=C chroot $ROOTFS_DIR 

echo "4.umount dir"
#2.umount
sudo umount $ROOTFS_DIR/dev
#sudo umount $MOUNT_DIR

echo -e "5.make rootfs img\n"
#mk rootfs img
sudo make_ext4fs -l 512M -L rootfs rootfs.img $ROOTFS_DIR
sudo chmod 777 rootfs.img
