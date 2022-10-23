cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo apt-get install build-essential libssl-dev libcurl4-openssl-dev libreadline-dev -y

cd ~/.rbenv && src/configure && make -C src

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

source ~/.zshrc

type rbenv

ruby -v
#rbenv install --list

#echo '==== Installing ruby 2.5.3, ctrl+c to cancel'
#rbenv install 2.5.3
#rbenv global 2.5.3


#echo '==== Installing  Postgres, sqlite dependency'
#sudo apt-get install libsqlite3-dev libpq-dev
