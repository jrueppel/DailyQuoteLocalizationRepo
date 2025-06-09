#!/bin/zsh
echo "Script started at $(date)" >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/script_debug.log

echo ">>> run_daily_quote.sh reached top of script at $(date)" >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/cron_debug.log


# >>> Conda initialize >>>
source /Users/jeffrueppel/miniconda3/etc/profile.d/conda.sh
conda activate base
# <<< Conda initialize <<<

python /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/AddNewStringEveryDay.py >> /Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo/logs/script_debug.log 2>&1
