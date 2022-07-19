#!/usr/bin/env zsh
source /home/drkknght/.zshrc

selected_device=$(lsblk -l | fzf | cut -d " " -f 1)

if [ -z $selected_device ]; then
    exit
elif grep -qs "/dev/$selected_device"  /proc/mounts; then
    sudo umount "/dev/$selected_device" /media/drkknght/disk/ 
else
    sudo mount "/dev/$selected_device" /media/drkknght/disk/ 
fi
