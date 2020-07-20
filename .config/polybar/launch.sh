#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


polybar -r mainbar-i3 &
polybar -r systray && sleep 10 && hideIt.sh --name '^Polybar tray window$' --region 0x900+75+-75
echo "Bars launched..."
