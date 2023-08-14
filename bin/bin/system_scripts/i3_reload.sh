#!/usr/bin/env zsh
notify-send  'I3WM CONFIG RELOADED' 'i3 config file and its configurations are now sourced.' --icon=dialog-information
i3-msg reload
