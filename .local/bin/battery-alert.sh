#!/bin/bash

bat_level="$(acpi -b | grep -P -o '[0-9]+(?=%)')"
ac_status="$(acpi -a | cut -c 12-20)"

if [ $ac_status == "off-line" ] && [ $bat_level -le 15 ]; then
    notify-send -u critical "Low  Battery" "\Plug  in  charger" && \
    paplay ~/.config/sounds/low-battery.oga
elif [ $ac_status == "on-line" ] && [ $bat_level -eq 100 ]; then
    notify-send -u low "Battery  Fully  Charged"
fi
