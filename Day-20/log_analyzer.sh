#!/bin/bash

set -euo pipefail

# Check argument
if [ $# -eq 0 ]; then
    echo "Usage: ./log_analyzer.sh <logfile>"
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File does not exist!"
    exit 1
fi

DATE=$(date +%F)
REPORT="log_report_$DATE.txt"

echo "===== LOG ANALYSIS REPORT =====" > "$REPORT"
echo "Date: $DATE" >> "$REPORT"
echo "Log File: $LOGFILE" >> "$REPORT"

TOTAL_LINES=$(wc -l < "$LOGFILE")
echo "Total Lines: $TOTAL_LINES" >> "$REPORT"

ERROR_COUNT=$(grep -Ei "ERROR|Failed" "$LOGFILE" | wc -l)

echo "Total Errors: $ERROR_COUNT" >> "$REPORT"

echo
echo "Total Errors: $ERROR_COUNT"

echo "==============================" >> "$REPORT"

echo "Critical Events:" >> "$REPORT"

grep -n "CRITICAL" "$LOGFILE" >> "$REPORT"

echo
echo "Critical Events"

grep -n "CRITICAL" "$LOGFILE"

echo "==============================" >> "$REPORT"

echo "Top 5 Error Messages:" >> "$REPORT"

grep "ERROR" "$LOGFILE" |
cut -d' ' -f4- |
sort |
uniq -c |
sort -rn |
head -5 >> "$REPORT"

echo
echo "Top Errors"

grep "ERROR" "$LOGFILE" |
cut -d' ' -f4- |
sort |
uniq -c |
sort -rn |
head -5

echo
echo "Report Generated: $REPORT"
