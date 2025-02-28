#!bin/bash
#
#
LOGFILE="system_log.txt"

echo "Timestamp     | CPU(%) | MEM(%)" > "$LOGFILE"

while true; do
	echo "checking cpu usage"
	CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

	echo "checking mem usage"
	MEM_USAGE=$(free -h | grep "Mem" | awk '{print "%.2f", $3/$2 *100}')

	echo " adding timestamp"
	TIME_STAMP=$(date +"%y-%m-%d %H:%M:%S")

	echo "$TIME_STAMP | $CPU_USAGE | $MEM_USAGE" >> "$LOGFILE"


	sleep 5
done

