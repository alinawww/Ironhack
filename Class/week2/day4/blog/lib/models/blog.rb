require 'date'
require 'colorize'
require 'pry'
require_relative './post.rb'
require 'date'

class Blog
  attr_reader :posts
  def initialize
    @posts = []
    @page = []
    @all_pages = []
    @index = 0
  end
  def add_post(post)
    @posts.push(post)
  end
end
