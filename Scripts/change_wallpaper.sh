#!/bin/sh

wallpapers_dir="/home/yoelvp/Desktop/Wallpapers"
wallpaper_list=("$wallpapers_dir"/*)
selected_wallpaper="${wallpaper_list[RANDOM % ${#wallpaper_list[@]}]}"
feh --bg-scale "$selected_wallpaper"

