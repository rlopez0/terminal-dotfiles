#!/usr/bin/env bash

# Package bootstrap dispatcher.
# This is intentionally separate from install.sh, which only manages symlinks.

set -euo pipefail

usage() {
  printf 'Usage:\n'
  printf '  ./bootstrap/install-packages.sh safe\n'
  printf '  ./bootstrap/install-packages.sh full\n'
}

MODE="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$MODE" in
  safe|full) ;;
  *)
    usage
    exit 1
    ;;
esac

printf 'terminal-dotfiles package bootstrap\n'
printf 'Mode: %s\n' "$MODE"

PLATFORM=""
OS_ID=""
OS_ID_LIKE=""

if [ "$(uname -s)" = "Darwin" ]; then
  PLATFORM="macos"
elif [ -r /etc/os-release ]; then
  . /etc/os-release
  OS_ID="${ID:-}"
  OS_ID_LIKE="${ID_LIKE:-}"

  case "${OS_ID}:${OS_ID_LIKE}" in
    debian:*|ubuntu:*|*:debian*|*:ubuntu*)
      PLATFORM="debian"
      ;;
    rhel:*|fedora:*|centos:*|almalinux:*|rocky:*|ol:*|*:rhel*|*:fedora*|*:centos*|*:almalinux*|*:rocky*|*:ol*)
      PLATFORM="redhat"
      ;;
  esac
fi

case "$PLATFORM" in
  macos)
    printf 'Detected platform: macOS\n'
    bash "${SCRIPT_DIR}/packages-macos.sh" "$MODE"
    ;;
  debian)
    printf 'Detected platform: Debian/Ubuntu-like\n'
    bash "${SCRIPT_DIR}/packages-debian.sh" "$MODE"
    ;;
  redhat)
    printf 'Detected platform: RHEL/Fedora-like\n'
    bash "${SCRIPT_DIR}/packages-redhat.sh" "$MODE"
    ;;
  *)
    printf 'Unsupported platform. No packages were installed.\n' >&2
    exit 1
    ;;
esac

printf 'Package bootstrap finished.\n'
