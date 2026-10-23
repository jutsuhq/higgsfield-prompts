#!/usr/bin/env bash
# Extract full-size keyframes at the given times and a strip to compare them.
# Usage: keyframes.sh <video> <t1> [t2 ...]   (times in seconds)
# Writes <video-dir>/keyframes/f<t>.png and keyframes/strip.jpg (frames left to right in the given order).
set -euo pipefail
f="$1"; shift
out="$(dirname "$f")/keyframes"; mkdir -p "$out"
args=(); n=0
for t in "$@"; do
  ffmpeg -v error -y -ss "$t" -i "$f" -frames:v 1 "$out/f$t.png"
  echo "$out/f$t.png"
  args+=(-i "$out/f$t.png"); n=$((n+1))
done
if [ "$n" -gt 1 ]; then
  chain=""; for k in $(seq 0 $((n-1))); do chain+="[$k]scale=-2:640[v$k];"; done
  for k in $(seq 0 $((n-1))); do chain+="[v$k]"; done
  ffmpeg -v error -y "${args[@]}" -filter_complex "${chain}hstack=$n" "$out/strip.jpg"
  echo "strip: $out/strip.jpg"
fi
