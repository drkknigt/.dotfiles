#!/usr/bin/env zsh
source /home/drkknght/.zshrc
tpe=$1
echo ${tpe}
# # file="$(fzf --height 40% --reverse)" && [ -f "$file" ] && xdg-open "$file" 
# fdfind --type f . | fzf  --cycle | xdg-open 2> ~/error.txt
# # compgen -c | fzf | zsh


file=$(fdfind --type f . | fzf --cycle --prompt='open files: ' --delimiter / --with-nth -1)

setsid xdg-open $file > /dev/null &
exit
