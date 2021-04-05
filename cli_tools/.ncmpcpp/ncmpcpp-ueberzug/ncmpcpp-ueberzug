#!/bin/sh
export FIFO_UEBERZUG="/tmp/mpd-ueberzug-${PPID}"

cleanup() {
    rm "$FIFO_UEBERZUG" 2>/dev/null
    rm /tmp/mpd_cover.jpg 2>/dev/null
    pkill -P $$ 2>/dev/null
    pkill ncmpcpp_cover_art.sh
}

pkill -P $$ 2>/dev/null
rm "$FIFO_UEBERZUG" 2>/dev/null
mkfifo "$FIFO_UEBERZUG" >/dev/null
trap cleanup EXIT 2>/dev/null
tail --follow "$FIFO_UEBERZUG" | ueberzug layer --silent --parser simple >/dev/null 2>&1 &

ncmpcpp
cleanup
