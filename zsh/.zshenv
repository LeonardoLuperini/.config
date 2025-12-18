ZDOTDIR=$HOME/.config/zsh
ZPLUGINS=$HOME/.config/zsh/plugins

#intellij idea
if [[ -d "$HOME/programs/intellij-idea-comunity/bin" ]]; then
  export PATH="${PATH}:$HOME/programs/intellij-idea-comunity/bin"
fi

# eww
if [[ -d "$HOME/eww-repo/target/release/" ]]; then
  export PATH="$PATH:$HOME/eww-repo/target/release/"
  alias eww_open="$HOME/.config/eww/open-eww.sh"
  alias eww_close="$HOME/.config/eww/close-eww.sh"
fi

PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

if uwsm check may-start; then
  exec uwsm start hyprland-uwsm.desktop
fi
