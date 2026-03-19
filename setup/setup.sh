#!/bin/bash

set -euo pipefail

. Scripts/utils.sh
. Scripts/dotfiles.sh
. Scripts/packages.sh

# Dirs
DOTFILES_DIR="$HOME/dotfiles"
TARGET_DIR="$HOME/.config"
TARGET_CONFIG_DIR="$HOME"

# List files/dirs
IGNORE_DIRS=("docs" "Scripts" ".git")
CONFIG_FILES=(".p10k.zsh" ".xinitrc" ".zshrc")

printf "\033[2J\033[1;1H"
echo "╔═══════════════════════════════════════╗"
echo "║       Setting up my main tools.       ║"
echo "╚═══════════════════════════════════════╝"

while true; do
  printf "\nPuedes configurar las siguientes opciones:\n"
  echo "[1] Configurar dotfiles"
  echo "[2] Instalar paquetes pacman"
  echo "[3] Instalar paquetes paru"
  echo "[q/Q] Salir"

  read -rsn1 key

  case "$key" in
    1)
      # Config DOTFILES
      read -rp "Are you sure you want to set up DOTFILES? [Y/n] > " answer

      case "$answer" in
        Y|y) config_dotfiles ;;
        N|n) continue ;;
        *)
          err "Invalid option."
          continue
          ;;
      esac
      ;;
    2)
      # Install pacman packages
      read -rp "Are you sure install packages? [Y/n] > " answer

      case "$answer" in
        Y|y)
          install_pacman_packages
          printf "\n"
          ;;
        N|n) continue ;;
        *)
          err "Invalid option."
          continue
          ;;
      esac
      ;;
    q|Q)
      info "👋 Bye"
      exit 1
      ;;
    *)
      err "Invalid option."
      exit 1
      ;;
  esac
done
