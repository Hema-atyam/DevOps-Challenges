#!/bin/bash
#
#
FILE=$1

if [ ! -f "$FILE" ]; then
	echo "file does not exists, enter the valid argument for file"
else
	echo "File exits, content of the file"
	cat "$FILE"
fi
