#!/usr/bin/env bash

DEPLOYER_HOME="/home/deployer"

apt-get install -y zsh

if [ ! -d $DEPLOYER_HOME ]; then
  adduser \
    --home $DEPLOYER_HOME \
    --shell /bin/zsh \
    --gid `id -g www-data`\
    --disabled-password \
    --gecos "Deployer" \
    deployer

  mkdir -m 700 $DEPLOYER_HOME/.ssh

  for rsa_file in keys/*.pub; do
    cat $rsa_file >> $DEPLOYER_HOME/.ssh/authorized_keys
  done

  cp files/users/.zshrc $DEPLOYER_HOME

  chmod 700 $DEPLOYER_HOME/.ssh/authorized_keys

  ln -s $RBENV_ROOT $DEPLOYER_HOME/.rbenv

  chown -R deployer:www-data $DEPLOYER_HOME
fi
