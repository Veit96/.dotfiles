#!/usr/bin/env bash

# More info: https://github.com/jaagr/polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

name=$(hostname) # enables to load machine specific bars...

# device specific launch
if [ ${name} = "thinkpadx260" ]; then
  polybar --reload ${name}&
  exit 0
fi

if [ ${name} = "desktop" ]; then
  polybar --reload desktop_wide &
  polybar --reload desktop_high &
  exit 0
fi

sleep 0.5

# Launch on multi monitor
#if type "xrandr"; then
#  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=${monitor} polybar --reload ${name}& # -c $HOME/.config/polybar/config &
#  done
#else
#  polybar --reload ${name}& # -c $HOME/.config/polybar/config &
#fi

# Launch bar1 and bar2
#polybar -r bar1
#polybar -r bar2

echo "Bars launched..."
