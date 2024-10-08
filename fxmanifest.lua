fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Haxalott'
description 'Armory script'
version 'Beta'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    'shared/*.lua',
    '@ox_lib/init.lua'
}