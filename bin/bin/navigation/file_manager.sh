#!/usr/bin/env zsh
# source ~/.zshrc

alias lf=lfrun
current_dir_flag=$1
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=/home/drkknght/go/bin/:$PATH
export PATH=/home/drkknght/usr/bin/:$PATH

if [  "$current_dir_flag" = "0" ] || [ "$current_dir_flag" = "2" ] ; then
direc=$(find ~ -type d |  fzf --cycle --prompt='change directory: ' --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" )
if [  -z "$direc" ] ; then
            exit
fi
fi

if [ "$current_dir_flag" = "2" ] ; then
    lfrun "$direc"
    exit
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





