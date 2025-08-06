#!/bin/bash

LOG_FILE="health_log.txt"

{
    echo "===== Server Health Check ====="
    echo "Date: $(date)"
    echo

    echo "--- CPU Usage ---"
    top -bn1 | grep "Cpu(s)"

    echo "--- Memory Usage ---"
    free -h

    echo "--- Disk Usage ---"
    df -h

    echo "--- Uptime ---"
    uptime

    echo "==============================="
    echo
} >> "$LOG_FILE"
