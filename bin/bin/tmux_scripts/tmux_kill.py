#!/usr/bin/env python3
from os import system
from subprocess import check_output
from sys import exit

# script to kill tmux sessions


def session_info():
    try:
        session_list = check_output(
            '{ grep "attached" <(tmux ls); grep -v "attached" <(tmux ls) } | cut -d ":" -f 1',
            shell=True,
            executable='/usr/bin/zsh',
        ).decode()
        # session_list = check_output(
        #     f'echo {sorted_list}| cut -d ":" -f 1 ', shell=True
        # ).decode()
        active_session = (
            check_output('tmux ls | grep "attached" | cut -d ":" -f 1', shell=True)
            .decode()
            .strip('\n')
        )
        selected_session = (
            check_output(
                '{ grep "attached" <(tmux ls); grep -v "attached" <(tmux ls) } | cut -d ":" -f 1 | fzf --prompt="delete session: "',
                shell=True,
                executable='/usr/bin/zsh',
            )
            .decode()
            .strip('\n')
        )
        if selected_session == '':
            exit('no session selected')
        print(session_list)
        return session_list, active_session, selected_session
    except:
        exit('exit')


def delete_session():
    session_list, active_session, selected_session = session_info()
    session_array = session_list.split('\n')
    session_index = session_array.index(selected_session)
    if selected_session == active_session:
        # if len(session_array) > 1:
        new_session = (
            session_index + 1 if (session_index != len(session_array) - 1) else 0
        )
        system(f'tmux switch-client -t "{session_array[new_session]}"')
        system(f'tmux kill-session -t "{selected_session}"')
    # else:
    # system(f'tmux kill-session -t "{selected_session}"')
    else:
        system(f'tmux kill-session -t "{selected_session}"')


def main():
    try:
        string = check_output('tmux ls 2> /dev/null', shell=True).decode()
    except:
        exit('empty')
    else:
        delete_session()


if __name__ == "__main__":
    main()
