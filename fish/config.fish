alias xi='sudo xbps-install'
alias xr='sudo xbps-remove -Ro'
alias xu='sudo xbps-install -Su && sudo update-grub'
alias xq='xbps-query' 

alias hmp='sudo zzz'

function fish_greeting
end


funcsave fish_greeting

set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /home/sid/.local/bin

