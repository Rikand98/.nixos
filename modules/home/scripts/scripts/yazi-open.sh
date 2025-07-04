#!/usr/bin/env bash

# Check if yazi is installed
if ! command -v yazi &> /dev/null; then
  echo "Yazi is not installed. Please install yazi and try again."
  exit 1
fi

# Start yazi with optional arguments
 wezterm-e yazi
