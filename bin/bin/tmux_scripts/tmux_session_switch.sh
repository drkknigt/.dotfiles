#!/usr/bin/env zsh

# This script is used to switch session in tmux

# exit if tmux is not running
if [ -z "$(tmux ls 2> /dev/null)" ] ; then exit 0 ; fi

session_info=$({ grep 'attached' <(tmux ls); grep -v 'attached' <(tmux ls) })

# select session to switch to
 selected_session=$(echo "$session_info" | cut -d ":" -f 1 | fzf  --cycle --prompt="switch session: " --preview="tmux list-windows -t {}  | batcat --theme='Monokai Extended Origin' --color=always")

# exit if no session is selected
if [ -z $selected_session ] ; then exit 0 ; fi

# if tmux is detached attach to the selected session
if [ -z $TMUX ]; then
     tmux attach -t $selected_session
# switch to tmux session if tmux is active
else
     tmux switch-client -t $selected_session 
fi
