#!/usr/bin/env zsh

# source ~/.zshrc
which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH
file_chosen=$(find ~/Notes -type f | fzf --delimiter / --with-nth -1)
if [ -z $file_chosen ] ; then
    i3-msg workspace back_and_forth
    exit
fi
nvim $file_chosen
