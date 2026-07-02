#!/usr/bin/env bash

STATE="$HOME/.cache/brightness-level"

[[ -f "$STATE" ]] || echo 5 > "$STATE"

PERCENT=$(cat "$STATE")

if (( PERCENT <= 20 )); then
    ICON="󰃞"
elif (( PERCENT <= 40 )); then
    ICON="󰃝"
elif (( PERCENT <= 60 )); then
    ICON="󰃟"
elif (( PERCENT <= 80 )); then
    ICON="󰃠"
else
    ICON="󰃡"
fi

echo "$ICON ${PERCENT}%"
