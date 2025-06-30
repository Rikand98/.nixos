#!/usr/bin/env bash

# Check if steam is installed
if ! command -v steam &> /dev/null; then
  echo "Steam is not installed. Please install Steam and try again."
  exit 1
fi

# Start steam with optional arguments
ghostty -e steam
