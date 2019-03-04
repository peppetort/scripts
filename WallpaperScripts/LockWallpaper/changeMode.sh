
STATE=`cat /home/peppetort/Wallpaper/LockWallpaper/state`
echo $STATE

if [ "$STATE" = "directionMode" ]
then
	cp /home/peppetort/Wallpaper/img1.png /home/peppetort/Wallpaper/img.png
	echo " " > /home/peppetort/Wallpaper/LockWallpaper/state
	kdialog --passivepopup 'Modalità blocco in Safe Mode' 3 &
else
	cp /home/peppetort/Wallpaper/img1NSFW.png /home/peppetort/Wallpaper/img.png
	echo "directionMode" > /home/peppetort/Wallpaper/LockWallpaper/state
	kdialog --passivepopup 'Modalità blocco in NSFW Mode' 3 &
fi

pkill lockMon.sh 
/home/peppetort/Wallpaper/LockWallpaper/lockMon.sh "$STATE" &
