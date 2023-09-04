# please don't run this more then twice :)
pkgToRemoveListFull="  yelp vim-common vim-tiny baobab gnome-online-miners gnome-bluetooth-common gnome-calculator gnome-terminal gnome-settings-daemon-common geary orca gedit-common language-selector-gnome gnome-shell-common  toilet libreoffice-common libreoffice-base-core $DESKTOP_SESSION 'language-pack*' nano gedit gnome-terminal hunspell hyphen pop-desktop pop-shell grim zenity  "
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
sudo apt --yes --purge remove --allow-remove-essential $pkgToRemoveList
