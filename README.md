i3-work
=======

This repo contains my i3wm config along with some install scripts for fast setup on a CLEAN computer

This will change our git username to me, so change it afterwards with:

`git config --global user.name "YOURNAME"`


### Install EVERYTHING with one command

Don't run this unless you trust me and have verified the files contents:

`wget -qO- https://raw.githubusercontent.com/viktorsmari/i3-work/master/bootstrap.sh| sh`


### Notes

* I use this repo on 2 different computers, work and home, and they had different audio settings.
Therefore have I bound the 'Meta + Shift + r' to reload the config, checking which computer you are on.
It checks which host you are on and generates a config with 'config.base' + config-computer
