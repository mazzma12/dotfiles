#!/bin/sh
monitor_left="DP-1"
monitor_center="DP-2"
monitor_right="eDP-1"

xrandr --output "$monitor_left" --mode 1920x1080 --pos 0x0 --rotate normal --output "$monitor_right" --primary --mode 1920x1080 --scale 1x1 --pos 3840x0 --rotate normal --output "$monitor_center" --mode 1920x1080 --pos 1920x0 --rotate normal
