require 'date'

yesterday = Date.new(2016,6,13)
today = Date.new(2016,6,14)
tomorrow = Date.new(2016,6,15)

class Post
  attr_reader :title, :text
  def initialize(title, date, text)
    @title = title
    @date = date
    @text = text
  end
end
