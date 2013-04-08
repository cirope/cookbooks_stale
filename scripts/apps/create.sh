#!/usr/bin/env bash

function usage
{
  cat <<-EOT
    $0 app_name [options]:
    -h    Show this help
    -d    Database name (app_name if not supplied)
    -u    Database user (app_name if not supplied)
    -p    Database password (app_name if not supplied)
EOT
}

if test $# -gt 0; then
  APP_NAME=$1;
  shift
else
  echo "You must provide an app_name"
  usage
  exit 1
fi

while getopts "hd:u:p:" OPTION; do
  case $OPTION in
    h)
      usage
      exit 0
      ;;
    d)
      PG_DB="$OPTARG"
      ;;
    u)
      PG_ROLE=$OPTARG
      ;;
    p)
      PG_PASSWORD=$OPTARG
      ;;
    \?)
      echo -e "\n  Option does not exist : $OPTARG\n"
      usage
      exit 1
      ;;
  esac
done

shift $(($OPTIND-1))

: ${PG_DB:=${APP_NAME}_production}
: ${PG_ROLE:=$APP_NAME}
: ${PG_PASSWORD:=$APP_NAME}

source scripts/postgresql/create_db_and_role.sh

mkdir -p /var/rails/$APP_NAME
chown deployer:www-data /var/rails/$APP_NAME
