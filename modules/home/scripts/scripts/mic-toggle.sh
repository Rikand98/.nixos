#!/usr/bin/env bash

# Toggle the mic
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# Check new status
STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

if echo "$STATUS" | grep -q '[MUTED]'; then
    espeak "Microphone muted" | paplay -
    notify-send -u critical -t 5000 "Microphone Status" "<span foreground='red'><b>Muted</b></span>" -i microphone-sensitivity-muted-symbolic
else
    espeak "Microphone active" | paplay -
    notify-send -u normal -t 5000 "Microphone Status" "<span foreground='green'><b>Active</b></span>" -i microphone-sensitivity-high-symbolic
fi
