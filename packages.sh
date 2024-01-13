#!/bin/sh

# nvidia_drivers="nvidia nvidia-settings nvidia-utils lib32-nvidia-utils cuda opencl-nvidia  lib32-opencl-nvidia vdpauinfo clinfo"
fonts="gnu-free-fonts ttf-inconsolata noto-fonts-emoji"
tools="neofetch zsh alacritty kitty bspwm sxhkd picom polybar rofi pulseaudio pavucontrol lxappearance git ly"
utils="lsd bat mdcat bashtop htop udev ntfs-3g gvfs gvfs-mtp gvfs-gphoto2 reflector lxappearance cloudflared cronie feh wmname less"
paru_packages=(
  "wttr"
  "cava"
  "vivaldi"
)
repositories_ohmyzsh=(
  "https://github.com/romkatv/powerlevel10k.git \"${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k\""
  "https://github.com/zdharma-continuum/fast-syntax-highlighting.git \"${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting\""
  "https://github.com/zsh-users/zsh-autosuggestions \"${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions\""
)

# Colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
reset='\033[0m'

echo -e "${green}Are you sure to install${reset} [$fonts $tools $utils] and [${paru_packages[*]}]"
echo -e "${green}<[Y] / [n]>${reset}"
read -r confirm

if [ "$confirm" = "Y" ] || [ "$confirm" = "y" ]; then
  sudo pacman -S --noconfirm "$fonts $tools $utils"
  # Install packages with paru
  paru -S --noconfirm "$(IFS=' '; echo "${paru_packages[*]}")"
elif [ "$confirm" = "N" ] || [ "$confirm" = "N" ]; then
  echo -e "${yellow}Installation canceled.${reset}"
else
  echo -e "${red}Invalid option.${reset}"
fi


for repository in "${repositories_ohmyzsh[@]}"; do
  git clone --depth=1 "$repository"
done

