fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_teleporter'
description 'MSK Teleporter'
version '1.0'

lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'config.lua'
}

client_script {
	'client.lua'
}

dependencies {
	'es_extended'
}