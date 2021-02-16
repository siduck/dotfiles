#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ];
then
for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export SESSION=${1:-flu}

case $SESSION in
  aww  )  exec awesome;;
  bsp  )  exec bspwm;;
  too  ) exec  ~/Public/./script_2b.sh;; 
  one  ) exec onedwm_bar;;
  dwm ) exec nordwm_bar;; 
  chad ) exec chadwm_bar;; 
  sii )  exec sidwm_bar;;
  ice  ) exec  icewm-session ;;
  jwm  ) exec jwm;;
  gruv   ) exec i3 -c ~/Public/i3confs/gruv/config;;
  opp  ) exec openbox-session;;
  db ) exec bspwm -c ~/Public/bspwmConfs/drabspwm;;
  foo  ) exec bspwm -c ~/Public/bspwmConfs/forestBsp;;
  bee  ) exec bspwm -c ~/Public/bspwmConfs/onebs;; 
  mat  ) exec bspwm -c ~/Public/bspwmConfs/material;; 
  min ) exec  bspwm -c ~/Public/bspwmConfs/minimal;; 
  flu  ) exec bash ~/.fluxbox/startup && fluxbox ;;
  ii ) exec i3 ;;
      * ) exec $1;;
  esac
