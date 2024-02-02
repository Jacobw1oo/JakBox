#!/bin/bash
# JakBox takes the best parts from 4 diffrent proot, chroot setup githubs
# https://github.com/olegos2/mobox
# https://github.com/Ilya114/Box64Droid/
# https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/
# https://github.com/Raezroth/Linux-ARM-Gaming-Chroot


#Part 1 - Termux - Installing proot-debian
echo "allow-external-apps = true" >> ~/.termux/termux.properties && echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties
pkg clean && termux-setup-storage && yes | pkg update && pkg install nano wget proot-distro pulseaudio -y && pkg clean && proot-distro install debian && proot-distro clear-cache &&
echo 'pulseaudio --verbose --start --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"
alias jakbox="proot-distro login debian --user root --shared-tmp --no-sysvipc"' >> ~/.bashrc && . ~/.bashrc && termux-reload-settings

#Part 2 - Termux - Installing VirGL Zink
pkg install x11-repo tur-repo
pkg install mesa-zink virglrenderer-mesa-zink

echo 'alias zink="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy virgl_test_server --use-egl-surfaceless --use-gles &"' >> ~/.bashrc
source ~/.bashrc

#Part 2.1 - Termux - Installing  VirGL ES - Disabled
#Todo make a pick menu

#pkg install x11-repo
#pkg install virglrenderer-android

#echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android &"' >> ~/.bashrc
#source ~/.bashrc

#Part 3 - Debian - Installing xfce4
bash scripts/xfce4.sh

#Part 4 - Debian - Adding User
#Username: gamer Password: gamer
bash scripts/addusergamer.sh