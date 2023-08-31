# please don't run this more then twice :)
pkgToRemoveListFull=" emacsen-common dictionaries-common transmission-common telnet $DESKTOP_SESSION baobab slick-greeter gnome-terminal webapp-manager hexchat-common gnome-calculator celluloid gnome-games gnome-terminal hypnotix nemo hexchat orca xterm nano transmission libreoffice-base-core libreoffice-common p7zip-full rhythmbox-tray-icon rhythmbox-data rhythmbox-plugins snapd snap rhythmbox vim-common vim-tiny xterm warpinator youtube-dl yelp 'gnome*' 'mint*'"
pkgToRemoveList=""
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove --allow-remove-essential $pkgToRemoveList
