class TextInspectionsController < ApplicationController
  def new
    render 'new'
  end
  def create
    @text = params[:text_inspection][:user_text]
    @word_count = @text.split(' ').length
    @reading_time = @word_count / 275
    @all_words = Hash.new(0)
    @text.split(' ').each{|word| @all_words[word] += 1}
    @all_words = @all_words.sort_by{|key, value| value}
    @most_frequent = @all_words.reverse[0...10]
    render 'results'
  end
end
