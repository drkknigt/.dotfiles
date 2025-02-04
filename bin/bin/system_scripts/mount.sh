#!/usr/bin/env zsh

# This script is used to mount devices

# make directory disk in home directory of the user
mkdir ~/disk 2> /dev/null

# select devices from currently connected devices to the system
selected_device=$(lsblk -l | fzf --prompt="mount disks: " | cut -d " " -f 1)

# exit if no selected_device is empty
[[ -z $selected_device ]] && exit

# use udiskie to mount or unmount the selected device
if grep -qs "/dev/$selected_device"  /proc/mounts; then
    udiskie-umount "/dev/$selected_device"
else
    udiskie-mount "/dev/$selected_device"
fi
