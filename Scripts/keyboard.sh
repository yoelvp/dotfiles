#!/bin/bash

COLOR=${1:-458588}

for zone in /sys/devices/platform/hp-wmi/rgb_zones/zone*; do
  echo $COLOR | sudo tee "$zone" > /dev/null
  # sudo bash -c "echo $KEYBOARD_COLOR > /sys/devices/platform/hp-wmi/rgb_zones/zone03"
done

