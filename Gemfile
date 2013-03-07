source "https://rubygems.org"
gem "sinatra", :require => "sinatra/base"
gem "slim"
gem 'sass'
gem 'data_mapper'
gem 'sinatra-flash'

group :production do
  gem 'thin'
  gem 'pg'
  gem 'dm-postgres-adapter'
end

group :development do
  gem "shotgun"
  gem 'sqlite3'
  gem 'dm-sqlite-adapter'
end
