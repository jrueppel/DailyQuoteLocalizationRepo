#!/bin/bash

# Absolute path to your log file
LOGFILE="/Users/jeffrueppel/cron.log"

# Log start time
echo "===== Script started at $(date) =====" >> "$LOGFILE"

# Change to repo directory
cd /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo || {
  echo "❌ Failed to cd into repo dir" >> "$LOGFILE"
  exit 1
}

# Log which Python will be used
echo "Using Python: $(which python3)" >> "$LOGFILE"

cd /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo
/Users/jeffrueppel/miniconda3/bin/python /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/AddNewStringEveryDay.py  >> "$LOGFILE" 2>&1
