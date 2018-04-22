xset r rate 350 45
xrdb -load ~/.Xresources &
# -R restores the last colorscheme that was in use. -n (without wallpaper)
#wal -n -R
nitrogen --restore &
exec i3
xset -b
