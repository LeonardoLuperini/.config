ZDOTDIR=$HOME/.config/zsh
ZPLUGINS=$HOME/.config/zsh/plugins

#intellij idea
if [[ -d "$HOME/programs/intellij-idea-comunity/bin" ]]; then
  export PATH="${PATH}:$HOME/programs/intellij-idea-comunity/bin"
fi

# zig 0.16.0, this is here because Arch hasn't yet updated to 0.16
if [[ -d "$HOME/.local/bin/zig-x86_64-linux-0.16.0/" ]]; then
    export PATH="${PATH}:$HOME/.local/bin/zig-x86_64-linux-0.16.0/"
fi

PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi
