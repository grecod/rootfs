#!/bin/bash  -ex

ROOTFS_DIR=$1
#SOUR_PATH=$(readlink $0)

# 1. qemu-aarch64-static copy
sudo cp -f /usr/bin/qemu-aarch64-static $ROOTFS_DIR/usr/bin/

# 2. Network DNS
echo 'nameserver 8.8.8.8' >> $ROOTFS_DIR/etc/resolv.conf
echo 'nameserver 114.114.114.114' >> $ROOTFS_DIR/etc/resolv.conf

#3.apt-get sources.list
#sudo cp -f ${SOUR_PATH%/*}/sources.list $ROOTFS_DIR/etc/apt/

#4.mount share dir
#sudo cp -f ${SOUR_PATH%/*}/rc.local $ROOTFS_DIR/etc/

mkdir -p $ROOTFS_DIR/{home/foo,dev/pts}

# 2. mount dir
sudo mount -o bind /dev $ROOTFS_DIR/dev
sudo mount -o bind /dev/pts $ROOTFS_DIR/dev/pts

# 3. chroot
sudo LANG=C.UTF-8 chroot $ROOTFS_DIR qemu-aarch64-static /bin/bash

# 4.umount dir
sudo umount $ROOTFS_DIR/dev/pts
sudo umount $ROOTFS_DIR/dev

# 5.make rootfs img"
sudo make_ext4fs -l 512M -L rootfs rootfs.img $ROOTFS_DIR
sudo chmod 777 rootfs.img
