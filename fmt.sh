#!/bin/sh

if [ "$#" != "1" -o ! -d "$1" ]; then
  echo "Must provide directory to minimize"
  exit 1
fi

for file in "$1"/**; do
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
