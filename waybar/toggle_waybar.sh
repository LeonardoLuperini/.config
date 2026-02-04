#!/bin/sh
if pgrep -x waybar > /dev/null; then
    systemctl --user stop --now waybar
else
    systemctl --user start --now waybar
fi
