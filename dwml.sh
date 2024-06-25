#!/usr/bin/env bash
sudo rm -rf /usr/share/xsessions/*
sudo wget -p /usr/share/fonts/Iosevka
sudo wget  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz --directory-prefix=/usr/share/fonts/Iosevka
sudo tar -xvf /usr/share/fonts/Iosevka/Iosevka.tar.xz -C /usr/share/fonts/Iosevka/
sudo rm -rf /usr/share/fonts/Iosevka/Iosevka.tar.xz /usr/share/fonts/Iosevka/*.md
sudo apt update
xargs sudo apt install <dwmlpkgs.txt
sleep 0.7; xdotool key 'Return' | curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash
 #remove below when alacritty and lsd are in the mint repos
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo -v
sudo apt install alacritty -y
curl -sS https://webi.sh/lsd | sh
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
sudo apt install winehq-staging -y
sudo apt install alacritty -y
chsh -s $(which zsh)
sudo fc-cache -f -v
curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x 
curl -sS https://webi.sh/lsd | sh
source ~/config/envman/PATH.env
rm -rf ~/snap
distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF
sudo apt update

sudo apt install librewolf -y
sudo apt update


sudo mv streamlink.desktop /usr/share/applications
sudo mv chatterino.desktop /usr/share/applications
sudo mv rustdesk.desktop /usr/share/applications
sudo mv *.png /usr/share/icons
sudo mkdir -p /usr/local/bin


curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

 mv *.AppImage Streamlink_Twitch_GUI
 




curl -s https://api.github.com/repos/Chatterino/chatterino2/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
 mv *.AppImage Chatterino


curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
 
 mv *.AppImage rustdesk
 find ./  -regextype posix-egrep -regex '.*{3,5}.*' -print0 | xargs -0 chmod +x
sudo mv rustdesk Chatterino Streamlink_Twitch_GUI /usr/local/bin


wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update
sudo apt install github-desktop
sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
sudo -v
./gwml.sh
mv config/.zshrc ~/.
./Jdownloader2.sh
git clone https://github.com/tristanisham/zvm
echo "# ZVM" >> $HOME/.profile
echo export ZVM_INSTALL="$HOME/.zvm/self" >> $HOME/.profile
echo export PATH="$PATH:$HOME/.zvm/bin" >> $HOME/.profile
echo export PATH="$PATH:$ZVM_INSTALL/" >> $HOME/.profile
zig i master
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
zig build
zig build installsystemd
sudo systemctl enable ly.service -f
sudo systemctl disable getty@tty2.service
cd -
./dwmlrmvpkgs.sh
