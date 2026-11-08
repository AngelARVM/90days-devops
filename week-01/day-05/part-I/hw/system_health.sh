#!/bin/bash
echo -e "Time\t\t\tMemory\t\tDisk (root)\tCPU"
secs="3600"
end=$((SECONDS+secs))

while [ $SECONDS -lt $end ]; do
    TIME=$(date "+%Y-%m-%d %H:%M:%S")
    MEMORY=$(free -m | awk 'NR==2{printf "%.f%%\t\t", $3/$2 * 100}')
    DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
    CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{printf "%.f%%", 100 - $1}')
    echo -e "$TIME\t$MEMORY$DISK\t$CPU"
    sleep 3
done
