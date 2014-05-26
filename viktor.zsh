# This file is public on github

alias xclip='xclip -selection c'
alias mum="echo 123"
alias edit='vi ~/.i3/viktor.zsh'
alias fresh='vi ~/.i3/freshInstall.txt'
alias pi='ping mbl.is'
alias fugl='nohup ~/.i3/pidginscript.sh &'
alias volup='pactl set-sink-volume 1 +10%'
alias vold='pactl set-sink-volume 1 10%'
alias avahifix='sudo service avahi-daemon stop'

# Pidgin requires this to work:
NSS_SSL_CBC_RANDOM_IV=0


# Switch timezones
alias IS="timedatectl  set-timezone Atlantic/Reykjavik"
alias LA="timedatectl set-timezone America/Los_Angeles"
alias NY="timedatectl set-timezone America/New_York"
alias AMS="timedatectl set-timezone Europe/Amsterdam"
alias KOB="timedatectl set-timezone Europe/Copenhagen"
alias LON="timedatectl set-timezone Europe/London"
