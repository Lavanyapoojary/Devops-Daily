#!/bin/bash

# disk_monitor.sh - Checks disk usage and logs warnings if usage > 80%

LOG_FILE="disk_log.txt"
THRESHOLD=80

echo "[$(date)] Starting disk usage check..." >> "$LOG_FILE"

# Get disk usage excluding tmpfs and other virtual filesystems
df -h --output=pcent,target -x tmpfs -x devtmpfs | tail -n +2 | while read usage mountpoint; do
    usage_num=$(echo "$usage" | tr -d '%')
    if [ "$usage_num" -ge "$THRESHOLD" ]; then
        echo "[$(date)] WARNING: $mountpoint is ${usage_num}% full!" >> "$LOG_FILE"
    else
        echo "[$(date)] OK: $mountpoint is ${usage_num}% full." >> "$LOG_FILE"
    fi
done

echo "[$(date)] Disk check complete." >> "$LOG_FILE"
