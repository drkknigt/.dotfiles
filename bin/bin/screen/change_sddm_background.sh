#!/usr/bin/env zsh

# this script is used to change the background at the sddm login screen

# choose wallpaper
choosen_wallpaper="$(fdfind '.+\.(jpg|jpeg)$'  ~/Pictures  | fzf --cycle --prompt='Wallpaper for sddm: ' --bind "tab:execute(imv {} >/dev/null)")"

# exit if no wallpaper is choosen
if [ -z "$choosen_wallpaper" ]; then
    exit
fi

# set wallpaper
cp $choosen_wallpaper ~/sugar-dark/Background.jpg -f
sudo cp ~/sugar-dark/ /usr/share/sddm/themes/ -rf

