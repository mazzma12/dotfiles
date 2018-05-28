#!/bin/bash
tmpbg="$(mktemp).png"
scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
# -I and -d optins do not work :/
i3lock --inactivity-timeout=30 -f -i "$tmpbg" 
