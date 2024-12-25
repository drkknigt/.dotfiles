#!/usr/bin/env zsh

# This script is used to search for files in the terminal quickly and then open the selected file in nvim.

# Ensure custom bin directory is in PATH
export PATH=$HOME/.local/bin/:$PATH

# Set the current working directory
current_dir=$(pwd)

# Get the flag to decide where to search for files (0: dotfiles, 1: home directory, 2: current directory)
search_flag=$1

# Function to search files using fdfind and open in fzf with a preview
search_files() {
    local prompt_message="$1"
    shift  # Shift the arguments making 2nd the 1st arg as so on and removing the 1st arg
    
    # Search files with fdfind and show preview with fzf
    fdfind . "$@" --type f -H | fzf \
        --prompt="$prompt_message" \
        --bind "ctrl-f:preview-down,ctrl-u:preview-up" \
        --bind "ctrl-o:toggle-preview" \
        --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" \
        --preview-window hidden
}

# Search based on the provided flag
case "$search_flag" in
    0)
        # Search in specific directories (dotfiles, ansible_sync, arch-pull)
        file_to_open=$(search_files "Search from dotfiles: " ~/.dotfiles ~/.ansible_sync ~/arch-pull)
        ;;
    1)
        # Search in the home directory
        file_to_open=$(search_files "Search from home directory: " ~)
        ;;
    2)
        # Search in the current directory
        file_to_open=$(search_files "Search from current directory: " "$current_dir")
        ;;
    *)
        echo "Invalid flag. Exiting."
        exit 1
        ;;
esac

# Exit if no file was selected
if [ -z "$file_to_open" ]; then
    exit
fi

# Open the selected file in nvim
nvim "$file_to_open"
