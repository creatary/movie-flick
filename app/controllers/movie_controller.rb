class MovieController < ApplicationController

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
