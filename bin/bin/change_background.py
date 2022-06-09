#!/usr/bin/env python3
##!/usr/bin/env zsh
# source /home/drkknght/.zshrc
# monitor1=$1
# # fdfind --type f  '.*\.j[a-zA-Z]+$' ~/Downloads | fzf 
# # print -rl -- ${(ko)commands} | fzf | (nohup ${SHELL:-"/bin/sh"} &) >/dev/null 2>&1
# # nitrogen --set-zoom --head=$1 $(fdfind '.+\.j.+$' Downloads | fzf)
# echo ${monitor1}
# fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(nitrogen --set-zoom-fill --head=${monitor1} {})"
#

import sys
from subprocess import check_output


def main():
    check_output(
        f"fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind 'tab:execute(nitrogen --set-zoom-fill --head=${sys.argv[1]} {{}})'",
        shell=True,
    )


if __name__ == "__main__":
    main()
