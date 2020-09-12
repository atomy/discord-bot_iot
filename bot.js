const Discord = require('discord.js')
const client = new Discord.Client()
var util = require('util')
const NATS = require('nats')

require('console-stamp')(console, 'HH:MM:ss.l');
var lastUpdate = 0

if (!process.env.IOT_HOSTNAME_SELEKTOR || process.env.IOT_HOSTNAME_SELEKTOR.length <= 0) {
    console.log('ERROR: Env variable IOT_HOSTNAME_SELEKTOR does not exists or is empty!')
    process.exit(1)
}

if (!process.env.DISCORD_API_KEY || process.env.DISCORD_API_KEY.length <= 0) {
    console.log('ERROR: Env variable DISCORD_API_KEY does not exists or is empty!')
    process.exit(1)
}

if (!process.env.NATS_IP || process.env.NATS_IP.length <= 0) {
    console.log('ERROR: Env variable NATS_IP does not exists or is empty!')
    process.exit(1)
}

const discordApiKey = process.env.DISCORD_API_KEY
const iotHostnameSelektor = process.env.IOT_HOSTNAME_SELEKTOR
const natsIp = process.env.NATS_IP

client.on('ready', () => {
    console.log(`Logged in as ${client.user.tag}!`)
    setupNatsConnection()
});

// connect to nats backend, subscribe to queue and forward heartbeat events every now and then to discord-bot-status
setupNatsConnection = () => {
    console.log('Connecting to nats-backend: ' + natsIp)
    const nc = NATS.connect(natsIp)

    nc.subscribe('heartbeat', (msg, reply, subject, sid) => {
        const message = JSON.parse(msg)
        // console.log('Received message: ' + msg)
        const currentUnixTimestamp = Math.floor(+new Date() / 1000);

        if (message.action === "HEARTBEAT" && iotHostnameSelektor === message.hostname) {
            // only update every 60s
            if (currentUnixTimestamp - lastUpdate > 60) {
                lastUpdate = currentUnixTimestamp
                const activityMessage = getFormattedUptime(message.uptime)
                console.log('Setting activity: ' + activityMessage)
                client.user.setActivity(activityMessage, {type: 'WATCHING'});
            }
        }
    })
}

// format uptime-line to set into activity
getFormattedUptime = (inputUptime) => {
    let matches = inputUptime.match(/load average: ([0-9\.]+), ([0-9\.]+), ([0-9\.]+)/)
    return util.format('L: %s|%s|%s', matches[1], matches[2], matches[3])
}

console.log("Connecting and login in...")
client.login(discordApiKey)
