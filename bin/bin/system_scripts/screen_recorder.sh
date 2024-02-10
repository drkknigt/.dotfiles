#!/usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'

choose_directory=$(find $HOME -maxdepth 4 -type d | fzf --prompt="choose directory to save: ")
if [ -z "$choose_directory" ]; then
    exit
fi
date_now=$(date +"%F-%H-%M-%S")
file_name="file-$date_now"
device=$(pactl list sources | grep Name |  fzf --prompt="choose audio service: " | cut -d ":" -f2)
if [ -z "$device" ]; then
    exit
fi
echo "directory choosen: $choose_directory/$file_name"
echo "audio device choose: $device \n"
swaymsg move container to workspace 9
if [ "$1" = "s" ]; then
    wf-recorder --audio="$device" -f "$choose_directory/$file_name.mp4"
else
    geometry=$(slurp)
    if [[ "$?" = "0" ]]; then
        wf-recorder --audio="$device" -g "$geometry" -f "$choose_directory/$file_name.mp4"
    fi
    echo "no geometry coordinates selected"
    exit
fi
