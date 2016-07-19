class PlaceholderController < ApplicationController
  def new
    render 'new'
  end
  def create
    @choice= params[:place_type]
    @how_many = params[:place][:user_number].to_i
    @paragraph = "This is one long paragraph that will be repeated
      if paragraph that will be repeated ifparagraph that will
        be repeated ifparagraph that will be repeated if the user
        wants more words."
    @paragraph_words = @paragraph.split(" ")
    @result = ""
    if @choice == "words"
      @result += @paragraph_words[0..@how_many].join(" ")
    else
      counter = 0
      while counter < @how_many
        @result = @result + "#{@paragraph}\n"
        counter += 1
      end
    end
    render 'place_result'
  end
end
