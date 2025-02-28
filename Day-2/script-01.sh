#!/bin/bash
#
#
URL="https://www.learnxops.com"
HOST="www.learnxops.com"


if curl -Is "$URL" --max-time 5 | grep "HTTP/"; then
	echo "url is reachable"
else 
	echo "can't reach the url, checking with the ping"

	if ping -c 3 "$HOST" &> /dev/null; then
		echo "host reached with ping"
	else "can't reach the host with ping as well"

	fi
fi
