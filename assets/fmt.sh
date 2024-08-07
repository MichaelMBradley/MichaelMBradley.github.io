#!/bin/sh

script_dirname="$(dirname "$0")"
script_location="$(realpath "$0")"

for file in "$script_dirname"/**; do
  if [ "$(realpath "$file")" = "$script_location" ]; then
    continue
  fi
  file_dirname="$(dirname "$file")"
  file_basename="$(basename "$file")"
  file_name="${file_basename%%.*}"
  file_extension="${file_basename#*.}"
  for format in png jpeg webp jxl avif heic; do
    if [ "$format" = "$file_extension" ]; then
      continue
    fi
    magick "$file" "${file_dirname}/${file_name}.${format}"
  done
done
