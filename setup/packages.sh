#!/bin/bash

PACMAN_PACKAGES="$HOME/dotfiles/packages.txt"
PARU_PACKAGES="$HOME/dotfiles/paru-packages.txt"

install_pacman_packages() {
  info "Installing packages..."
  echo "$PACMAN_PACKAGES"
  grep -vE '^\s*($|#)' "$PACMAN_PACKAGES" | sudo pacman -S --needed -
  success "Finished installing <PACMAN> packages"
}

install_paru_packages() {
  info "Installing <PARU> packages..."
  grep -vE '^\s*($|#)' "$PARU_PACKAGES" | paru -S --needed -
  success "Finished installing <PARU> packages"
}
