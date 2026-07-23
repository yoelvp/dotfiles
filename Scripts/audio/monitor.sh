#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$0")"
LAST=""

update() {
    CURRENT="$("$SCRIPT_DIR/state.sh" get_volume)"

    [[ "$CURRENT" == "$LAST" ]] && return

    LAST="$CURRENT"

    "$SCRIPT_DIR/notify.sh"

    polybar-msg action "#volume.hook.0" >/dev/null 2>&1
}

update

pactl subscribe | while read -r EVENT
do
    [[ "$EVENT" != *"sink"* ]] && continue
    update
done
