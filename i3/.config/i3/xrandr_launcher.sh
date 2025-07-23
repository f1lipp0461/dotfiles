#!/bin/bash

connected_outputs=$(xrandr | grep " connected" | cut -d" " -f1)
num_outputs=$(echo "$connected_outputs" | wc -l)

sleep 1

if [ "$num_outputs" -eq 1 ]; then
    for ws in {1..10}; do
        i3-msg "workspace $ws output HDMI-1"
    done
else
    i3-msg "exec xrandr --output HDMI-1 --primary --right-of HDMI-0"
    
    for ws in {1..5}; do
        i3-msg "workspace $ws output HDMI-1"
    done

    for ws in {6..10}; do
        i3-msg "workspace $ws output HDMI-0"
    done
fi

