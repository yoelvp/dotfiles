#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q primary -c "$DIR"/config.ini &

if [[ $(xrandr -q | grep "HDMI-1 connected") ]]; then
 polybar -q secondary -c "$DIR"/config.ini &
fi
