#!/bin/sh

# set primary monitor (needed because, set differently with lightdm)
xrandr --output HDMI-1 --primary &
xset r rate 500 35 & # 1) milisec until key respond 2) repeat per sec
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
wal -R -n & # -R restores the last colorscheme that was in use. -n skip setting the wallpaper
nitrogen --restore & # restore wallpaper

exec i3
