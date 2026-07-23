#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$0")"

read VOL MUTED <<< "$("$SCRIPT_DIR/state.sh" get_volume)"

if [[ "$MUTED" == yes ]]; then
    echo "󰖁"
    exit
fi

if (( VOL <= 30 )); then
    ICON="󰕿"
elif (( VOL <= 70 )); then
    ICON="󰖀"
else
    ICON="󰕾"
fi

echo "$ICON $VOL%"
