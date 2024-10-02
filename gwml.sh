#!/usr/bin/env sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "RANGER_LOAD_DEFAULT_RC=false"
mv themes ~/.local/share
cp -r .config ~/
mv .zshrc ~/
mv icons ~/.local/share
mv .dircolors ~/
sudo mv awesome.desktop /usr/share/xsessions/
mv .xinitrc ~/
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.nemo.preferences show-hidden-files-true
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv zsh-master/lib zsh-master/dracula.zsh-theme ~/.oh-my-zsh/themes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
export ZSH="$XDG_DATA_HOME"/oh-my-zsh
export WINEPREFIX="$XDG_DATA_HOME"/wine
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
