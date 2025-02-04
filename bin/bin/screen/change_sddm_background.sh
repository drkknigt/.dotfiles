#!/usr/bin/env zsh

# this script is used to change the background at the sddm login screen

# choose wallpaper
choosen_wallpaper="$(fdfind '.+\.(jpg|jpeg)$' ~/Pictures | \
    fzf --cycle \
    --prompt='Wallpaper for sddm: ' \
    --bind "tab:execute(swaymsg output ${monitor} bg {} fill &> /dev/null ),ctrl-o:toggle-preview+execute-silent(kitty +kitten icat --clear --stdin no --silent --transfer-mode file </dev/null >/dev/tty)" \
    --preview="preview_fzf.sh {}")"

# exit if no wallpaper is choosen
if [ -z "$choosen_wallpaper" ]; then
    notify-send "Error" "No wallpaper choosen for login screen" --icon=dialog-warning
    exit
fi

# set wallpaper
cp $choosen_wallpaper ~/sugar-dark/Background.jpg -f
sudo cp ~/sugar-dark/ /usr/share/sddm/themes/ -rf

