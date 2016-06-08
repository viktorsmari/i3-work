#Step 1 - install programs including git to be able to clone in the next step
sudo apt-get install pwgen curl nmap vim vim-gnome zsh git git-core arandr g++ automake make chromium-browser tree scrot bc traceroute htop whois xclip thunar bmon glipper vim-snippets vim-snipmate
#gnome-icon-theme-full 

#Step 2 - Clone the i3 repo
git clone https://github.com/viktorsmari/i3-work.git ~/.i3

#Step 3 - install i3 stable
sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install i3

# Use this if you rather want unstable dev
#sudo echo 'deb http://build.i3wm.org/ubuntu/trusty trusty main' >> /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get --allow-unauthenticated install i3-autobuild-keyring
#sudo apt-get update
#sudo apt-get install i3

# Link i3 status bar
ln -s ~/.i3/i3status.conf ~/.i3status.conf


#Step 4 - Git

#git settings
git config --global core.editor "vim"
git config --global push.default matching
#git config --global user.name ""
#git config --global user.email "email"


#Step 5 - Vim

#Vim plugin manager
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#link vimrc
ln -s ~/.i3/vimrc ~/.vimrc

#vim color scheme monokai
mkdir -p ~/.vim/colors
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -P ~/.vim/colors
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -P ~/.vim/colors


#Step 6 - Shell

# change default shell
chsh -s /bin/zsh 

# install oh my zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# link my zsh config 
ln -s ~/.i3/zsh.zsh ~/.oh-my-zsh/custom/zsh.zsh

echo 'Remember to check if this is needed: (sudo?) chsh -s /bin/zsh'

#TODO: what about .zshrc?
