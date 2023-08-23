#!/usr/bin/env zsh


is_active=$(echo $TMUX)


fzf_dir=$(find ~ -type d -iname "*.git"| fzf --prompt="open git dir: " )
if [ -z "$fzf_dir" ] ; then
    exit
fi

git_directory=$(dirname "$fzf_dir")

if [ -z "$is_active" ]; then
    lazygit -p $git_directory
else
    current_session_name=$(tmux display-message -p '#S')
    latest_window=$(tmux list-windows -t $current_session_name | tail -n1 | awk -F":" '{ print $1 }')
    # tmux select-window -t $current_session_name:$latest_window 
    lazygit -ucf ~/.config/lazygit/config.yml -p $git_directory
fi
exit



