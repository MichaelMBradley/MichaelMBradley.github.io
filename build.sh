#!/bin/sh

build_dir="out"
assets_dir="assets"

mkdir -p "$build_dir"
minify -o "$build_dir" index.html style.css
cp -r "$assets_dir" "$build_dir"/
./fmt.sh "$build_dir"/"$assets_dir"
