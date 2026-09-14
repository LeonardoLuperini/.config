#!/bin/bash

flags=(
    "--enable-features=UseOzonePlatform"
    "--ozone-platform=wayland"
    "--password-store=basic"
)

if command -v brave-browser >/dev/null 2>&1; then
    exec brave-browser "${flags[@]}"
elif command -v flatpak >/dev/null 2>&1 &&
     flatpak info com.brave.Browser >/dev/null 2>&1; then
    exec flatpak run com.brave.Browser "${flags[@]}"
else
    echo "Error: Brave is not installed natively or through Flatpak." >&2
    exit 1
fi
