require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb :home
end

get '/redirect' do
  redirect to '/'
end
