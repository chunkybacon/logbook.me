source 'http://rubygems.org'

gem 'rails', '3.0.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'
gem "inherited_resources", :git => "git://github.com/josevalim/inherited_resources.git"
gem "devise"
gem "simple_form", :git => "git://github.com/plataformatec/simple_form.git"
gem "will_paginate", :git => "git://github.com/mislav/will_paginate.git", :branch =>"rails3"
gem "show_for", :git => "git://github.com/plataformatec/show_for.git"
gem "haml"
gem "haml-rails", :git => "git://github.com/indirect/haml-rails.git", :tag => "v0.3.4"
gem "jquery-rails", :git => "git://github.com/indirect/jquery-rails.git", :tag => "v0.2.3"
gem "uuidtools"
gem "bartt-ssl_requirement", :require => "ssl_requirement"
gem "mongoid", :git => "git://github.com/mongoid/mongoid.git"
gem "bson_ext"

group :development do
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'sqlite3-ruby'
  gem 'web-app-theme', :git => 'git://github.com/pilu/web-app-theme.git'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem "faker"
  gem 'rspec-rails'
  gem 'machinist'
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'steak', '>= 1.0.0.rc.1'
  gem 'capybara'
end
