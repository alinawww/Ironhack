class SiteController < ApplicationController
  def index
    render 'index'
  end
  def show
    @my_user = session[:current_user_id]
    render '/'
  end
end
