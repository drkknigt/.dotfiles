#!/usr/bin/env zsh

# source ~/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
file_chosen=$(find ~/Notes -type f | fzf --delimiter / --with-nth -1)
if [ -z $file_chosen ] ; then
    exit
fi
nvim $file_chosen
