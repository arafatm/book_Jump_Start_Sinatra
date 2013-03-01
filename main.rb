# encoding: UTF-8
require 'sinatra'
require 'slim'
require './song.rb'

get('/styles.css'){ scss :styles }

get '/' do
  slim :home
end

get '/about' do
  @title = "All About This Website"
  slim :about
end

get '/contact' do
  slim :contact
end

get '/fake-error' do
  status 500
  "There’s nothing wrong, really :P"
end 

not_found do
  slim :not_found
end

get '/instance' do
  @name = "DAZ"
  slim :show
end

# ruby main.rb -e production/test/development to see environment
get '/environment' do
  if development?
    "development" 
  elsif production?
    "production" 
  elsif test?
    "test" 
  else
    "Who knows what environment you're in!"
  end
end
__END__
@@show
<h1>Hello <%= @name %>!</h1>
