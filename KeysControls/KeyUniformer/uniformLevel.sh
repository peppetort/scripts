#!/bin/bash

path=/sys/class/leds

luminance(){
	read -r level < "$path"/asus::kbd_backlight/brightness
	echo $level
}

echo $(luminance) > "$path"/asus::kbd_backlight_1/brightness

inotifywait -me modify --format '' "$path"/asus::kbd_backlight/brightness | while read; do
	echo $(luminance) > "$path"/asus::kbd_backlight_1/brightness
done
