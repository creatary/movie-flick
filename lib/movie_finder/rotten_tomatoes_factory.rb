require 'rottentomatoes'
include RottenTomatoes

module MovieFinder

  class RottenTomatoesFactory

    def initialize
      RottenTomatoes::Rotten.api_key = "wvw7psh9gt5kn4vf8h9f2bum"
    end

    def find(movie_title)
      return RottenTomatoes::RottenMovie.find(:title => movie_title, :limit => 1, :expand_results => false)
    end
  end

end