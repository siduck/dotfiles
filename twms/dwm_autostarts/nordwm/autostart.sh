#!/bin/sh

feh --bg-fill ~/Pictures/wall/moun.jpg &
xrdb merge ~/Public/xresources/sidnord/siflux &
picom & 
cp -r ~/Public/theme\ and\ icons/flux/.gtkrc-2.0 ~/ &
cp -r ~/Public/theme\ and\ icons/flux/settings.ini  ~/.config/gtk-3.0/ &

cp -r ~/Public/rofi/awesome/rofi/ ~/.config/

#wallpaper



# bar 
#~/.dwm/bar &


~/Public/dwm_autostarts/nordwm/bar &
dwm
