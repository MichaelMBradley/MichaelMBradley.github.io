#!/bin/sh

build_dir="out"
assets_dir="assets"

mkdir -p "$build_dir"
minify -o "$build_dir" index.html style.css
cp -r "$assets_dir" "$build_dir"/

for file in "$assets_dir"/*; do
  file_basename="$(basename "$file")"
  file_name="${file_basename%%.*}"
  file_extension="${file_basename#*.}"
  printf "%s ->" "$file_basename"
  for format in png jpeg webp jxl avif heic; do
    if [ "$format" = "$file_extension" ]; then
      continue
    fi
    printf " %s" "$format"
    magick "$file" "${build_dir}/${assets_dir}/${file_name}.${format}"
  done
  echo
done
