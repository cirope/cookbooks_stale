#!/usr/bin/env bash

DEPLOYER_HOME=/home/deployer
RBENV_ROOT=$DEPLOYER_HOME/.rbenv

source $DEPLOYER_HOME/.profile

# Install rbenv
source <(curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer)

# Install ruby
if [ ! -d "$RBENV_ROOT/versions/$RUBY_VERSION" ]; then
  rbenv install $RUBY_VERSION
fi

rbenv global $RUBY_VERSION
rbenv rehash
