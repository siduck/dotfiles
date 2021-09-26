# bashrc
alias lc='colorls -lA --sd'

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# draw horiz line under prompt
draw_line() {
  local COLUMNS="$COLUMNS"
  while ((COLUMNS-- > 0)); do
    printf '\e[30m\u2500'
  done
}

# my prompt
PS1="\[\033[32m\]  \[\033[37m\]\[\033[34m\]\w \[\033[0m\]"
PS2="\[\033[32m\]  > \[\033[0m\]"

PATH=$PATH:~/.local/bin
PATH=$PATH:~/.node_modules/bin
PATH=$PATH:~/.volta/bin
PATH=$PATH:~/.cargo/bin

# bash history
HISTSIZE=
HISTFILESIZE=

# my aliases

alias use="xrdb merge"
alias load="kill -USR1 $(pidof st)"
alias wal="feh --bg-fill"
alias gg='g++ ~/Documents/dummies/main.cpp && ~/Documents/dummies/./a.out'
alias ww='wget'
alias cc='g++ ~/c.cpp && ~/./a.out'
alias ree='redshift -P -O 3500'
alias zz='doas zzz'
alias bb='doas ln -s /etc/sv/bluetoothd/ /var/service'
alias vi='bash ~/.local/bin/vi_padding && nvim'
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
alias sii='sx sh ~/.xinitrc sii'
alias chad='sx sh ~/.xinitrc chad'

alias bee='sx sh ~/.xinitrc bee'
alias bruh='sx sh ~/Public/./script_2b.sh'
alias one='sx sh ~/.xinitrc one'
alias nord='sx sh ~/.xinitrc nord'
alias fluu='sx sh ~/.xinitrc flu'
alias based='sx sh ~/.xinitrc base'
alias mat='sx sh ~/.xinitrc mat'
alias min='sx sh ~/.xinitrc min'
alias doo='doas'
alias ttc='tty-clock -c -C 7 -r -f "%A, %B %d"'

alias gl='git clone'
# mpd aliases to stop / run
alias kek=" killall mpd ncmpcpp ncmpcpp_cover_art.sh"
alias mpd=" mpd && ~/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug"
alias mpdd="kek && mpd"

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
alias nn='printf "\n" &&'

alias luamake=/home/sid/lua-language-server/3rd/luamake/luamake

alias ni='npm install -g'
alias nr='npm uninstall -g'

export FZF_DEFAULT_OPTS='
  --color fg:#646a76
  --color bg+:#7797b7,fg+:#2c2f30,hl:#D8DEE9,hl+:#26292a,gutter:#3a404c
  --color pointer:#373d49,info:#606672
  --border
  --color border:#646a76'

source ~/.fzf-tab-completion/bash/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'

# pmem |grep -E "picom|Xorg|bspwm|sxhkd"
. "$HOME/.cargo/env"
