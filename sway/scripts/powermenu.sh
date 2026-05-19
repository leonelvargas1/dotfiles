#!/bin/bash

chosen=$(printf "Power off\nRestart\nLog out" | wofi --dmenu)

case "$chosen" in
    "Power off") systemctl poweroff ;;
    "Restart") systemctl reboot ;;
    "Log out") swaymsg exit ;;
esac
