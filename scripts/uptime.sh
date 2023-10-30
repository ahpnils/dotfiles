#!/bin/sh
uptime|awk '{print $(NF-2)" "$(NF-1)" "$NF}'
