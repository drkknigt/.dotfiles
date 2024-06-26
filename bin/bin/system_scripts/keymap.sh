#!/usr/bin/env zsh

# this scripts displays the current keymaps for the window manager, tmux, zsh  and misc stuff

# source ~/.zshrc
#
# I3_CONFIG=$HOME/.config/sxhkd/sxhkdrc
# mod_key=$(sed -nre 's/^set \$mod (.*)/\1/p' ${I3_CONFIG})
# grep "^bindsym" ${I3_CONFIG} \
#     | sed "s/-\(-\w\+\)\+//g;s/\$mod/${mod_key}/g;s/Mod1/Alt/g;s/exec //;s/bindsym //;s/^\s\+//;s/^\([^ ]\+\) \(.\+\)$/\1 :    \t\t\2/;s/^\s\+//" \
#     | tr -s ' ' \
#     | fzf --prompt="keymaps for i3: "

glow -p ~/.dotfiles/docs/i3_keymaps.md
