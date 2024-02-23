fx_version "cerulean"

description ""
author "GFLP10#7754"
version '1.0.0'
repository 'https://github.com/Justus-Braun/quiz-menu'

lua54 'yes'

games {
  "gta5",
  "rdr3"
}

ui_page 'web/build/index.html'

client_script "client/**/*"
server_scripts {
  "server/cache.lua",
  "server/utils.lua",
  "server/server.lua"
}

files {
	'web/build/index.html',
	'web/build/**/*',
}