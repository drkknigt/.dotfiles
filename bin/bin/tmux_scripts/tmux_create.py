#!/usr/bin/env python3

import argparse
import os
import sys
from subprocess import check_output


def get_args():
    parser = argparse.ArgumentParser(
        description='make a tmux session at give directory'
    )
    parser.add_argument(
        'directories',
        help='directory to tmux into',
        metavar='DIRECTORIES',
        nargs='+',
        type=str,
    )
    args = parser.parse_args()
    if not check_if_valid(args.directories):
        parser.error('invalide directory/directories')
    return args.directories


def main():
    # directories = ' '.join(get_args())
    directories = ' '.join(
        [
            # '~/bin',
            # '/home/drkknght',
            # '~/path',
            # '/home',
            # '~/path/PATH_1/programming-1,python/projcts/',
            '~'
        ]
    )
    try:
        selected_directory = (
            check_output(
                f'find {directories} -mindepth 1 -maxdepth 6 -type d | fzf --prompt="make-session:"',
                shell=True,
            )
            .decode()
            .strip('\n')
        )
    except:
        sys.exit('')
    session_name = os.path.basename(selected_directory)
    if 'TMUX' in os.environ:
        os.system(f'tmux new -s {session_name} -c {selected_directory} -n Main -d')
        os.system(
            f'tmux new-window -n Terminal -t {session_name} -c {selected_directory}'
        )
        os.system(f'tmux select-window -t {session_name}:1')
        os.system(f'tmux send-keys -t {session_name}:Main "nvim" C-m ')
        os.system(f'tmux switch-client -t {session_name}')
    else:
        os.system(f'tmux new -s {session_name} -c {selected_directory} -n Main -d')
        os.system(
            f'tmux new-window -n Terminal -t {session_name} -c {selected_directory}'
        )
        os.system(f'tmux select-window -t {session_name}:1')
        os.system(f'tmux send-keys -t {session_name}:Main "nvim" C-m ')
        os.system(f'tmux attach -t {session_name}')


if __name__ == "__main__":
    main()
