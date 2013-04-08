#!/usr/bin/env bash

if [ ! -d /etc/nginx ]; then
  apt-get -y install python-software-properties

  add-apt-repository ppa:nginx/stable
  apt-get -y update

  apt-get -y install nginx
fi
