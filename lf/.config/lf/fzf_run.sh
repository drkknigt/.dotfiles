#!/usr/bin/env zsh
file=$(fdfind . "$HOME" -a -H | fzf --height=100% --layout=reverse --bind "ctrl-o:toggle-preview" --prompt="jump to position: " --preview="~/.dotfiles/lf/.config/lf/preview_fzf.sh {}" --preview-window down:5 )
if [ -n "$file" ]; then
if [ -d "$file" ]; then
    cmd="cd"
else
    cmd="select"
fi
    file="$(printf '%s' "$file" | sed 's/\\/\\\\/g;s/"/\\"/g')"
    lf -remote "send $id $cmd \"$file\""
fi
