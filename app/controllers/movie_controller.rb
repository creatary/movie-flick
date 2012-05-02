class MovieController < ApplicationController

  def get
    movieFinder = MovieFinder::MovieFinder.new
    @movies = movieFinder.find(params[:city])

    respond_to do |format|
      format.html
      format.json { render :json => @movies }
    end
  end

end
