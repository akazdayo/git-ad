#!/bin/sh
# SPDX-License-Identifier: MIT OR Apache-2.0
set -eu

case "${1-}" in
  '') ;;
  --help|-h)
    printf '%s\n' 'Usage: sh install.sh' 'Set INSTALL_DIR to override ~/.local/bin.'
    exit 0
    ;;
  *) printf '%s\n' 'Usage: sh install.sh' >&2; exit 1 ;;
esac

source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
install_dir=${INSTALL_DIR:-"$HOME/.local/bin"}
target=$install_dir/git-ad

if [ -e "$target" ] || [ -L "$target" ]; then
  printf 'Refusing to overwrite existing file: %s\n' "$target" >&2
  printf '%s\n' 'Remove the existing installation first, then run this script again.' >&2
  exit 1
fi

mkdir -p -- "$install_dir"
cp -- "$source_dir/bin/git-ad" "$target"
chmod 755 "$target"
printf 'Installed: %s\n' "$target"
case ":$PATH:" in
  *":$install_dir:"*) printf '%s\n' 'Try: git ad .' ;;
  *)
    printf '%s\n' 'Add the installation directory to PATH in your shell configuration:'
    printf '  export PATH="%s:$PATH"\n' "$install_dir"
    ;;
esac
