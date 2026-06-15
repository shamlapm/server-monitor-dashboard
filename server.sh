#!/bin/bash

case "$1" in
cpu)
    top -bn1 | grep "Cpu" | awk '{print $2}'
    ;;
memory)
    free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB", $3,$2 }'
    ;;
esac
