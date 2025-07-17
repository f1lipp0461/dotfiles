#!/bin/bash

# interfaces names
ETH_IF="enp12s0"
WLAN_IF="wlan0"

# checks for connections
eth_connected=$(cat /sys/class/net/$ETH_IF/operstate 2>/dev/null)
wlan_connected=$(cat /sys/class/net/$WLAN_IF/operstate 2>/dev/null)

# ethernet connected
if [[ "$eth_connected" == "up" ]]; then
    ip=$(ip addr show "$ETH_IF" | awk '/inet / {print $2}' | cut -d/ -f1)
    echo "%{F#cba6f7}󰈁%{F-} $ip"
    exit 0
fi

# ethernet disconnected
if [[ "$eth_connected" == "down" ]]; then
    echo "%{F#cba6f7}󰈂%{F-} disconnected"
    exit 0
fi

# wifi connected
if [[ "$wlan_connected" == "up" ]]; then
    essid=$(iw dev "$WLAN_IF" link | grep SSID | cut -d' ' -f2-)
    if [[ -n "$essid" ]]; then
        echo "%{F#cba6f7}%{F-} $essid"
        exit 0
    fi
fi

# wifi disconnected
echo "%{F#cba6f7}󰖪%{F-} not connected"
