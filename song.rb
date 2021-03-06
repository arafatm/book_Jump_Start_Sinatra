require 'dm-core'
require 'dm-migrations'
require 'sinatra'
require 'slim'

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end
configure :test do
end
configure :production do
end

class Song
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :lyrics, Text
  property :length, Integer
  property :released_on, Date
end

def released_on=date
  super Date.strptime(date, '%m/%d/%Y')
end

DataMapper.finalize

module SongHelpers
  def find_songs
    @songs = Song.all
  end

  def find_song
    Song.get(params[:id]) 
  end

  def create_song
    @song = Song.create(params[:song])
  end
end

helpers SongHelpers

before do
  @title = "Manage Songs"
end

get '/songs' do
  find_songs
  find_songs
  slim :songs
end

get '/songs/new' do
  halt(401,'Not Authorized') unless session[:admin]
  @song = Song.new
  slim :new_song
end

get '/songs/:id' do
  @song = find_song
  slim :show_song
end

post '/songs' do
  flash[:notice] = "Song successfully added" if create_song
  redirect to("/songs/#{@song.id}")
end

get '/songs/:id/edit' do
    @song = find_song
      slim :edit_song
end

put '/songs/:id' do
  song = find_song
  song.update(params[:song])
  redirect to("/songs/#{song.id}")
end

delete '/songs/:id' do
  find_song.destroy
  redirect to('/songs')
end
