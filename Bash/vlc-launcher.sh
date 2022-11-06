#=====================================================================================#
#Ver 1.2
#	Updated pactl command to use master volume instead of a specific sink
#	a.k.a. a specific device.  This allows it to be more consistent.
#=====================================================================================#
#!/bin/bash

if pgrep 'vlc' ; then
	pkill vlc
	sleep 0.25s
	pactl set-sink-volume 0 50%
else 
	pactl set-sink-volume 0 15%
	sleep 0.25s
	cvlc --random --quiet $HOME/Music/
fi
