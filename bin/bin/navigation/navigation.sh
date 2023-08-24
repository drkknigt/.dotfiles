#!/usr/bin/env zsh

# source ~/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'

dotfile_flag=$1


if [ "$dotfile_flag" = "0" ] ; then 
    # file_to_open=$(fdfind  ~/.dotfiles --full-path --hidden --type f | fzf --prompt="search from dotfiles: " --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)
    file_to_open=$(find ~/.dotfiles ~/.ansible_sync -type f | fzf --prompt="search from dotfiles: " --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)
elif [ "$dotfile_flag" = "1" ] ; then
    file_to_open=$(find ~ -type f | fzf --prompt="search from home directory: " --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)
elif [ "$dotfile_flag" = "2" ] ; then
    file_to_open=$(find . -type f | fzf --prompt="search from home directory: " --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)
fi
    
if [ -z "$file_to_open" ]; then
    exit
fi

nvim "$file_to_open"
