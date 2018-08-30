mkdir -p ~/evaneos
cd ~/evaneos

git clone git@github.com:Evaneos/evaneos-ng.git
git clone git@github.com:Evaneos/ev-fdm.git

# install fabric
sudo apt-get -y install fabric

cd ./evaneos-ng
make docker-pull
cd ./docker/dev
fab install
fab build
cd docker-compose
cp docker-compose-default.yml.dist docker-compose-default.yml
cd ..
fab start


# Add host to env
sudo sh -c 'sudo cat >> /etc/hosts << EOF
	127.0.0.1 static1.local.evaneos.com static2.local.evaneos.com static3.local.evaneos.com static4.local.evaneos.com static5.local.evaneos.com
	127.0.0.1 www.local.evaneos.com www.local.evaneos.it www.local.evaneos.es www.local.evaneos.de www.local.evaneos-travel.com
	127.0.0.1 pro.local.evaneos.com pro.local.evaneos.it pro.local.evaneos.es pro.local.evaneos.de pro.local.evaneos-travel.com
EOF'


sudo rm -r ~/evaneos/evaneos-ng/applications/pro.evaneos.com/web/browser-vendor/bower_components/ev-fdm
sudo ln -s ~/evaneos/ev-fdm ~/evaneos/evaneos-ng/applications/pro.evaneos.com/web/browser-vendor/bower_components/ev-fdm
cd ~/evaneos/ev-fdm

#php 
sudo apt-get -y install php5-common libapache2-mod-php5 php5-cli php5-curl
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Others
sudo apt-get install knock