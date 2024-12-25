#!/bin/sh
# This wrapper script is invoked by xdg-desktop-portal-termfilechooser.
#
# Inputs:
# 1. "1" if multiple files can be chosen, "0" otherwise.
# 2. "1" if a directory should be chosen, "0" otherwise.
# 3. "0" if opening files was requested, "1" if writing to a file was
#    requested. For example, when uploading files in Firefox, this will be "0".
#    When saving a web page in Firefox, this will be "1".
# 4. If writing to a file, this is recommended path provided by the caller. For
#    example, when saving a web page in Firefox, this will be the recommended
#    path Firefox provided, such as "~/Downloads/webpage_title.html".
#    Note that if the path already exists, we keep appending "_" to it until we
#    get a path that does not exist.
# 5. The output path, to which results should be written.
#
# Output:
# The script should print the selected paths to the output path (argument #5),
# one path per line.
# If nothing is printed, then the operation is assumed to have been canceled.


# File used to cache the last accessed directory while saving file from LF (file manager) in browser
last_save_cache="/tmp/lf_previous_save_dir_browser.1e2x37Hl"

# File used to cache the last accessed directory while opening file from LF (file manager) in browser
last_open_cache="/tmp/lf_previous_open_dir_browser.1e2x37Hl"

# Ensure the cache file exists (create it if it doesn't)
touch $last_save_cache
touch $last_open_cache

# Read the previously saved directory or opened directory path from the cache file
previous_save_dir=$(cat $last_save_cache)
previous_open_dir=$(cat $last_open_cache)

# Set a default directory to open in case no specific directory is provided.
default_dir="$HOME/Downloads"

# Boolean-like variable indicating whether multiple files can be selected.
multiple="$1"

# Boolean-like variable indicating whether the operation involves a directory.
directory="$2"

# Boolean-like variable indicating whether the result should be saved to a file.
save="$3"

# Path where the selected file(s) will be saved.
path_name="$4"

# Output path for the selection.
out="$5"

# Command to run the file manager (lf) script.
cmd="lfrun"

# Variable to indicate if the script is being run from a browser context.
browser_run="running"
export browser_run     # Export the variable so it can be accessed by child processes. 
export path_name       # Export the path name for file that is to be saved (i.e name of file)
export save            # Export the save flag for use in child processes.
export last_save_cache # Export the file which saves path for the last saved file in browser
export last_open_cache # Export the file which saves where browser opened the file from last time 

# Command to launch a terminal with specific properties (class name for window management).
termcmd="kitty --class 'lf_browser' -e"


# Use the last opened directory (from cache ) or default to Downloads if not set.
 default_dir="${previous_open_dir:-$HOME/Downloads}"

# Check if the save flag is set (indicating a save operation is required).
if [ "$save" = "1" ]; then
    # Use the last saved directory (from cache ) or default to Downloads if not set.
     default_dir="${previous_save_dir:-$HOME/Downloads}"
    # Set positional arguments for lf, specifying output and default directory.
    set -- -selection-path "$out" "$default_dir"
elif [ "$directory" = "1" ]; then
    # If a directory operation is requested, set the same positional arguments.
    set -- -selection-path "$out" "$default_dir"
elif [ "$multiple" = "1" ]; then
    # If multiple selection is enabled, use the same positional arguments.
    set -- -selection-path "$out" "$default_dir"
else
    # Default case: set positional arguments for lf.
    set -- -selection-path "$out" "$default_dir"
fi

# Run the terminal command with the `lf` command and its arguments.
$termcmd $cmd "$@"

# If save flag is set and the output file is empty or non-existent.
if [ "$save" = "1" ] && [ ! -s "$out" ]; then
    # Remove the path_name file since nothing was selected or saved.
    /usr/bin/rm "$path_name"
fi
