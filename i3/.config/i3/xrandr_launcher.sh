#!/bin/bash

connected_screens=$(xrandr --listmonitors | grep -c "Monitors")

if [ "$connected_screens" -eq 1 ]; then
    i3-msg "workspace 1 output HDMI-1"
    i3-msg "workspace 2 output HDMI-1"
    i3-msg "workspace 3 output HDMI-1"
    i3-msg "workspace 4 output HDMI-1"
    i3-msg "workspace 5 output HDMI-1"
    i3-msg "workspace 6 output HDMI-1"
    i3-msg "workspace 7 output HDMI-1"
    i3-msg "workspace 8 output HDMI-1"
    i3-msg "workspace 9 output HDMI-1"
else
    i3-msg "workspace 1 output HDMI-1"
    i3-msg "workspace 2 output HDMI-1"
    i3-msg "workspace 3 output HDMI-1"
    i3-msg "workspace 4 output HDMI-1"
    i3-msg "workspace 5 output HDMI-1"
    i3-msg "workspace 6 output HDMI-0"
    i3-msg "workspace 7 output HDMI-0"
    i3-msg "workspace 8 output HDMI-0"
    i3-msg "workspace 9 output HDMI-0"
    i3-msg "xrandr --output HDMI-1 --primary --right-of HDMI-0"
fi

