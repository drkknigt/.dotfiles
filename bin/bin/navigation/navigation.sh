#!/usr/bin/env zsh

# This script is used to search for files in terminal fast and then open that file in nvim

# source ~/.zshrc
export PATH=$HOME/.local/bin/:$PATH
current_dir=$(pwd)

dotfile_flag=$1


if [ "$dotfile_flag" = "0" ] ; then 

    # search files in ansible_sync and .dotfiles and arch-pul
    file_to_open=$(fdfind . ~/.dotfiles ~/.ansible_sync ~/arch-pull --type f -H | fzf --prompt="search from dotfiles: " --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)
elif [ "$dotfile_flag" = "1" ] ; then

    # search files from home directory
    file_to_open=$(fdfind . ~ --type f -H | fzf --prompt="search from home directory: " --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)
elif [ "$dotfile_flag" = "2" ] ; then

    # search files in the current directory
    file_to_open=$(fdfind . $current_dir  --type f -H | fzf --prompt="search from current directory: " --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)
fi
    # exit if no Directory is selected 
if [ -z "$file_to_open" ]; then
    exit
fi

# open selected file in nvim
nvim "$file_to_open"
