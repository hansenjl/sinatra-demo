source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 5.2', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'foreman'
gem 'dotenv'

group :production do
  gem 'pg', '~> 0.20'
end



group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :development do
  gem 'pry'
  gem 'shotgun'
  gem 'tux'
  gem 'sqlite3', '~> 1.3.6'
end


