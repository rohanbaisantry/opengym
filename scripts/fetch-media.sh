#!/usr/bin/env bash
# Download exercise images and GIFs into public/img and public/gif.
# Source: hasaneyldrm/exercises-dataset (CC)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPO=https://github.com/hasaneyldrm/exercises-dataset.git
TMP=$(mktemp -d)

cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

echo "Cloning exercise media..."
git clone --depth 1 --filter=blob:none --sparse "$REPO" "$TMP/dataset"
git -C "$TMP/dataset" sparse-checkout set images videos

mkdir -p "$ROOT/public/img" "$ROOT/public/gif"
echo "Copying images..."
cp -R "$TMP/dataset/images/." "$ROOT/public/img/"
echo "Copying GIFs..."
cp -R "$TMP/dataset/videos/." "$ROOT/public/gif/"

IMG_COUNT=$(find "$ROOT/public/img" -type f | wc -l | tr -d ' ')
GIF_COUNT=$(find "$ROOT/public/gif" -type f | wc -l | tr -d ' ')
du -sh "$ROOT/public/img" "$ROOT/public/gif"
echo "Done: $IMG_COUNT images, $GIF_COUNT GIFs"
