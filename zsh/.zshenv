ZDOTDIR=$HOME/.config/zsh
ZPLUGINS=$HOME/.config/zsh/plugins

#intellij idea
if [[ -d "$HOME/programs/intellij-idea-comunity/bin" ]]; then
  export PATH="${PATH}:$HOME/programs/intellij-idea-comunity/bin"
fi

PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi
