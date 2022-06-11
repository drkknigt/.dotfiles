#!/usr/bin/env zsh
source /home/drkknght/.zshrc
monitor1=$1
# wallpaper1=$(sed -n 2p ~/.config/nitrogen/bg-saved.cfg)
# wallpaper2=$(sed -n 7p ~/.config/nitrogen/bg-saved.cfg)
# wallpaper1=$(echo "${wallpaper1}" | sed -e 's/[]$.*[\^]/\\&/g' )
# wallpaper2=$(echo "${wallpaper2}" | sed -e 's/[]$.*[\^]/\\&/g' )
bg1=$(cut -d ' ' -f 4 ~/.fehbg | grep '/home' | cut -d "'" -f 2)
bg2=$(cut -d ' ' -f 5 ~/.fehbg | grep '/home' | cut -d "'" -f 2)
# fdfind --type f  '.*\.j[a-zA-Z]+$' ~/Downloads | fzf 
# print -rl -- ${(ko)commands} | fzf | (nohup ${SHELL:-"/bin/sh"} &) >/dev/null 2>&1
# nitrogen --set-zoom --head=$1 $(fdfind '.+\.j.+$' Downloads | fzf)
curret=$(fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(nitrogen  --set-zoom-fill --head=${monitor1} {})")
if [ -z "$curret" ]
then
    echo 'empty'
    exit
fi
if [ ${monitor1} = 0 ]
then
    # sed -i -e "s|${wallpaper1}|file=${curret}|g" ~/.config/nitrogen/bg-saved.cfg
    # echo '1st monitor'
    echo 'doing'
    feh --bg-fill $curret --bg-fill $bg2
    exit
else
    # echo '2nd monitor'
    # sed -i -e "s|${wallpaper2}|file=${curret}|g" ~/.config/nitrogen/bg-saved.cfg
    feh --bg-fill $bg1 --bg-fill $curret
    echo 'hi'
fi
