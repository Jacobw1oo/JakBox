#!/bin/bash
#Part 5 - Debian User - compiling and installing turnip GPU drivers
#turnipcompile.sh

#some fun file links
#https://gitlab.freedesktop.org/mesa/mesa
#https://gitlab.freedesktop.org/Danil/mesa/-/archive/turnip/feature/a7xx-basic-support/mesa-turnip-feature-a7xx-basic-support.tar.gz
#https://gitlab.freedesktop.org/Danil/mesa/-/tree/feature/turnip/a750

set -e

#Making sure architecture is correct
sudo dpkg --add-architecture armhf
sudo apt update
sudo apt upgrade -y

#getting build-dependencies for Mesa source package
sudo echo "deb-src [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://deb.debian.org/debian bookworm main contrib" >> /etc/apt/sources.list
sudo echo "deb-src [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://deb.debian.org/debian bookworm-updates main contrib" >> /etc/apt/sources.list
sudo apt update
sudo apt-get build-dep mesa
sudo apt install wget
sudo apt install make cmake git wget vulkan-tools mesa-utils g++-arm-linux-gnueabihf g++-aarch64-linux-gnu
# all arm64 requirments
sudo apt install zlib1g-dev:arm64 libexpat1-dev:arm64 libdrm-dev:arm64 libx11-dev:arm64 libx11-xcb-dev:arm64 libxext-dev:arm64 libxdamage-dev:arm64 libxcb-glx0-dev:arm64 libxcb-dri2-0-dev:arm64 libxcb-dri3-dev:arm64 libxcb-shm0-dev:arm64 libxcb-present-dev:arm64 libxshmfence-dev:arm64 libxxf86vm-dev:arm64 libxrandr-dev:arm64 libwayland-dev:arm64 wayland-protocols:arm64 libwayland-egl-backend-dev:arm64
# all armhf requirments
sudo apt install zlib1g-dev:armhf libexpat1-dev:armhf libdrm-dev:armhf libx11-dev:armhf libx11-xcb-dev:armhf libxext-dev:armhf libxdamage-dev:armhf libxcb-glx0-dev:armhf libxcb-dri2-0-dev:armhf libxcb-dri3-dev:armhf libxcb-shm0-dev:armhf libxcb-present-dev:armhf libxshmfence-dev:armhf libxxf86vm-dev:armhf libxrandr-dev:armhf libwayland-dev:armhf wayland-protocols:armhf libwayland-egl-backend-dev:armhf

# main mesa repo
git clone https://gitlab.freedesktop.org/mesa/mesa /home/gamer/Downloads
cd /home/gamer/Downloads/

echo "[binaries]
c = 'arm-linux-gnueabihf-gcc'
cpp = 'arm-linux-gnueabihf-g++'
ar = 'arm-linux-gnueabihf-ar'
strip = 'arm-linux-gnueabihf-strip'
pkgconfig = 'arm-linux-gnueabihf-pkg-config'

[host_machine]
system = 'linux'
cpu_family = 'arm'
cpu = 'aarch64'
endian = 'little'
" > ${MESA_PREFIX}/arm64.txt

echo "[binaries]
c = 'arm-linux-gnueabihf-gcc'
cpp = 'arm-linux-gnueabihf-g++'
ar = 'arm-linux-gnueabihf-ar'
strip = 'arm-linux-gnueabihf-strip'
pkgconfig = 'arm-linux-gnueabihf-pkg-config'

[host_machine]
system = 'linux'
cpu_family = 'arm'
cpu = 'arm'
endian = 'little'
" > ${MESA_PREFIX}/arm86.txt







#If i had to build mesa for the a750
#git clone https://gitlab.freedesktop.org/Danil/mesa/-/tree/feature/turnip/a750 /home/gamer
