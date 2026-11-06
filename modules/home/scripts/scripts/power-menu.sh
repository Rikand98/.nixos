#!/usr/bin/env bash

# Fuzzel-based power menu (fuzzel is the only launcher on this system).

choice=$(printf '%s\n' \
  "󰐥  Shutdown" \
  "  Restart" \
  "  Suspend" \
  "󰌾  Lock" \
  "󰍃  Logout" \
  | fuzzel --dmenu --prompt "" --lines 5)

case "$choice" in
  *Shutdown) systemctl poweroff ;;
  *Restart)  systemctl reboot ;;
  *Suspend)  systemctl suspend ;;
  *Lock)     swaylock ;;
  *Logout)   niri msg action quit ;;
esac
