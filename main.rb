# encoding: UTF-8
require 'sinatra'
require 'slim'
require './song.rb'

configure do
  set :session_secret, 'try to make this long and hard to guess'
  enable :sessions
  set :username, 'frank'
  set :password, 'sinatra'
end

get '/set/:name' do
  session[:name] = params[:name]
end

get '/get/hello' do
  "Hello #{session[:name]}"
end

get '/login' do
  slim :login
end

post '/login' do
  if params[:username] == settings.username && 
    params[:password] == settings.password
    session[:admin] = true
    redirect to('/songs')
  else
    slim :login
  end
end

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
