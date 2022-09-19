#!/bin/sh
set -e

filter_version="0.5.5"
grimdawn_version="1.1.9.0"

filter_type="fullRainbow"
# filter_type="diablo"
# filter_type="basicHighlighting"

download_link="https://github.com/WareBare/WanezGD_Tools/releases/download/v$filter_version/$filter_type-$grimdawn_version.zip"


rainbow_filter_dir=~/.local/share/Steam/steamapps/common/Grim\ Dawn/settings/text_en
temp_dir=~/.cache/meer-mods

downloaded_file="meer-mods-file.zip"


echo "check if unzip is installed"
unzip -v

echo "check if wget is installed"
wget --version


mkdir -p "$temp_dir"

wget \
  --directory-prefix="$temp_dir" \
  --output-document="$temp_dir/$downloaded_file" \
  --no-config \
  "$download_link"

unzip \
  -d "$temp_dir" \
  "$temp_dir/$downloaded_file"

cp -R "$temp_dir/Grim Dawn/settings/text_en/." "$rainbow_filter_dir"

rm -rf "$temp_dir"
