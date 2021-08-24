git clone https://aur.archlinux.org/yay.git
cd ~
cd yay
makepkg -si
cd ../
rm -rf yay
yay -S google-chrome