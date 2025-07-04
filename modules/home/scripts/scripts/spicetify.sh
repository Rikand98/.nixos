#!/usr/bin/env bash

# Check if yazi is installed
if ! command -v spotify &> /dev/null; then
  echo "Spotify is not installed. Please install spotify and try again."
  exit 1
fi

# Start spotify with optional arguments
wezterm -e spotify
