#!/bin/bash
Log_dir="/var/log"

report_file=C:\Users\krist\Fork-Test\bash_scripts\

error="(error|ERROR|Error|warning|Warning|WARNING)"

grep -r -E "$error" $Log_dir | awk -F `:` `{print $2}` | sort | uniq -c | sort -nr > $report_file
echo "Log report generated at $report_file"
cat $report_file

date