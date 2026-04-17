#!/usr/bin/env bash

# Portable dotfiles installer.
# Creates user-level symlinks only; it does not install packages.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_DIR="${HOME}/.dotfiles-local"

link_file() {
  local source_file="$1"
  local target_file="$2"

  if [ ! -e "$source_file" ]; then
    printf 'Missing source: %s\n' "$source_file" >&2
    return 1
  fi

  if [ -L "$target_file" ]; then
    printf 'Updating symlink: %s -> %s\n' "$target_file" "$source_file"
    ln -sfn "$source_file" "$target_file"
    return
  fi

  if [ -e "$target_file" ]; then
    local backup_file="${target_file}.backup.$(date +%Y%m%d%H%M%S)"
    printf 'Existing file found: %s\n' "$target_file"
    printf 'Creating backup: %s\n' "$backup_file"
    mv "$target_file" "$backup_file"
  fi

  printf 'Creating symlink: %s -> %s\n' "$target_file" "$source_file"
  ln -s "$source_file" "$target_file"
}

printf 'terminal-dotfiles installer\n'
printf 'Repository: %s\n' "$REPO_DIR"

if [ ! -d "$LOCAL_DIR" ]; then
  printf 'Creating local directory: %s\n' "$LOCAL_DIR"
  mkdir -p "$LOCAL_DIR"
else
  printf 'Local directory already exists: %s\n' "$LOCAL_DIR"
fi

link_file "${REPO_DIR}/shell/bashrc.minimal" "${HOME}/.bashrc"
link_file "${REPO_DIR}/shell/zshrc.full" "${HOME}/.zshrc"

printf 'Done. Open a new shell or source the desired rc file.\n'
