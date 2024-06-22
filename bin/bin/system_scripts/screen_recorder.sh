#!/usr/bin/env zsh

# This script is used to record screen

# choose directory where the video will be saved
choose_directory=$(find $HOME -maxdepth 4 -type d | fzf --prompt="choose directory to save: ")

# exit if choose_directory is empty
if [ -z "$choose_directory" ]; then
    exit
fi

# store current date
date_now=$(date +"%F-%H-%M-%S")

# make file name with current date
file_name="file-$date_now"

# select audio device used to record the audio 
device=$(pactl list sources | grep Name |  fzf --prompt="choose audio service: " | cut -d ":" -f2)

# Exit if no audio device is selected
if [ -z "$device" ]; then
    exit
fi

echo "directory choosen: $choose_directory/$file_name"
echo "audio device choose: $device \n"

# move the terminal recording the screen to workspace 9
swaymsg move container to workspace 9

# if 1st argument to the script is 1 then record the whole screen
if [ "$1" = "s" ]; then
    wf-recorder --audio="$device" -f "$choose_directory/$file_name.mp4"
    
# else record by selecting the screen using slurp
else
    geometry=$(slurp)
    if [[ "$?" = "0" ]]; then
        wf-recorder --audio="$device" -g "$geometry" -f "$choose_directory/$file_name.mp4"
    fi
    echo "no geometry coordinates selected"
    exit
fi
