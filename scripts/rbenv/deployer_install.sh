#!/usr/bin/env bash

DEPLOYER_HOME=/home/deployer
RBENV_ROOT=$DEPLOYER_HOME/.rbenv

# Install rbenv
cat vendor/rbenv-installer/master/bin/rbenv-installer | bash

exec $SHELL -l

# Install ruby
if [ ! -d "$RBENV_ROOT/versions/$RUBY_VERSION" ]; then
  rbenv install $RUBY_VERSION
fi

rbenv global $RUBY_VERSION
rbenv rehash
