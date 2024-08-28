#!/usr/bin/env bash
sudo rm -rf /usr/share/xsessions/*
sudo wget -p /usr/share/fonts/Iosevka
sudo wget  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz --directory-prefix=/usr/share/fonts/Iosevka
sudo tar -xvf /usr/share/fonts/Iosevka/Iosevka.tar.xz -C /usr/share/fonts/Iosevka/
sudo rm -rf /usr/share/fonts/Iosevka/Iosevka.tar.xz /usr/share/fonts/Iosevka/*.md
sudo mv /etc/sudoers.d/0pwfeedback /etc/sudoers.d/0pwfeedback.disabled 
sudo apt update -y
sudo apt purge '*language-*' -y
xargs sudo apt install <dwmlpkgs.txt -y
fc-cache -f -v
sudo chsh -s $(which zsh)
sudo systemctl enable libvirtd
sudo adduser $USER libvirt
sudo adduser $USER kvm
sudo -v
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
sudo -v
echo 'Defaults !pwfeedback'|sudo tee /etc/sudoers.d/9_no_pwfeedback
sudo apt install winehq-staging -y
sudo -v
rm -rf ~/snap

mkdir zig
cd zig
wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz
 tar xf *
 rm -rf *.tar.xz
 mv * zig
 sudo mv zig/lib zig/zig /usr/local/bin
 cd -


flatpak install -y --noninteractive flathub com.chatterino.chatterino/x86_64/stabke librewolf io.github.shiftey.Desktop org.jellyfin.JellyfinServer
sudo mv streamlink.desktop /usr/share/applications
sudo mv *.png /usr/share/icons
sudo mkdir -p /usr/local/bin


curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

 mv *.AppImage Streamlink_Twitch_GUI

 find ./  -regextype posix-egrep -regex '.*{3,5}.*' -print0 | xargs -0 chmod +x
sudo mv Streamlink_Twitch_GUI /usr/local/bin

sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
./gwml.sh
./Jdownloader2.sh
nvim > /dev/null 2>&1 &
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
sudo zig build installsystemd
sudo systemctl enable ly.service -f
sudo systemctl disable getty@tty2.service
cd -
./dwmlrmvpkgs.sh
sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
