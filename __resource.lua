-- manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
-- description
description 'Roleplay Chat'
-- ver
version '2.1.0'
-- client script
client_script 'client/main.lua'
-- and server scripts, yea i am dumb
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
    'server/server.lua'
}
