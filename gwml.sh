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
sudo mv dwm.desktop /usr/share/xsessions/
mv config/.xinitrc ~/
mv config/init.vim ~/.config/nvim/
mv config/alacritty.toml ~/.config/alacritty
mv config/dwm/* ~/.config/dwm
mv config/config.rasi ~/.config/rofi
mv config/picom.conf ~/.config/picom
mv config/tmux.conf ~/.config/tmux
mv config/.zshrc ~/
mv config/plugins config/rc.conf ~/.config/ranger
mv config/.dircolors ~/
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
