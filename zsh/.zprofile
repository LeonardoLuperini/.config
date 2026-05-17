if uwsm check may-start; then
  echo "1) Niri (default)"
  echo "2) Hyprland"
  read -r "?Scegli [1]: " choice
  case "$choice" in
    2) session="hyprland-uwsm.desktop" ;;
    *) session="niri.desktop" ;;
  esac
  exec uwsm start "$session"
fi
