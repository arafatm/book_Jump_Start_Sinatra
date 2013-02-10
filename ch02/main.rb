# encoding: UTF-8
require 'sinatra'

get '/' do
  erb :home
end

get '/about' do
  @title = "All About This Website"
  erb :about
end

get '/contact' do
  erb :contact
end

get '/fake-error' do
  status 500
  "There’s nothing wrong, really :P"
end 

not_found do
  erb :not_found
end

get '/instance' do
    @name = "DAZ"
      erb :show
end
__END__
@@show
<h1>Hello <%= @name %>!</h1>
