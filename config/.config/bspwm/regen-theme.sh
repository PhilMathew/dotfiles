#!/bin/bash

notify-send -u LOW "Regenerating themes..."

# Spicetify
spicetify update
spicetify apply 
killall spotify 

# Dunst (it's weird man)
sh ~/.config/dunst/launch.sh

notify-send -u LOW "Theme successfully regenerated!"
