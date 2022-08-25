ROOTFSDIR=$1

#sudo debootstrap --arch=armel buster $ROOTFSDIR https://mirrors.tuna.tsinghua.edu.cn/debian/
sudo debootstrap --arch=arm64 buster $ROOTFSDIR http://mirrors.ustc.edu.cn/debian/
