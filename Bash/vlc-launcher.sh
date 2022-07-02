#=====================================================================================#
#Ver 1.1
#	Added pactl command to set volume
#	Added sleep to allow delay before volume changes
#	Run 'pactl list sinks' to get device ID for active audio device
#=====================================================================================#
#!/bin/bash

if pgrep 'vlc' ; then
	pkill vlc
	sleep 0.25s
	pactl set-sink-volume 277 50%
else 
	pactl set-sink-volume 277 25%
	sleep 0.25s
	cvlc --random --quiet $HOME/Music/
fi
