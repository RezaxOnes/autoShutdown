#!/bin/bash
LOGFILE="/var/log/battery-command.log"
battery=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$battery" -lt 7 ]; then
echo "May Se Tat Nguon Trong 3s do <=7%" >> "$LOGFILE"
sleep 3
if ! systemctl hibernate; then
echo "thuc thi hibernate that bai, tien hanh shutdown - $(date '+%Y-%m-%d %H:%M:%S')" >>  "$LOGFILE" 
sleep 1
    systemctl poweroff 
  fi  
else  
echo "Pin dang lon hon 7 khong thuc thi - $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOGFILE" 
fi
