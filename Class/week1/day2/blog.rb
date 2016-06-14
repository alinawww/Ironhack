
require 'date'

class Blog
  def initialize
    @posts = []
  end
  def add_post(post)
    @posts.push(post)
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
  # def publish_regular_page
  #   sorted_posts = @posts.sort! do |post1, post2|
  #     post2.date <=> post1.date
  #   end
  #   length = 0
  #   while length < 5 do
  #     length += 1
  #     sorted_posts.each do |post|
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


blog.add_post Post.new("First post", yesterday, "content1" )
blog.add_post Post.new("Second post", tomorrow, "content2", true )
blog.add_post Post.new("Third post", today, "content3" )
blog.add_post Post.new("First post", yesterday, "content1" )
blog.add_post Post.new("Second post", tomorrow, "content2", true )
blog.add_post Post.new("Third post", today, "content3" )
blog.add_post Post.new("First post", yesterday, "content1" )

blog.publish_front_page
