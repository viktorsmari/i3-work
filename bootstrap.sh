#!/bin/bash

echo "======== TODO ========"

echo "1. What is your email? (For git config)"
read -p 'Email: ' MY_EMAIL

echo "2. Do you want stable or dev i3 (s / d)"
read -p 'i3 version: ' I3VERSION

echo "3. Do you want rbenv installed?"
read -p 'y / n ' USE_RBENV

echo "4. Do you want nvm installed?"
read -p 'y / n ' USE_NVM

echo '-------'
echo $MY_EMAIL
echo $I3VERSION
echo $USE_RBENV
echo $USE_NVM

echo 'TODO: The ~/.zshrc file (which is not in this repo), loads plugins and sets ZSH theme. Link it with ln?'
echo 'TODO: Install rbenv? scripts/rbenv.sh'
echo 'TODO: Install nvm?'
echo 'TODO: generate SSH key'

#exit

sudo apt-get update
echo "================== Install programs  ====================="
sudo apt-get install -y pwgen curl nmap zsh git git-core arandr g++ automake make \
  chromium-browser tree scrot bc traceroute htop whois xclip thunar bmon glipper \
  vim vim-gnome vim-snippets vim-snipmate xbacklight gpicview powerline gnome-terminal \
  python-pip virtualenv libnotify
#gnome-icon-theme-full

echo "================== Clone my i3 repo and setup ====================="
cd
git clone https://github.com/viktorsmari/i3-work.git ~/.i3

# Install i3 stable newest
sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install i3 -y

# Use this if you rather want unstable dev
#sudo echo 'deb http://build.i3wm.org/ubuntu/trusty trusty main' >> /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get --allow-unauthenticated install i3-autobuild-keyring
#sudo apt-get update
#sudo apt-get install i3

# Link i3 status bar
if [[ $(hostname -s) = "tpad" ]]; then
  ln -s ~/.i3/i3status_thinkpad.conf ~/.i3status.conf
else
  ln -s ~/.i3/i3status.conf ~/.i3status.conf
fi

# Create the first config
~/.i3/generatei3.sh

echo "================== Setup git ====================="
git config --global core.editor "vim"
git config --global push.default matching
git config --global user.name "Viktor Smari"
#git config --global user.email "email"

# Generate ssh key?
# ssh-keygen -t rsa -b 4096

echo "================== Setup vim ====================="

# Get Vundle, Vim plugin manager
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#link vimrc
ln -s ~/.i3/vimrc ~/.vimrc

# Get vim color scheme monokai
mkdir -p ~/.vim/colors
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -P ~/.vim/colors
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -P ~/.vim/colors

# Install plugins
vim -c 'PluginInstall' -c 'qa!'


echo "================== Setup oh-my-zsh ====================="

#TODO (fails): Change default shell to ZSH
chsh -s /bin/zsh

# install oh my zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# link my zsh config
ln -s ~/.i3/zsh.zsh ~/.oh-my-zsh/custom/zsh.zsh


if [[ $USE_RBENV -eq 'y' ]]; then
  echo '==== Installing rbenv ...'
  #TODO: untested
  cd
  ~/.i3/scripts/rbenv.sh
fi

if [[ $USE_NVM -eq 'y' ]]; then
  #TODO: untested
  echo '==== Installing nvm in ~/.nvm ...'
  cd
  git clone https://github.com/creationix/nvm.git .nvm
  cd ~/.nvm

  echo 'export NVM_DIR="$HOME/.nvm"' >> .zshrc
  # This loads nvm
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> .zshrc
  # This loads nvm bash_completion
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> .zshrc
fi

echo 'All done!'


