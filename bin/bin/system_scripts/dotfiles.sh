
dotfile_flag=$1

if [ "$dotfile_flag" = "0" ] ; then 
    echo "searching dotfiles"
    file_to_open=$(find ~/.dotfiles -type f | fzf)
    if [ -z "$file_to_open" ] ; then exit ;fi
else
    echo "searching home directory"
    file_to_open=$(find  ~ -type f | fzf)
    if [ -z "$file_to_open" ] ; then exit ;fi
fi
    

nvim $file_to_open
