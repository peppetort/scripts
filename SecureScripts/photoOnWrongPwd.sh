#!/bin/bash

data="$(date +"%Y-%m-%d_%T")"

fswebcam -q  -r 1920x1080 --jpeg 85 -D 1 /home/peppetort/Immagini/Login\ Failure/$data.jpg
exit 0
