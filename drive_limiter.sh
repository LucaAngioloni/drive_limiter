#!/bin/bash
#
# wait for the process to start
sleep 40

# get pid
DRIVE_PID=$(ps -A | grep "Google Drive.app/Contents/MacOS/Google Drive" | awk '{print $1}') # | head -1

# limit cpu usage
# cpulimit --pid $DRIVE_PID --limit 55
echo $DRIVE_PID | while read pid ; do
    cpulimit --pid $pid --limit 5 &
done
