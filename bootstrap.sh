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

echo "5. Do you want neovim and plugins installed?"
read -p 'y / n : ' USE_NEOVIM

echo "6. Do you want vim plugins installed?"
read -p 'y / n : ' USE_VIM

echo "7. Do you want rbenv installed?"
read -p 'y / n : ' USE_RBENV

echo "8. Do you want nvm installed?"
read -p 'y / n : ' USE_NVM

echo '======== Questions done ========'

echo 'TODO: The ~/.zshrc file (which is not in this repo), loads plugins. Create it here and link it with ln?'
echo 'TODO: generate SSH key'

if [[ $USE_DEP = 'y' ]]; then
  echo "======== Install programs ========"
  echo "This is aimed at Ubuntu 20, if you have a different version and a package installation fails, it could cancel the rest of the operations"
  sudo apt-get update
  read 'Updating complete, now installing packages...'
  # VIP packages
  sudo apt-get install -y curl nmap zsh git g++ automake make \
    chromium-browser tree gnome-screenshot htop whois thunar bmon \
    vim gnome-terminal
  # Packages likely to fail:
  sudo apt-get install -y scrot silversearcher-ag pwgen vim-snippets vim-snipmate gpicview powerline \
    gromit-mpx inotify-tools flameshot rofi arandr xbacklight xclip jq xfce4-clipman python3-venv ncdu \
    libpq-dev zlib1g-dev

  mkdir ~/Pictures/screenshots
  mkdir -p ~/.config/xfce4/terminal
  cp terminalrc ~/.config/xfce4/terminal/

else
  echo "======== no install dep"
fi

if [[ $USE_I3 = 'y' ]]; then
  echo "======== Clone my i3 repo and setup ========"
  cd

  #TODO: fails when repo exists
  git clone https://github.com/viktorsmari/i3-work.git ~/.i3
  if [[ $I3VERSION = 's' ]]; then
    echo "Installing i3-stable"
    read -p 'Press enter to continue.'
    # Install i3 stable newest
    sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
    sudo apt-get --allow-unauthenticated install sur5r-keyring -y
  else
    echo "Installing i3-unstable"
    read -p 'Press enter to continue.'
    # unstable dev
    # TODO: FAILS
    sudo echo 'deb http://build.i3wm.org/ubuntu/trusty trusty main' >> /etc/apt/sources.list
    sudo apt-get --allow-unauthenticated install i3-autobuild-keyring -y
  fi

  sudo apt-get update
  sudo apt-get install i3 i3blocks -y

  # Link i3 status bar
  if [[ $(hostname -s) = "tpad" ]]; then
    ln -s ~/.i3/i3status_thinkpad.conf ~/.i3status.conf
  else
    ln -s ~/.i3/i3status.conf ~/.i3status.conf
    ln -s ~/.i3/i3blocks.conf ~/.i3blocks.conf
  fi

  # Create the first config
  ~/.i3/generatei3.sh

else
  echo "======== no install i3"
fi

if [[ $USE_GIT = 'y' ]]; then
  echo "======== Setup git ========"
  git config --global core.editor "vim"
  git config --global merge.conflictstyle diff3
  git config --global merge.tool vimdiff
  git config --global mergetool.prompt false
  git config --global pull.rebase=true
  git config --global push.default matching
  git config --global push.followTags true
  git config --global user.email $MY_EMAIL
  git config --global user.name $MY_USER

  #TODO: Generate ssh key?
  # ssh-keygen -t rsa -b 4096
else
  echo "======== no install git"
fi

if [[ $USE_NEOVIM = 'y' ]]; then
  echo "======== Setup neovim ========"
  sudo apt-get install -y neovim
  mkdir ~/.config/nvim
  ln -s ~/.i3/init.vim ~/.config/nvim/init.vim

  echo "installing plug for nvim..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Install plugins
  nvim -c 'PlugInstall' -c 'qa!'
fi

if [[ $USE_VIM = 'y' ]]; then
  echo "======== Setup vim ========"

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
  echo "======== no install vim"
fi


if [[ $USE_OHMZ = 'y' ]]; then
  echo "======== Setup oh-my-zsh ========"
  echo "Remember to check if there is a newer way of installing oh-my-zsh?"

  #TODO (fails): Change default shell to ZSH
  sudo chsh -s /bin/zsh

  # install oh my zsh
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

  # link my zsh config
  ln -s ~/.i3/zsh.zsh ~/.oh-my-zsh/custom/zsh.zsh

  echo "cloning zsh-autosuggestions... did not work the last time!"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "You must add it to .zshrc plugins()"
else
  echo "======== no install oh my zsh"
fi


if [[ $USE_RBENV = 'y' ]]; then
  echo "======== Setup rbenv ========"
  sh ~/.i3/scripts/rbenv.sh
fi

if [[ $USE_NVM = 'y' ]]; then
  #TODO: untested
  echo "======== Setup nvm in ~/.nvm ========"
  cd
  git clone https://github.com/creationix/nvm.git .nvm

  echo 'source ~/.i3/scripts/lazy_nvm.sh' >> .zshrc
else
  echo "======== no install rbenv"
fi

echo 'All done!'
