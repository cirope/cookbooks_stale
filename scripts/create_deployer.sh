#!/usr/bin/env bash

DEPLOYER_HOME="/home/deployer"

apt-get install -y zsh

if [ ! -d $DEPLOYER_HOME ]; then
  adduser \
    --home $DEPLOYER_HOME \
    --shell /bin/zsh \
    --gid `id -g www-data` \
    --ingroup admin \
    --disabled-password \
    --gecos "Deployer" \
    deployer

  mkdir -m 700 $DEPLOYER_HOME/.ssh

  for rsa_file in keys/*.pub; do
    cat $rsa_file >> $DEPLOYER_HOME/.ssh/authorized_keys
  done

  cp files/users/.zshrc $DEPLOYER_HOME
  cp files/users/.gemrc $DEPLOYER_HOME

  chmod 700 $DEPLOYER_HOME/.ssh/authorized_keys

  chown -R deployer:www-data $DEPLOYER_HOME

  echo "deployer ALL=NOPASSWD:ALL" >> /etc/sudoers
fi
