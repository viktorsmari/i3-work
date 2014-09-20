# This file is public on github

#ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# ruby env
export PATH="$HOME/.rbenv/bin:$PATH"

alias weather=" nohup /opt/extras.ubuntu.com/my-weather-indicator/bin/my-weather-indicator &"
alias open=xdg-open
alias xclip='xclip -selection c'
alias edit='vi ~/.i3/viktor.zsh'
alias pi='ping mbl.is'
alias volup='pactl set-sink-volume 1 +10%'
alias vold='pactl set-sink-volume 1 10%'
alias avahifix='sudo service avahi-daemon stop'
alias tunnel='echo ssh -L 8080:localhost:8443 user@host'

# Pidgin requires this to work:
NSS_SSL_CBC_RANDOM_IV=0

# Switch timezones
alias IS="timedatectl  set-timezone Atlantic/Reykjavik"
alias LA="timedatectl set-timezone America/Los_Angeles"
alias NY="timedatectl set-timezone America/New_York"
alias AMS="timedatectl set-timezone Europe/Amsterdam"
alias KOB="timedatectl set-timezone Europe/Copenhagen"
alias LON="timedatectl set-timezone Europe/London"


