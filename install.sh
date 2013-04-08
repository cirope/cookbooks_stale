#!/usr/bin/env bash

export RBENV_ROOT="/opt/rbenv"
RUBY_VERSION="2.0.0-p0"

apt-get -y install build-essential libssl-dev git-core

if [ ! -d "$RBENV_ROOT" ]; then
  git clone git://github.com/sstephenson/rbenv.git "$RBENV_ROOT"
  git clone git://github.com/sstephenson/ruby-build.git "$RBENV_ROOT/plugins/ruby-build"
fi

if [ ! -d "$RBENV_ROOT/versions/$RUBY_VERSION" ]; then
  $RBENV_ROOT/bin/rbenv install $RUBY_VERSION
fi

export PATH="$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH"

gem install chef --no-ri --no-rdoc
