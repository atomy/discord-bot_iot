#!/bin/bash

set -e

echo "Deploying to pi-kitchen@192.168.2.22..."
scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@192.168.2.22:~/.docker/config.json
scp -o StrictHostKeyChecking=no docker-compose.kitchen.yml pi@192.168.2.22:/home/pi/apps/discord-bot_iot/docker-compose.yml
scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@192.168.2.22:/home/pi/apps/discord-bot_iot/deployInner.sh
scp -o StrictHostKeyChecking=no scripts/notification.sh pi@192.168.2.22:/home/pi/apps/discord-bot_iot/notification.sh
scp -o StrictHostKeyChecking=no changes pi@192.168.2.22:/home/pi/apps/discord-bot_iot/changes
ssh -o StrictHostKeyChecking=no pi@192.168.2.22 "cd /home/pi/apps/discord-bot_iot && ./deployInner.sh"
echo "Deploying to pi-kitchen@192.168.2.22...DONE"

echo "Deploying to pi-buero@192.168.2.21..."
scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@192.168.2.21:~/.docker/config.json
scp -o StrictHostKeyChecking=no docker-compose.buero.yml pi@192.168.2.21:/home/pi/apps/discord-bot_iot/docker-compose.yml
scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@192.168.2.21:/home/pi/apps/discord-bot_iot/deployInner.sh
scp -o StrictHostKeyChecking=no scripts/notification.sh pi@192.168.2.21:/home/pi/apps/discord-bot_iot/notification.sh
scp -o StrictHostKeyChecking=no changes pi@192.168.2.21:/home/pi/apps/discord-bot_iot/changes
ssh -o StrictHostKeyChecking=no pi@192.168.2.21 "cd /home/pi/apps/discord-bot_iot && ./deployInner.sh"
echo "Deploying to pi-buero@192.168.2.21...DONE"

echo "Deploying to pi-relay2@192.168.2.20..."
scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@192.168.2.20:~/.docker/config.json
scp -o StrictHostKeyChecking=no docker-compose.relay.yml pi@192.168.2.20:/home/pi/apps/discord-bot_iot/docker-compose.yml
scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@192.168.2.20:/home/pi/apps/discord-bot_iot/deployInner.sh
scp -o StrictHostKeyChecking=no scripts/notification.sh pi@192.168.2.20:/home/pi/apps/discord-bot_iot/notification.sh
scp -o StrictHostKeyChecking=no changes pi@192.168.2.20:/home/pi/apps/discord-bot_iot/changes
ssh -o StrictHostKeyChecking=no pi@192.168.2.20 "cd /home/pi/apps/discord-bot_iot && ./deployInner.sh"
echo "Deploying to pi-relay2@192.168.2.20...DONE"