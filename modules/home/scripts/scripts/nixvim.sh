#!/usr/bin/env bash

# Check if Neovimis installed
if ! command -v nvim &> /dev/null; then
  echo "Neovim is not installed. Please install Neovim and try again."
  exit 1
fi

# Start Neovim with optional arguments
wezterm -e nvim
