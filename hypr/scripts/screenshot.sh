#!/bin/sh

file_name="Screenshot-$(date +%F-%T).jpeg"
file_path="${HOME}/Desktop/Screenshots/${file_name}"
grim -t jpeg -q 100 "${file_path}" | swappy -f "${file_path}"
notify-send 'Screenshot' -i "${file_path}" "${file_name}"

# bind = $mainMod, Print, exec, grim -g "$(slurp)" - | swappy -f -
