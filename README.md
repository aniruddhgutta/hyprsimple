## Screenshots
![Screenshots](https://raw.githubusercontent.com/aniruddhgutta/hyprsimple/master/main/Pictures/Screenshots/catppuccin-setup_1.png)

![Screenshots](https://raw.githubusercontent.com/aniruddhgutta/hyprsimple/master/main/Pictures/Screenshots/catppuccin-setup_4.png)

![Screenshots](https://raw.githubusercontent.com/aniruddhgutta/hyprsimple/master/main/Pictures/Screenshots/catppuccin-setup_2.png)

![Screenshots](https://raw.githubusercontent.com/aniruddhgutta/hyprsimple/master/main/Pictures/Screenshots/alternate-setup.png)


## Overview
This rice aims to provide a **simple** and **comfy** hyprland setup (**especially for new users)** made for and by a new arch user (had to throw it in there). It includes all the essential packages along with a few which I use (can be excluded) which provide for a clean DE.  The key feature here is the fact that most of the configs are **very close to default/are well documented** (there are of course a few exceptions like swaync) so you can easily comprehend what's happening in any config/script.
I highly recommend for you to **check out all the configs** and just go through them once, because even if you do not understand what's happening, it'll give you a better idea if at all something breaks and you want to fix it.

***NOTE:*** A huge amount of **wallpapers** (*~400 in total:* 200 regular with 200 extra catppuccin) are included and can be cycled through using the hotkey - SUPER + W. Other keybindings are listed below.

## Keybinds
Below I've included some common keybinds. I  recommend you to go through the hyprland.conf to checkout the rest of the keybinds and also recommend you checkout the waybar config file to checkout what clicking each of the modules does.

Programs -
* App Launcher: SUPER + Space
* Logout menu: SUPER + R
* Lock: SUPER + Shift + R
* File Manager: SUPER + E
* Terminal: SUPER + Return/Enter
* Browser: SUPER + B
* Notification center: SUPER + S
* Clipboard: SUPER + C

Scripts -
* Waybar reload: SUPER + Shift + W
* Wallpaper switching: SUPER + W

Media/Brightness -
* Increase/decrease volume: SUPER + Up/Down Arrow 
* Mute volume: SUPER + Left/Right Arrow
* Increase/decrease screen brightness: SUPER + Alt + Up/Down Arrow
* Increase/decrease keyboard brightness: SUPER + Left/Right Arrow
* Pause/unpause media: SUPER + Shift +  Up/Down Arrow 
* Skip-next media: SUPER + Shift +  Right Arrow 
* Skip-previous media SUPER + Shift +  Left Arrow 

Screenshots -
* Screenshot (copy) with area selection: SUPER + Shift + S
* Screenshot (save) with area selection: SUPER + Alt + S
* Screenshot (save) entire screen: SUPER + Shift + D

General -
* Toggle floating:  SUPER + V
* Kill window: SUPER + Q
* SDDM: SUPER + M
* Scratchpads: SUPER + X/A/Z

## Packages
Themeing -
- **GTK and QT theme**: catppuccin-mocha-mauve
- **Icon theme**: papirus
- **Fonts**: poppins, jetbrains mono nerd
- **Cursors**: catppuccin-mocha-mauve

Programs -
* **Media viewer**: qimgv, mpv
* **PDF**: zathura, evince
* **Music player**: tauon music box
- **File manager**: thunar
- **Code editor**: Cursor
- **Browser**: zen (firefox fork), thorium (chromium fork)
- **Terminal**: kitty, micro (terminal text editor)
- **Extras**: notion, morgen, obsidian, vesktop (discord+vencord), timeshift, gnome disks, gnome calculator, btop, obs

Utilities -
- **Bar**: waybar
- **Launcher**: rofi-wayland
- **Clipboard**: wl-clip-persist, clipse
- **Fetch**: pfetch
- **Wallpapers**: swww, pywal
- **Extras**: iwgtk (wifi), blueman (bluetooth), nwg-look (gui for gtk themeing), auto-cpufreq (battery optimisations), pavucontrol (audio settings)

## Installation
> [!IMPORTANT]
The install script is still a work in progress and is catered to my device, so I highly recommend you to look into the configs and packages and remove whatever is unnecessary (like nvidia drivers or auto-cpufreq if you're on a desktop).

As of right now, the hyprsimple.sh script hasn't been tested yet, so to use the "install script", simply do the following:

```shell
cd ~/
git clone https://github.com/aniruddhgutta/hyprsimple.git ~/dots
cd ~/dots  
sudo chmod +x ~/dots/packages.sh  #making the packages install script executable
sudo chmod +x ~/dots/configs.sh  #making the configs install script executable
./packages.sh  #installs all the packages
./configs.sh  #copies the configs, only run after the package script is completed
```

The *packages.sh* script - 
* installs the required packages
* yay (aur helper) 
* auto-cpufreq (automatic battery optimisations for laptops)
* enables system services

The *configs.sh* script - 
* copies over the configs
* edits auto-cpufreq config to include conservation mode for ideapad laptops like mine
* copies the wallpapers (huge amount of walls)
* installs spicetify
* sets up the theme for grub (bootloader), sddm (display/login manager) and GTK themeing (QT themeing is handled by kvantum which is in the configs)
* sets up NVIDIA drivers
* sets up the zsh shell

***NOTE***: There are three different folders in the repo -
* **Main**: contains the absolute essentials for a simple hyprland config
* **Extras**: contains (very few) extra configs for stuff like mpv, qimgv, etc)
* **Archived**: contains previously used configs and/or broken ones for reference/backups

*As convenient as it sounds, I'm not the best at making scripts because I'm new to all of this, so I recommend manually installing the packages and copying the configs by referencing the scripts mentioned above:*
```shell
#Run the following commands after installing the required packages...
cd ~
git clone https://github.com/aniruddhgutta/hyprsimple.git dots
cp -r ~/dots/main/.config/ ~/
cp -r ~/dots/main/.local/ ~/
cp -r ~/dots/main/.themes/ ~/
cp -r ~/dots/main/.icons/ ~/
cp -r ~/dots/main/Pictures ~/
```

## TODO
- [ ] Neovim
- [ ] Install script
- [ ] Chatoic AUR setup and migrating all aur packages
- [ ] Pywal
