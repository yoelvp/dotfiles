#!/usr/bin/env bash

STATE="/tmp/polybar-network"

nmcli monitor | while read -r _; do
    if [[ -f "$STATE" && $(<"$STATE") == 1 ]]; then
        polybar-msg action "#user_network.hook.1" >/dev/null
    else
        polybar-msg action "#user_network.hook.0" >/dev/null
    fi
done
