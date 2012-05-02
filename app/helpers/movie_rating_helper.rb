require 'rubygems'
require 'rottentomatoes'
include RottenTomatoes

module MovieRatingHelper

  def get_rating(movie_title)
    Rotten.api_key = "wvw7psh9gt5kn4vf8h9f2bum"
    @movie = RottenMovie.find(:title => movie_title, :limit => 1)
    "CS: #{@movie.ratings.critics_score}, AS:  #{@movie.ratings.audience_score}"
  end

end
