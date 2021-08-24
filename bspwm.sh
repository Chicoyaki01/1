git clone https://aur.archlinux.org/yay.git
cd ~
cd yay
makepkg -si
cd ../
rm -rf yay
yay -S google-chrome yadm kime

yadm clone https://github.com/Chicoyaki01/bspwm.git
yadm pull #깃에서 내가 올린거 가져옴
yadm alt #가져온거 적용