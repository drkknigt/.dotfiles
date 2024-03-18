#!/usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH

selected_wifi=$(nmcli dev wifi list --rescan yes | fzf --prompt='Connect wifi: ')
if [ -z "$selected_wifi" ] 
then exit
fi

if [[ "$(echo $selected_wifi | awk '{ print $1 }')" = "*" ]]; then
    echo "already connected"
    exit
fi

current_wifi=$(echo $selected_wifi | xargs | awk -F"Infra" '{ print $1 }' | awk '{ sub(/^[^ ]+/,""); print }' | sed 's/^ *//;s/ *$//')

nmcli dev wifi connect $current_wifi > /dev/null
