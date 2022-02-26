#!/bin/bash
# Enter a number X
# Download X images at random from unsplash, and delete duplicates in the end
n_images=${1:-3}
bg_dim="2560x1440"
bg_folder="$HOME/Pictures/wallpapers/$bg_dim"
mkdir -p $bg_folder
while [ $(ls -l $bg_folder | wc -l) -lt $n_images ]; do
	wget -q -O $bg_folder/$RANDOM.jpeg https://source.unsplash.com/random/$bg_dim
done
fdupes -dN $bg_folder
# feh --randomize --bg-fill $bg_folder

