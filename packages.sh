#!/bin/sh

# Installing packages
echo "
██████╗  █████╗  ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗███████╗
██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝
██████╔╝███████║██║     █████╔╝ ███████║██║  ███╗█████╗  ███████╗
██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══██║██║   ██║██╔══╝  ╚════██║
██║     ██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝███████╗███████║
╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
                                                                 "
echo "Installing essential packages..."
sudo pacman -S --noconfirm  sddm archlinux-keyring unzip blueman bluez git iwd dhcpcd dash  #IMPORTANT
echo "

Done!

"
echo "Installing hyprland..."
sudo pacman -S --noconfirm  hyprland hyprlock xdg-desktop-portal-hyprland xdg-desktop-portal-gtk swww rofi-wayland waybar wl-clip-persist wl-clipboard cliphist swaync brightnessctl blueman pavucontrol kitty #window manager and related programs
echo "

Done!

"
echo "Installing fonts..."
sudo pacman -S --noconfirm  zsh noto-fonts-emoji ttf-jetbrains-mono-nerd ttf-iosevka-nerd ttf-fira-code ttf-firacode-nerd ttf-font-awesome ttf-0xproto-nerd ttf-agave-nerd ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-dejavu-nerd ttf-fira-code ttf-firacode-nerd ttf-font-awesome ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-iosevkatermslab-nerd ttf-jetbrains-mono-nerd ttf-liberation-mono-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-noto-nerd ttf-roboto-mono-nerd ttf-space-mono-nerd ttf-ubuntu-mono-nerd ttf-ubuntu-nerd noto-fonts-cjk
echo "

Done!

"
echo "Installing themeing related packages..."
sudo pacman -S --noconfirm  papirus-icon-theme kvantum nwg-look kvantum-qt5 qt5-wayland qt5-quickcontrols2 qt6-svg qt6-declarative  #themeing
echo "

Done!

"
echo "Installing file manager and disk manager..."
sudo pacman -S --noconfirm  file-roller gvfs gvfs-mtp gnome-disk-utility ntfs-3g xorg-xhost gparted  #archive manager and gnome disks
#sudo pacman -S --noconfirm  thunar-volman thunar-archive-plugin thunar-media-tags-plugin  #thunar
sudo pacman -S --noconfirm  nemo-fileroller nemo-preview nemo-share  #nemo
echo "

Done!

"
echo "Installing NVIDIA drivers..."
sudo pacman -S --noconfirm  nvidia-dkms nvidia-utils  #nvidia
echo "

Done!

"
echo "Installing audio packages (pipewire)..."
sudo pacman -S --noconfirm  pipewire-audio pipewire-pulse pipewire-alsa pavucontrol dunst pamixer libcanberra  #audio and notifications
echo "

Done!

"
echo "Installing common utilities..."
sudo pacman -S --noconfirm  qbittorrent obs-studio syncthing converseen obsidian gnome-calculator evince zathura zathura-cb zathura-pdf-poppler bat zoxide fastfetch mpv micro  #programs
echo "

Done!

"

# chaotic-aur install
sudo pacman -S --noconfirm wlogout tumbler grimblast-git qimgv-git spotify vesktop ffmpeg4.4 spicetify-cli spicetify-marketplace-bin tauon-music-box catppuccin-mocha-grub-theme-git catppuccin-cursors-mocha qt6-svg qt6-declarative pfetch  #chaotic-aur

# yay install
echo "
██╗   ██╗ █████╗ ██╗   ██╗
╚██╗ ██╔╝██╔══██╗╚██╗ ██╔╝
 ╚████╔╝ ███████║ ╚████╔╝ 
  ╚██╔╝  ██╔══██║  ╚██╔╝  
   ██║   ██║  ██║   ██║   
   ╚═╝   ╚═╝  ╚═╝   ╚═╝   
                          "
echo "Installing yay (aur helper)"
sudo pacman -S --needed --noconfirm  git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

# yay packages (all)
#echo "Installing extra hyprland packages..."
#yay -S --noconfirm  iwgtk ttf-poppins clipse wlogout xfce-polkit tumbler grimblast-git  #required
#echo "${green}Done${clear}!"
#echo "Installing more common utilities..."
#yay -S --noconfirm  notion-app-electron morgen-bin qimgv spotify vesktop thorium-browser-bin spotify zenity ffmpeg4.4 spicetify-cli tauon-music-box cursor-appimage zen-browser-avx2-bin  #programs
#yay -S --noconfirm  r-quick-share vscodium microsoft-teams-nativefier  # Hard to install
#echo "${green}Done${clear}!"
#echo "Installing theme packages..."
#yay -S --noconfirm  catppuccin-mocha-grub-theme-git catppuccin-sddm-theme-mocha qt6-svg qt6-declarative pywal-16-colors pfetch  #themeing
#echo "${green}Done${clear}!"

# yay packages (excluding chaotic aur packages)
echo "Installing extra packages..."
yay -S --noconfirm iwgtk ttf-poppins clipse xfce-polkit notion-app-electron morgen-bin thorium-browser-bin cursor-appimage pywal-16-colors zen-browser-avx2-bin	
echo "

Done!

"
echo "Removing unused dependencies..."
yay --noconfirm -Yc
echo "

Done!

"

# auto-cpufreq
echo "Installing auto-cpufreq..."
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo auto-cpufreq --install
echo "

Done!

"

# services
echo "Enabling system utilities..."    
sudo systemctl enable iwd dhcpcd sddm bluetooth
echo "

Done!

"

# cleaning up
sudo rm -r ~/dots/yay-bin/
sudo rm -r ~/dots/auto-cpufreq/
