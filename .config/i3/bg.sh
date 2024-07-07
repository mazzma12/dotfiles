#!/bin/bash
# https://www.reddit.com/r/unixporn/comments/5gq78g/where_do_you_all_find_your_wallpapers/
bg_dim="2560x1440"
bg_folder="$HOME/Pictures/wallpapers/$bg_dim"
n=${1:-3}
mkdir -p $bg_folder
for i in $(seq 0 $n)
do
	wget -q -O $bg_folder/$RANDOM.jpeg https://source.unsplash.com/random/$bg_dim
	sleep .1; # True Random
done
fdupes -dN $bg_folder
# Display bg with :
# feh --randomize --bg-fill $bg_folder
