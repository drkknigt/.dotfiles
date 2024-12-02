#!/usr/bin/env zsh

# This script seraches for files and directories  in file system from /home directory. This is used by window manager
# and then opens the  file in appropriate application or opens the directory in if directory is searched
# the file accepts 'f' and 'd' as arg and passes it to fdfind for searching file or directory respectively

# export DE=kde
# export DE=gnome
exp=$1

# search for files in file system with fzf
if [ ${exp} = "f" ]; then
    file=$(fdfind --type ${exp} . $disk $HOME /run/media/ /media 2> /dev/null | fzf --cycle --prompt='open files: ' --delimiter / --with-nth -1 --bind "ctrl-s:execute(setsid -f xdg-open {} &> /dev/null),tab:execute(setsid -f nemo $(basename {}) &> /dev/null),ctrl-o:toggle-preview" --preview="echo {} | batcat --theme='Monokai Extended Origin' --color=always" --keep-right --preview-window wrap --preview-window hidden)
    
# quit if file is empty
if [ -z "$file" ]; then
        exit
fi

# search for directories in file system fzf
else
    file=$(fdfind --type ${exp} . ${disk} $HOME /run/media/ /media/ --hidden | fzf --prompt='open directories: ' --bind "tab:execute(setsid -f xdg-open {} &> /dev/null),ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always " --keep-right --preview-window hidden --preview-window wrap)

# quit if file is empty
if [ -z "$file" ]; then
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
        #open file in zathura if its pdf or epub
        if [ "$?" = "0" ]; then
            setsid -f zathura $file
            exit
        fi
        # if its not pdf/epub then open with xdg-open
        setsid -f xdg-open $file
        ;;
    *)
        echo "unknown file format"
        sleep 0.5
        ;;
esac


