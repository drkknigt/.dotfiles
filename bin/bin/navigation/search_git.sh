#!/usr/bin/env zsh

# Script to search for and open git directories using fzf and lazygit.
# It searches for git repositories within the home directory up to 8 levels deep.

# export FZF_DEFAULT_OPTS='--layout=reverse --border=none -m'

# Search for all git directories
fzf_dir=$(fdfind '.git$' "$HOME" -I -d 8 -t d -H -x dirname {} | \
    fzf --cycle \
        --prompt="Open Git in Lazygit : " \
        --bind="ctrl-o:toggle-preview" \
        --preview="git_info.sh {} | batcat --theme='Monokai Extended Origin' --color=always" \
        --keep-right)

# Exit if no directory is selected
if [ -z "$fzf_dir" ]; then
    exit
fi

lazygit -ucf ~/.config/lazygit/config.yml -p "$fzf_dir"
exit
