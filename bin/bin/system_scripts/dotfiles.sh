main_arg=$1
if [ "$main_arg" = "0" ] ; then 
    echo "hello"
file_to_open=$(find ~/.dotfiles -type f | fzf)
if [ -z "$file_to_open" ] ; then exit ;fi
else
file_to_open=$(find  ~ -type f | fzf)
    echo "hi"
if [ -z "$file_to_open" ] ; then exit ;fi
fi
    

nvim $file_to_open
