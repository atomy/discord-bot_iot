#!/bin/bash

set -e

ips=( "192.168.2.20" "192.168.2.21" "192.168.2.22" )

for ip in "${ips[@]}"
do
  echo "Deploying to pi@${ip}..."
  scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@${ip}:~/.docker/config.json
  scp -o StrictHostKeyChecking=no docker-compose.kitchen.yml pi@${ip}:/home/pi/apps/discord-bot_iot/docker-compose.yml
  scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@${ip}:/home/pi/apps/discord-bot_iot/deployInner.sh
  scp -o StrictHostKeyChecking=no scripts/notification.sh pi@${ip}:/home/pi/apps/discord-bot_iot/notification.sh
  scp -o StrictHostKeyChecking=no changes pi@${ip}:/home/pi/apps/discord-bot_iot/changes
  ssh -o StrictHostKeyChecking=no pi@${ip} "cd /home/pi/apps/discord-bot_iot && ./deployInner.sh"
  echo "Deploying to pi@${ip}...DONE"
done