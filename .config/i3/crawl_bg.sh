#!/bin/bash
bg_dim="2560x1440"
bg_folder="$HOME/Pictures/wallpapers/$bg_dim"
mkdir -p $bg_folder
while [ $(ls -l $HOME/Pictures/wallpapers | wc -l) -lt $1 ]; do
	wget -q -O $bg_folder/$RANDOM.jpeg https://source.unsplash.com/random/$bg_dim
done
fdupes -dN $bg_folder
# feh --randomize --bg-fill $bg_folder

