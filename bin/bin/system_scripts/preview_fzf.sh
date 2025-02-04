#!/bin/sh


# this script is used to preview files in fzf preview window

# set unique fzf cache dir name for each preview
dir_name="fzf-$(uuidgen)"
mkdir "$HOME/.cache/fzf/$dir_name" -p

# set unique name for each cache file
CACHE="$HOME/.cache/fzf/$dir_name/thumbnail.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' \
	-- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"

# clear image from the terminal when script exits and remove fzf cache
clear_image() {
    rm "$HOME/.cache/fzf" -rf
    exec kitty +kitten icat --clear --stdin no --silent --transfer-mode file </dev/null >/dev/tty
}

# preview images with kitty +kiten icat
image() {
 kitty +kitten icat --clear --silent --transfer-mode=file --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 "$1" 
}

# preview text files
batorcat() {
	file="$1"
	shift
	if command -v batcat > /dev/null 2>&1; then
		batcat --color=always --style=plain --pager=never --theme="Monokai Extended Origin" "$file" "$@"
	else
		cat "$file"
	fi
}

# preview markdown files
glowormdcat() {
	file="$1"
	shift
	if command -v glow > /dev/null 2>&1; then
		glow -p "$file"
	else
		glow -p "$file"
	fi
}

# set fle types and fileformats
file_type=$(file -b --mime-type -L "$1" | cut -d "/" -f1)
file_format=$(file -b --mime-type -L "$1" | cut -d "/" -f2)
file_name=$(printf "%s\n" "$(readlink -f "$1")" | awk '{print tolower($0)}')

# pview file according to their type
case "$file_type"  in
    "inode")
        case "$file_format" in 
            directory) tree -L 1 "$1" | batcat --theme='Monokai Extended Origin' ;;
            *) file -ibL "$1" | grep -q text && batorcat "$1" || file -Lb "$1" ;;
        esac
        ;;
    "application")
        case "$file_name" in
            *.tgz|*.tar.gz) tar vxzf "$1" ;;
            *.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1" ;;
            *.rar) unrar l "$1" ;;
            *.tar.bz2|*.tbz2) tar tjf "$1" ;;
            *.tar.txz|*.txz) xz --list "$1" ;;
            *.tar) tar tf "$1" ;;
            *.gz) gzip -l "$1" ;;
            *.torrent) transmission-show "$1" ;;
            *.o) nm "$1";;
            *.iso) iso-info --no-header -l "$1" ;;
            *.7z) 7z l "$1" ;;
            *.odt|*.ods|*.odp|*.sxw) odt2txt "$1" ;;
            *.docx) docx2txt "$1" ;;
            *.doc) catdoc "$1" ;;
            *.cbz|*.cbr|*.cbt)
                [ ! -f "$CACHE" ] && comicthumb "$1" "$CACHE" 1024
                image "$CACHE" "$2" "$3" "$4" "$5"
                ;;
            *.epub)
                [ ! -f "$CACHE" ] && epub-thumbnailer "$1" "$CACHE" 1024
                image "$CACHE" "$2" "$3" "$4" "$5"
                ;;
            *.pdf)
                [ ! -f "${CACHE}.jpg" ] && pdftoppm -jpeg -f 1 -singlefile "$1" "$CACHE"
                image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
                ;;
            *.xls|*.xlsx)
                ssconvert --export-type=Gnumeric_stf:stf_csv "$1" "fd://1" | batorcat --language=csv
                ;;
            *) file -ibL "$1" | grep -q text && batorcat "$1" || file -Lb "$1" ;;
        esac
        ;;
    "text")
        case "$file_name" in
            *.xml|*.html) w3m -dump "$1";;
            *.[1-8]) man "$1" | col -b ;;
            *.md) glowormdcat "$1";;
            *) batorcat --language=cpp "$1" ;;
        esac
        ;;
    "audio")
        case "$file_name" in
            *)
            exiftool "$1"
            ;;
        esac
        ;;
    "video")
        case "$file_name" in
            *)
                [ ! -f "${CACHE}.jpg" ] && \
                    ffmpegthumbnailer -i "$1" -o "${CACHE}.jpg" -s 0 -q 5
                image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
                ;;
        esac
        ;;
    "image")
        case "$file_name" in
        *.bmp|*.jpg|*.jpeg|*.png|*.xpm|*.webp|*.tiff|*.gif|*.jfif|*.ico)
            image "$1" "$2" "$3" "$4" "$5"
            ;;
        *.svg)
            [ ! -f "${CACHE}.jpg" ] && convert "$1" "${CACHE}.jpg"
            image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
            ;;
        *.djvu)
            [ ! -f "${CACHE}.jpg" ] && ddjvu -format=ppm -quality=85 -page=1 "$1" "${CACHE}.jpg"
            image "${CACHE}.jpg" "$2" "$3" "$4" "$5"
            ;;
        *)
            image "$1" "$2" "$3" "$4" "$5"
            ;;
        esac
        ;;
	*) file -ibL "$1" | grep -q text && batorcat "$1" || file -Lb "$1" ;;
esac

# set trap to clearcache and remove images from terminal
trap clear_image EXIT SIGINT SIGTERM SIGQUIT
exit 0
