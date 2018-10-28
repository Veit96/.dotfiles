xset r rate 500 35 # 1) milisec until key respond 2) repeat per sec
xrdb -load ~/.Xresources &

# wallpaper and colorscheme:
# wallpaper and colorscheme
# -R restores the last colorscheme that was in use. -n skip setting the wallpaper
wal -R
# nitrogen --restore &

exec i3
xset -b
