#!/bin/bash

set -e

scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@192.168.2.22:~/.docker/config.json

scp -o StrictHostKeyChecking=no docker-compose.kitchen.yml pi@192.168.2.22:/home/pi/apps/discord-bot_iot/docker-compose.yml
scp -o StrictHostKeyChecking=no scripts/deployInner.sh pi@192.168.2.22:/home/pi/apps/discord-bot_iot/deployInner.sh
scp -o StrictHostKeyChecking=no scripts/notification.sh pi@192.168.2.22:/home/pi/apps/discord-bot_iot/notification.sh
scp -o StrictHostKeyChecking=no changes pi@192.168.2.22:/home/pi/apps/discord-bot_iot/changes
#scp -o StrictHostKeyChecking=no docker-compose.buero.yml pi@${ip}:/home/pi/apps/discord-bot_iot_buero/docker-compose.yml
#scp -o StrictHostKeyChecking=no docker-compose.relay.yml pi@${ip}:/home/pi/apps/discord-bot_iot_relay/docker-compose.yml

ssh -o StrictHostKeyChecking=no pi@192.168.2.22 "cd /home/pi/apps/discord-bot_iot && ./scripts/deployInner.sh"
#ssh -o StrictHostKeyChecking=no pi@192.168.2.22 "cd /home/pi/apps/discord-bot_iot && docker-compose pull && docker-compose up -d"
#ssh -o StrictHostKeyChecking=no pi@192.168.2.20 "cd /home/pi/apps/discord-bot_iot_buero && docker-compose pull && docker-compose up -d"
#ssh -o StrictHostKeyChecking=no pi@192.168.2.20 "cd /home/pi/apps/discord-bot_iot_relay && docker-compose pull && docker-compose up -d"