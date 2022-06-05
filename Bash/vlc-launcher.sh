#=====================================================================================#
#Ver 1.0
#	Created launcher to play music library without launching and manually starting
#	VLC. It will also play next track at random and suppress errors.
#	Verified script with ShellCheck [https://www.shellcheck.net/]
#=====================================================================================#
#!/bin/bash

if pgrep 'vlc' ; then
	pkill vlc
else 
	cvlc --random --quiet $HOME/Music/
fi
