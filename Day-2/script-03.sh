#!/bin/bash
#
#
FILE="process_list.txt"
ps aux > "$FILE"
echo " saved process list to $FILE"
