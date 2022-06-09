#!/usr/bin/env python3
from os import system
from subprocess import check_output
from sys import exit


def get_sessions():
    try:
        active = [
            i[: i.find(':')] if 'attached' in i else ''
            for i in check_output('tmux ls 2> /dev/null', shell=True)
            .decode()
            .splitlines()
        ][0]
        sessions = '\n'.join(
            i[: i.find(':')]
            for i in check_output('tmux ls 2> /dev/null', shell=True)
            .decode()
            .splitlines()
        )
    except:
        exit('first session')
    return sessions, sessions.count('\n') + 1, active


def delete_sessions():
    try:
        sessions_list, total_sessions, active = get_sessions()
        session_array = sessions_list.splitlines()
        selected_session = (
            check_output(
                f'echo "{sessions_list}" | fzf --prompt="delete-session: "',
                shell=True,
            )
            .decode()
            .strip('\n')
        )
        if total_sessions > 1:
            current_session_index = session_array.index(selected_session)
            if active == selected_session:
                if current_session_index - 1 < 0:
                    system(
                        f'tmux switch-client -t "{session_array[current_session_index + 1]}" 2> /dev/null'
                    )
                    system(f'tmux kill-session -t "{selected_session}"')
                else:
                    system(
                        f'tmux switch-client -t "{session_array[current_session_index - 1]}" 2> /dev/null'
                    )
                    system(f'tmux kill-session -t "{selected_session}"')
            else:
                system(f'tmux kill-session -t "{selected_session}"')
        else:
            system(f'tmux kill-session -t "{selected_session}"')
    except:
        exit('')


if __name__ == "__main__":
    delete_sessions()
