if ! command -v greetd &>/dev/null; then
    if uwsm check may-start; then
      exec uwsm start niri.desktop
    fi
fi
