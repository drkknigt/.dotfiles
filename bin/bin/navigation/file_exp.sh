#!/usr/bin/env zsh

# This script searches for files and directories in the file system starting from /home.
# It is used by a window manager to open the file in an appropriate application
# or opens the directory if a directory is selected.
# The script accepts 'f' for file search or 'd' for directory search as arguments.

# The first argument passed to the script defines the type of search:
# 'f' for file search and 'd' for directory search.
search_type=$1
export FZF_DEFAULT_OPTS='--layout=reverse --border=none -m'

# Function to search for files using fdfind and fzf
search_files() {

    file=$(fdfind --type f . $HOME /run/media /media 2>/dev/null | fzf \
        --cycle \
        --prompt=" Search for files: " \
        --delimiter / \
        --with-nth -1 \
        --bind "ctrl-s:execute(setsid -f xdg-open {} &> /dev/null),tab:execute(setsid -f nemo $(basename {}) &> /dev/null),ctrl-o:toggle-preview" \
        --preview="echo {} | batcat --theme='Monokai Extended Origin' --color=always" \
        --keep-right \
        --preview-window wrap \
        --preview-window hidden)
}

# Function to search for directories using fdfind and fzf
search_directories() {

    file=$(fdfind --type d . $HOME /run/media /media --hidden 2>/dev/null | fzf \
        --prompt=" Search for directories: " \
        --bind "tab:execute(setsid -f xdg-open {} &> /dev/null),ctrl-o:toggle-preview" \
        --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" \
        --keep-right \
        --preview-window hidden \
        --preview-window wrap)
}

# Perform the search based on the argument
case "$search_type" in 
    f) search_files;;
    d) search_directories;;
    *) exit;;
esac

# Exit if no file or directory was selected
[[ -z "$file" ]] && exit

# Determine the mime-type of the selected file
file_type=$(file -b --mime-type -L "$file" | cut -d "/" -f1)
file_format=$(file -b --mime-type -L "$file" | cut -d "/" -f2)

# Open the file based on its type
case $file_type in
    "inode")
        case $file_format in 
            "directory") setsid -f nemo "$file" > /dev/null;;
            "x-empty") setsid -f alacritty -e nvim "$file" ;;
            *) setsid -f xdg-open "$file";;
        esac
        ;;
    "text")
        if [ "$file_format" = "html" ]; then
            echo "Do you want to open this HTML file in a browser? (yes/no)"
            read open_in_browser
            if [ "$open_in_browser" = "yes" ]; then
                brave "$file"
                exit
            fi
        fi
        setsid -f alacritty -e nvim "$file"
        ;;
    "image")
        setsid -f imv "$file"
        ;;
    "video" | "audio")
        setsid -f mpv --force-window "$file" &> /dev/null
        ;;
    "application")
        if echo "$file_format" | grep -Pi "pdf|epub" &>/dev/null; then
            setsid -f zathura "$file"
            exit
        fi
        setsid -f xdg-open "$file"
        ;;
    *)
        echo "Unknown file format"
        sleep 0.5
        ;;
esac

exit
