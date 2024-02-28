#!/usr/bin/env zsh
# source ~/.zshrc
working_dir=$(pwd)

# set initial variables
alias lf=lfrun
current_dir_flag=$1
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export DE=kde
export DE=gnome

# direcotry to open lf in

if [  "$current_dir_flag" = "0" ] || [ "$current_dir_flag" = "2" ] ; then
direc=$(find ~ -maxdepth 8 -type d  |  fzf --cycle --prompt='change directory: ' --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" )
if [ "$current_dir_flag" = "0" ] ; then
if [  -z "$direc" ] ; then
    exit
fi
fi
fi

# if opened from sxhkd

if [ "$current_dir_flag" = "2" ] ; then
if [  -z "$direc" ] ; then
    i3-msg workspace back_and_forth
    exit
fi
    lfrun "$direc"
    exit
fi

# exit if no fzf option chosen



if [ -z "$TMUX" ] ; then
    if [ "$current_dir_flag" = "0" ] ; then
    lf "$direc"
else
    lf "$working_dir"
    fi
else
    if [ "$current_dir_flag" = "0" ] ; then
    lf "$direc"
else
    lf "$working_dir"
    fi
    exit
fi
