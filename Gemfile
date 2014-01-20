# -*- coding: utf-8 -*-
source 'https://rubygems.org'

gem 'thin'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'gmaps4rails'
gem 'underscore-rails'

gem 'geocoder'

gem 'devise'
gem 'haml-rails'
gem 'cancan'

gem 'resque'
gem 'resque-scheduler'

group :production do
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end

gem 'therubyracer'
gem 'less-rails'

gem 'formtastic'
gem 'formtastic-bootstrap', github: 'mjbellantoni/formtastic-bootstrap'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  gem 'pry'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'

  # This needs to be here, else rake spec will fail silently.
  gem 'rspec-rails'
end

#testing with rspec

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  gem 'capybara'
  gem 'selenium-webdriver'
  gem "factory_girl_rails"
  gem 'database_cleaner'
  gem "email_spec"
end
