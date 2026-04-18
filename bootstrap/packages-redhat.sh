#!/usr/bin/env bash

# RHEL/Fedora-like package bootstrap using dnf.
# Does not enable EPEL, add external repositories, or change the default shell.

set -euo pipefail

MODE="${1:-}"

case "$MODE" in
  safe|full) ;;
  *)
    printf 'Usage: %s safe|full\n' "$0" >&2
    exit 1
    ;;
esac

if ! command -v dnf >/dev/null 2>&1; then
  printf 'dnf was not found. This script only supports RHEL/Fedora-like systems.\n' >&2
  exit 1
fi

package_exists() {
  dnf info "$1" >/dev/null 2>&1
}

install_if_available() {
  local package="$1"

  if package_exists "$package"; then
    printf 'Installing: %s\n' "$package"
    sudo dnf install -y "$package"
  else
    printf 'Package not available in configured dnf repositories, skipping: %s\n' "$package"
  fi
}

PACKAGES=(fzf zoxide bat)

if [ "$MODE" = "full" ]; then
  PACKAGES+=(zsh fastfetch)
fi

printf 'Updating dnf metadata...\n'
sudo dnf makecache

printf 'Installing RHEL/Fedora-like packages (%s mode)...\n' "$MODE"

for package in "${PACKAGES[@]}"; do
  install_if_available "$package"
done
