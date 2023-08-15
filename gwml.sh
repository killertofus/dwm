#!/usr/bin/env sh
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/awesome
mkdir -p ~/.config/rofi
mkdir -p ~/.config/picom
mkdir -p ~/.oh-my-zsh/themes/lib
cd config
mv init.vim ~/.config/nvim/
mv alacritty.yml ~/.config/alacritty/
mv rc.lua theme ~/.config/awesome
mv rofi.rasi ~/.config/rofi
mv picom.conf ~/.config/picom

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv /lib dracula.zsh-theme ~/oh-my-zsh/themes/lib
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
znap pull
