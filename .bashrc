# .bashrc

alias lc='colorls -lA --sd'
#export CC=gcc
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#history completition using fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# my prompt

PS1="\[\033[32m\]  \[\033[37m\]\[\033[34m\]\w \[\033[0m\]"
PS2="\[\033[32m\]  > \[\033[0m\]"

# 
#eval "$(starship init bash)"

PATH=$PATH:~/.local/bin
PATH=$PATH:~/.local/bin/v
# bash history unlimited 

HISTSIZE= 
HISTFILESIZE=

# my aliases
alias gg='g++ ~/Documents/dummies/main.cpp && ~/Documents/dummies/./a.out'
alias cc='g++ ~/c.cpp && ~/./a.out'
alias ree='redshift -P -O 3333'
alias zz='doas zzz'
alias bb='doas ln -s /etc/sv/bluetoothd/ /var/service'
alias vim='nvim'
alias xmo='xmodmap  ~/.xmodmap-sid'
alias del='doas rm -r'
#xbps commands
alias xi='doas xbps-install'
alias xr='doas xbps-remove -Ro'
alias xu='doas xbps-install -Su && doas update-grub'
alias xq='xbps-query' 
alias comp='doas make install'
alias vav='doas xbps-install --repository ~/VUR/hostdir/binpkgs/'

# sx xinitrc commands
alias too='sx sh ~/.xinitrc too'
alias bsp='sx sh ~/.xinitrc bsp'
alias foo='sx sh ~/.xinitrc foo'
alias db='sx sh ~/.xinitrc db'
alias ice='sx sh ~/.xinitrc ice'
alias jw='sx sh ~/.xinitrc jwm'
alias opp='sx sh ~/.xinitrc opp'
alias dwm='sx sh ~/.xinitrc dwm'
alias gruv='sx sh ~/.xinitrc gruv'
alias sii='sx sh ~/.xinitrc sii'
alias ii='sx sh ~/.xinitrc ii'
alias bee='sx sh ~/.xinitrc bee' 
alias bruh='sx sh ~/Public/./script_2b.sh'
alias one='sx sh ~/.xinitrc one'
alias nord='sx sh ~/.xinitrc nord'
alias fluu='sx sh ~/.xinitrc flu'
alias based='sx sh ~/.xinitrc base'
alias doo='doas'
alias ttc='tty-clock -c -C 7 -r -f "%A, %B %d"'

# mpd aliases to stop / run
alias kek=" killall mpd ncmpcpp ncmpcpp_cover_art.sh"
alias mpd=" mpd && ~/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug"
alias mpdd="kek && mpd"

#alias mpd=" mpd && ncmpcpp"
#alias mpdd="doo ln -s /etc/sv/mpd /var/service/ " 
#alias mpk=" doas rm /var/service/mpd"

# youtube-dl to download stuffs

alias yt='youtube-dl --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3'

alias ytv='youtube-dl --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata'

# check mem
alias pmem='doo ps_mem.py'

alias ls='logo-ls'
alias la='logo-ls -A'
alias ll='logo-ls -al'
# equivalents with Git Status on by Default
alias lsg='logo-ls -D'
alias lag='logo-ls -AD'
alias llg='logo-ls -alD'
alias neof='clear && neofetch --source ~/.local/bin/mangagirl'
alias neo='neofetch'
#alias add='ffmpeg -i'
#alias art='-c:a copy -c:v copy -map 0:0 -map 1:0 -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" '
#alias art='lame --ti'
alias xd='xdeb -Sde'
alias xii='xi -R binpkgs'

#export BROWSER=/opt/ungoogled-chromium-eloston/ungoogled-chromium_87.0.4280.88-1.1_linux/chrome
