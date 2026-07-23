#!/usr/bin/env bash

source "$(dirname "$0")/state.sh"

read VOLUME MUTED <<< "$(get_volume)"

if [[ "$MUTED" == yes ]]; then
    ICON="audio-volume-muted"

    notify-send \
        -r 9910 \
        -i "$ICON" \
        "Volume" \
        "Audio muted."
    exit
fi

if (( VOLUME <= 30 )); then
    ICON="audio-volume-low"
elif (( VOLUME <= 70 )); then
    ICON="audio-volume-medium"
else
    ICON="audio-volume-high"
fi

notify-send \
    -r 9910 \
    -h int:value:$VOLUME \
    -i "$ICON" \
    "Volume: $VOLUME%"
