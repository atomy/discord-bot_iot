#!/bin/bash

set -e

echo "Running inner deployment..."
cd apps/discord-bot_iot
docker-compose pull
docker-compose up -d
./notification.sh
echo "Running inner deployment...DONE"