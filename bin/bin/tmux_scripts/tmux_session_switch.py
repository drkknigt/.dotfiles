#!/usr/bin/env python3

import os
import sys
from subprocess import check_output

# script to switch tmux session


def get_clients():
    try:
        sessions = [
            i[: i.find(':')]
            for i in check_output('tmux ls', shell=True).decode().splitlines()
        ]
    except:
        sys.exit('sorry no sessions running in background')
    return sessions


def swith_client():
    try:
        clients = '\n'.join(get_clients())
        selected_client = (
            check_output(
                f'echo "{clients}" | fzf --prompt="switch-session: "', shell=True
            )
            .decode()
            .strip('\n')
        )
        os.system(
            f'tmux switch-client -t "{selected_client}" 2> /dev/null || tmux attach -t "{selected_client}" 2> /dev/null'
        )
    except:
        sys.exit('')
    # os.system(f'echo "{clients}"')


if __name__ == "__main__":
    swith_client()
