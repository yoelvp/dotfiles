#!/usr/bin/env bash

pkill -f "polybar -q primary"

while pgrep -f "polybar -q primary" >/dev/null; do
    sleep 0.1
done

polybar -q stats -c "$HOME/dotfiles/polybar/config.ini" &
