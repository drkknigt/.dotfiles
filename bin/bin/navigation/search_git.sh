#!/usr/bin/env zsh


# this script searches for all git directory from home directory until 8  directory depths

# search for all directories that are git initialized
fzf_dir=$(fdfind '.git$' "$HOME" -I -d 8 -t d -H -x dirname {} |  fzf --cycle --prompt='open git dir: '  --bind "ctrl-o:toggle-preview" --preview="git_info.sh {}| batcat --theme='Monokai Extended Origin' --color=always" --keep-right ) 

# exit if fzf_dir is empty variable
if [ -z "$fzf_dir" ] ; then
    exit
fi


# if tmux is not active then open the selected directory in lazygit 
if [ -z "$TMUX" ]; then
    lazygit -p $fzf_dir
else
    
    # if tmux is active then open the selected directory in lazygit  in a new window 
    current_session_name=$(tmux display-message -p '#S')
    latest_window=$(tmux list-windows -t $current_session_name | tail -n1 | awk -F":" '{ print $1 }')
    # tmux select-window -t $current_session_name:$latest_window 
    lazygit -ucf ~/.config/lazygit/config.yml -p $fzf_dir
fi
exit



