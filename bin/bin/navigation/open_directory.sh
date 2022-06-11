#!/usr/bin/env zsh
source /home/drkknght/.zshrc
monitor1=$1
# fdfind --type f  '.*\.j[a-zA-Z]+$' ~/Downloads | fzf 
# print -rl -- ${(ko)commands} | fzf | (nohup ${SHELL:-"/bin/sh"} &) >/dev/null 2>&1
# nitrogen --set-zoom --head=$1 $(fdfind '.+\.j.+$' Downloads | fzf)
# fdfind '.+\.(jpg|jpeg)$' Downloads Pictures Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(nitrogen --set-zoom-fill --head=${monitor1} {})"

fdfind --full-path . '/home/drkknght' --type d --hidden | fzf --cycle --prompt='change-background: ' --bind "tab:execute(nemo 1> /dev/null 2> /dev/null  {} &)"
