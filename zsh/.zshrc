if command -v pacman > /dev/null; then
	DISTRO="arch"
elif command -v apt > /dev/null; then 
	DISTRO="ubuntu"
fi

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

# Kitty alias
alias im="kitty +kitten icat"
alias th="kitty +kitten themes" 

# Misc alias
alias c="clear"
alias pls="sudo"
alias plsInstall="sudo pacman -Syu --needed"

# java
if [[ "$DISTRO" == "arch" ]]; then
	alias java8="/usr/lib/jvm/java-8-openjdk/jre/bin/java"
	alias javac8="/usr/lib/jvm/java-8-openjdk/bin/javac"
elif [[ "$DISTRO" == "ubuntu" ]]; then
	alias java8="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"
	alias javac8="/lib/jvm/java-8-openjdk-amd64/bin/javac"
fi

# System alias
if [[ "$DISTRO" == "arch" ]]; then
	alias battery="cat /sys/class/power_supply/BAT1/capacity"
	alias battery-time="date +\"%T\" && cat /sys/class/power_supply/BAT1/capacity"
	alias get-vol="wpctl get-volume @DEFAULT_AUDIO_SINK@"
fi

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

# opam configuration
[[ ! -r /home/leo/.opam/opam-init/init.zsh ]] || source /home/leo/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# zig configuration
export PATH=$PATH:~/zig-linux-x86_64-0.13.0-dev.211+6a65561e3/

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
