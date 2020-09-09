i3-work
=======

This repo contains my i3wm config along with some install scripts for fast setup on a CLEAN computer

This will change our git username to me, so change it afterwards with:

`git config --global user.name "YOURNAME"`


### Install EVERYTHING with one command

Don't run this unless you trust me and have verified the files contents:

`wget -qO- https://raw.githubusercontent.com/viktorsmari/i3-work/master/bootstrap.sh| sh`


### Notes

* The **config** file is gitignored because it is generated by joining **config.base** with **config-whatever** depending on the hostname.

* See/edit the generatei3.sh if you need similar setup

* The 'Meta + Shift + r' will run the generatei3.sh, and restarting i3wm.

The reason for this is I used this repo on 2 different computers, work and home, and they had different XF86 and audio settings.


Read more about my [computing.md](computing.md)
