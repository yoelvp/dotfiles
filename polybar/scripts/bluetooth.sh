#!/bin/bash

if ! bluetoothctl show | grep -q "Powered: yes"; then
    echo "󰂲 Off"
    exit
fi

connected=$(bluetoothctl devices Connected | wc -l)

if [ "$connected" -eq 0 ]; then
    echo "󰂯 On"
else
    echo "󰂱 $connected"
fi
