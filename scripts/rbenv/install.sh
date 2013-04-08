RUBY_VERSION="2.0.0-p0"

# Just install the minimal to compile ruby
apt-get -y update
apt-get -y install build-essential libssl-dev git-core curl

DEPLOYER_HOME=/home/deployer
RBENV_ROOT=$DEPLOYER_HOME/.rbenv

# Install rbenv
su deployer
curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

echo "export RBENV_ROOT=\"\${HOME}/.rbenv\"" >> $DEPLOYER_HOME/.profile
echo "if [ -d \"\${RBENV_ROOT}\" ]; then" >> $DEPLOYER_HOME/.profile
echo "  export PATH=\"\${RBENV_ROOT}/bin:\${PATH}\"" >> $DEPLOYER_HOME/.profile
echo "  eval \"\$(rbenv init -)\"" >> $DEPLOYER_HOME/.profile
echo "fi" >> $DEPLOYER_HOME/.profile


 #Install ruby
if [ ! -d "$RBENV_ROOT/versions/$RUBY_VERSION" ]; then
  $RBENV_ROOT/bin/rbenv install $RUBY_VERSION
fi

export PATH="$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH"

rbenv global $RUBY_VERSION
rbenv rehash

sudo su -
