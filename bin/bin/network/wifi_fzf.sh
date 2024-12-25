#!/usr/bin/env zsh


# script used to connect to the internet using wifi

# exit script if nmcli is not found
if ! command -v nmcli 2>&1 >/dev/null; then
    notify-send  "Nmcli not found " "script will exit" --icon=dialog-information
    exit 1
fi

# select the wifi ssid to connect to
selected_wifi=$(nmcli dev wifi list --rescan yes | fzf --prompt='Connect wifi: ')

# exit if no wifi is selected
[[ -z "$selected_wifi" ]] && exit

# exit if wifi is already connected to the same wifi
if [[ "$(echo $selected_wifi | awk '{ print $1 }')" = "*" ]]; then
    notify-send "already connected to this network"
    exit
fi


# connect to the network choosen
current_wifi=$(echo $selected_wifi | awk '{ print $1 }')

nmcli dev wifi connect $current_wifi > /dev/null
