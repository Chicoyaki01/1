#!/bin/bash

#time set
ln -sf /usr/share/zoneinfo/Asia/Seoul
ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime
hwclock --systohc

echo "en_US.ISO-8859-1" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "ko_KR.EUC-KR EUC-KR" >> /etc/locale.gen
echo "ko_KR.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "chicoyaki01" >> /etc/hostname

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.0.1 arch.localdomain chicoyaki01" >> /etc/hosts

pacman -S networkmanager grub os-prober efibootmgr
grub-install --efi-directory=/boot
os-prober
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager.service

useradd -mG wheel chicoyaki01
echo "root passwd"
passwd
echo "chicoyaki01 passwd"
passwd chicoyaki01

echo "You have to edit 'sudo nano /etc/sudoers'."
echo "#%wheel ALL= <----- remove #"
echo "%wheel ALL= <---- Look like this"

sudo pacman -S xorg bspwm sxhkd rofi alacritty lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings nitrogen lxappearance picom nautilus noto-fonts noto-fonts-cjk
sudo systemctl enable lightdm
