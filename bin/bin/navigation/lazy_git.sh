#!/usr/bin/env zsh

source ~/.zshrc

git_directory=$(dirname "$(find ~ -type d -iname "*.git"| fzf --prompt="open git dir: "  )")
lazygit -p $git_directory
