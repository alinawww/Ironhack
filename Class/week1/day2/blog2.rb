require 'date'
require 'colorize'
require 'pry'

class Blog
  def initialize
    @posts = []
    @page = []
    @all_pages = []
    @index = 0
  end
  def add_post(post)
    @posts.push(post)
  end
  def publish_front_page
    sorted_posts = @posts.sort! do |post1, post2|
      post2.date <=> post1.date
    end
    puts "---\nWelcome! This is the front page of my blog.\n---"
    split_posts = @posts.each_slice(3).to_a
    counter = 1
    split_posts.map.with_index do |page, index|

      # binding.pry
      page.each do |post|
        if post.sponsored
          puts "***SPONSORED POST***".colorize(:blue)
          puts "#{post.title.upcase}"
          puts "#{post.date}"
          puts "-------------".colorize(:light_blue)
          puts "#{post.text}"
          puts "********************"
          puts " "
        else
          puts "#{post.title.upcase}"
          puts "#{post.date}"
          puts "-------------".colorize(:light_blue)
          puts "#{post.text}"
          puts " "
        end
      end

      puts " "
      puts "< prev next >".colorize(:color => :white, :background => :black)

      split_posts.each_index do |index|
        if index + 1 == counter
          print (index + 1).to_s.colorize(:green), "   "
        else
          print index + 1, "   "
        end
      end
      counter += 1
      command = gets.chomp.downcase
      if command == ">" || command == "next"

        split_posts[index+1]
      elsif command == "<" || command == "prev"
        prev_page = index - 2
        split_posts[prev_page.to_i]
        # binding.pry
      else
        puts "Sorry, I don't understand your command."
      end
    end
  end
end

class Post
  attr_reader :title, :date, :text, :sponsored
  def initialize(title, date, text, sponsored = false)
    @title = title
    @date = date
    @text = text
    @sponsored = sponsored
  end
end


blog = Blog.new
yesterday = Date.new(2016,6,13)
today = Date.new(2016,6,14)
tomorrow = Date.new(2016,6,15)

content1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content2 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content3 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content4 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content5 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content6 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
content7 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

blog.add_post Post.new("Alina's post", yesterday, content1 )
blog.add_post Post.new("Marjon's post", tomorrow, content2, true )
blog.add_post Post.new("Ben's post", today, content3 )
blog.add_post Post.new("Mary's post", yesterday, content4)
blog.add_post Post.new("Luke's post", tomorrow, content5, true )
blog.add_post Post.new("Chris's post", today, content6 )
blog.add_post Post.new("Elise's post", yesterday, content7 )

blog.publish_front_page
