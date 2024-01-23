#!/usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH
mkdir ~/disk 2> /dev/null

selected_device=$(lsblk -l | fzf --prompt="mount disks: " | cut -d " " -f 1)

if [ -z $selected_device ]; then
    exit
elif grep -qs "/dev/$selected_device"  /proc/mounts; then
    udiskie-umount "/dev/$selected_device"
else
    udiskie-mount "/dev/$selected_device"
fi
