#!/bin/bash

max_usage=70
partition=/home/hwan

# disk usage 가 max_usage 가 넘으면, 무한 알림 루프

while true
do
    sleep 1
    current_usage=$(df $partition | tail -n 1 | awk '{print $5}' | sed 's/%//')
    if [ $current_usage -gt $max_usage ]; then
        echo "Disk usage exceeded: ${current_usage}%"

    fi
done