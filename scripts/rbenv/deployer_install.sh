#!/usr/bin/env bash

DEPLOYER_HOME=/home/deployer
RBENV_ROOT=$DEPLOYER_HOME/.rbenv

# Install rbenv
source <(curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer)

source $DEPLOYER_HOME/rbenv_env.sh

# Install ruby
if [ ! -d "$RBENV_ROOT/versions/$RUBY_VERSION" ]; then
  rbenv install $RUBY_VERSION
fi

rbenv global $RUBY_VERSION
rbenv rehash
