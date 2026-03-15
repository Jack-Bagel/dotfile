#!/bin/bash
NOTIFIED_15=false
NOTIFIED_5=false

while true; do
    BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$STATUS" != "Charging" ]; then
        if [ "$BATTERY" -le 5 ] && [ "$NOTIFIED_5" = false ]; then
            dunstify -u critical "Battery Critical" "${BATTERY}% remaining — plug in now!"
            NOTIFIED_5=true
        elif [ "$BATTERY" -le 15 ] && [ "$NOTIFIED_15" = false ]; then
            dunstify -u normal "Battery Low" "${BATTERY}% remaining"
            NOTIFIED_15=true
        fi
    else
        NOTIFIED_5=false
        NOTIFIED_15=false
    fi

    sleep 60
done
