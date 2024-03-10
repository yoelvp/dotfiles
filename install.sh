#!/bin/bash

dotfiles_path="$PWD"
config_path="/home/yoelvp/.config"
home_path="/home/yoelvp"

folders=(
  "alacritty"
  "betterlockscreen"
  "bspwm"
  "dunst"
  "kitty"
  "neofetch"
  "nvim"
  "picom"
  "polybar"
  "rofi"
  "sxhkd"
  "tmux"
)

files=(
  ".zshrc"
  ".p10k.zsh"
  ".xinitrc"
)

# Check if the configuration directories exist
for folder in "${folders[@]}"; do
  if [ -d "$dotfiles_path/$folder" ]; then
    if [ -d "$config_path/$folder" ] && [ -L "$config_path/$folder" ]; then
      ln -sf "$dotfiles_path/$folder" "$config_path"
    fi

    if [ -d "$config_path/$folder" ] && [ ! -L "$config_path/$folder" ]; then
      mv "$config_path/$folder" "$config_path/$folder.bk"
      ln -s "$dotfiles_path/$folder" "$config_path"
    fi

    if [ ! -d "$config_path/$folder" ]; then
      ln -s "$dotfiles_path/$folder" "$config_path"
    fi
  else
    echo "Config folder does not exist"
  fi
done

# Check if the configuration files exist
for file in "${files[@]}"; do
  if [ -e "$dotfiles_path/$file" ]; then
    if [ -e "$home_path/$file" ] && [ ! -L "$home_path/$file" ]; then
      mv "$home_path/$file" "$home_path/$file.bk"
      ln -s "$dotfiles_path/$file" "$home_path"
    fi

    if [ -e "$home_path/$file" ] && [ -L "$home_path/$file" ]; then
      ln -sf "$dotfiles_path/$file" "$home_path"
    fi

    if [ ! -e "$home_path/$file" ]; then
      ln -s "$dotfiles_path/$file" "$home_path"
    fi
  else
    echo "Config file does not exist"
  fi
done
