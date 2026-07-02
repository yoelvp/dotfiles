#!/usr/bin/env bash

pkill -f "polybar -q stats"

while pgrep -f "polybar -q stats" >/dev/null; do
    sleep 0.1
done

polybar -q primary -c "$HOME/.config/polybar/config.ini" &
