require 'rspec'
require_relative '../lib/models/post.rb'
require 'date'

# creating new tasks, deleting tasks, updating tasks, completing tasks, and maybe even a few more surprises.
describe Post do
  before(:each) do
    @today = Date.new(2016,6,14)
  end

  subject { Post.new("First blog", @today, "content" )}

  describe "#initialize" do
    it "creates a post" do
      expect(subject.text).to eq("content")
    end
  end
end
