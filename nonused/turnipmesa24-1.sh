#!/bin/bash

#DEPRICATED, no longer used

#turnipmesa24-1.sh
#Part 7 - Debian User - Installing mesa 24.1 turnip zink GPU drivers - newest has lots of errors, complied 2024 02 02
echo "Part 7 - Debian User - Installing mesa 24.1 turnip zink GPU drivers"

# If amy command fails, script is stoped
set -e

#dependices install for mesa-vulkan-kgsl_*_armhf
sudo apt install -y libvulkan1:armhf 

#Downloading turnip zink drivers
curl -s -o /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_24.1.0-devel-20240120_arm64.deb https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/packages/mesa-vulkan-kgsl_24.1.0-devel-20240120_arm64.deb
#Dont have armhf version - I dont know if it is needed.
#curl -s -o /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_24.1.0-devel-20240202_arm32.deb https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/packages/mesa-vulkan-kgsl_24.1.0-devel-20240202_arm32.deb

#Instilling Drivers
sudo dpkg -i /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_24.1.0-devel-20240120_arm64.deb

#Tools for testing driver
sudo apt install -y vulkan-tools mesa-utils glmark2-x11

echo '[Desktop Entry]
Name=VKCube Turnip
Exec=bash -c "env TU_DEBUG=noconform MESA_VK_WSI_DEBUG=sw vkcube"
Icon=vkcube
Terminal=true
Type=Application' > ~/Desktop/VKCube_turnip.desktop
chmod +x ~/Desktop/VKCube_turnip.desktop

echo '[Desktop Entry]
Name=GLX Gears Turnip
Exec=bash -c "env MESA_LOADER_DRIVER_OVERRIDE=zink TU_DEBUG=noconform glxgears"
Icon=glxgears
Terminal=true
Type=Application' > ~/Desktop/GLXGears_turnip.desktop
chmod +x ~/Desktop/GLXGears_turnip.desktop

echo "Part 7 - Done"
sleep 10
