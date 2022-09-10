#Plugin
source $ZPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZPLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZPLUGINS/zsh-history-substring-search.zsh
source $ZPLUGINS/zsh-you-should-use/you-should-use.plugin.zsh

#Alias
alias llah="ls -lah"
alias la="ls -a"
alias lac="ls -a --color=auto"
alias ls="ls --color=auto"
alias im="kitty +kitten icat"
alias th="kitty +kitten themes" 

# History sub tring search options
# se passi a vi ricordati di cambiarlo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/leonardo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$ZDOTDIR/starship.toml
