#!/usr/bin/env zsh
# source ~/.zshrc
which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH
#
selected_wifi=$(nmcli dev wifi list| fzf --prompt='Connect wifi: ')
if [ -z "$selected_wifi" ] 
then exit
fi

active_flag=$(echo $selected_wifi | xargs | awk -F" " '{ print $4 }')
echo $active_flag
if [ ${active_flag} = "*" ] 
then
    echo "exit" > /dev/null
else
    nmcli dev wifi connect $(echo $selected_wifi | xargs | cut -d ' ' -f2) > /dev/null
fi
