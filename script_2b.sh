#!/bin/sh

picom &
xrdb merge ~/Public/xresources/ocean/.Xresources &
feh --bg-fill ~/Pictures/wall/moun.jpg &
xfce4-panel &
cp -r ~/Public/theme\ and\ icons/one/.gtkrc-2.0 ~/ &
cp -r ~/Public/poly/jwm/polybar ~/.config &
cp -r ~/Public/theme\ and\ icons/one/settings.ini  ~/.config/gtk-3.0/ &
~/.config/polybar/launch.sh &
cp -r ~/Public/rofi/one/rofi ~/.config & 
cp -r ~/Public/xfcee/2bw/xfce4 ~/.config &
exec /usr/local/bin/2bwm
