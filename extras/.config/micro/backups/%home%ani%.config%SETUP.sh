#!/bin/bash
cd dotfiles

# Timezone setup
timedatectl set-timezone Asia/Kolkata #replace with yours

# Installing packages
sudo pacman -S amd-ucode zed sddm archlinux-keyring brightnessctl unzip blueman bluez git hyprland rofi-wayland hyprpaper waybar zsh noto-fonts-emoji ttf-jetbrains-mono-nerd ttf-iosevka-nerd nerd-fonts noto-fonts ttf-fira-code ttf-firacode-nerd ttf-font-awesome papirus-icon-theme file-roller gvfs gvfs-mtp thunar-volman thunar-archive-plugin thunar-media-tags-plugin gnome-disk-utility ntfs-3g nvidia nvidia-utils nvidia-settings pipewire-audio pipewire-pulse pipewire-alsa pavucontrol dunst pamixer libcanberra zathura zathura-cb zathura-pdf-mupdf bat zoxide rsync kvantum qt5ct qt6ct nwg-look kvantum-qt5 qt5-quickcontrols2 neofetch mpv micro grim slurp qt6-svg qt6-declarative 

# yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

# yay packages
yay -S iwgtk ttf-poppins sddm-conf-git wl-clipboard wlogout thorium-browser-bin spotify zenity ffmpeg4.4 spicetify-cli qimgv xfce-polkit tumbler

# Spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh #marketplace
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

# NVIDIA
... #have to include config edits
sudo mkinitcpio -P #rebuilding initramfs

# Micro plugins
micro -plugin install runit
micro -plugin install palettero
micro -plugin install cheat
micro -plugin install lsp
micro -plugin install manipulator

# Configs
cp -r .config ~/ #dotfiles
cp -r catpuccin-sddm-mocha /usr/share/sddm/themes/ #SDDM theme
cp -r .themes ~/ #gtk themes
cp -r .local/share/icons ~/.local/share #cursors

# services
systemctl enable iwd blutooth sddm nvidia-suspend.service nvidia-resume.service nvidia-hibernate.service
