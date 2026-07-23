#!/usr/bin/env bash

STATE="$HOME/.cache/brightness-level"

MIN=3341
MAX=62194

[[ -f "$STATE" ]] || echo 5 > "$STATE"

LEVEL=$(cat "$STATE")

case "$1" in
    up)
        LEVEL=$((LEVEL + 5))
        (( LEVEL > 100 )) && LEVEL=100
        ;;

    down)
        LEVEL=$((LEVEL - 5))
        (( LEVEL < 5 )) && LEVEL=5
        ;;

    *)
        echo "Uso: $0 {up|down}"
        exit 1
        ;;
esac

echo "$LEVEL" > "$STATE"

BRIGHTNESS=$(( MIN + (LEVEL - 5) * (MAX - MIN) / 95 ))

brightnessctl set "$BRIGHTNESS" >/dev/null

dunstify \
  -h int:value:"$LEVEL" \
  -h string:x-dunst-stack-tag:brightness \
  "☀️ Brightness: ${LEVEL}%"

polybar-msg action "#brightness.hook.0" >/dev/null
