#!/bin/sh
# SPDX-License-Identifier: MIT OR Apache-2.0
set -eu

case "${1-}" in
  '') ;;
  --help|-h)
    printf '%s\n' 'Usage: sh uninstall.sh' 'Set INSTALL_DIR to match the installation directory.'
    exit 0
    ;;
  *) printf '%s\n' 'Usage: sh uninstall.sh' >&2; exit 1 ;;
esac

install_dir=${INSTALL_DIR:-"$HOME/.local/bin"}
target=$install_dir/git-ad
if [ ! -e "$target" ] && [ ! -L "$target" ]; then
  printf 'Not installed: %s\n' "$target"
  exit 0
fi
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
if [ -L "$target" ] || ! cmp -s -- "$source_dir/bin/git-ad" "$target"; then
  printf 'Refusing to remove a file that differs from this release: %s\n' "$target" >&2
  exit 1
fi
rm -- "$target"
printf 'Removed: %s\n' "$target"
