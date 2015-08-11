#/bin/bash!
# 1 - install git
sudo apt-get install -y git
git config --global user.email "johangirod@gmail.com"
git config --global user.name "Johan Girod"


# 2 - install guake
cd /opt/
sudo apt-get install -y python-keybinder
sudo git clone https://github.com/Guake/guake.git
cd guake
sudo chmod -u+xrw dev.sh
sudo ./dev.sh --install &
sudo ln -s ./dev.sh /usr/bin/guake

# 3 -install sublime
cd /tmp
sudo wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
sudo dpkg -i sublime-text_build-3083_amd64.deb

# 4 - install zsh 
sudo apt-get install -y zsh
# 4 b - install prezto 
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
# 4 b i- install prezto modules



# 5 - install node
mkdir /tmp/nodejs && cd /tmp/nodejs
wget http://nodejs.org/dist/node-latest.tar.gz
tar xzvf node-latest.tar.gz && cd node-v*
./configure
make && make test && make install

# 5.a - install node utilities

# 6 - install haskell
sudo apt-get install haskell-platform
# 6.a Install stack
wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/vivid stable main'|sudo tee /etc/apt/sources.list.d/fpco.list # -- if unbuntu 15.04
sudo apt-get update && sudo apt-get install stack -y

