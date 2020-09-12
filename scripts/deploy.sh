#!/bin/bash

set -e

scp ~/.docker/config.json app@192.168.2.20:~/.docker/config.json

scp -o StrictHostKeyChecking=no docker-compose.kitchen.yml pi@${ip}:/home/pi/apps/discord-bot_iot_kitchen/docker-compose.yml
#scp -o StrictHostKeyChecking=no docker-compose.buero.yml pi@${ip}:/home/pi/apps/discord-bot_iot_buero/docker-compose.yml
#scp -o StrictHostKeyChecking=no docker-compose.relay.yml pi@${ip}:/home/pi/apps/discord-bot_iot_relay/docker-compose.yml

ssh app@192.168.2.20 "cd /home/pi/apps/discord-bot_iot_kitchen && docker-compose pull && docker-compose up -d"
#ssh app@192.168.2.20 "cd /home/pi/apps/discord-bot_iot_buero && docker-compose pull && docker-compose up -d"
#ssh app@192.168.2.20 "cd /home/pi/apps/discord-bot_iot_relay && docker-compose pull && docker-compose up -d"