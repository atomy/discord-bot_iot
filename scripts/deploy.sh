#!/bin/bash

set -e

scp -o StrictHostKeyChecking=no ~/.docker/config.json pi@192.168.2.20:~/.docker/config.json

scp -o StrictHostKeyChecking=no docker-compose.kitchen.yml pi@${ip}:/home/pi/apps/discord-bot_iot_kitchen/docker-compose.yml
#scp -o StrictHostKeyChecking=no docker-compose.buero.yml pi@${ip}:/home/pi/apps/discord-bot_iot_buero/docker-compose.yml
#scp -o StrictHostKeyChecking=no docker-compose.relay.yml pi@${ip}:/home/pi/apps/discord-bot_iot_relay/docker-compose.yml

ssh -o StrictHostKeyChecking=no pi@192.168.2.20 "cd /home/pi/apps/discord-bot_iot_kitchen && docker-compose pull && docker-compose up -d"
#ssh -o StrictHostKeyChecking=no pi@192.168.2.20 "cd /home/pi/apps/discord-bot_iot_buero && docker-compose pull && docker-compose up -d"
#ssh -o StrictHostKeyChecking=no pi@192.168.2.20 "cd /home/pi/apps/discord-bot_iot_relay && docker-compose pull && docker-compose up -d"