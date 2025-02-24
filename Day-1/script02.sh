#!/bin/bash
#
#
#
EMAIL="godavariammai8@gmail.com"
REPORT_FILE="/tmp/report.txt"

disk_usage(){
        echo "____Disk space usage___"
        df -h >> $REPORT_FILE
}


monitor_services(){
        echo "____Monitor Sevices____"
        systemctl list-units --type=service --state=running >> $REPORT_FILE
}


memory_usage(){
        echo "____Memory Usage___"
        free -m >> $REPORT_FILE
}


cpu_usage(){
        echo "____CPU Usage____"
        top -b -n 1 | head -10 >> $REPORT_FILE
}


send_email_report() {
    echo "Sending comprehensive report via email..."
    {
        echo "Subject: System Health Report"
        echo "System Health Report:"
        cat $REPORT_FILE
    } | sendmail -i -v -Am $EMAIL
}

while true; do
    clear
    echo "==================== System Health Check ===================="
    echo "1. Check Disk Usage"
    echo "2. Monitor Running Services"
    echo "3. Assess Memory Usage"
    echo "4. Evaluate CPU Usage"
    echo "5. Send Comprehensive Report via Email"
    echo "6. Exit"
    echo "============================================================="
    echo "Please select an option (1-6):"
    read -p "Enter choice: " choice

    case $choice in
        1)
            disk_usage
            ;;
        2)
            monitor_services
            ;;
        3)
            memory_usage
            ;;
        4)
            cpu_usage
            ;;
        5)
            send_email_report
            ;;
        6)
            echo "Exiting script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option! Please choose a valid number between 1 and 6."
            ;;
    esac
done
