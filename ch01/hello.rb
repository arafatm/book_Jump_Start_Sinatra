require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require

get '/hello' do
    "Hello Sinatra!"
end
