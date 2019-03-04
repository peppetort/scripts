#!/bin/zsh


if [ "$1" = "backlight" ]
then
	if [ "$2" = "set" ]
	then
		BRI=$(xbacklight -get)
		BRI=$(printf '%.0f\n' $BRI)
		echo $BRI > /sys/class/backlight/acpi_video0/brightness 
	elif [ "$2" = "load" ]
	then
		BRI=$(cat /sys/class/backlight/acpi_video0/brightness)
		xbacklight -set $BRI
	fi

elif [ "$1" = "keybrightness" ]
then
	if [ "$2" = "set" ]
	then
		KBRI=$(cat /sys/class/leds/asus::kbd_backlight/brightness)
		echo $KBRI > /usr/local/bin/BrightnessControls/keyboardLevel
	elif [ "$2" = "load" ]
	then
		KBRI=$(cat /usr/local/bin/BrightnessControls/keyboardLevel)
		/usr/local/share/kbd_backlight set $KBRI	
	fi
fi
