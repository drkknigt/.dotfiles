#!/usr/bin/env zsh
source /home/drkknght/.zshrc
exp=$1
# # file="$(fzf --height 40% --reverse)" && [ -f "$file" ] && xdg-open "$file" 
# fdfind --type f . | fzf  --cycle | xdg-open 2> ~/error.txt
# # compgen -c | fzf | zsh
if [ -d pat ] 
then
    pat=pat
    down=down 
    doc=doc
else
    pat=''
    down=''
    doc=''
fi

if [ ${exp} = "f" ]
then
    file=$(fdfind --type ${exp} . $down $pat $doc $HOME | fzf --cycle --prompt='open files: ' --delimiter / --with-nth -1 --bind "tab:execute(setsid -f xdg-open {})")
else
    file=$(fdfind --type ${exp} . ${pat} ${down} ${doc} $HOME | fzf --cycle --prompt='open directories: ' )
fi
echo $file

# echo ~/$file
if [ -z "$file" ]
then
    exit
else
    setsid -f xdg-open $file > /dev/null
fi
exit


