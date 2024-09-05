#!/usr/bin/env bash
sed -i 's/dwm/dwl/g' gwml.sh
sed -i 's/xsessions/wayland-sessions/g' gwml.sh
sed -i 's/.xinitrc/startup.sh/g' gwml.sh
sed -i '23d;24d' gwml.sh
sed -i 's/picom/wdisplays/g' dwmlpkgs.txt
sed -i 's/feh/wayland-protocols/g' dwmlpkgs.txt
sed -i 's/xscreensaver/libwayland-cursor++1 liblz4-dev libwayland-bin libinput-dev libwayland-dev libwlroots-dev/g' dwmlpkgs.txt
sed -i 's/volumeicon-alsa/waybar/g' dwmlpkgs.txt
sed -i 's/lxappearance/nwg-look/g' dwmlpkgs.txt
sudo mkdir -p /usr/share/wayland-sessions
sudo rm -rf /usr/share/xsessions/*
sudo wget -p /usr/share/fonts/Iosevka
sudo wget  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz --directory-prefix=/usr/share/fonts/Iosevka
sudo tar -xvf /usr/share/fonts/Iosevka/Iosevka.tar.xz -C /usr/share/fonts/Iosevka/
sudo rm -rf /usr/share/fonts/Iosevka/Iosevka.tar.xz /usr/share/fonts/Iosevka/*.md
sudo apt update
sudo -v
sudo apt purge '*language-*' '*cinnamon-*' -y
xargs sudo apt install <dwmlpkgs.txt -y
sudo mv update.sh /usr/local/bin
fc-cache -f -v
sudo systemctl enable libvirtd
sudo adduser $USER libvirt
sudo adduser $USER kvm
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
main() {
   codename=$(grep "CODENAME" /etc/upstream-release/lsb-release | cut -d'=' -f2)
    printf "%b" '\033[1;33mDownloading..\n\033[0m'
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$codename/winehq-$codename.sources
    printf "%b" '\033[1;32mDone! Goodbye!\n\033[0m'
}

main
sudo apt update && sudo apt upgrade -y
sudo dpkg --configure -a
sudo apt install winehq-staging -y
chsh -s $(which zsh)
rm -rf ~/snap
flatpak install -y --noninteractive flathub com.chatterino.chatterino/x86_64/stable librewolf io.github.shiftey.Desktop org.jellyfin.JellyfinServer JDownloader
sudo mv streamlink.desktop /usr/share/applications
sudo mv rustdesk.desktop /usr/share/applications
sudo mv *.png /usr/share/icons
sudo mkdir -p /usr/local/bin


mkdir zig
cd zig
wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz
 tar xf *
 rm -rf *.tar.xz
 mv * zig
 sudo mv zig/lib zig/zig /usr/local/bin
 cd -



curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

 mv *.AppImage Streamlink_Twitch_GUI


curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

 mv *.AppImage rustdesk
 find ./  -regextype posix-egrep -regex '.*{3,5}.*' -print0 | xargs -0 chmod +x
sudo mv rustdesk Streamlink_Twitch_GUI /usr/local/bin


sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
./gwml.sh
nvim > /dev/null 2>&1 &
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
sudo zig build
sudo zig build installsystemd
sudo systemctl enable ly.service -f
sudo systemctl disable getty@tty2.service
cd -
./dwmlrmvpkgs.sh
sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y