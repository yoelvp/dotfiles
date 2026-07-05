#!/bin/bash

STATE_FILE="/tmp/polybar-network"

[[ -f "$STATE_FILE" ]] || echo icon > "$STATE_FILE"

if [[ "$1" == "toggle" ]]; then
    if [[ $(cat "$STATE_FILE") == "icon" ]]; then
        echo text > "$STATE_FILE"
    else
        echo icon > "$STATE_FILE"
    fi
    polybar-msg action "#network.hook.0" >/dev/null 2>&1
    exit
fi

SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2-)

if [[ -z "$SSID" || "$SSID" == "--" ]]; then
    echo "󰖪"
    exit
fi

if [[ $(cat "$STATE_FILE") == "icon" ]]; then
    echo " "
else
    echo "  $SSID"
fi
