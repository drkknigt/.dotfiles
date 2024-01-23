#!/usr/bin/env zsh

# source ~/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/go/bin/:$PATH
export PATH=$HOME/.local/bin/:$PATH

git_directory=$(dirname "$(find ~ -type d -iname "*.git"| fzf --prompt="open git dir: "  )")
lazygit -p $git_directory
