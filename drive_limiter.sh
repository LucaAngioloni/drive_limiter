#!/bin/bash
#
# wait for the process to start
sleep 30

# get pid
DRIVE_PID=$(ps -A | grep "Backup and Sync.app/Contents/MacOS/Backup" | awk '{print $1}' | head -1)

# limit cpu usage
cpulimit --pid $DRIVE_PID --limit 55