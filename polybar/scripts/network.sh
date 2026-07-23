#!/usr/bin/env bash

MODE="$1"

SSID=$(nmcli -g GENERAL.CONNECTION device show wlo1)

if [[ -z "$SSID" || "$SSID" == "--" ]]; then
    echo "󰖪 "
    exit
fi

case "$MODE" in
    icon)
        echo "󰖩"
        ;;
    text)
        echo "󰖩 $SSID"
        ;;
esac
