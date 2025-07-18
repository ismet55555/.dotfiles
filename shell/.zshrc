###############################################################################
#             _
#            | |
#     _______| |__  _ __ ___
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__
#  (_)___|___/_| |_|_|  \___|
#
#
###############################################################################

# Installing ZSH Terminal:
#     - https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

###############################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Installation:
#     Install: https://github.com/romkatv/powerlevel10k#oh-my-zsh
#     Fonts:   https://github.com/romkatv/powerlevel10k#fonts
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
HISTTIMEFORMAT=""
HISTSIZE=50000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

###############################################################################
#                          OH-MY-ZSH PLUGINS
###############################################################################

# Installing oh-my-zsh with one of these:
#    -> sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#    -> sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# git
plugins=(git)

# zsh autosuggestions
#    Oh-mh-zsh: git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins+=(zsh-autosuggestions)

# zsh syntax highlighting
#    Oh-mh-zsh: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins+=(zsh-syntax-highlighting)

# zsh-auto-notify
#    Oh-mh-zsh: git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $ZSH_CUSTOM/plugins/auto-notify
#    Set threshold: export AUTO_NOTIFY_THRESHOLD=X
# plugins+=(auto-notify)

# zsh VI mode
# plugins+=(zsh-vi-mode)

# sudo with ESC-ESC
plugins+=(sudo)

source $ZSH/oh-my-zsh.sh

###############################################################################

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

###############################################################################

# Key bindings for fzf (fuzzy finder)
#    - Ctrl+r - Search history
#    - Alt+c  - Change directory
#    - Ctrl+t - Paste the selected file path(s) into the command line
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  . /usr/share/doc/fzf/examples/key-bindings.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

###############################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###############################################################################
#                       References to Other Files
###############################################################################
# Aliases (Terminal shortcuts)
if [ -f ~/.sh_aliases ]; then
    . ~/.sh_aliases
fi
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Alias bindings/function
if [ -f ~/.sh_bindings ]; then
    . ~/.sh_bindings
fi

# Environment variables
if [ -f ~/.sh_env ]; then
    . ~/.sh_env
fi
if [ -f ~/.env ]; then
    . ~/.env
fi

# . "$HOME/.cargo/env"

# Surpress warning - Powerlevel10k with instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
