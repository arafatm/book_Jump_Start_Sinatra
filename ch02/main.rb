# encoding: UTF-8
require 'sinatra'
require 'slim'

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
__END__
@@show
<h1>Hello <%= @name %>!</h1>
