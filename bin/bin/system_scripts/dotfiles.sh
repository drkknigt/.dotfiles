file_to_open=$(find ~/.dotfiles -type f | fzf)
if [ -z "$file_to_open" ] ; then exit ;fi

nvim $file_to_open
