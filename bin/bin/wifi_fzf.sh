#!/usr/bin/env zsh
source ~/.zshrc
#
first=$(nmcli dev wifi list| fzf --prompt='Connect wifi: ')
if [ -z "$first" ] 
then exit
fi
second=$(echo $first | xargs | cut -d ' ' -f1)
if [ ${second} = "*" ] 
then
    echo "exit" > /dev/null
else
    nmcli dev wifi connect $(echo $first | xargs | cut -d ' ' -f2) > /dev/null
fi
