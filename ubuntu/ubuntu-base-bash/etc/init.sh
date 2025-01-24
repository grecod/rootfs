#!/bin/bash  -x

echo  "** init.sh **"
mount -t proc /proc /proc
mount -t sysfs /sys /sys
mkdir -p /dev/pts
mount -t devpts devpts /dev/pts

mount -t 9p -o trans=virtio,version=9p2000.L hostshare /home/foo

cd /home/foo

exec /bin/bash