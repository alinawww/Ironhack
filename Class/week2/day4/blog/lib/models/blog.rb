require 'colorize'
require 'pry'
require_relative './post.rb'



class Blog
  attr_reader :posts
  def initialize
    @posts = []

  end
  def add_post(post)
    @posts.push(post)
  end
end
