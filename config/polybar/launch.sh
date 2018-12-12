#!/usr/bin/env bash

# More info: https://github.com/jaagr/polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

name=$(hostname) # enables to load machine specific bars...

if [ ${name} = "thinkpadx260" ]; then
  polybar --reload ${name}&
fi

if [ ${name} = "desktop" ]; then
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=${monitor} polybar --reload ${name}& # -c $HOME/.config/polybar/config &
  done
else
  polybar --reload ${name}& # -c $HOME/.config/polybar/config &
fi


#
#sleep 0.1
#
## Launch on multi monitor
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
