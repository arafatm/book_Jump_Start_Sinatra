source "https://rubygems.org"
gem "sinatra", :require => "sinatra/base"
gem "slim"
gem 'sass'
gem 'sqlite3'
gem 'data_mapper'

group :production do
  gem 'thin'
  gem 'pg'
  gem 'dm-postgres-adapter'
end

group :development do
  gem "shotgun"
  gem 'dm-sqlite-adapter'
end
