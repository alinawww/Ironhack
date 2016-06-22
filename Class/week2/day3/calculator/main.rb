require 'sinatra'
require "sinatra/reloader"
require 'yaml/store'
require 'pry'

enable :sessions

def save(save_result)
  t = Time.now
  @save_result = save_result
  @saved_results.transaction do
      @saved_results[t] = @save_result
  end
end


get '/' do
  erb :home
end

post '/calculate' do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  operation = params[:operation]
  case operation
    when "addition"
      result = first + second
      # response = "#{result}"
    when "subtraction"
      result = first - second
      # response = "#{first} - #{second} = #{result}"
    when "multiply"
      result = first * second
      # response = "#{first} * #{second} = #{result}"
    when "divide"
      result = first / second
      # response = "#{first} / #{second} = #{result}"
  end
  response = result
  session[:result] = response
  redirect to '/result'
end

get '/result' do
  @result = session[:result]
  erb :result
end

post '/save_result' do
  @saved_results = YAML::Store.new("results.yml")
  save_result = params[:save_result]
  if save_result == "save"
    save(session[:result])
  end
  redirect to '/saved'
end

get '/saved' do
  erb :saved
end
