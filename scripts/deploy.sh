#!/bin/bash

set -e

echo "Deploying to pi-kitchen@2003:d4:1f23:ba00:2427:f7a3:3c10:c4ad..."
scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@2003:d4:1f23:ba00:2427:f7a3:3c10:c4ad:~/.docker/config.json
scp -o StrictHostKeyChecking=no docker-compose.kitchen.yml pi@2003:d4:1f23:ba00:2427:f7a3:3c10:c4ad:/home/pi/apps/discord-bot_iot/docker-compose.yml
scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@2003:d4:1f23:ba00:2427:f7a3:3c10:c4ad:/home/pi/apps/discord-bot_iot/deployInner.sh
scp -o StrictHostKeyChecking=no scripts/notification.sh pi@2003:d4:1f23:ba00:2427:f7a3:3c10:c4ad:/home/pi/apps/discord-bot_iot/notification.sh
scp -o StrictHostKeyChecking=no changes pi@2003:d4:1f23:ba00:2427:f7a3:3c10:c4ad:/home/pi/apps/discord-bot_iot/changes
ssh -o StrictHostKeyChecking=no pi@2003:d4:1f23:ba00:2427:f7a3:3c10:c4ad "cd /home/pi/apps/discord-bot_iot && ./deployInner.sh"
echo "Deploying to pi-kitchen@2003:d4:1f23:ba00:2427:f7a3:3c10:c4ad...DONE"

echo "Deploying to pi-office@2003:d4:1f23:ba00:f4d0:9c00:206f:69fa..."
scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@2003:d4:1f23:ba00:f4d0:9c00:206f:69fa:~/.docker/config.json
scp -o StrictHostKeyChecking=no docker-compose.office.yml pi@2003:d4:1f23:ba00:f4d0:9c00:206f:69fa:/home/pi/apps/discord-bot_iot/docker-compose.yml
scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@2003:d4:1f23:ba00:f4d0:9c00:206f:69fa:/home/pi/apps/discord-bot_iot/deployInner.sh
scp -o StrictHostKeyChecking=no scripts/notification.sh pi@2003:d4:1f23:ba00:f4d0:9c00:206f:69fa:/home/pi/apps/discord-bot_iot/notification.sh
scp -o StrictHostKeyChecking=no changes pi@2003:d4:1f23:ba00:f4d0:9c00:206f:69fa:/home/pi/apps/discord-bot_iot/changes
ssh -o StrictHostKeyChecking=no pi@2003:d4:1f23:ba00:f4d0:9c00:206f:69fa "cd /home/pi/apps/discord-bot_iot && ./deployInner.sh"
echo "Deploying to pi-office@2003:d4:1f23:ba00:f4d0:9c00:206f:69fa...DONE"

echo "Deploying to pi-relay2@2003:d4:1f23:ba00:5ff:4195:12d:ae12..."
scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@2003:d4:1f23:ba00:5ff:4195:12d:ae12:~/.docker/config.json
scp -o StrictHostKeyChecking=no docker-compose.relay.yml pi@2003:d4:1f23:ba00:5ff:4195:12d:ae12:/home/pi/apps/discord-bot_iot/docker-compose.yml
scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@2003:d4:1f23:ba00:5ff:4195:12d:ae12:/home/pi/apps/discord-bot_iot/deployInner.sh
scp -o StrictHostKeyChecking=no scripts/notification.sh pi@2003:d4:1f23:ba00:5ff:4195:12d:ae12:/home/pi/apps/discord-bot_iot/notification.sh
scp -o StrictHostKeyChecking=no changes pi@2003:d4:1f23:ba00:5ff:4195:12d:ae12:/home/pi/apps/discord-bot_iot/changes
ssh -o StrictHostKeyChecking=no pi@2003:d4:1f23:ba00:5ff:4195:12d:ae12 "cd /home/pi/apps/discord-bot_iot && ./deployInner.sh"
echo "Deploying to pi-relay2@2003:d4:1f23:ba00:5ff:4195:12d:ae12...DONE"