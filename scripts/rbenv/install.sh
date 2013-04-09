RUBY_VERSION="2.0.0-p0"

# Just install the minimal to compile ruby
apt-get -y update
apt-get -y install build-essential libssl-dev git-core curl

if [ ! -d /home/deployer/.rbenv ]; then
  cat files/config/rbenv/env.sh >> /home/deployer/.profile
fi

cp scripts/rbenv/deployer_install.sh /home/deployer/
chown deployer:www-data /home/deployer/deployer_install.sh

su -l deployer -c /home/deployer/deployer_install.sh
rm /home/deployer/deployer_install.sh
