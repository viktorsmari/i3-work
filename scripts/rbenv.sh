cd
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

source ~/.zshrc

type rbenv

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

sudo apt-get install build-essential libssl-dev libcurl4-openssl-dev libreadline-dev -y

ruby -v
rbenv install --list


