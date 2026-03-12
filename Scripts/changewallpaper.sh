#!/bin/sh

WALL_DIR="$HOME/Desktop/Images/Wallpapers"
chosen=$(find "$WALL_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) \
| while read -r img; do
  echo -e "$(basename "$img")\0icon\x1f$img"
done | rofi -dmenu -i -p "Wallpapers" -show-icons -theme $HOME/.config/rofi/launchers/change-wallpaper.rasi)

[ -n "$chosen" ] && feh --bg-fill "$WALL_DIR/$chosen"
