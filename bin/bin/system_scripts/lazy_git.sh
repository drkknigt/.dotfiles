#!/usr/bin/env zsh

source ~/.zshrc

git_directory=$(find ~ -type d -iname .git | fzf --prompt="open git dir: "  | awk -F".git" '{ print $1 }')
lazygit -p $git_directory
