#!/bin/bash

layouts=("it" "us")

# Legge il layout attuale
current=$(setxkbmap -query | awk '/layout/{print $2}')

if [[ $1 == "toggle" ]]; then
    for i in "${!layouts[@]}"; do
        if [[ "${layouts[$i]}" == "$current" ]]; then
            next=$(( (i + 1) % ${#layouts[@]} ))
            setxkbmap "${layouts[$next]}"
            break
        fi
    done
else
    echo "${current^^}"
fi

