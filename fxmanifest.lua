fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'cmdscripts'
version '1.0.0'
description 'simply script for holster shit'

client_script 'client.lua'
server_script 'server.lua'
shared_script {
    '@ox_lib/init.lua',
    'config.lua'
}

dependency 'ox_lib'
