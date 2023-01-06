#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Usage: ${0##*/} PICTURES"
    exit
fi

[ "$1" == '--' ] && shift

abspath () {
    case "$1" in
        /*) printf "%s\n" "$1";;
        *)  printf "%s\n" "$PWD/$1";;
    esac
}

listfiles () {
    find -L "$(dirname "$target")" -maxdepth 1 -type f -iregex \
      '.*\(jpe?g\|bmp\|png\|gif\)$' -print0 | sort -z
}

target="$(abspath "$1")"
count="$(listfiles | grep -a -m 1 -ZznF "$target" | cut -d: -f1)"

if [ -n "$count" ]; then
    listfiles | xargs -0 sxiv -b -n "$count" --
else
    sxiv -b -- "$@" # fallback
fi