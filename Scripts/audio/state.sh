#!/usr/bin/env bash

get_volume() {
    info="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
    muted=no

    [[ "$info" == *"[MUTED]"* ]] && muted=yes

    volume=$(awk '{print int($2*100)}' <<< "$info")

    echo "$volume $muted"
}

case "$1" in
    get_volume)
        get_volume
        ;;
esac
