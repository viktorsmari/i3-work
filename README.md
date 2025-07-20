dotfiles (formerly i3-work)
=======

Goal: get up and running quickly with a clean install of Sway (or i3) on Ubuntu

This repo contains dotfiles for:
- Sway (using since 2024)
- Waybar (moved from i3status to be able to click on the bar)
- i3 (used it from 2014 - 2024)
- vim and nvim

I started using `stow` to easily symlink more configs

How to use this repo
- Clone or download this repo to your home directory
- `cd dotfiles`
- Install `stow` and install the stuff you want:
`stow sway waybar nvim`

### Install EVERYTHING with one command

Don't run this unless you trust me and have verified the files contents:

`wget -qO- https://raw.githubusercontent.com/viktorsmari/dotfiles/master/setup.sh | bash`

### Notes

* See/edit the generatei3.sh if you want i3 with 2 or more computers with different setup
* The 'Meta + Shift + r' will run the generatei3.sh, and restarting i3wm.

The reason for this is I used this repo on 2 different computers, work and home, and they had different XF86 and audio settings.

Read more about my [computing.md](computing.md)
