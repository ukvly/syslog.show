#!/usr/bin/env nix-shell
#!nix-shell -i bash -p imagemagick

set -eu

TRUTH=../logo-360x360.png

for img in *.png; do

    resolution=$(echo $img | grep -Eo '[[:digit:]]+x[[:digit:]]+')

    if [ -z "$resolution" ]; then
	resolution=192x192
    fi

    convert "$TRUTH" -resize "$resolution" "$img"
done

