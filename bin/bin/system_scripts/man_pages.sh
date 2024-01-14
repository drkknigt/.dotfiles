#!/usr/bin/env zsh
which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH
choosen_page=$(man -k . | fzf --prompt="man pages: " | awk -F" " '{ print $1 }')
if [ -z "$choosen_page" ]; then
    exit
fi
man "$choosen_page"
