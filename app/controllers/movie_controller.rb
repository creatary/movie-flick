class MovieController < ApplicationController

  #def get
  #  movieFinder = MovieFinder::MovieFinder.new
  #  @movies = movieFinder.find(params[:city])
  #
  #  respond_to do |format|
  #    format.html
  #    format.json { render :json => @movies }
  #  end
  #end

  def find_by_location
    movieFinder = MovieFinder::MovieFinder.new
    @movies = movieFinder.find_by_location(params[:city])

    respond_to do |format|
      format.html
      format.json { render :json => @movies }
    end
  end

  def index

  end

end
