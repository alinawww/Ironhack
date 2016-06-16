
require 'date'
require 'pry'

class Blog
  def initialize
    @posts = []
    @page = []
    @all_pages = []
  end
  def add_post(post)
    @posts.push(post)
  end
  def create_pages
    sorted_posts = @posts.sort! do |post1, post2|
      post2.date <=> post1.date
    end
    counter = 0
    while counter <= 3 do
      @posts.each do |post|
        @page.push(post)
        #binding.pry
      end
      counter += 1
    end
    if counter == 4
      puts "prev < > next"
      puts "Where do you want to go next? (Type '<' or '>' to navigate through the posts)"
      choice = gets.chomp.downcase
      if choice === "<"
        while counter <= 4 do
          @page.push(post)
          puts post.title
          #binding.pry
          counter += 1
        end
      elsif choice === ">"
        while counter <= 4 do
          @page.push(post)
          puts post.title
          #binding.pry
          counter += 1
        end
      else
        puts "Command is unknown. Please try 'prev' or 'next'"
      end
    end
    @all_pages.push(@page)
  end
  def publish_front_page
    sorted_posts = @posts.sort! do |post1, post2|
      post2.date <=> post1.date
    end
    puts "---\nWelcome! This is the front page of my blog.\n---"
    sorted_posts.each do |post|
      if post.sponsored
        puts "***SPONSORED POST***"
        puts "#{post.title.upcase}"
        puts "#{post.date}"
        puts "-------------"
        puts "#{post.text}"
        puts "********************"
        puts " "
      else
        puts "#{post.title.upcase}"
        puts "#{post.date}"
        puts "-------------"
        puts "#{post.text}"
        puts " "
      end
    end
  end
end

# class BlogPage < Blog
#   def add_post(post)
#     length = @posts.length
#     while length < 5 do
#       @posts.push(post)
#     end
#   end
#   def publish_regular_page
#     page_sorted_posts = @posts.sort! do |post1, post2|
#       post2.date <=> post1.date
#     end
#     page_sorted_posts.each do |post|
#       if post.sponsored
#         puts "***SPONSORED POST***"
#         puts "#{post.title.upcase}"
#         puts "#{post.date}"
#         puts "-------------"
#         puts "#{post.text}"
#         puts "********************"
#         puts " "
#       else
#         puts "#{post.title.upcase}"
#         puts "#{post.date}"
#         puts "-------------"
#         puts "#{post.text}"
#         puts " "
#       end
#     end
#   end
# end

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


blog.add_post Post.new("Alina's post", yesterday, "content1" )
blog.add_post Post.new("Marjon's post", tomorrow, "content2", true )
blog.add_post Post.new("Ben's post", today, "content3" )
blog.add_post Post.new("Mary's post", yesterday, "content1" )
blog.add_post Post.new("Luke's post", tomorrow, "content2", true )
blog.add_post Post.new("Chris's post", today, "content3" )
blog.add_post Post.new("Elise's post", yesterday, "content1" )
blog.add_post Post.new("John's post", today, "content3" )
blog.add_post Post.new("Bobs post", yesterday, "content1" )
blog.add_post Post.new("Carmen's post", today, "content3" )
blog.add_post Post.new("Joana's post", yesterday, "content1" )

blog.create_pages
