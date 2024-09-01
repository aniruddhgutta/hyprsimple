#!/bin/bash
#Mutes audio using pulseaudio

DEFAULT_SINK=$(pactl info | grep "Default Sink" | cut -d " " -f3)
pactl set-sink-mute "$DEFAULT_SINK" toggle
dunstify " mute" -t 800 -r 1

canberra-gtk-play -i audio-volume-change -d "changevolume"
