#!/usr/bin/env zsh


# script used to connect to the internet using wifi


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
