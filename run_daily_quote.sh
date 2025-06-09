#!/bin/zsh
echo "Script started at $(date)" >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/script_debug.log

echo ">>> run_daily_quote.sh reached top of script at $(date)" >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/cron_debug.log

# Debug: Test which shell and environment we're in
echo ">>> SHELL is $SHELL" >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/cron_debug.log
echo ">>> PATH is $PATH" >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/cron_debug.log


# Skip conda activation
PYTHON_BIN="/Users/jeffrueppel/miniconda3/bin/python"  # ← update if different

echo ">>> Running Python script using $PYTHON_BIN..." >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/cron_debug.log
$PYTHON_BIN /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/AddNewStringEveryDay.py >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/script_debug.log 2>&1
