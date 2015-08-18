#!/bin/sh
xrandr --output VGA-0 --off --output LVDS --mode 1600x900 --pos 0x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-0 --mode 1920x1080 --pos 1600x0 --rotate normal
feh --no-xinerama --bg-tile ~/annex/Wallpaper/batman_owls.png
