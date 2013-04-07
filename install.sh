#!/usr/bin/env bash

export RBENV_ROOT="/opt/rbenv"
RUBY_VERSION="2.0.0-p0"

apt-get -y install build-essential git-core

if [ ! -d "$RBENV_ROOT" ]; then
  git clone git://github.com/sstephenson/rbenv.git "$RBENV_ROOT"
  git clone git://github.com/sstephenson/ruby-build.git "$RBENV_ROOT/plugins/ruby-build"
fi

$RBENV_ROOT/bin/rbenv install $RUBY_VERSION
