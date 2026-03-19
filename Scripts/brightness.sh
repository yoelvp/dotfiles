#!/bin/bash

ACTION=$1
MAX=$(brightnessctl max)
CUR=$(brightnessctl get)
PCT=$(( CUR * 100 / MAX ))
STEP=5
NEW=0

PCT=$(( (PCT + STEP / 2) / STEP * STEP ))

case $action in
  up)
    NEW=$(( PCT + STEP ))
    [ "$NEW" -gt 100 ] && NEW=100
    ;;
  down)
    NEW=$(( PCT - STEP ))
    [ "$NEW" -lt 5 ] && NEW=5
    ;;
esac

brightnessctl set "$NEW%"

# Progress bar
FILLED=$(( NEW / 10 ))
EMPTY=$(( 10 - FILLED ))
BAR=$(printf '█%.0s' $(seq 1 $FILLED))$(printf '░%.0s' $(seq 1 $EMPTY))

dunstify -a changebrightness -u low -r 9991 \
  -h "int:value:$NEW" \
  -i "brightnesssettings" \
  "󰃟  $NEW%" "$BAR" \
  -t 1500
