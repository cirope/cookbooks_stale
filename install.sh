#!/usr/bin/env bash

RBENV_DIR="/opt/rbenv"

if [ ! -d "$RBENV_DIR" ]; then
  git clone git://github.com/sstephenson/rbenv.git "$RBENV_DIR";
  git clone git://github.com/sstephenson/ruby-build.git "$RBENV_DIR/plugins/ruby-build";
fi
