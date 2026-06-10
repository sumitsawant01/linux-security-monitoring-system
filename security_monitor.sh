#!/bin/bash

echo "================================="
echo " Linux Security Monitoring Report"
echo "================================="

echo ""
echo "Current Date & Time:"
date

echo ""
echo "Logged In Users:"
who

echo ""
echo "Recent Error Logs:"
sudo journalctl -p err -n 10 --no-pager

echo ""
echo "Last Logins:"
last | head -5

echo ""
echo "Open Ports:"
ss -tuln

echo ""
echo "Running Processes:"
ps aux --sort=-%mem | head -10

echo ""
echo "Saving report..."

REPORT="security_report_$(date +%Y%m%d_%H%M%S).txt"

{
echo "===== Linux Security Monitoring Report ====="
date
echo ""
echo "Logged In Users:"
who
echo ""
echo "Last Logins:"
last | head -5
echo ""
echo "Open Ports:"
ss -tuln
echo ""
echo "Recent Error Logs:"
sudo journalctl -p err -n 10 --no-pager
} > "$REPORT"

echo ""
echo "================================="
echo " Report Generated Successfully"
echo "================================="
echo "Report saved as: $REPORT"

