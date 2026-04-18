#!/usr/bin/env bash

# macOS package bootstrap using Homebrew.
# Does not install casks, shell frameworks, fonts, or change the default shell.

set -euo pipefail

MODE="${1:-}"

case "$MODE" in
  safe|full) ;;
  *)
    printf 'Usage: %s safe|full\n' "$0" >&2
    exit 1
    ;;
esac

if ! command -v brew >/dev/null 2>&1; then
  printf 'Homebrew was not found. Install Homebrew first, then rerun this script.\n' >&2
  exit 1
fi

PACKAGES=(eza bat zoxide fzf)

if [ "$MODE" = "full" ]; then
  PACKAGES+=(fastfetch)
fi

printf 'Installing macOS packages with Homebrew (%s mode)...\n' "$MODE"

for package in "${PACKAGES[@]}"; do
  if brew list --formula "$package" >/dev/null 2>&1; then
    printf 'Already installed: %s\n' "$package"
  else
    printf 'Installing: %s\n' "$package"
    brew install "$package"
  fi
done
