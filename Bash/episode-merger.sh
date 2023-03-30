#!/bin/bash
#=====================================================================================#
#Ver 1.0
#	Created and tested file to use ffmpeg to merge two video files into one for TV
#		$HOME that are split.  ffmpeg merges the files, mapfile generates array
#		based on a list that is created by ls and modified by the user
#	Verified with ShellCheck
#=====================================================================================##

filesMoved=n listReady=n x=1 y=2 z=1

mkdir "$HOME/Downloads/Episodes"
read -rp "Have the videos been moved to the directory? (y to continue, q to quit): " filesMoved
printf "\n"

if [ "$filesMoved" == "y" ]; then

	ls -RaA -1 "$HOME/Downloads/Episodes" > "$HOME/Downloads/video-list.txt"
	read -rp "Is the video-list.txt file ready? (y to continue, q to quit): " listReady

	if [ "$listReady" == "y" ]; then

		mapfile -t CatVids < "$HOME/Downloads/video-list.txt"
		lines=${CatVids[0]}

		until [ "$y" -gt "$lines" ]
		do
			ffmpeg -i "$HOME/Downloads/Episodes/${CatVids[$x]}" -c copy "$HOME/Downloads/Episodes/temp$x.ts"
			ffmpeg -i "$HOME/Downloads/Episodes/${CatVids[$y]}" -c copy "$HOME/Downloads/Episodes/temp$y.ts"
			ffmpeg -i "concat:$HOME/Downloads/Episodes/temp$x.ts|$HOME/Downloads/Episodes/temp$y.ts" -c copy "$HOME/Downloads/vid-$z.mp4"
			((x=x+2))
			((y=y+2))
			((z++))

		done
		rm "$HOME"/Downloads/Episodes/*.ts
		rm "$HOME"/Downloads/video-list.txt
		notify-send "Episode Merge Complete" --icon=selection-mode
	fi
fi
