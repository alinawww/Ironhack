class CommentsController < ApplicationController
  def index

  end
  def new
    @my_comment = @my_movie.comments.new
    if
    render 'show'
    else
    end
  end
  def create
    @my_movie = Movie.find(params[:movie_id])
    @my_comment = @my_movie.comments.new(entry_params)
    @my_comment.save
    # byebug
    redirect_to "/movies/#{@my_movie.id}"
  end
  def edit
    @my_comment = @my_movie.comments.find(params[:movie_id])
  end
  def update
    @my_movie = Movie.find(params[:movie_id])
    @my_comment = @my_movie.comments.find(params[:id])
    @my_comment.update(entry_params)
    @my_comment.save
    redirect_to '/movies/2/discussion'
  end
  def entry_params
    params.require(:comment).permit(:username, :comment_text)
  end
end
