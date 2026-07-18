#!/bin/bash

WALL="$HOME/Pictures/wallpapers/a_person_riding_a_bicycle_on_a_hill_with_sunflowers.jpeg"
# BLUR="${XDG_CACHE_HOME:-$HOME/.cache}/awww/overview-blur.png"
BLUR="$HOME/Pictures/temp/overview-blur.png"

mkdir -p "$(dirname "$BLUR")"
magick "$WALL" -blur 0x30 "$BLUR"

awww img "$WALL"
awww img --namespace _overview "$BLUR"
