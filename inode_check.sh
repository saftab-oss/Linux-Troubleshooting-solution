#!/bin/bash
# Run this file with bash.

LIMIT=80
# Alert threshold: warn if inode usage goes above 80%.

USED=$(df  --output=ipcent /var/lib/webapp | tail -1 | tr -d ' %')
# Get the inode usage as a plain number, saved in USED:
#   df -i                    → show inode usage
#   --output=ipcent          → only the IUse% column
#   /var/lib/webapp          → for this disk
#   | tail -1                → keep the last line (drop the "IUse%" header)
#   | tr -d ' %'             → delete spaces and the % sign → e.g. 2
#   $( ... )                 → run all of that and store the result in USED

if [ "$USED" -gt "$LIMIT" ]; then
# If USED is greater than (-gt) LIMIT... (spaces inside [ ] are required)

  echo "ALERT: /var/lib/webapp inodes at ${USED}%"
  # ...print an alert with the current %.

else
# Otherwise (80% or below)...

  echo "OK: /var/lib/webapp inodes at ${USED}%"
  # ...print OK with the current %.

fi
# End of the if block.
