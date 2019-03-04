#!/bin/bash

debug=$1

while true
do
	h=$(date +%H)
	m=$(date +%M)
	n=0
	path="/home/peppetort/Wallpaper/Dynamic\ Background/mojave_dynamic_"
	extention=".jpeg"
	
	if [ $h -eq 00 ];
	then
		h=0
	elif [ $h -eq 10 ];
	then
		h=10
	elif [ $h -eq 20 ];
	then
		h=20
	else
		h=${h##*0}
	fi
	
		if [ "$h" -ge 8 ] && [ "$h" -le 16 ];
		then
			n=$(($h-5))
			path="$path$n$extention"	
			/home/peppetort/Wallpaper/Dynamic\ Background/scripts/changeImg.sh "$path"
		else
			if [ "$h" -lt 23 ] && [ "$h" -gt 8 ]
			then
				temp=$(($h%2))
		
				if [ "$temp" -eq 1 ];
				then
					n=$(($h-($h/3)))
			
				else
					h=$(($h-1))
					n=$(($h-($h/3)))
				fi

			elif [ "$h" -eq 23 ] || [ "$h" -eq 24 ];
			then
				n=15
			elif [ "$h" -eq 1 ] || [ "$h" -eq 2 ];
			then
				n=16
			elif [ "$h" -eq 3 ] || [ "$h" -eq 4 ];
			then
				n=1
			elif [ "$h" -eq 5 ] || [ "$h" -eq 6 ] || [ "$h" -eq 7 ];
			then
				n=2
			fi
		
		path="$path$n$extention"
		/home/peppetort/Wallpaper/Dynamic\ Background/scripts/changeImg.sh "$path"
	fi
	
	h=$(date +%H)
	m=$(date +%M)

	if [ $m -ne 00 ];
	then
		h1=$((($h+1)*3600))
		h=$(($h*3600))
		if [ "$m" -eq 09 ];
		then
			m=540
		else
			m=$(($m*60))
		fi
		timeInSec=$(($h+$m))
		sleeptime=$(($h1-$timeInSec))
	else
		sleeptime=3600
	fi


	sleep $sleeptime
	
done

