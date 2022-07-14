#!/bin/bash
#
# wait for the process to start
sleep 30

i=0

while [[ $i -lt 5 ]]
do
  # get pid
  DRIVE_PID=$(ps -A | grep "Google Drive.app/Contents/MacOS/Google Drive" | awk '{print $1}') # | head -1
  LEN=$(echo $DRIVE_PID | wc -l | awk '{print $1}')
  ((i++))
  if [[ $i -gt 100 || $LEN -gt 1 ]]; then
    break
  fi
  sleep 5
done

# limit cpu usage
# cpulimit --pid $DRIVE_PID --limit 55
echo $DRIVE_PID | while read pid ; do
    cpulimit --pid $pid -l 5 &
done
