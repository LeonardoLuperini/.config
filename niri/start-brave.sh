#!/bin/bash

flags="--enable-features=UseOzonePlatform --ozone-platform=wayland --password-store=basic"

if command -v brave-browser; then
    brave-browser $flags
else
    flatpak run com.brave.Browser $flags
fi
