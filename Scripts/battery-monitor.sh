#!/usr/bin/env bash

set -euo pipefail

########################################
# Config
########################################

LOW=40
HIGH=80
REMINDER=300 # seconds
MIN_INTERVAL=2
DRAIN_WINDOW=0.5

########################################
# State intern
########################################

LAST_LOW_NOTIFY=0
LAST_HIGH_NOTIFY=0
LAST_STATE=""
LAST_CHECK=0

########################################
# Detect path battery and AC
########################################
BATPATH=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' | head -n1)
AC_NAME=$(find /sys/class/power_supply -maxdepth 1 \
    \( -name 'AC*' -o -name 'ADP*' -o -name 'ACAD*' \) -printf '%f\n' | head -n1)

if [[ -z "$BATPATH" ]]; then
    echo "Not found battery in /sys/class/power_supply" >&2
    exit 1
fi

########################################
# Get battery
########################################

# BATTERY=$(upower -e | grep BAT | head -n1)

battery_info() {
    local status percent
    status=$(<"$BATPATH/status")
    percent=$(<"$BATPATH/capacity")

    case "$status" in
        Charging)    status="charging" ;;
        Discharging) status="discharging" ;;
        Full)        status="full" ;;
        *)           status="${status,,}" ;;
    esac

    echo "$status $percent"
    # upower -i "$BATTERY" | awk '
    #     /state:/ {
    #         state=$2
    #     }
    #
    #     /percentage:/ {
    #         gsub("%","",$2)
    #         percent=$2
    #     }
    #
    #     END {
    #         print state, percent
    #     }
    # '
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

    read -r STATE PERCENT <<< "$(battery_info)"

    ####################################
    # Change of state
    ####################################

    if [[ "$STATE" != "$LAST_STATE" ]]; then

        case "$STATE" in
            charging) notify_connected ;;
            discharging) notify_disconnected ;;
        esac

        LAST_STATE="$STATE"
    fi

    ####################################
    # Low battery
    ####################################

    NOW=$(date +%s)

    if [[ "$STATE" == "discharging" ]] && (( PERCENT <= LOW )); then
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

    if [[ "$STATE" == "charging" ]] && (( PERCENT >= HIGH )); then
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

read -r LAST_STATE _ <<< "$(battery_info)"
check
LAST_CHECK=$(date +%s)

########################################
# Loop events (udev, without upowerd)
########################################
udevadm monitor -u -s power_supply | while read -r line; do
    [[ "$line" == UDEV* ]] || continue

    # Drenar ráfagas de eventos duplicados
    while read -r -t "$DRAIN_WINDOW" _; do :; done

    NOW=$(date +%s)
    if (( NOW - LAST_CHECK >= MIN_INTERVAL )); then
        check
        LAST_CHECK=$NOW
    fi
done
