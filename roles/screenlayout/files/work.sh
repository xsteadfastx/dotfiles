#!/bin/sh
xrandr --output VGA-0 --mode 1280x1024 --pos 0x0 --rotate normal --output LVDS --mode 1600x900 --pos 1280x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-0 --off
feh --no-xinerama --bg-tile ~/.i3/wallpaper.png
