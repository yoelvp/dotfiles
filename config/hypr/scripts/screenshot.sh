#!/bin/sh

file_name="Screenshot-$(date +%F-%T).png"
file_path="${HOME}/Desktop/Screenshots/${file_name}"
grim -t png "${file_path}" | wl-copy --type image/png
notify-send 'Screenshot' -i "${file_path}" "${file_name}"

# bind = $mainMod, Print, exec, grim -g "$(slurp)" - | swappy -f -
