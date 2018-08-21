## This file is public on github
# ZSH config is in ~/.zshrc
export EDITOR=vim
ZSH_THEME="agnoster"
RPROMPT='%{$fg[red]%}$(rbenv version-name)%{$reset_color%}%'

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

stty stop undef
xset r rate 255

############ SSH tips
# Access a servers website (behind a firewall) on ip:8080
# Server needs to add 'GatewayPorts yes' in /etc/ssh/sshd_config
# ssh -L 8080:localhost:80 user@host

# Allow Local device to access the tunnel via lanip:8080
# ssh -L \*8080:localhost:8443 user@host

# display my local rails app(must be running on 3000) on a remote machine:8080
# ssh -R 8080:localhost:3000 user@remote

# If hopserver:2200 is the only one with ssh access to endpoint:2200
# ssh -p2200 root@hopserver -L 2201:endpoint:2200 -N
# Then ftp to localhost port 2201

# ssh -D 12345 root@proxyserver
# Firefox: Pref - Advanced - Network - Settings -Manual Proxy
# - Socks Host: localhost, Port 12345
# ssh -D 192.168.0.10 ... allows lan clients to share the tunnel (not only localhost)

#programs
alias handy="printf 'Keyboard: \txmodmap -pke, xev, showkey,
Programs: \tgetprocid, exo-preferred-applications,
Volume: \tpavucontrol, paprefs (RTP settings for network server)
Color picker: \tgpick
Airplay: \tmkchromecast
dd progress: \tsudo kill -USR1 $(pgrep ^dd)
debug: \t dmesg, vmstat 1, mpstat -P ALL, iostat -xz 1,
debug: \t sar -n DEV 1, sar -n TCP, ETCP 1
webcamgrab: outputs to /tmp
'"

#i3 config
alias config="vi ~/.i3/config.base"
alias edit='vi ~/.i3/zsh.zsh'       # (edit this file)


# Programs etc
alias ap='ansible-playbook'
alias b='bundle'
alias be='bundle exec'
alias bu='bundle update'
alias dn='docker node'
alias doc='docker'
alias doci='docker images'
alias dock='docker'
alias doco='docker-compose'
alias docrmc='docker rm `docker ps -aq`'
alias docrmi='docker rmi --force'
alias docrmu='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias ds='docker service'
alias dst='docker stats $(docker ps --format={{.Names}})'
alias fm='free -m'
alias gap='git add -p'
alias gop='git-open'
alias gs='git status'
alias getprocid='xprop | grep WM_CLASS'
alias htop='htop -d 30'
alias img=gpicview
alias cast='python ~/dev/mkchromecast/bin/mkchromecast'
alias open=xdg-open
alias pi='ping 8.8.8.8'
alias r='rails'
alias rs='rails server -b 0.0.0.0'
alias rgrep='rgrep --color'
alias sshc='vi ~/.ssh/config'
alias rb='rbenv'
alias vag='vagrant'
alias vi='vim -p'
alias vim='vim -p'
alias vimrc='vim ~/.vimrc'
alias vio='vim -O'
alias webcamgrab="ffmpeg -f video4linux2 -i /dev/video0 -vframes 1 -strftime 1 /tmp/%Y-%m-%d_%H-%M-%S_webcamgrab.jpg"
alias wn='watch -n'
alias xclip='xclip -selection c'

# Folders
alias f="cd ~/fablab/"
alias l=ll
alias la='ls -lAhp --group-directories-first'
alias ll='ls -lhp --group-directories-first'

# Switch timezones
alias IS="timedatectl  set-timezone Atlantic/Reykjavik"
alias KOB="timedatectl set-timezone Europe/Copenhagen"

# Scripts
alias workdual="sh ~/.i3/scripts/disp-dtu-dual-2560.sh"
alias homedual="sh ~/.i3/scripts/disp-home-dualHD.sh"
alias single="sh ~/.i3/scripts/disp-home-single.sh"
alias home2="sh ~/.i3/scripts/disp-home2.sh"
alias fablab="sh ~/.i3/scripts/fablab.sh"
alias wer='curl wttr.in/bcn'
alias cheat='curl cheat.sh/$1'

