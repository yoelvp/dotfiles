#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Left bars
polybar -q logo -c "$DIR"/config.ini &
polybar -q my_workspaces -c "$DIR"/config.ini &

polybar -q system_information -c "$DIR"/config.ini &
# polybar -q primary -c "$DIR"/config.ini &
# polybar -q logo -c "$DIR"/config.ini &

#if [[ $(xrandr -q | grep "HDMI-1 connected") ]]; then
#  polybar -q top_ext -c "$DIR"/config.ini &
#fi
# polybar -q bottom -c "$DIR"/config.ini &
