#!/usr/bin/env zsh
which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH

choosen_wallpaper="$(fdfind '.+\.(jpg|jpeg)$'  ~/Pictures  | fzf --cycle --prompt='Wallpaper for sddm: ' --bind "tab:execute(swayimg {} >/dev/null)")"
if [ -z "$choosen_wallpaper" ]; then
    exit
fi
cp $choosen_wallpaper ~/sugar-dark/Background.jpg -f
sudo cp ~/sugar-dark/ /usr/share/sddm/themes/ -rf

