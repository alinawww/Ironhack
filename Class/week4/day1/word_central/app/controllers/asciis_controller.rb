
class AsciisController < ApplicationController
  def new
    render 'new'
  end
  def create
    @text = params[:asciis][:user_text]
    @artii = Artii::Base.new :font => 'slant'
    render 'ascii_result'
  end
end
