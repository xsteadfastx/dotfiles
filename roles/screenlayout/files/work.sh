#!/bin/sh
xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP1-3 --off --output DP1-2 --mode 1920x1200 --pos 0x0 --rotate normal --output DP1-1 --mode 1920x1200 --pos 1920x0 --rotate normal --output DP2 --off
feh --bg-fill ~/.i3/wallpaper.png
