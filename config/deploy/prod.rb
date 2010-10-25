role :web, "logbook.me"                          # Your HTTP server, Apache/etc
role :app, "logbook.me"                          # This may be the same as your `Web` server
role :db,  "logbook.me", :primary => true        # This is where Rails migrations will run
set :hostname, 'http://logbook.me'
