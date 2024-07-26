#!/bin/bash

# This script is used to create a new project inside tmux and then start a tmux session in it

selected_directory=$(fdfind . ~ --type d -d 4 -H | fzf --cycle --prompt="choose directory: ")



# make cache file 
recent_flag=$1
mkdir ~/.cache/tmux -p
touch ~/.cache/tmux/recent_dirs

if [[ -z $selected_directory ]] ; then exit ; fi

read -p "Enter root directory: " root_directory
if [[ -d "$selected_directory$root_directory" ]] ; then
    echo "directory already exits"
    exit
fi
read -p "Enter directory structure: " directory_structure



directory_structure=$(echo $directory_structure | tr ' ' '\n')

for i in $directory_structure; do
    if [[ $i == */ ]]; then
        mkdir -p "$selected_directory$root_directory/$i"
        echo "this is working"
    else
        directory=$(dirname $i)
        file_name=$(basename $i)
        mkdir -p "$selected_directory$root_directory/$directory"
        touch "$selected_directory$root_directory/$directory/$file_name"
    fi
done

# create a session name for session
selected_directory="$selected_directory$root_directory"

name_first_part=$(basename $(dirname "$selected_directory"))
name_second_part=$(basename "$selected_directory" | tr "." "_")
session_name="${name_first_part}/${name_second_part}"

# check if tmux already as session you are about to create
tmux has -t "$session_name" > /dev/null
if [ "0" = "$?" ]; then echo "session with this directory already running"; exit 0 ; fi


# write the session to cache tmux file
grep -x $selected_directory  ~/.cache/tmux/recent_dirs &> /dev/null

if [ "$?" = "1" ]; then
    echo $selected_directory >> ~/.cache/tmux/recent_dirs
fi


# make session
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
