#!/usr/bin/env bash

# Toggle the mic
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# Check new status
STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

if echo "$STATUS" | grep -q '[MUTED]'; then
    espeak "Microphone muted" | paplay -
    notify-send -u normal -t 5000 "Microphone Status" "Muted" -i microphone-sensitivity-muted-symbolic
else
    espeak "Microphone active" | paplay -
    notify-send -u normal -t 5000 "Microphone Status" "Active" -i microphone-sensitivity-high-symbolic
fi
