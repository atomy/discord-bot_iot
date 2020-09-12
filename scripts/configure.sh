#!/usr/bin/env bash

set -e

if [ -z "${ECR_PREFIX}" ] ; then
  echo "ENV: ECR_PREFIX is missing!"
  exit 1
fi

if [ -z "${DISCORD_KEY_BUERO}" ] ; then
  echo "ENV: DISCORD_KEY_BUERO is missing!"
  exit 1
fi

if [ -z "${DISCORD_KEY_KITCHEN}" ] ; then
  echo "ENV: DISCORD_KEY_KITCHEN is missing!"
  exit 1
fi

rm -f scripts/build.sh
rm -f scripts/push.sh
rm -f docker-compose.yml

cp docker-compose.buero.yml.dist docker-compose.buero.yml
sed -i "s|xxx.dkr.ecr.eu-central-1.amazonaws.com|${ECR_PREFIX}|" docker-compose.buero.yml
sed -i "s|xxx|${DISCORD_KEY_BUERO}|" docker-compose.buero.yml

cp docker-compose.kitchen.yml.dist docker-compose.kitchen.yml
sed -i "s|xxx.dkr.ecr.eu-central-1.amazonaws.com|${ECR_PREFIX}|" docker-compose.kitchen.yml
sed -i "s|xxx|${DISCORD_KEY_KITCHEN}|" docker-compose.kitchen.yml

cp scripts/build.sh.dist scripts/build.sh
sed -i "s|xxx.dkr.ecr.eu-central-1.amazonaws.com|${ECR_PREFIX}|" scripts/build.sh

cp scripts/buildAmd64.sh.dist scripts/buildAmd64.sh
sed -i "s|xxx.dkr.ecr.eu-central-1.amazonaws.com|${ECR_PREFIX}|" scripts/buildAmd64.sh

cp scripts/push.sh.dist scripts/push.sh
sed -i "s|xxx.dkr.ecr.eu-central-1.amazonaws.com|${ECR_PREFIX}|" scripts/push.sh