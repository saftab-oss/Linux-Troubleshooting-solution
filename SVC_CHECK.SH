#!/bin/bash

for SVC in nginx ssh cron; do

STATE=$(systemctl is-active "$SVC")

if [ "$STATE" = "active" ]; then
echo "ok" "$SVC" "$STATE"
else
echo "DOWN" "$SVC" "$STATE"
journalctl -u "$SVC" -n 3 --no-pager
fi

done
