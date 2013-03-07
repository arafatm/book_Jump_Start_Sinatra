# encoding: UTF-8
require 'sinatra'
require 'slim'
require './song.rb'
require 'sinatra/flash'


# =====
# configure blocks
configure do
  set :session_secret, 'try to make this long and hard to guess'
  enable :sessions
  set :username, 'frank'
  set :password, 'sinatra'
end

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end
configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

# =====
# helpers
helpers do
  # To use:
  # == css :style1, style2, :style3
  # generates:
  # <link href="/style1.css" media="screen projection" rel="stylesheet"/>
  # <link href="/style2.css" media="screen projection" rel="stylesheet"/>
  # <link href="/style3.css" media="screen projection" rel="stylesheet"/>
  def css(*stylesheets)
    stylesheets.map do |stylesheet| 
      "<link href=\"/#{stylesheet}.css\" media=\"screen, projection\" rel=\"stylesheet\" />"
    end.join
  end

  # style link to current page differently
  def current?(path='/')
    puts "current: #{request.path}, #{path}"
    (request.path==path || request.path==path+'/*') ? "current" : nil
  end

  def set_title
    @title ||= "Song by Sinatra"
  end
end

before do
  set_title
end

# =====
# session routes
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

get '/logout' do
  session.clear
  redirect to('/login')
end

# =====
# asset routes
get('/styles.css'){ scss :styles }

# =====
# main routes
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
