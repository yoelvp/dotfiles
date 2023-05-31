#!/bin/sh

theme_name="$1"
file_delete="./theme.conf"

if [ -f "$file_delete" ]; then
  rm "$file_delete"
fi

if [ -f "./themes/$theme_name.conf" ]; then
  ln -s "./themes/$theme_name.conf" ~/.config/kitty/theme.conf
else
  echo "The theme \"$theme_name.conf\" does not exist in \"./themes/\". Please verify the name or try again."
fi
