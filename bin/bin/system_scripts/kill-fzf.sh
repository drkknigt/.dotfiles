var=$TMUX
if [ -z "$var" ]
then 
    echo "NO active tmux session running"
else 
    tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux kill-session -t 
    tmux attach
fi

