#!/bin/bash

# Network
export WLAN=$(ip link | grep wlp | awk -F ": " '{print $2}')
export ETH=$(ip link | grep enp | awk -F ": " '{print $2}')

# Terminate already running bar instances
killall -qw polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main &
