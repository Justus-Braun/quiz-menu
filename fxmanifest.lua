fx_version 'cerulean'

description 'Quiz Menu for FiveM'
author 'GFLP10#7754'
version '1.0.2'
repository 'https://github.com/Justus-Braun/quiz-menu'

lua54 'yes'

games {
  'gta5',
  'rdr3'
}

ui_page 'web/build/index.html'

client_script 'client/**/*'
shared_script '@ox_lib/init.lua'
server_scripts {
  'server/cache.lua',
  'server/utils.lua',
  'server/server.lua'
}

files {
	'web/build/index.html',
	'web/build/**/*',
}