#!/usr/bin/env bash

# Debian/Ubuntu package bootstrap using apt.
# Does not add PPAs, install shell frameworks, or change the default shell.

set -euo pipefail

MODE="${1:-}"

case "$MODE" in
  safe|full) ;;
  *)
    printf 'Usage: %s safe|full\n' "$0" >&2
    exit 1
    ;;
esac

if ! command -v apt >/dev/null 2>&1; then
  printf 'apt was not found. This script only supports Debian/Ubuntu-like systems.\n' >&2
  exit 1
fi

package_exists() {
  apt-cache show "$1" >/dev/null 2>&1
}

install_if_available() {
  local package="$1"

  if package_exists "$package"; then
    printf 'Installing: %s\n' "$package"
    sudo apt install -y "$package"
  else
    printf 'Package not available in configured apt repositories, skipping: %s\n' "$package"
  fi
}

PACKAGES=(fzf zoxide bat)

if [ "$MODE" = "full" ]; then
  PACKAGES+=(nala zsh fastfetch)
fi

printf 'Updating apt package index...\n'
sudo apt update

printf 'Installing Debian/Ubuntu packages (%s mode)...\n' "$MODE"

for package in "${PACKAGES[@]}"; do
  install_if_available "$package"
done
