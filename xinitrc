#!/bin/sh

# Runs on login
export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="rxvt-unicode-256color"
export BROWSER="chromium"
export READER="zathura"

# set primary monitor (needed because, set differently with lightdm)
if [ $(hostname) = "desktop" ]; then
  xrandr --output DP-0 --primary --output DP-2 --right-of DP-0 &
  nvidia-settings --load-config-only &
fi

#[ -f ~/.zshrc ] && source ~/.zshrc
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
xset r rate 500 35 & # 1) milisec until key respond 2) repeat per sec
wal -R -n & # -R restores the last colorscheme that was in use. -n skip setting the wallpaper
nitrogen --restore & # restore wallpaper

exec i3 # start Desktop environment
