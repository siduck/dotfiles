#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

feh --bg-fill ~/Pictures/wall/vanord.png &
xrdb merge ~/Public/xresources/flux/.Xresources &
picom & 
cp -r ~/Public/theme\ and\ icons/flux/.gtkrc-2.0 ~/ &
cp -r ~/Public/theme\ and\ icons/flux/settings.ini  ~/.config/gtk-3.0/ &

cp -r ~/Public/rofi/awesome/rofi/ ~/.config/

