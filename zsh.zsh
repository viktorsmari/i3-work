## This file is public on github
# ZSH config is in ~/.zshrc
export EDITOR=vim
ZSH_THEME="dieter"

stty stop undef
xset r rate 255

#programs
alias prog="printf 'Keyboard: \txmodmap -pke, xev, showkey,
Programs: \tgetprocid, exo-preferred-applications, 
Volume: \tpavucontrol, paprefs (RTP settings for network server)
Color picker: \tgpick
Airplay:	\t rygel
'"
alias getprocid='xprop | grep WM_CLASS'

#i3 config
alias config="vi ~/.i3/config.base"
alias edit='vi ~/.i3/zsh.zsh'

#handy
alias www='cd /var/www/html/'
alias open=xdg-open
alias xclip='xclip -selection c'
alias pi='ping 8.8.8.8'

#vol
alias volup='pactl set-sink-volume 1 +10%'
alias vold='pactl set-sink-volume 1 10%'

# ssh -L 8080:localhost:8443 user@host

# ssh -p2200 root@hopserver -L 2201:endpoint:2200 -N
# Then ftp to localhost port 2201

#system
alias v="vim"
alias vi="vim"
alias vimrc="vim ~/.vimrc"

alias ll='ls -lhp --group-directories-first'
alias l=ll
alias la='ls -lAhp --group-directories-first'

# Switch timezones
alias IS="timedatectl  set-timezone Atlantic/Reykjavik"
alias AMS="timedatectl set-timezone Europe/Amsterdam"
alias KOB="timedatectl set-timezone Europe/Copenhagen"

