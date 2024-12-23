#!/bin/bash

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

echo "7. Do you want rbenv installed?"
read -p 'y / n : ' USE_RBENV

echo "8. Do you want MISE installed?"
read -p 'y / n : ' USE_MISE

echo -e '======== Questions done ========\n'

echo 'TODO: The ~/.zshrc file (which is not in this repo), loads plugins. Create it here and link it with ln?'
echo 'TODO: generate SSH key'

if [[ $USE_DEP = 'y' ]]; then
  echo -e "======== Install programs ========\n"

  sudo apt-get update

  # VIP packages
  sudo apt-get install -y curl nmap zsh git g++ automake make \
    tree gnome-screenshot htop whois thunar bmon \
    alacritty \
    vim-gtk3 \
    vim \
    libyaml-dev \
    nm-tray

  # Packages likely to fail:
  sudo apt-get install -y scrot silversearcher-ag pwgen gpicview powerline \
    redis-server \
    wl-clipboard \
    mako-notifier \
    grim grimshot \
    postgresql postgresql-contrib libpq-dev \
    inotify-tools flameshot rofi arandr xbacklight xclip jq xfce4-clipman python3-venv ncdu \
    libpq-dev zlib1g-dev

  mkdir -p ~/Pictures/screenshots
  mkdir -p ~/.config/xfce4/terminal
  cp terminalrc ~/.config/xfce4/terminal/

else
  echo -e "\n======== no install dep"
fi

if [[ $USE_I3 = 'y' ]]; then
  echo -e "\n======== Clone my i3 repo and setup ========\n"
  cd

  #TODO: fails when repo exists
  git clone https://github.com/viktorsmari/i3-work.git ~/.i3

  sudo apt-get install -y i3

  # Link i3 status bar
  ln -s ~/.i3/i3status.conf ~/.i3status.conf
  ln -s ~/.i3/i3blocks.conf ~/.i3blocks.conf
  ln -s ~/.i3/alacritty.toml ~/.alacritty.yml

  # Create the first config
  ~/.i3/generatei3.sh

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
  ln -s ~/.i3/init.vim ~/.config/nvim/init.vim

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

  #link vimrc
  ln -s ~/.i3/vimrc ~/.vimrc

  # Get vim color scheme monokai
  mkdir -p ~/.vim/colors
  wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -P ~/.vim/colors
  wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -P ~/.vim/colors

  # Install plugins
  vim -c 'PluginInstall' -c 'qa!'
else
  echo -e "\n======== no install vim\n"
fi


if [[ $USE_OHMZ = 'y' ]]; then
  echo -e "\n======== Setup oh-my-zsh ========\n"
  echo -e "Remember to check if there is a newer way of installing oh-my-zsh?\n"

  #TODO (fails): Change default shell to ZSH
  sudo chsh -s /bin/zsh

  # install oh my zsh
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # link my zsh config
  ln -s ~/.i3/zsh.zsh ~/.oh-my-zsh/custom/zsh.zsh

  echo -e "\ncloning zsh-autosuggestions... did not work the last time!\n"
  #git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  source ~/.i3/scripts/install_zsh-autosuggestions.sh

  echo -e "\nYou must add it to .zshrc plugins()"
else
  echo -e "\n======== no install oh my zsh\n"
fi

if [[ $USE_MISE = 'y' ]]; then
  echo -e "\n======== Setup mise ========\n"
  curl https://mise.run | sh
  echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc
fi

if [[ $USE_RBENV = 'y' ]]; then
  echo -e "\n======== Setup rbenv ========\n"
  sh ~/.i3/scripts/rbenv.sh
fi

echo -e 'All done!\n'
