#!/usr/bin/env bash

COOKBOOKS_DIR="$( cd "$( dirname "$0" )" && pwd )"

source scripts/create_deployer.sh
source scripts/rbenv/install.sh
source scripts/postgresql/install.sh
source scripts/nginx/install.sh
source scripts/nodejs/install.sh
