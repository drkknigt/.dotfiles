#!/usr/bin/env zsh
# set alias fdfind to fd for mint on arch

# set variables for fzf
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export DE=kde
export DE=gnome
exp=$1
# search in mounted drive

# logic for file explorer for finding files
if [ ${exp} = "f" ]
then
    file=$(fdfind --type ${exp} . $disk $HOME /run/media/ /media 2> /dev/null | fzf --cycle --prompt='open files: ' --delimiter / --with-nth -1 --bind "ctrl-s:execute(setsid -f xdg-open {} &> /dev/null),tab:execute(setsid -f nemo $(basename {}) &> /dev/null),ctrl-o:toggle-preview" --preview="echo {} | batcat --theme='Monokai Extended Origin' --color=always" --keep-right --preview-window wrap --preview-window hidden)
    
# quit if file is empty
if [ -z "$file" ]
then
    exit
fi

# logic for file explorer for directories
else
    file=$(fdfind --type ${exp} . ${disk} $HOME /run/media/ /media/ --hidden | fzf --prompt='open directories: ' --bind "tab:execute(setsid -f xdg-open {} &> /dev/null),ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always " --keep-right --preview-window hidden --preview-window wrap)

# quit if file is empty
if [ -z "$file" ]
then
    exit
fi
    setsid -f nemo $file > /dev/null
    exit
fi

# find the mime-type and open file in desired application 
file_type=$(file -b --mime-type "$file" | cut -d "/" -f1)
file_format=$(file -b --mime-type "$file" | cut -d "/" -f2)

case $file_type in
    "text")
        if [ "$file_format" = "html" ]; then
            echo  "Do you want to open html file in browser ? (yes/no)" 
            read open_in_browser
            if [ "$open_in_browser" = "yes" ]; then
                brave $file
                exit
            else
                setsid -f alacritty -e nvim $file
                exit
            fi
        fi
        setsid -f alacritty -e nvim $file
        ;;
    "image")
        setsid -f imv $file
        ;;
    "video")
        setsid -f mpv $file
        ;;
    "audio")
        setsid -f mpv --force-window $file
        ;;
    "application")
        echo "$file_format" | grep -Pi "pdf|epub" &> /dev/null
        if [ "$?" = "0" ]; then
        setsid -f zathura $file
        exit
        fi
        setsid -f xdg-open $file
        ;;
    *)
        echo "unknown file format"
        sleep 0.5
        ;;
esac


