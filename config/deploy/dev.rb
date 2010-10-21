role :web, "dev.logbook.me"                          # Your HTTP server, Apache/etc
role :app, "dev.logbook.me"                          # This may be the same as your `Web` server
role :db,  "dev.logbook.me", :primary => true        # This is where Rails migrations will run
set :hostname, 'http://dev.logbook.me'
set :repository,  "git@github.com:chunkybacon/logbook.me.git"
