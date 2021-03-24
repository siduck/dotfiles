#!/bin/sh
picom &
xrdb merge ~/Public/xresources/compiz/.Xresources 
xfce4-panel &
feh --bg-fill ~/Pictures/wall/voidblue.png &
cp -r ~/Public/theme\ and\ icons/2bwm/.gtkrc-2.0 ~/
cp -r ~/Public/theme\ and\ icons/2bwm/settings.ini  ~/.config/gtk-3.0/
exec /usr/local/bin/2bwm
