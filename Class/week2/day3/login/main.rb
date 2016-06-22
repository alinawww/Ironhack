require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'
load 'lib/users.rb'

enable :sessions

get '/' do
  erb :home
end

post '/login' do
  @name = params[:name]
  @password = params[:password]
  users = Users.new
  session[:authorized] = users.login(@name, @password)
  if session[:authorized]  == true
    redirect to '/profile'
  else
    redirect to '/error'
  end
end

post '/logout' do
    session[:authorized] = false
    redirect to '/'
end

get '/profile' do
  if session[:authorized]
    erb :profile
  else
    redirect to '/'
  end
end

get '/error' do
  erb :error
end
