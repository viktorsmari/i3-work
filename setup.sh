#!/bin/bash

echo "Cloning repo and linking configs..."
if [ -d ~/dotfiles ]; then
  echo "Directory ~/dotfiles already exists. Not cloning repo again!"
else
  echo "Cloning i3 repo..."
  git clone https://github.com/viktorsmari/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles || exit
# print out current directory
echo "Current directory: $(pwd)"

mkdir -p ~/Pictures/screenshots

echo -e "\n======== Answer (y/n) - default: no ======== \n"

echo "1. Do you want git setup?"
read -p 'y / n :' USE_GIT

if [[ $USE_GIT = 'y' ]]; then
  echo "1b. What is your email? (For git config)"
  read -p 'Email: ' MY_EMAIL
  read -p 'User name: ' MY_USER
fi

echo "2b. Do you want to install i3 (y / n)"
read -p 'y / n : ' USE_I3

echo "3. Do you want all dependencies installed?"
read -p 'y / n : ' USE_DEP

echo "4. Do you want oh my zsh installed?"
read -p 'y / n : ' USE_OHMZ

echo "5. Do you want neovim and plugins installed?"
read -p 'y / n : ' USE_NEOVIM

echo "6. Do you want vim plugins installed?"
read -p 'y / n : ' USE_VIM

echo "7. Do you want MISE installed?"
read -p 'y / n : ' USE_MISE

echo -e '======== Questions done ========\n'

if [[ $USE_DEP = 'y' ]]; then
  echo -e "======== Install programs ========\n"

  sudo apt-get update

  # VIP packages
  sudo apt-get install -y curl nmap zsh git g++ automake make \
    stow \
    tree htop whois thunar bmon \
    btop \
    alacritty \
    vim-gtk3 \
    vim \
    libyaml-dev \
    nm-tray

  # Packages for Wayland
  sudo apt-get install -y wl-clipboard \
    grim grimshot \
    wf-recorder

  sudo apt-get install -y silversearcher-ag pwgen powerline \
    postgresql postgresql-contrib libpq-dev \
    inotify-tools jq ncdu \
    libpq-dev zlib1g-dev

  # Packages for X
  sudo apt-get install -y xbacklight xclip \
    xfce4-clipman rofi flameshot arandr
else
  echo -e "\n======== no install dep"
fi

if [[ $USE_I3 = 'y' ]]; then
  sudo apt-get install -y i3

  # Link i3 status bar
  ln -s ~/dotfiles/i3status.conf ~/.i3status.conf
  ln -s ~/dotfiles/i3blocks.conf ~/.i3blocks.conf

  # Create the first config
  ~/dotfiles/generatei3.sh
else
  echo -e "======== no install i3\n"
fi

if [[ $USE_GIT = 'y' ]]; then
  echo -e "\n======== Setup git ========\n"
  git config --global core.editor "vim"
  git config --global merge.conflictstyle diff3
  git config --global merge.tool vimdiff
  git config --global mergetool.prompt false
  git config --global pull.rebase true
  git config --global push.default matching
  git config --global push.followTags true
  git config --global user.email $MY_EMAIL
  git config --global user.name $MY_USER

  #TODO: Generate ssh key?
  # ssh-keygen -t rsa -b 4096
else
  echo -e "======== no install git\n"
fi

if [[ $USE_NEOVIM = 'y' ]]; then
  echo -e "======== Setup neovim ========\n"
  sudo apt-get install -y neovim
  mkdir ~/.config/nvim
  stow nvim

  echo -e "installing plug for nvim...\n"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Install plugins
  nvim -c 'PlugInstall' -c 'qa!'
fi

if [[ $USE_VIM = 'y' ]]; then
  echo -e "\n======== Setup vim ========\n"

  # Get Vundle, Vim plugin manager
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  stow vim

  # Get vim color scheme monokai
  mkdir -p ~/.vim/colors
  wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -P ~/.vim/colors
  wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -P ~/.vim/colors

  # Install plugins
  vim -c 'PluginInstall' -c 'qa!'
else
  echo -e "======== no install vim\n"
fi


if [[ $USE_OHMZ = 'y' ]]; then
  echo -e "\n======== Setup oh-my-zsh ========\n"
  echo -e "Remember to check if there is a newer way of installing oh-my-zsh?\n"

  #TODO (fails): Change default shell to ZSH
  sudo chsh -s /bin/zsh

  # install oh my zsh
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # link my zsh config
  stow zsh

  echo -e "\ncloning zsh-autosuggestions... did not work the last time!\n"
  #git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  source ~/dotfiles/scripts/install_zsh-autosuggestions.sh

  echo -e "\nYou must add it to .zshrc plugins()"
else
  echo -e "======== no install oh my zsh\n"
fi

if [[ $USE_MISE = 'y' ]]; then
  echo -e "\n======== Setup mise ========\n"
  curl https://mise.run | sh
  echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc
fi

echo -e 'All done!\n'
