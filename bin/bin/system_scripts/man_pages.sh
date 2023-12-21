#!/usr/bin/env zsh
# source /home/drkknght/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=/home/drkknght/.local/bin/:$PATH
MAN="/usr/bin/man"
if [ -n "$1" ]; then
    $MAN "$@"
    return $?
else
    $MAN -k . | fzf --reverse --preview="echo {1,2} | sed 's/ (/./' | sed -E 's/\)\s*$//' | xargs $MAN" | awk '{print $1 "." $2}' | tr -d '()' | xargs -r $MAN
    return $?
fi
