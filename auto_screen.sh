#!/bin/bash

sessions=$(screen -ls | grep -oP '^\s*\d+(?=\.)')
if [ "$(echo "$sessions" | wc -l)" -eq 1 ]; then
    screen -r "$sessions"
else
    echo "Multiple or no screen sessions found."
    screen -ls
fi
