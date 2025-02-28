awk 'tolower($0) ~ /error|failed|critical/' /var/log/syslog > error_logs.txt
