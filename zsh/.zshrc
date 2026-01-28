DISTRO=$(cat /etc/*-release)

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

#Plugin
source $ZPLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZPLUGINS/zsh-you-should-use/you-should-use.plugin.zsh
source $ZPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Alias
# file-system alias
alias llah="ls -lah --color=auto"
alias la="ls -a --color=auto"
alias ls="ls --color=auto"
alias tree="tree -C"

# Misc alias
alias c="clear"

# Gradle
alias gra="./gradlew"

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

# zls
if [[ -d "$HOME/.local/src/zls/zig-out/bin" ]]; then
  PATH="$PATH:$HOME/.local/src/zls/zig-out/bin"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
