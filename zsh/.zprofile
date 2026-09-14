# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# set PATH to include crate if cargo exists
if [[ -d "$HOME/.cargo/bin" ]]; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

if ! command -v greetd &>/dev/null; then
    if uwsm check may-start; then
      exec uwsm start niri.desktop
    fi
fi

