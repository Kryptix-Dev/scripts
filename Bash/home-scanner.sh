#=====================================================================================#
#Ver 1.1
#	Added freshclam log file to check for update errors
#	Added a day of the week checker to determine if a full scan is run
#	Added a short scan option when it isn't Saturday
#	Added to the if-else notification loop to notify on database update errors
#	Updated the failed notification message
#	Verified with ShellCheck
#=====================================================================================#
#!/bin/bash

rm "$HOME/System/Logs/clamav.log"
rm "$HOME/System/Logs/freshclam.log"

freshclam --quiet --log="$HOME/System/Logs/freshclam.log"

#=====================================================================================#
# CHECK FOR THE DAY OF WEEK TO DETERMINE IF FULL SCAN IS RUN
# Run full scan on Saturdays with a nice code so it's deprioritized
# Run a Download folder scan for rest of the week
#=====================================================================================#
dayOfWeek=$(date '+%a')
	if [ "$dayOfWeek" = "Sat" ]; then
		nice --adjustment=5 clamscan "$HOME/" -ri --exclude-dir="$HOME/.local/share/Trash" --scan-archive --log="$HOME/System/Logs/clamav.log"
	else
		clamscan "$HOME/Downloads" -ri --scan-archive --log="$HOME/System/Logs/clamav.log"
	fi

#=====================================================================================#
# IF-ELSE TO CHECK LOG FILES FOR NOTIFICATION
#=====================================================================================#
updateFailed="$(grep -Po 'ERROR: Update \K.*' "$HOME/System/Logs/freshclam.log")"
infectedFiles="$(grep -Po 'Infected files: \K.*' "$HOME/System/Logs/clamav.log")"
if [ "$updateFailed" != "failed." ] && [ "$infectedFiles" -eq 0 ]; then
	notify-send "Scan is GREEN" "No threats found, database updated. $updateFailed" --icon=selection-mode
elif [ "$updateFailed" == "failed." ] && [ "$infectedFiles" -eq 0 ]; then
	notify-send "Scan is YELLOW" "No threats found, but database failed to update." --icon=mail-mark-junk
elif [ "$infectedFiles" -gt 0 ]; then
	notify-send "Scan is RED" "Scan found <b>$infectedFiles</b> infected files, check log for details." --icon=mail-mark-junk
elif [ "$updateFailed" == "failed." ] && [ "$infectedFiles" -gt 0 ]; then
	notify-send "Scan is RED" "Scan found <b>$infectedFiles</b> infected files, check log for details.  Database failed to update." --icon=mail-mark-junk
else 
	notify-send "Scan FAILED" "The scan was cancelled or failed." --icon=process-stop
fi

#=====================================================================================#
# LOG FILE ARCHIVAL
# Combine daily log files into a monthly log file on the first day of the month
# Combine monthly log files into a yearly log file on the first day of the month
#
#dayOfMonth=$(date '+%d')
#monthOfYear=$(date '+%b')
#if [ "$dayOfMonth" == 01 ]; then
#		mv "$HOME/System/Logs/clamav-month.log" "$HOME/System/Logs/clamav-${monthOfYear,,}.log"
#		rm "$HOME/System/Logs/clamav-month.log"
#		cat "$HOME/System/Logs/clamav-daily.log" >> "$HOME/System/Logs/clamav-month.log"
#	else
#		cat "$HOME/System/Logs/clamav-daily.log" >> "$HOME/System/Logs/clamav-month.log"
#fi
#=====================================================================================#
