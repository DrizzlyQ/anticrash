fx_version 'cerulean'
game 'gta5'

author 'Drizzly'
description 'Crash exploit detector with Discord webhook alerts'
version '1.0.0'

client_script 'client.lua'
server_script {
    'config.lua',
    'server.lua'
}
shared_script 'config.lua'
