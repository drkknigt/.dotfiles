# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below. if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" fi # If you come from bash you might have to change your $PATH. export PATH=$HOME/bin:/usr/local/bin:$PATH # Path to your oh-my-zsh installation. export ZSH="$HOME/.oh-my-zsh" # Set name of the theme to load --- if set to "random", it will load a random theme each time oh-my-zsh is loaded, in which case, to know which specific one was loaded, run: echo $RANDOM_THEME See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#747474,bold"
if [ -f ~/.fzf/shell/key-bindings.zsh ]; then
    source ~/.fzf/shell/key-bindings.zsh
else
    source /usr/share/fzf/key-bindings.zsh
fi
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions poetry)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zshk/"
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'

# various user paths added
PATH=$HOME/bin/*:$PATH
PATH=$HOME/usr/bin:$PATH

# config for nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH=$HOME/.local/bin:$PATH
PATH=/usr/local/go/bin:$PATH
PATH=$HOME/go/bin:$PATH
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias rm='rm -I'
alias la='ls -A'
alias l='ls -CF'
alias cl='clear'
alias q='exit'
alias tmux='tmux -u'
alias lf='lfrun'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# enable vi mode
bindkey -v

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
alias xdg-open='xdg-open 2>/dev/null'
alias wifi='nmcli radio wifi'
alias vpn='protonvpn-cli '
alias ch='tmux_cht.sh'
# alias rgrep='rg'
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
# bindkey -s "^r" "history | fzf^M"     # bind hstr to Ctrl-r (for Vi mode check doc)

# bindings for zsh

# bindings for tmux creation
bindkey -s '^e ' 'tmux_create.sh 0^M'
bindkey -s '^er' 'tmux_create.sh 1^M'
bindkey -s '^ea' 'tmux_create.sh 2^M'
bindkey -s '^\\s' 'tmux_create.sh 3^M'
bindkey -s '^e\\' 'tmux_kill.py^M'
bindkey -s '^ey' 'tmux_session_switch.sh^M'
bindkey -s '^eg' 'tmux_git.sh^M'

# bindkey for git for shell
bindkey -s '^\\g' 'tmux_git.sh^M'

# start lazygit
bindkey -s '^g' 'lazygit -ucf ~/.config/lazygit/config.yml^M'
# start nvim
bindkey -s '^v' 'nvim^M'

# navigate effiecently in shell
bindkey -s '^\\d' '~/bin/navigation/navigation.sh 0^M'
bindkey -s '^\\h' '~/bin/navigation/navigation.sh 1^M'
bindkey -s '^\\f' '~/bin/navigation/navigation.sh 2^M'
bindkey -s "^e'" "file_manager.sh 0^M"

# go back in history
bindkey "^P" up-line-or-search

# go forward in history
bindkey "^N" down-line-or-search
bindkey "^]" end-of-line
bindkey "^a" beginning-of-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^ " backward-char
bindkey "kj"  vi-cmd-mode

# some editor vairables
export EDITOR=vim
export VISUAL=vim
export KEYTIMEOUT=20

# source /usr/share/doc/fzf/examples/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf man pages

LANG="en_US.utf8"
export LANG

# alias for the luamake
alias luamake=$HOME/tools/lua-language-server/3rd/luamake/luamake

# start ssh agent 
alias ssha='eval $(ssh-agent) && ssh-add'


# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# setup pyenv and poetry
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
if [ -f /usr/share/zsh/site-functions/_pyenv ]; then
source /usr/share/zsh/site-functions/_pyenv
fi

# change directory for the tmux shells

cdd1(){
    direc=$(find ~ -type d |  fzf --cycle --prompt='change directory: ' --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" )
    if [ -n "$TMUX" ] ; then
        if [  -z "$direc" ] ; then
            exit
        fi
    fi
   cd $direc
}


# change directory inside shell

cdd(){
which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi
    direc=$(fdfind -H --type d . "$HOME" |  fzf --cycle --prompt='change directory: ' --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" )
        if [  -n "$direc" ] ; then
            cd $direc
        fi
}

update_repo(){
    current_os=$(cat /etc/os-release | grep -Pi '^name' | cut -d "=" -f2)
    if [ "$current_os" = '"Arch Linux"' ]; then
        country_selected=$(reflector --list-countries | fzf --prompt="select country: " | cut -d" " -f1)
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bkp-"$(date --iso-8601='hours')"
    sudo reflector --verbose --latest 12 --protocol https --country "$country_selected" --save /etc/pacman.d/mirrorlist
elif [ "$current_os" = '"Linux Mint"' ]; then
    echo "not on arch linux"
    fi
}
add(){
    temp=0
    for i in $@;do
        temp=$(( $temp + $i ))
    done
    echo $temp
}
