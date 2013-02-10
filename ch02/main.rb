require 'sinatra'

get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

not_found do
  erb :not_found
end
