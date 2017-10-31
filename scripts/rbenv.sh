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

# Postgres, sqlite dep
sudo  apt-get install libsqlite3-dev libpq-dev
