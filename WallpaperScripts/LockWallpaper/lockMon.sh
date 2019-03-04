#!/bin/bash

ver=0

dbus-monitor --session "type='signal',interface='org.freedesktop.ScreenSaver'" |
	while read x; do
		if [ "$x" = "boolean true" ] && [ "$ver" = 0 ]
		then
			ver=1
			/home/peppetort/Wallpaper/LockWallpaper/downloadImg.sh "$1" 
		elif [ "$x" = "boolean false" ] 
		then
			/home/peppetort/Wallpaper/LockWallpaper/copyImg.sh "$1" 
			ver=0
		fi			
	done
