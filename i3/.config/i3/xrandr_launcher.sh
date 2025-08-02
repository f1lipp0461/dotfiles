#!/bin/bash

connected_outputs=$(xrandr | grep " connected" | cut -d" " -f1)
num_outputs=$(echo "$connected_outputs" | wc -l)

sleep 1

if [ "$num_outputs" -ne 1 ]; then
    i3-msg "exec xrandr --output HDMI-1 --primary --right-of HDMI-0"
fi

