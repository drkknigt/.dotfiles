#!/usr/bin/env zsh
# make cache file and source zshrc functions
# source ~/.zshrc
recent_flag=$1
touch ~/.dotfiles/tmux/recent_dirs

# create session in any dir in $HOME
if [ "$recent_flag" = "0" ] ; then
    
selected_directory=$(find ~ -mindepth 1 -maxdepth 6 -type d | fzf --prompt="make-session: "  --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)

# create recently created sessions
elif [ "$recent_flag" = "1" ] ; then
    
selected_directory=$(cat ~/.cache/tmux/recent_dirs | fzf --prompt="make-session: "  --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)

elif [ "$recent_flag" = "2" ]  ; then
    
# create a new dir and then create a session
project_dir=$(find ~/Projects ~/WAY ~/CS ~/CS-course -maxdepth 0 -type d | fzf --prompt='open directories: ' --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --keep-right --preview-window hidden)

if [ -z "$project_dir" ] ; then
    exit
fi

vared -p "Project name: " -c directory
selected_directory="$project_dir"/"$directory"
mkdir -p $selected_directory
elif [ "$recent_flag" = "3" ] ; then
    selected_directory=$(pwd)
else
    exit
fi
    

# exit if session directory is empty
if [ -z "$selected_directory" ]; then clear;exit 0;fi

# create a session name for session

name_first_part=$(basename $(dirname "$selected_directory"))
name_second_part=$(basename "$selected_directory" | tr "." "_")
session_name="${name_first_part}/${name_second_part}"

# check if session is already running
if [ "$session_name" = "$(tmux ls 2> /dev/null | grep 'attached' | cut -d ':' -f 1)" ];
then
    echo "you are already in this session"
    exit 0
fi

# check if tmux already as session you are about to create
tmux has -t "$session_name" > /dev/null
if [ "0" = "$?" ]; then echo "session with this directory already running"; exit 0 ; fi

# check if selected directory is valid
if [ ! -d  "$selected_directory" ]; then echo "not a dir"; exit 0 ; fi

grep -x $selected_directory  ~/.cache/tmux/recent_dirs &> /dev/null

if [ "$?" = "1" ]; then
    echo $selected_directory >> ~/.cache/tmux/recent_dirs
fi



if [ -z "$TMUX" ]; then
    tmux new -s $session_name -c $selected_directory -n Main -d
    tmux setenv PROJECT_ROOT $selected_directory
    tmux new-window -n Terminal -t $session_name -c $selected_directory
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name "export PROJECT_ROOT=$selected_directory" C-m &> /dev/null
    tmux send-keys -t $session_name "clear" C-m &> /dev/null
    tmux send-keys -t $session_name:Main "nvim" C-m
    tmux attach -t $session_name
else
    tmux new -s $session_name -c $selected_directory -n Main -d
    tmux setenv PROJECT_ROOT $selected_directory
    tmux new-window -n Terminal -t $session_name -c $selected_directory
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name "export PROJECT_ROOT=$selected_directory" C-m &> /dev/null
    tmux send-keys -t $session_name "clear" C-m &> /dev/null
    tmux send-keys -t $session_name:Main "nvim" C-m
    tmux switch-client -t $session_name
fi
