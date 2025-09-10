#!/bin/bash

LOG_FILE="/var/log/sysmon.log"

while true; do
  echo "--- $(date) ---" >> "$LOG_FILE"
  echo "CPU: $(cat /proc/loadavg)" >> "$LOG_FILE"
  echo "MEMORY: $(awk '/MemAvailable/{printf "%.1f%%\n", (1-$2/1024/1024)*100}' /proc/meminfo)" >> "$LOG_FILE"
  echo "DISK: $(df -h / | awk 'NR==2{print $5}')" >> "$LOG_FILE"
  echo "NET: $(cat /sys/class/net/eth0/operstate 2>/dev/null || echo "down")" >> "$LOG_FILE"
  sleep 300
done &