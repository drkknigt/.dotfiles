#!/usr/bin/env zsh
source /home/drkknght/.zshrc
MAN="/usr/bin/man"
if [ -n "$1" ]; then
    $MAN "$@"
    return $?
else
    $MAN -k . | fzf --reverse --preview="echo {1,2} | sed 's/ (/./' | sed -E 's/\)\s*$//' | xargs $MAN" | awk '{print $1 "." $2}' | tr -d '()' | xargs -r $MAN
    return $?
fi
