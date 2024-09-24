#!/usr/bin/env sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "RANGER_LOAD_DEFAULT_RC=false"
mv .themes ~/
cp -r .config ~/
mv .icons ~/
mv .zshrc ~/
mv .dircolors ~/
sudo mkdir -p /usr/share/xsessions
sudo mv dwm.desktop /usr/share/xsessions/
mv .xinitrc ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv zsh-master/lib zsh-master/dracula.zsh-theme ~/.oh-my-zsh/themes
rm -rf master.zip
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
~/.tmux/plugins/tpm/scripts/install_plugins.sh
make -C ~/.config/dwm/ clean
sudo make -C ~/.config/dwm/ clean install
make -C ~/.config/dwm/slstatus/ clean
sudo make -C ~/.config/dwm/slstatus/ clean install
