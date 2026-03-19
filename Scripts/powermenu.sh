#!/usr/bin/env bash

poweroff="󰐥 Poweroff"
reboot="󰜉 Reboot"
suspend=" Suspend"
lockscreen="󰍁 Lockscreen"
logout="󰍃 Logout"

uptime=$(uptime -p)
user=$(whoami | sed 's/^/@/')
kernel=$(uname -r | sed 's/^/v/')
options="$poweroff\n$reboot\n$suspend\n$lockscreen\n$logout"

chosen=$(printf "$options" | rofi -dmenu -p "Goodbye $user" -mesg "Uptime: $uptime | Kernel: $kernel" -theme $HOME/.config/rofi/launchers/powermenu.rasi)

case "$chosen" in
  "$poweroff") systemctl poweroff ;;
  "$reboot") systemctl reboot ;;
  "$suspend")
    mpc -q pause
    amixer set Master mute
    systemctl suspend
    ;;
  "$lockscreen") betterlockscreen -l blur ;;
  "$logout") i3-msg exit ;;
esac
