#!/bin/bash

chosen=$(printf "Apagar\nReiniciar\nCerrar sesión" | wofi --dmenu)

case "$chosen" in
    "Power off") systemctl poweroff ;;
    "Restart") systemctl reboot ;;
    "Log out") swaymsg exit ;;
esac
