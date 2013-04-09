RUBY_VERSION="2.0.0-p0"

# Just install the minimal to compile ruby
apt-get -y update
apt-get -y install build-essential libssl-dev git-core curl

if [ ! -d /home/deployer/.rbenv ]; then
  cat files/config/rbenv/env.sh >> /home/deployer/.profile
fi

cp scripts/rbenv/deployer_install.sh /home/deployer/
cp scripts/rbenv/env.sh /home/deployer/rbenv_env.sh
chown deployer:www-data /home/deployer/deployer_install.sh
chown deployer:www-data /home/deployer/rbenv_env.sh

su -l deployer -c /home/deployer/deployer_install.sh

rm /home/deployer/deployer_install.sh
rm /home/deployer/rbenv_env.sh

# From https://github.com/fesplugas/rbenv-bootstrap

sudo apt-get -y install zlib1g-dev libssl-dev
sudo apt-get -y install libreadline-gplv2-dev
sudo apt-get -y install libxml2 libxml2-dev libxslt1-dev
