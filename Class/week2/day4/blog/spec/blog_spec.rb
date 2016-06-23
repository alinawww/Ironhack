require 'rspec'
require_relative '../lib/models/blog.rb'
require 'date'

# creating new tasks, deleting tasks, updating tasks, completing tasks, and maybe even a few more surprises.
describe Blog do
  before(:each) do
    @subject = Blog.new

  end

  describe "#add_post" do
    before(:each) do
      @today = Date.new(2016,6,14)
      @post = Post.new("First blog", @today, "content" )
      @subject.add_post @post
    end
    it "adds a post to the blog" do
      expect(@subject.posts).to include(@post)
    end
  end 
end
