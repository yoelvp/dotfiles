#!/usr/bin/env bash

options=(
    "󰐥 Poweroff"
    "󰜉 Reboot"
    "󰍁 Lockscreen"
    " Suspend"
)

rofi_cmd() {
  rofi -dmenu \
    -p "Goodbye ${USER}" \
    -mesg "Uptime: $(uptime -p | sed -e 's/up //g')" \
    -no-click-to-exit \
    -theme "$HOME"/.config/rofi/launchers/powermenu.rasi
}

chosen=$(printf "%s\n" "${options[@]}" | rofi_cmd)

case $chosen in
    "󰐥 Porweroff")
        systemctl poweroff
        ;;
    "󰜉 Reboot")
        systemctl reboot
        ;;
    "󰍁 Lockscreen")
        ScreenLocker
        ;;
    " Suspend")
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
esac
