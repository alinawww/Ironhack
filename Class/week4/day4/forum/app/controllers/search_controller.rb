class SearchController < ApplicationController
  def index
    render 'search'
  end
  def create
    # byebug
    @movies = Movie.all
    @my_movie = Movie.new
    @search_term = params[:search_term]
    @found_movies = Movie.where("title like ?", "%#{@search_term}%")
    # byebug
      if @found_movies.count > 0
        redirect_to '/search/show_search_result'
      else
        redirect_to '/search/show_imdb_result'
      end
  end
  def show_search_result
    @found_movies = Movie.where("title like ?", "%#{@search_term}%")
    render 'show_search_result'
  end
  def show_imdb_result
    @movies = Movie.all
    @my_movie = Movie.new
    @search_term = params[:search_term]
    @found_movies = Imdb::Search.new(@search_term).movies[0..5]
    @found_movies_with_poster = @movies[0..2]
    render 'show_imdb_result'
  end
end
