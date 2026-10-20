#!/usr/bin/env bash
# Summarise a reference video for prompt writing: duration, size, cut times, contact sheet.
# Usage: analyze-video.sh <video> [sheet.jpg]
set -euo pipefail
f="$1"; sheet="${2:-${f%.*}-sheet.jpg}"
dur=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$f")
echo "duration: ${dur}s"
echo "size: $(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$f")"
cuts=$(ffmpeg -hide_banner -nostats -i "$f" -vf "select='gt(scene,0.25)',showinfo" -f null - 2>&1 | grep -o 'pts_time:[0-9.]*' | cut -d: -f2 | tr '\n' ' ' || true)
echo "cuts: ${cuts:-none (single shot)}"
ffmpeg -v error -y -i "$f" -vf "fps=24/${dur},scale=240:-1,tile=6x4" -frames:v 1 "$sheet"
echo "contact sheet: $sheet (24 evenly spaced frames, left to right, top to bottom)"
