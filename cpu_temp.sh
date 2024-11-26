#!/bin/bash

get_cpu_info() {
    local temps=$(sensors | grep "Core" | awk '{print $1 " " $3}')
    local usage=$(mpstat -P ALL 1 1 | awk '/Average:/ && $2 != "CPU" {print "Core " $2 ": " 100-$NF "%"}')
    local full_info=$(echo -e "CPU Temperatures:\n$temps\n\nCPU Usage:\n$usage")
    
    notify-send "CPU Details" "$full_info"
}

temp=$(sensors | grep "Core 0" | awk '{print $3}' | sed 's/+//')

if (( $(echo "$temp > 80" | bc -l) )); then
    color="#FF0000"
elif (( $(echo "$temp > 70" | bc -l) )); then
    color="#FFA500"
else
    color="#00FF00"
fi

case "$BLOCK_BUTTON" in
    1)
        get_cpu_info
        ;;
esac

echo " <span color='$color'>$temp</span>"
exit 0
