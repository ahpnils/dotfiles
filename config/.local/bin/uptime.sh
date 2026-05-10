#!/bin/sh

if [ -f /proc/loadavg ]; then
  # Linux
  cut -d' ' -f1-3 /proc/loadavg
elif command -v sysctl >/dev/null 2>&1; then
  # BSD / macOS
  sysctl -n vm.loadavg | tr -d '{}' | awk '{print $1, $2, $3}'
else
  # Fallback to anchored parsing
  uptime | sed 's/.*load average[s]*: //' | tr -d ','
fi
