RUBY_VERSION="2.0.0-p0"

# Just install the minimal to compile ruby
apt-get -y update
apt-get -y install build-essential libssl-dev git-core curl

su -l deployer scripts/rbenv/deployer_install.sh
