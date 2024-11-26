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
if [ -z "$selected_wifi" ] 
then exit
fi

# exit if wifi is already connected to the same wifi
if [[ "$(echo $selected_wifi | awk '{ print $1 }')" = "*" ]]; then
    echo "already connected"
    exit
fi


# connect to the ssid choosen
current_wifi=$(echo $selected_wifi | xargs | awk -F"Infra" '{ print $1 }' | awk '{ sub(/^[^ ]+/,""); print }' | sed 's/^ *//;s/ *$//')

nmcli dev wifi connect $current_wifi > /dev/null
