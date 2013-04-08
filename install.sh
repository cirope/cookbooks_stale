#!/usr/bin/env bash

export RBENV_ROOT="/opt/rbenv"
RUBY_VERSION="2.0.0-p0"

# Just install the minimal to compile ruby
apt-get -y update
apt-get -y install build-essential libssl-dev git-core

# Install rbenv
if [ ! -d "$RBENV_ROOT" ]; then
  git clone git://github.com/sstephenson/rbenv.git "$RBENV_ROOT"
  git clone git://github.com/sstephenson/ruby-build.git "$RBENV_ROOT/plugins/ruby-build"
fi

# Install ruby
if [ ! -d "$RBENV_ROOT/versions/$RUBY_VERSION" ]; then
  $RBENV_ROOT/bin/rbenv install $RUBY_VERSION
fi

export PATH="$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH"

rbenv global $RUBY_VERSION
rbenv rehash

# Link global rbenv to the current user
if [ ! -d "$HOME/.rbenv" ]; then
  ln -s $RBENV_ROOT "$HOME/.rbenv"

  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
  echo 'eval "$(rbenv init -)"' >> ~/.profile

  exec $SHELL -l
fi

source scripts/create_deployer.sh
source scripts/postgresql/install.sh
