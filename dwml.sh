pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
sudo pacman -Syu
cd
yay -S  rofi chatterino2-7tv-git vscodium git wget awesome sddm vlc librewolf caja streamlink streamlink-twitch-gui-bin qbittorrent jdownloader2 rustdesk obs stacer gnome-disk-utility nano alacritty remmina p7zip-guifish flameshot github-desktop-bin timeshift noto-fonts-cjk noto-fonts-emoji -Y
wget https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run
chmod +x pia-linux-3.3.1-06924.run
sh ./pia-linux-3.3.1-06924.run
sudo systemctl enable sddm.service
