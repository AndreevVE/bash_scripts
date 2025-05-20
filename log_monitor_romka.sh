
LogDir="/var/log"
ReportFile="/var/log/log_report.txt"
Error="(error|ERROR|Error|warning|Warning|WARNING)"
grep -r -E "$Error" $LogDir > $ReportFile 2>/dev/null | awk -F ':' '{print $2}' | sort unig -c -nr > $ReportFile
echo "Log file generated at $ReportFile"
cat $ReportFile