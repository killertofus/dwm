#!/usr/bin/env bash
sed -i 's/dwm/dwl/g' configs.sh
sed -i 's/xsessions/wayland-sessions/g' configs.sh
sed -i 's/.xinitrc/startup.sh/g' configs.sh
sed -i '20d;21d' configs.sh
sed -i 's/feh/wayland/g' packages.txt
sed -i 's/rofi/rofi-wayland/g' packages.txt
sed -i 's/xscreensaver/wlroots/g' packages.txt
sed -i 's/picom/swww/g' packages.txt
sed -i 's/lxappearance/nwg-look/g' packages.txt
sed -i '2 a wayland-protocols' packages.txt
sed -i 's/volumeicon/waybar/g' packages.txt
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i '/#MAKEFLAGS="5"/c\MAKEFLAGS="--jobs=$(nproc)"' /etc/makepkg.conf
sudo sed -i '32 a ILoveCandy' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo mkdir -p /usr/share/wayland-sessions
git clone https://aur.archlinux.org/yay.git
makepkg -siD yay --noconfirm
sudo -v
sudo pacman -S --needed git base-devel --noconfirm
sudo pacman -Syu --noconfirm
sudo -v
sudo pacman -S $(cat packages.txt | cut -d' ' -f1) --noconfirm
fc-cache -f
chsh -s $(which zsh)
for word in $(cat aurpackages.txt); do yay -S --noconfirm --mflags --skipinteg $word || true; done
yay --devel --save
sudo pacman -Qttdq | sudo pacman -Rns - --noconfirm
sudo systemctl enable ly
sudo systemctl enable piavpn.service
sudo systemctl enable libvirtd.service
sudo systemctl enable libvirtd.socket
yay -Scc --noconfirm
nvim > /dev/null 2>&1 &
./configs.sh
rm -rf $(pwd)
