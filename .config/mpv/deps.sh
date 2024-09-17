#!/bin/bash
# handles deps

# see: "https://github.com/jgreco/mpv-youtube-quality"
yt-quality () {
    repo="yt-quality"
    git clone "https://github.com/jgreco/mpv-youtube-quality" $repo
    cp "$repo/youtube-quality.lua" scripts/
    cp "$repo/youtube-quality-osc.lua" scripts/
    cp "$repo/youtube-quality.conf" script-opts/
    rm -rf $repo
}

case $1 in
    "") yt-quality ;;
    *) echo "unknown cmd" ;;
esac

