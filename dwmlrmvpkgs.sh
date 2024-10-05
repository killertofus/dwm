# please don't run this more then twice :)
pkgToRemoveListFull=""
pkgToRemoveList="emacsen-common dictionaries-common xterm transmission-common telnet x-terminal-emulator mintreport xviewer drawing baobab slick-greeter *cinnamon-* gnome-terminal webapp-manager mint-upgrade-info hexchat-common gnome-calculator celluloid gnome-games gnome-terminal hypnotix hexchat orca xterm nano transmission *libreoffice-* p7zip-full *rhythmbox-* vim-common vim-tiny xterm warpinator yt-dlp yelp"
for pkgToRemove in $(echo $pkgToRemoveListFull); do
  $(dpkg --status $pkgToRemove &> /dev/null)
  if [[ $? -eq 0 ]]; then
    pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
  fi
done
apt --yes --purge remove --allow-remove-essential $pkgToRemoveList
