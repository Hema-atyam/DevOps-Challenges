crontab -e #run directly on terminal

0 2 * * * tar -czf /backup/home_backup_$(date +\%Y-\%m-\%d).tar.gz /home/user

: <<'END_COMMENT'
0 → Minute (0th minute)
2 → Hour (2 AM)
* * * → Runs daily (every day, every month, every weekday)

tar -czf → Create a Compressed Backup
tar → Archive utility to bundle files
-c → Create a new archive
-z → Compress using gzip (.tar.gz format)
-f → Specify the output file

/backup/home_backup_$(date +\%Y-\%m-\%d).tar.gz → Filename with Date
/backup/home_backup_ → Backup location and file prefix

$(date +\%Y-\%m-\%d) → Generates a date (YYYY-MM-DD)

Example: /backup/home_backup_2025-02-27.tar.gz

/home/user → Directory to Backup
Specifies the directory /home/user to be backed up 
END_COMMENT
