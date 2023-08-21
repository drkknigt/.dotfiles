#!/usr/bin/env zsh
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'


exp=$1
# # file="$(fzf --height 40% --reverse)" && [ -f "$file" ] && xdg-open "$file" 
# fdfind --type f . | fzf  --cycle | xdg-open 2> ~/error.txt
# # compgen -c | fzf | zsh
if [ -d disk ] 
then
    disk=disk
else
    disk=''
fi

echo $disk
if [ ${exp} = "f" ]
then
    file=$(fdfind --type ${exp} . $disk $HOME | fzf --cycle --prompt='open files: ' --delimiter / --with-nth -1 --bind "tab:execute(setsid -f xdg-open {} &> /dev/null),ctrl-o:toggle-preview" --preview="batcat {} --theme='Monokai Extended Origin' --color=always" --keep-right --preview-window hidden)
else
    file=$(fdfind --type ${exp} . ${disk} $HOME --hidden | fzf --prompt='open directories: ' --bind "tab:execute(setsid -f xdg-open {} &> /dev/null),ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --keep-right --preview-window hidden)
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


