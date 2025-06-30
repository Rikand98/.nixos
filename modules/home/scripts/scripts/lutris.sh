#!/usr/bin/env bash

# Check if lutris is installed
if ! command -v lutris &> /dev/null; then
  echo "Lutris is not installed. Please install Lutris and try again."
  exit 1
fi

# Start lutris with optional arguments
ghostty -e lutris
