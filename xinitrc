xset r rate 300 70 # 1) milisec until key respond 2) repeat per sec
xrdb -load ~/.Xresources &
# -R restores the last colorscheme that was in use. -n (without wallpaper)
#wal -n -R
nitrogen --restore &
exec i3
xset -b
