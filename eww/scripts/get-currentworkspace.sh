#!/bin/bash

handle_workspace() {
  echo $1 | awk '{ sub(/^workspace>>/, ""); print }'
}

handle_focusedmon() {
  echo $1 | awk -F',' '{ print $NF }'
}

handle() {
  case $1 in
    workspace\>*) handle_workspace $1 ;;
    focusedmon\>*) handle_focusedmon $1 ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
