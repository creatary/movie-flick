require 'rottentomatoes'
include RottenTomatoes

module MovieFinder

  class MovieFinder

    def find_by_location(location)
      googleMovies = GoogleMovies::Client.new(location)
      sort_movies_by_rating(get_movies_details(extract_movies_titles(googleMovies)))
    end

    def fetch_movie_details(movie_title)
      RottenTomatoes::Rotten.api_key = "wvw7psh9gt5kn4vf8h9f2bum"
      Rails.logger.info "Fetching details for #{ movie_title}"

      movie = RottenTomatoes::RottenMovie.find(:title => movie_title, :limit => 1, :expand_results => false)
      return nil if movie.empty?
      Movie.new(movie.title, movie.ratings.critics_score, movie.ratings.audience_score,
                movie.critics_consensus, movie.year )
    end

    def fetch_movies(city)
      find_by_location(city)
    end

    def fetch_cinemas(location, movie)
      google_movies = GoogleMovies::Client.new(location)
      google_movies.movies_theaters.delete_if { |t| !t.movies.map{ |m| m.name }.include?(movie) }
    end

    private

    def get_movies_details(movies_titles)
      movies_titles.map { |movie_title| fetch_movie_details movie_title }.compact
    end

    def extract_movies_titles(google_movies)
      google_movies.movies_theaters.collect { |t| t.movies }.flatten.collect { |m| m.name }.uniq
    end

    def sort_movies_by_rating(movies)
      movies.sort {|a, b| b.critics_score <=> a.critics_score}
    end

  end

end