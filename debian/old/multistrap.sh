#!/bin/sh

ln -s /var/cache/apt/archives/debian-archive-keyring_2019.1ubuntu2_all.deb debian-archive-keyring_2019.1ubuntu2_all.deb
sudo multistrap -f buster.cfg -d $1
