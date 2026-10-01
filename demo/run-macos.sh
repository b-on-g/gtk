#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
	echo "Homebrew is required: https://brew.sh"
	exit 1
fi

export DYLD_LIBRARY_PATH="$(brew --prefix gjs)/lib:$(brew --prefix gtk4)/lib:$(brew --prefix glib)/lib:$(brew --prefix cairo)/lib${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}"
export GI_TYPELIB_PATH="/opt/homebrew/lib/girepository-1.0:$(brew --prefix gjs)/lib/girepository-1.0:$(brew --prefix gtk4)/lib/girepository-1.0${GI_TYPELIB_PATH:+:$GI_TYPELIB_PATH}"

exec gjs -m bog/gtk/demo/native.mjs "$@"
