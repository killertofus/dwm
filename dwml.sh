#!/usr/bin/env bash
PS3='dwl or dwm: '
options=("dwl" "dwm")
select opt in "${options[@]}"
do
    case $opt in
        "dwl")
            sed -i 's/dwm/dwl/g' gwml.sh
            sed -i 's/xsessions/wayland-sessions/g' gwml.sh
            sed -i 's/.xinitrc/startup.sh/g' gwml.sh
            sed -i '21d;22d' gwml.sh
            sed -i 's/picom/wdisplays/g' dwmlpkgs.txt
            sed -i 's/feh/wayland-protocols/g' dwmlpkgs.txt
            sed -i 's/xscreensaver/libwayland-cursor++1 libwayland-bin libinput-dev libwayland-dev libwlroots-dev/g' dwmlpkgs.txt
            sed -i 's/volumeicon-alsa/waybar/g' dwmlpkgs.txt
            sed -i '32 a wget https://github.com/LGFae/swww/' dwml.sh
            sed -i '75 a cd swww && ' dwml.sh
            sed -i '76 a cargo build --release ' dwml.sh
            sed -i '77 a mv swww/target/release/swww swww/target/release/swww-daemon /usr/local/bin' 
            sed -i '2,28d' dwml.sh 
            break  # exit the loop after dwl is chosen
            ;;
        "dwm")
            echo "you chose choice 2"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
    done

source "$0" # restart the script after user selection
sudo rm -rf /usr/share/xsessions/*
sudo wget -p /usr/share/fonts/Iosevka
sudo wget  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz --directory-prefix=/usr/share/fonts/Iosevka
sudo tar -xvf /usr/share/fonts/Iosevka/Iosevka.tar.xz -C /usr/share/fonts/Iosevka/
sudo rm -rf /usr/share/fonts/Iosevka/Iosevka.tar.xz /usr/share/fonts/Iosevka/*.md
sudo apt update
xargs sudo apt install <dwmlpkgs.txt
sleep 0.6; xdotool key 'Return' | curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash
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
fc-cache -f -v
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
./gwml.sh
./Jdownloader2.sh
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
sudo zig build
sudo zig build installsystemd
sudo systemctl enable ly.service -f
sudo systemctl disable getty@tty2.service
cd -
./dwmlrmvpkgs.sh
