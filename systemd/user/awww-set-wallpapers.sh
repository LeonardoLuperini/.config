#!/bin/bash

WALL="$HOME/Pictures/wallpapers/medieval_city_scape_3840x2160.png"
# BLUR="${XDG_CACHE_HOME:-$HOME/.cache}/awww/overview-blur.png"
BLUR="$HOME/Pictures/temp/overview-blur.png"

mkdir -p "$(dirname "$BLUR")"
magick "$WALL" -blur 0x30 "$BLUR"

awww img "$WALL"
awww img --namespace _overview "$BLUR"
