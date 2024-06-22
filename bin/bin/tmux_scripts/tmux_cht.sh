#!/usr/bin/env zsh

# this script uses cht.sh to get info on programs


# list of core utils
core_utils="find man tldr sed awk tr cp ls grep xargs rg ps mv kill lsof less head tail tar cp rm rename jq cat ssh cargo git git-worktree git-status git-commit git-rebase docker docker-compose stow chmod chown make\n"


# list of languages
languages="golang solidity vlang v nodejs javascript tmux typescript zsh cpp c lua rust python bash php haskell ArnoldC css html gdb"
selected=$(echo "$core_utils" "$languages" | tr " " "\n" | fzf)

# if selected is empty exit the script
if [[ -z $selected ]]; then
    exit 0
fi

# read query from the user
vared -p "Enter Query: " -c query
echo $selected

# send request for finding info on languages
if echo "$languages" | grep -qs "$selected" ; then
    query=`echo $query | tr ' ' '+'`
    if [ -n "$TMUX" ]; then
        echo \"curl -s cht.sh/$selected/$query/\" & curl -s cht.sh/$selected/$query | less
    else 
        echo \"curl -s cht.sh/$selected/$query/\" & curl -s cht.sh/$selected/$query | less
    fi
# send request for finding info on core utils
else
    if [ -n "$TMUX" ]; then
        curl -s cht.sh/$selected~$query | less
    else
        curl -s cht.sh/$selected~$query | less
    fi
fi
