require 'sinatra'
require 'sinatra/reloader'
require './lib/models/blog.rb'
require './lib/models/post.rb'
require 'pry'
# require 'date'

blog = Blog.new
yesterday = Date.new(2016,6,13)
today = Date.new(2016,6,14)
tomorrow = Date.new(2016,6,15)


content1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content2 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."


blog.add_post Post.new("Alina's post", yesterday, content1 )
blog.add_post Post.new("Marjon's post", tomorrow, content2)
blog.add_post Post.new("David's post", tomorrow, content2)
blog.add_post Post.new("Jorge's post", tomorrow, content2)


get '/' do
  @posts = blog.posts
  erb :home
end
