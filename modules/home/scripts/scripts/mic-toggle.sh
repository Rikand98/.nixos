#!/usr/bin/env bash
if echo "$STATUS" | grep -q '[MUTED]'; then
  notify-send "Microphone Muted" -i microphone-sensitivity-muted-symbolic
else
  notify-send "Microphone Active" -i microphone-sensitivity-high-symbolic
fi
