#!/usr/bin/env bash

set -eu

if [[ "$USER" = "danielrf" ]]; then
    mirror_args=(
        --mirror "https://android.googlesource.com=/mnt/cache/mirror"
    )
else
    mirror_args=()
fi

args=(
    --ref-type tag
    "https://android.googlesource.com/platform/manifest"
    "$@"
    ../*/repo-*.json
)

export TMPDIR=/tmp

../../mk-repo-file.py "${mirror_args[@]}" "${args[@]}"
