#!/bin/bash

notify-send -u LOW "Regenerating themes..."

# Oomox (gtk) theme
oomox-materia-cli -t ~/.themes -o wal-oomox ~/.cache/wal/colors-oomox

# # Spicetify
# spicetify update
# spicetify apply 
# killall spotify 

# Dunst (it's weird man)
sh ~/.config/dunst/launch.sh

notify-send -u LOW "Theme successfully regenerated!"