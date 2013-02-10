require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require

get '/hello' do
    "Hello Sinatra!"
end

get '/:name' do
    name = params[:name]
      "Hi there #{name}!"
end

get '/what/time/is/it/in/:number/hours' do
  number = params[:number].to_i
  time = Time.now + number * 3600
  "The time in #{number} hours will be #{time.strftime('%I:%M %p')}"
end
