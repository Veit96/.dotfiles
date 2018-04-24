#!/usr/bin/env sh

# More info: https://github.com/jaagr/polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch on multi monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload desktop -c $HOME/.config/polybar/config &
  done
else
  polybar --reload desktop -c $HOME/.config/polybar/config &
fi

# Launch bar1 and bar2
#polybar bar1 &
#polybar bar2 &

echo "Bars launched..."
