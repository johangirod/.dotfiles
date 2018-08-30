#/bin/bash!

# 0 - install utilities
# 0a - java
sudo apt-get install -y default-jre
# 0b - curl
sudo apt-get install -y curl


# 1 - install && configure git
sudo apt-get install -y git
git config --global user.email "johangirod@gmail.com"
git config --global user.name "Johan Girod"
git config --global push.default simple
git config --global pull.rebase true

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
# 4b - install prezto
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
# 4b/i- install && configure prezto modules
# TODO

# 4c - install z.sh
sudo mkdir -p /opt/z
cd /opt/z
sudo wget https://github.com/rupa/z/raw/master/z.sh

# 4c' - install fasd
cd /tmp/
git clone git@github.com:clvv/fasd.git
cd ./fasd
sudo make install

# 5 - install node
mkdir /tmp/nodejs && cd /tmp/nodejs
wget http://nodejs.org/dist/node-latest.tar.gz
tar xzvf node-latest.tar.gz && cd node-v*
./configure
make && sudo make test && sudo make install
# 5.a - change permission to yarn folder
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
# 5.b - install npm and yarn
npm install npm@latest -g
curl -o- -L https://yarnpkg.com/install.sh | bash
# 5.c - raise the number of files that could be concurrently watched
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# 6 - install haskell
sudo apt-get install -y haskell-platform
# 6.a Install stack
wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
# -- if unbuntu 15.04
echo 'deb http://download.fpcomplete.com/ubuntu/vivid stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
sudo apt-get update && sudo apt-get install stack -y

# 7 - Generate a ssh key for this computer
ssh-keygen -t rsa -b 4096 -C "johangirod@gmail.com"
ssh-add ~/.ssh/id_rsa
nano ~/.ssh/id_rsa.pub &
ssh -T git@github.com


# 8 - Customize .zshrc
cat >> ~/.zshrc << EOF

# Add custom lines to .zshrc
source ~/.dotfiles/.customrc
EOF


# 9 - install python env (pip)
cd /tmp
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

# 10 - docker
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker johan
# 10b - docker-compose
pip install -U docker-compose

# 11 - Styling
# 11a - add font
mkdir ~/.fonts
cd ~/.fonts
# TODO
# 11b - install compiz
sudo apt-get install -y compizconfig-settings-manager compiz-plugins-extra

# 12 install fuck
wget -O - https://raw.githubusercontent.com/nvbn/thefuck/master/install.sh | sh - && $0



source ~/.zshrc
