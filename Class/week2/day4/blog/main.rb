require 'sinatra'
require 'sinatra/reloader'
require './lib/models/blog.rb'
require './lib/models/post.rb'
require 'pry'

blog = Blog.new
yesterday = Date.new(2016,6,13)
today = Date.new(2016,6,14)
tomorrow = Date.new(2016,6,15)


content1 = "alina's content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content2 = "marjon's content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content3 = "david's content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content4 = "jorge's content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."


blog.add_post Post.new("Alina", yesterday, content1, "MUSIC", "ALINA" )
blog.add_post Post.new("Marjon", tomorrow, content2, "DESIGN", "MARJON")
blog.add_post Post.new("David", tomorrow, content3, "PROGRAMMING", "DAVID")
blog.add_post Post.new("Jorge", tomorrow, content4, "PROGRAMMING", "Jorge")
# binding.pry

get '/' do
  @posts = blog.posts
  erb :home
end

get '/post_details/:id' do
  @posts = blog.posts
  @id = params[:id].to_i
  erb :post_details
end

post '/create_post' do
  redirect to '/new_post'
end

get '/new_post' do
  @posts = blog.posts
  erb :new_post
end

post '/add_new_post' do
  @new_post_title = params[:name]
  @new_post_content = params[:content]
  @new_post_author = params[:author]
  @category = params[:category]
  @author = params[:author]
  @time = Time.now
  blog.add_post Post.new(@new_post_title, @time, @new_post_content, @category, @author)
  redirect to '/'
end
