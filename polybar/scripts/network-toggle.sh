#!/usr/bin/env bash

STATE="/tmp/polybar-network"

[[ -f "$STATE" ]] || echo 0 > "$STATE"

if [[ $(<"$STATE") == 0 ]]; then
    echo 1 > "$STATE"
    polybar-msg action "#user_network.hook.1" >/dev/null
else
    echo 0 > "$STATE"
    polybar-msg action "#user_network.hook.0" >/dev/null
fi
