#!/bin/sh

# set primary monitor (needed because, set differently with lightdm)
xrandr --output HDMI-1 --primary &

xset r rate 500 35 # 1) milisec until key respond 2) repeat per sec

xrdb -load ~/.Xresources &

# wallpaper and colorscheme:
# -R restores the last colorscheme that was in use. -n skip setting the wallpaper
wal -R -n
nitrogen --restore &

xset -b

exec i3
