#!/bin/bash

file_name="screenshot-$(date +%F-%T).png"
file_path="${HOME}/Pictures/screenshots/${file_name}"
grim -t png -g "$(slurp)" "${file_path}"
notify-send 'Screenshot' -i "${file_path}" "${file_name}"
