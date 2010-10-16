require 'bundler/capistrano'

set :use_sudo, false

set :application, "logbook.me"
set :repository,  "git@github.com:railsrumble/rr10-team-73.git"

set :user, :logbook
set :scm, :git
set :deploy_via, :remote_cache
set :git_enable_submodules, false
set :use_sudo, false
set :branch, :mongo

role :web, "logbook.me"                          # Your HTTP server, Apache/etc
role :app, "logbook.me"                          # This may be the same as your `Web` server
role :db,  "logbook.me", :primary => true        # This is where Rails migrations will run

set :deploy_to, "/var/www/#{application}"

namespace :deploy do
  %w(start stop restart).each do |action|
    desc "#{action.capitalize} unicorns for application"
    task action.to_sym, :roles => :app, :except => { :no_release => true } do
      run "echo #{action} > /etc/sv/unicorn/supervise/control"
    end
  end

  desc "Symlink the database config file from shared directory to current release directory."
  task :symlink_configs do
    %w(smtp).each do |initializer|
      run "ln -nsf #{shared_path}/config/initializers/#{initializer}.rb #{current_release}/config/initializers/"
    end
    %w(sphinx database).each do |config_file|
      run "ln -nsf #{shared_path}/config/#{config_file}.yml #{current_release}/config/"
    end
  end

  desc "Symlink public assets to current release directory"
  task :symlink_assets, :roles => :app do
    %w(assets).each do |folder|
      run "ln -nsf #{shared_path}/public/#{folder} #{current_release}/public/"
    end
  end
end

after "deploy:update_code", "deploy:symlink_configs"
after "deploy:update_code", "deploy:symlink_assets"
after 'deploy', 'deploy:cleanup'
