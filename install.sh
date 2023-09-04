#!/bin/bash

current_directory="$PWD"
user_path="/home/yoelvp"

bash_path="$current_directory/bash"
zshrc_path="$current_directory/zshrc"
xinitrc_path="$current_directory/xinitrc"
xauthority_path="$current_directory/Xauthority"
p10k_path="$current_directory/.p10k.zsh"

old_bash_path="$user_path/.bashrc"
old_zshrc_path="$user_path/.zshrc"
old_xinitrc_path="$user_path/.xinitrc"
old_xauthority_path="$user_path/.Xauthority"
old_p10k_path="$user_path/.p10k.zsh"

if [ -f "$old_bash_path" ]; then
  echo "Backup file..."
  cp "$old_bash_path" "$old_bash_path.bk"

  ln -sfn "$bash_path" "$old_bash_path"
else
  echo "Could not file"
fi
/home/yoelvp/Worspace/dotfiles/config/alacritty /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/betterlockscreen /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/bspwm/ /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/dunst /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/kitty /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/neoftech /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/nitrogen /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/nvim /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/picom /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/polybar /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/rofi /home/yoelvp/.config
/home/yoelvp/Worspace/dotfiles/config/sxhkd /home/yoelvp/.config
