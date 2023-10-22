#!/usr/bin/env sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
wget https://github.com/dracula/qbittorrent/raw/master/dracula.qbtheme
echo "RANGER_LOAD_DEFAULT_RC=false"
mkdir -p ~/.themes
mv dracula.qbtheme ~/.themes
git clone https://github.com/dracula/gtk
mv gtk/gtk-4.0 ~/.themes
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/dwm
mkdir -p ~/.config/rofi
mkdir -p ~/.config/picom
mkdir -p ~/.config/ranger
mkdir -p ~/.config/tmux
mv wallpaper.jpg ~/.config/dwm/wallpaper.jpg
cd config
mv init.vim ~/.config/nvim/
sudo mv dwm.desktop /usr/share/xsessions/
mv .xinitrc ~/
mv alacritty.yml ~/.config/alacritty
mv config1.rasi ~/.config/rofi
mv picom.conf ~/.config/picom
mv tmux.conf ~/.config/tmux
mv .dircolors ~/
mv dwm/* ~/.config/dwm
mv plugins rc.conf ~/.config/ranger
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv lib dracula.zsh-theme ~/.oh-my-zsh/themes
rm -rf master.zip
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
make -C ~/.config/dwm/ clean
sudo make -C ~/.config/dwm/ clean install
make -C ~/.config/dwm/slstatus/ clean
sudo make -C ~/.config/dwm/slstatus/ clean install
