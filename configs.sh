#!/bin/sh

echo "
 ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ ███████╗
██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ ██╔════╝
██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗███████╗
██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║╚════██║
╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝███████║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝
                                                       "
                                                       
# Dash setup
echo "Setting up dash..."
sudo ln -sfT /bin/dash /bin/sh
readlink /bin/sh
echo "

Done!

"

# Configs
echo "Copying configs...."
cp -r ~/dots/main/.config/ ~/  #dotfiles
cp -r ~/dots/main/.themes/ ~/  #gtk themes
cp -r ~/dots/main/.icons/ ~/  #cursors
cp -r ~/dots/main/.local/ ~/

cp -r ~/dots/main/Pictures ~/
echo "

Done!

"
sudo touch /etc/auto-cpufreq.conf
sudo sh -c "echo 'ideapad_laptop_conservation_mode = true' >> /etc/auto-cpufreq.conf"

# Executable Permission
#echo "Setting up permissions"
#cd ~/.local/bin
#sudo chmod +x volnotification
#sudo chmod +x volmutenotification
#echo "Done!"

# Extras
echo "Copying extra configs...."
cp -r ~/dots/extras/.config ~/  #extras for applications
cp -r ~/dots/extras/.local ~/  #same as above
echo "

Copied Files Sucesfully

"

# Micro plugins
echo "Installing plugins for micro..."
micro -plugin install runit
micro -plugin install palettero
micro -plugin install cheat
micro -plugin install lsp
micro -plugin install manipulator
echo "

Done!

"

# Spicetify
echo "Installing spicetify...."
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh  #marketplace
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
echo "

Done! Please ensure to run Spotify first, and then run 'spicetify backup apply' without quotes.

"

# Themeing
echo "
████████╗██╗  ██╗███████╗███╗   ███╗███████╗██╗███╗   ██╗ ██████╗ 
╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝██║████╗  ██║██╔════╝ 
   ██║   ███████║█████╗  ██╔████╔██║█████╗  ██║██╔██╗ ██║██║  ███╗
   ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  ██║██║╚██╗██║██║   ██║
   ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗██║██║ ╚████║╚██████╔╝
   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                                                                  "
# Grub
echo "Setting up grub theme..."
sudo pacman -S --noconfirm  os-prober efibootmgr grub  #checking
sudo rm -r /etc/default/grub
sudo cp -r ~/dots/main/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "

Done!

"

# Catppuccin themeing
echo "Setting up sddm and gtk themeing..."
sudo rm -r /etc/sddm.conf  #sddm
sudo cp -r ~/dots/main/sddm.conf /etc/
echo "

Done!

"

# gsettings
gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-mocha-mauve'
gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 10'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 10'
gsettings set org.gnome.desktop.interface font-name 'Sans 10'
gsettings set org.gnome.desktop.interface cursor-theme 'Catppuccin-Mocha-Mauve'
gsettings set org.gnome.desktop.interface cursor-size '24'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

# NVIDIA
echo "
███╗   ██╗██╗   ██╗██╗██████╗ ██╗ █████╗ 
████╗  ██║██║   ██║██║██╔══██╗██║██╔══██╗
██╔██╗ ██║██║   ██║██║██║  ██║██║███████║
██║╚██╗██║╚██╗ ██╔╝██║██║  ██║██║██╔══██║
██║ ╚████║ ╚████╔╝ ██║██████╔╝██║██║  ██║
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝
                                         "
echo "

WARNING - NVIDIA drivers are unstable and may likely result in some issues. Proceed with caution.

"
echo "Setting up NVIDIA drivers..."
sudo sh -c "echo 'options nvidia_drm modeset=1 fbdev=1' >> /etc/modprobe.d/nvidia.conf"
sudo sh -c "echo 'MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)' >> /etc/mkinitcpio.conf"
#sudo rm -r /etc/mkinitcpio.conf
#sudo cp -r ~/dots/main/mkinitcpio.conf /etc/
#sudo rm -r /etc/modprobe.d/nvidia.conf
#sudo cp -r ~/dots/main/nvidia.conf /etc/modprobe.d/
echo "

Done!

"
echo "Rebuilding initramfs..."
sudo mkinitcpio -P
echo "

Done!

"
echo "Setting up NVIDIA services..."
systemctl enable nvidia-suspend.service
systemctl enable nvidia-resume.service
systemctl enable nvidia-hibernate.service
echo "

Done!

"

# zsh
echo "Setting up zsh..."
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi
echo "#(cat ~/.cache/wal/sequences &)  #pywal colors" >> ~/.zshrc
