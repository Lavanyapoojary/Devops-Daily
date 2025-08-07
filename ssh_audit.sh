#!/bin/bash

LOG_FILE="ssh_audit_log.txt"
echo "SSH Audit Log - $(date)" > $LOG_FILE

echo -e "\nCurrently Logged-in Users:" >> $LOG_FILE
who >> $LOG_FILE

echo -e "\nFailed SSH Login Attempts:" >> $LOG_FILE
grep "Failed password" /var/log/auth.log | tail -n 10 >> $LOG_FILE

echo "Audit complete. Output saved to $LOG_FILE."
