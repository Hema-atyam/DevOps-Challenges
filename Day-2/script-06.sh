#!/bin/bash
#
#
PATH="/var/log/"

if [ ! -d "$PATH" ]; then
	echo "directory doesn't exist"
else
	find "$PATH" -type f -name "*.log" -mtime +7 -exec rm -f {} \;
        echo " removed files older than 7 days"
fi
