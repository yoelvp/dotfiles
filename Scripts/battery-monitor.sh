#!/usr/bin/env bash

set -euo pipefail

########################################
# Config
########################################

LOW=40
HIGH=80
REMINDER=300 # seconds

########################################
# State intern
########################################

LAST_LOW_NOTIFY=0
LAST_HIGH_NOTIFY=0
LAST_STATE=""

########################################
# Get battery
########################################

BATTERY=$(upower -e | grep BAT | head -n1)

battery_info() {
    upower -i "$BATTERY" | awk '
        /state:/ {
            state=$2
        }

        /percentage:/ {
            gsub("%","",$2)
            percent=$2
        }

        END {
            print state, percent
        }
    '
}

########################################
# Notifications
########################################

notify_connected() {
    notify-send \
        -u normal \
        -i battery \
        " Charger connected"
}

notify_disconnected() {
    notify-send \
        -u low \
        -i battery \
        " Charger disconnected"
}

notify_low() {
    notify-send \
        -u critical \
        -i battery \
        "󰁺 Low battery" \
        "Low battery, please connect the charger."
}

notify_high() {
    notify-send \
        -u low \
        -i battery \
        "󰂄 Battery at ${HIGH}%" \
        "You can unplug the charger."
}

########################################
# Testing
########################################

check() {

    read STATE PERCENT <<< "$(battery_info)"

    ####################################
    # Change of state
    ####################################

    if [[ "$STATE" != "$LAST_STATE" ]]; then

        case "$STATE" in

            charging)
                notify_connected
                ;;

            discharging)
                notify_disconnected
                ;;

        esac

        LAST_STATE="$STATE"

    fi

    ####################################
    # Low battery
    ####################################

    NOW=$(date +%s)

    if [[ "$STATE" == "discharging" ]] &&
       (( PERCENT <= LOW )); then

        if (( NOW - LAST_LOW_NOTIFY >= REMINDER )); then

            notify_low

            LAST_LOW_NOTIFY=$NOW

        fi

    else

        LAST_LOW_NOTIFY=0

    fi

    ####################################
    # Battery charged
    ####################################

    if [[ "$STATE" == "charging" ]] &&
       (( PERCENT >= HIGH )); then

        if (( NOW - LAST_HIGH_NOTIFY >= REMINDER )); then

            notify_high

            LAST_HIGH_NOTIFY=$NOW

        fi

    else

        LAST_HIGH_NOTIFY=0

    fi

}

########################################
# Startup
########################################

read LAST_STATE _ <<< "$(battery_info)"

check

upower --monitor-detail | while read -r _; do
    check
done
