cd
#git clone https://github.com/rbenv/rbenv.git ~/.rbenv
#git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

#sudo apt-get install build-essential libssl-dev libcurl4-openssl-dev libreadline-dev -y

# rbenv-install 2022
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

#cd ~/.rbenv && src/configure && make -C src

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

#ruby -v

#echo '==== Installing  Postgres, sqlite dependency'
#sudo apt-get install libsqlite3-dev libpq-dev
