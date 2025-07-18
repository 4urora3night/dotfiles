#!/bin/bash

# Set your battery device
BATTERY_PATH="/sys/class/power_supply/BAT0"
LOW_BATTERY_THRESHOLD=15 
SUFFICIENT_BATTERY_THRESHOLD=80
# Get battery percentage
if [ -f "$BATTERY_PATH/capacity" ]; then
  battery_level=$(cat "$BATTERY_PATH/capacity")
else
  notify-send "Battery info not found."
  exit 1
fi

# If battery is low and not charging, send notification
status=$(cat "$BATTERY_PATH/status")

if [ "$battery_level" -le "$LOW_BATTERY_THRESHOLD" ] && [ "$status" != "Charging" ]; then
  notify-send "Low Battery" "Battery is at ${battery_level}%!"
fi
if [ "$battery_level" -ge "$SUFFICIENT_BATTERY_THRESHOLD" ] && [ "$status" == "Charging" ]; then
  notify-send "Sufficient Battery charge" "Battery is at ${battery_level}%!"
fi
