# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#------------------------------ load zsh-defer for lazy load -------------------------------#
autoload -Uz ~/zsh-defer/zsh-defer

#-------------------------- lazy load files and source bindings and aliases -----------------#
zsh-defer source ~/.zsh_alias
zsh-defer source ~/.zsh_functions
zsh-defer source ~/.zsh_apps
zsh-defer source ~/.zsh_bindings

#---------------------------------------- history settings ---------------------------------#
HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors

#---------------------------------- completiona and suggestion settings ----------------------#
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#747474,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd completion)

#--------------------------------------- paths and env vars ---------------------------------#
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp -m'

#------------------------------------- various user paths added ------------------------------#
#------------------------------------------- source ~/.zsh_paths -----------------------------#

#------------------------------------ some editor vairables ----------------------------------#
export EDITOR=vim
export VISUAL=vim
export KEYTIMEOUT=4000
LANG="en_US.utf8"
export LANG


# enable auto suggestions
zsh-defer source ~/zsh-autosuggestions/zsh-autosuggestions.zsh

#----------------------------------- append completions to fpath ---------------------------#
fpath=(${ASDF_DIR}/completions $fpath)

#------------------------- initialise completions with ZSH's compinit -----------------------#
source ~/powerlevel10k/powerlevel10k.zsh-theme


#--------------- To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. -------------#
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
