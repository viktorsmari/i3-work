#!/bin/bash

echo "======== Answer (y/n) - default: no ========"

echo "1. Do you want git setup?"
read -p 'y / n :' USE_GIT

if [[ $USE_GIT = 'y' ]]; then
  echo "1b. What is your email? (For git config)"
  read -p 'Email: ' MY_EMAIL
  read -p 'User name: ' MY_USER
fi

echo "2b. Do you want to install i3 (y / n)"
read -p 'y / n : ' USE_I3

if [[ $USE_I3 = 'y' ]]; then
  echo "3. Which i3 version, stable or dev (s / d)"
  read -p 'i3 version: ' I3VERSION
fi

echo "3. Do you want all dependencies installed?"
read -p 'y / n : ' USE_DEP

echo "4. Do you want oh my zsh installed?"
read -p 'y / n : ' USE_OHMZ

echo "6. Do you want vim plugins installed?"
read -p 'y / n : ' USE_VIM

echo "7. Do you want rbenv installed?"
read -p 'y / n : ' USE_RBENV

echo "8. Do you want nvm installed?"
read -p 'y / n : ' USE_NVM

echo '======== Questions done ========'

echo 'TODO: The ~/.zshrc file (which is not in this repo), loads plugins and sets ZSH theme. Link it with ln?'
echo 'TODO: generate SSH key'

if [[ $USE_DEP = 'y' ]]; then
  echo "================== Install programs  ====================="
  sudo apt-get update
  read -p 'Press enter to continue.'
  sudo apt-get install -y pwgen curl nmap zsh git git-core arandr g++ automake make \
    chromium-browser tree scrot bc traceroute htop whois xclip thunar bmon glipper \
    vim vim-gnome vim-snippets vim-snipmate xbacklight gpicview powerline gnome-terminal \
    python-pip virtualenv libnotify silversearcher-ag
  #gnome-icon-theme-full
else
  echo "==== no install dep"
fi

if [[ $USE_I3 = 'y' ]]; then
  echo "================== Clone my i3 repo and setup ====================="
  cd

  #TODO: fails when repo exists
  git clone https://github.com/viktorsmari/i3-work.git ~/.i3
  if [[ $I3VERSION = 's' ]]; then

    echo "stable"
    read -p 'Press enter to continue.'
    # Install i3 stable newest
    sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
    sudo apt-get update
    sudo apt-get --allow-unauthenticated install sur5r-keyring
    sudo apt-get update
    sudo apt-get install i3 -y
  else
    echo "unstable"
    read -p 'Press enter to continue.'
    # unstable dev
    sudo echo 'deb http://build.i3wm.org/ubuntu/trusty trusty main' >> /etc/apt/sources.list
    sudo apt-get update
    sudo apt-get --allow-unauthenticated install i3-autobuild-keyring
    sudo apt-get update
    sudo apt-get install i3
  fi

  # Link i3 status bar
  if [[ $(hostname -s) = "tpad" ]]; then
    ln -s ~/.i3/i3status_thinkpad.conf ~/.i3status.conf
  else
    ln -s ~/.i3/i3status.conf ~/.i3status.conf
  fi

  # Create the first config
  ~/.i3/generatei3.sh

else
  echo "==== no install i3"
fi

if [[ $USE_GIT = 'y' ]]; then
  echo "================== Setup git ====================="
  git config --global core.editor "vim"
  git config --global push.default matching
  git config merge.tool vimdiff
  git config merge.conflictstyle diff3
  git config mergetool.prompt false
  git config --global user.name $MY_USER
  git config --global user.email $MY_EMAIL

  #TODO: Generate ssh key?
  # ssh-keygen -t rsa -b 4096
else
  echo "==== no install git"
fi

if [[ $USE_VIM = 'y' ]]; then
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
else
  echo "==== no install vim"
fi


if [[ $USE_OHMZ = 'y' ]]; then
  echo "================== Setup oh-my-zsh ====================="

  #TODO (fails): Change default shell to ZSH
  chsh -s /bin/zsh

  # install oh my zsh
  wget --no-check-certificate http://install.ohmyz.sh -O - | sh

  # link my zsh config
  ln -s ~/.i3/zsh.zsh ~/.oh-my-zsh/custom/zsh.zsh
else
  echo "==== no install oh my zsh"
fi


if [[ $USE_RBENV = 'y' ]]; then
  echo "================== Setup rbenv ====================="
  #TODO: untested
  cd
  ~/.i3/scripts/rbenv.sh
fi

if [[ $USE_NVM = 'y' ]]; then
  #TODO: untested
  echo "================== Setup nvm in ~/.nvm ====================="
  cd
  git clone https://github.com/creationix/nvm.git .nvm
  cd ~/.nvm

  echo 'export NVM_DIR="$HOME/.nvm"' >> .zshrc
  # This loads nvm
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> .zshrc
  # This loads nvm bash_completion
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> .zshrc
else
  echo "==== no install rbenv"
fi

echo 'All done!'


