require 'sinatra'
require "sinatra/reloader"
#
get '/' do
  'this is my super web app this is my super web app2'
end

get '/about' do
  @time = Time.now
  @mytime = @time.strftime("%d %m %y ")
  erb :about

end

get '/hi' do
  @name = 'Alina'
  erb :hi
end

get '/time/ago/:hour' do
  @time = Time.now - (params[:hour].to_i * 3600)
  @timeago = params[:hour]
  erb :time
end

get '/fruits' do
  @fruits = %w(oranges lemons  apples pears grapes )
  @time = Time.now
  @mytime = @time.strftime("%d %m %y ")
  erb :fruits
end

get '/users/:username' do
  @username = params[:username]
  erb :users
end
