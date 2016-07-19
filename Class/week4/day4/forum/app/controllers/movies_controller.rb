class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def show
    @my_movie = Movie.find(params[:id])
    @comments = @my_movie.comments.all
    @my_comment = @my_movie.comments.new
    @my_user = session[:user]
  end
  def new
  end
  def create
    @my_movie = Movie.new(
      poster: params[:movie][:poster],
      title: params[:movie][:title],
      year: params[:movie][:year],
      synopsis: params[:movie][:synopsis]
    )
    @my_movie.save
    redirect_to "/movies/#{@my_movie.id}"
  end

end
