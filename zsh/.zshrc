#Plugin
source $ZPLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZPLUGINS/zsh-you-should-use/you-should-use.plugin.zsh
source $ZPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Alias
# ls alias
alias llah="ls -lah"
alias la="ls -a"
alias lac="ls -a --color=auto"
alias ls="ls --color=auto"
alias plsInstall="sudo pacman -Syu --needed"

# Kitty alias
alias im="kitty +kitten icat"
alias th="kitty +kitten themes" 

# Misc alias
alias c="clear"
alias pls="sudo"

# System alias
alias battery="cat /sys/class/power_supply/BAT1/capacity"
alias get-vol="wpctl get-volume @DEFAULT_AUDIO_SINK@"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# History substring search options
# se passi a vi ricordati di cambiarlo
source $ZPLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[1;2A" history-substring-search-up
bindkey "^[[1;2B" history-substring-search-down

# The following lines were added by compinstall
zstyle :compinstall filename '/home/leonardo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$ZDOTDIR/starship.toml

# opam configuration
[[ ! -r /home/leo/.opam/opam-init/init.zsh ]] || source /home/leo/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
