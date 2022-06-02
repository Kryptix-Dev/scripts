#!/bin/bash
# Change path $HOME/System/... to point to where the script will reside

rm "$HOME/System/clamav-daily.log"
freshclam
	#notify-send "Virus database updated, commencing scan." --icon=selection-mode
nice --adjustment=5 clamscan "$HOME/" -ri --exclude-dir="$HOME/.local/share/Trash" --scan-archive --log="$HOME/System/clamav-daily.log"

dayOfMonth=$(date '+%d')
monthOfYear=$(date '+%b')
if [ "$dayOfMonth" == 01 ]; then
		mv "$HOME/System/clamav-month.log" "$HOME/System/clamav-${monthOfYear,,}.log"
#		rm "$HOME/System/clamav-month.log"
		cat "$HOME/System/clamav-daily.log" >> "$HOME/System/clamav-month.log"
	else
		cat "$HOME/System/clamav-daily.log" >> "$HOME/System/clamav-month.log"
fi

infectedFiles="$(grep -Po 'Infected files: \K.*' "$HOME/System/clamav-daily.log")"
if [ "$infectedFiles" -eq 0 ]; then
		notify-send "Scan is GREEN" "Scan results are clean, no threats found." --icon=selection-mode
	elif [ "$infectedFiles" -gt 0 ]; then
		notify-send "Scan is RED" "Scan found <b>$infectedFiles</b> infected files, check the log for details." --icon=mail-mark-junk
	else 
		notify-send "Scan FAILED" "Something went wrong, the scan will need to run again." --icon=process-stop
fi
