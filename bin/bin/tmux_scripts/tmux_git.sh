#!/usr/bin/env zsh


is_active=$(echo $TMUX)


git_directory=$(dirname $(find ~ -type d -iname "*.git"| fzf --prompt="open git dir: " ) 2> /dev/null) 
if [ -z "$git_directory" ] ; then
    exit
fi

if [ -z "$is_active" ]; then
    lazygit -p $git_directory
else
    current_session_name=$(tmux display-message -p '#S')
    latest_window=$(tmux list-windows -t $current_session_name | tail -n1 | awk -F":" '{ print $1 }')
    # tmux select-window -t $current_session_name:$latest_window 
    lazygit -ucf ~/.config/lazygit/config.yml -p $git_directory
fi
exit



