#!/usr/bin/env python3

import argparse
import os
import subprocess


def get_args():
    parser = argparse.ArgumentParser(
        description='launch tmux env', prog='tmux launcher'
    )
    parser.add_argument('-e', '--editor', help='launch neovim', action='store_true')
    parser.add_argument(
        '-f',
        '--files',
        help='files to open in neovim',
        default='',
        type=str,
        metavar='Files',
    )
    parser.add_argument(
        '-w',
        '--window',
        help='number of windows to open',
        type=int,
    )
    parser.add_argument(
        '-p', '--programs', help='programs to launch in windows', nargs='+', type=str
    )
    args = parser.parse_args()
    if os.path.isfile(args.files):
        parser.error('sorry file doesnt exist')
    return parser.parse_args()


def launch_tmux(name, files, windows, programs):
    if name os.system(f'tmux new -s {name} -d') else os.system('tmux new -d')
    os.system('tmux send-keys ')



def main():
    args = get_args()
    name = args.name or ''
    files = args.file or ''
    windows = args.window or 3
    programs = args.programs or ['cd ~', 'cd ~', 'cd ~']
    if 'TMUX' in os.environ:
        pass
    else:
        pass
