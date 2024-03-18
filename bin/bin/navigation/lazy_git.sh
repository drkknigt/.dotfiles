#!/usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'

directory_name=$(find ~ -type d -iname "*.git"| fzf --prompt="open git dir: "  )
git_directory=$(dirname "$directory_name")
lazygit -p $git_directory
