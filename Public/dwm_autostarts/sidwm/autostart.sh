#!/bin/sh

# rofi theme 
cp -r ~/Public/rofi/dwm/rofi/ ~/.config/ &

picom & 
# for terminal theme
xrdb merge ~/Public/xresources/base/.Xresources &

# for icon/gtk themes 
cp -r ~/Public/theme\ and\ icons/dwm/.gtkrc-2.0 ~/ & 
cp -r ~/Public/theme\ and\ icons/dwm/settings.ini  ~/.config/gtk-3.0/ &


#wallpaper

feh --bg-fill ~/Pictures/wall/ninja.png &

cp -r ~/Desktop/nvim_confs/base/init.vim ~/.config/nvim &
~/Public/dwm_autostarts/sidwm/bar &

siduck
