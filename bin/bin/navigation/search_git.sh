#!/usr/bin/env zsh


export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'


# fzf_dir=$(find ~ -maxdepth 8 -type d -iname "*.git"| fzf --prompt="open git dir: " )
fzf_dir=$(find ~ -maxdepth 8 -type d -iname "*.git" -exec dirname {} \;|  fzf --cycle --prompt='open git dir: '  --bind "ctrl-o:toggle-preview" --preview="git_info.sh {}| batcat --theme='Monokai Extended Origin' --color=always" --keep-right )
if [ -z "$fzf_dir" ] ; then
    exit
fi

# git_directory=$(dirname "$fzf_dir")

if [ -z "$TMUX" ]; then
    lazygit -p $fzf_dir
else
    current_session_name=$(tmux display-message -p '#S')
    latest_window=$(tmux list-windows -t $current_session_name | tail -n1 | awk -F":" '{ print $1 }')
    # tmux select-window -t $current_session_name:$latest_window 
    lazygit -ucf ~/.config/lazygit/config.yml -p $fzf_dir
fi
exit



