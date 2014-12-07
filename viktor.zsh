# This file is public on github

#plugins=(torrent)
#ZSH_THEME=""
#config
alias i="vi ~/.i3/config.base"
alias edit='vi ~/.i3/viktor.zsh'
alias prog='echo gpick, xev, xmodmap -pke'
alias getprocid='xprop | grep WM_CLASS'
stty stop undef

#handy
alias www='cd /var/www/html/'
alias weather=" nohup /opt/extras.ubuntu.com/my-weather-indicator/bin/my-weather-indicator &"
alias open=xdg-open
alias xclip='xclip -selection c'
alias pi='ping 8.8.8.8'

#vol
alias volup='pactl set-sink-volume 1 +10%'
alias vold='pactl set-sink-volume 1 10%'

#adv
alias avahifix='sudo service avahi-daemon stop'
alias tunnel='echo ssh -L 8080:localhost:8443 user@host'

alias ll='ls -lhp --group-directories-first'
alias l=ll
alias la='ls -lAhp --group-directories-first'

# Switch timezones
alias IS="timedatectl  set-timezone Atlantic/Reykjavik"
alias AMS="timedatectl set-timezone Europe/Amsterdam"
alias KOB="timedatectl set-timezone Europe/Copenhagen"


