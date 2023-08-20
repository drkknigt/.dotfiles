#!/usr/bin/env zsh
current_dir_flag=$1

if [  "$current_dir_flag" = "0" ] ; then
direc=$(find ~ -type d |  fzf --cycle --prompt='change directory: ' --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" )
if [  -z "$direc" ] ; then
            exit
fi
fi

if [ -z "$TMUX" ] ; then
    if [ "$current_dir_flag" = "0" ] ; then
    lf "$direc"
else
    lf .
    fi
else
    if [ "$current_dir_flag" = "0" ] ; then
    lf "$direc"
else
    lf .
    fi
    exit
fi





