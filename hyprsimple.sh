#!/usr/bin/bash

echo "
  _                                              _      
 | |                         o                  | |     
 | |            _   ,_    ,      _  _  _     _  | |  _  
 |/ \   |   | |/ \_/  |  / \_|  / |/ |/ |  |/ \_|/  |/  
 |   |_/ \_/|/|__/    |_/ \/ |_/  |  |  |_/|__/ |__/|__/
           /|/|                           /|            
           \|\|                           \|            
"

# chaotic-aur setup
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

#sudo rm -r /etc/pacman.conf
#sudo cp -r ~/dots/main/pacman.conf /etc/
sudo sh -c "echo '
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf"
sudo pacman -Syyuu --noconfirm

# next scripts
/bin/sh ~/dots/packages.sh
/bin/sh ~/dots/configs.sh
