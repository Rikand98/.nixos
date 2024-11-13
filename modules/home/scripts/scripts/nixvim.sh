#!/usr/bin/env bash

# Check if yazi is installed
if ! command -v nvim &> /dev/null; then
  echo "Nvim is not installed. Please install nvim and try again."
  exit 1
fi

# Start yazi with optional arguments
wezterm -e nvim
