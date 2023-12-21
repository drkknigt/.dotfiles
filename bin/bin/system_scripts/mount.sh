#!/usr/bin/env zsh
# source /home/drkknght/.zshrc

export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=/home/drkknght/.local/bin/:$PATH
mkdir ~/disk 2> /dev/null

selected_device=$(lsblk -l | fzf --prompt="mount disks: " | cut -d " " -f 1)

if [ -z $selected_device ]; then
    exit
elif grep -qs "/dev/$selected_device"  /proc/mounts; then
    sudo umount "/dev/$selected_device" ~/disk
else
    sudo mount "/dev/$selected_device" ~/disk
fi
