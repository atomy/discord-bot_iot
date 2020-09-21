#!/bin/bash

set -e

cd apps/discord-bot_iot
docker-compose pull
docker-compose up -d
./notification.sh