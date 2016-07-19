class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @my_user = User.find(params[:id])
    @my_movie = Movie.find(params[:id])
    render 'site/index'
  end
  def new
    @my_user = User.new
    render 'new'
  end
  def create
    @my_user = User.new(
      name: params[:user][:name],
      password: params[:user][:password]
    )
    @my_user.save
    redirect_to "/users/#{@my_user.id}"
  end
end

#
# def show
#   @my_movie = Movie.find(params[:id])
#   @comments = @my_movie.comments.all
#   @my_comment = @my_movie.comments.new
#   @my_user = session[:user]
# end
