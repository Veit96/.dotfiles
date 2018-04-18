xset r rate 350 45
xrdb -load ~/.Xresources &
nitrogen --restore &
exec i3
exec ~/.config/polybar/launch.sh
xset -b
