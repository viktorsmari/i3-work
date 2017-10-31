cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

cd ~/.rbenv && src/configure && make -C src

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc >> ~/.zshrc

source ~/.zshrc

type rbenv

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo apt-get install build-essential libssl-dev libcurl4-openssl-dev libreadline-dev -y

ruby -v
rbenv install --list

echo '==== Installing ruby 2.4.1, ctrl+c to cancel'
rbenv install 2.4.1
rbenv global 2.4.1


echo '==== Installing  Postgres, sqlite dependency'
sudo apt-get install libsqlite3-dev libpq-dev
