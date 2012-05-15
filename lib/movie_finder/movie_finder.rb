require 'rottentomatoes'
include RottenTomatoes

module MovieFinder

  class MovieFinder

    attr_writer :google_movies_client_factory, :rotten_tomatoes_factory

    def initialize
      @google_movies_client_factory = GoogleMoviesClientFactory.new
      @rotten_tomatoes_factory = RottenTomatoesFactory.new
    end

    def find_by_location(location)
      googleMovies = @google_movies_client_factory.create_client(location)
      sort_movies_by_rating(get_movies_details(extract_movies_titles(googleMovies)))
    end

    def fetch_movie_details(movie_title)
      return nil if movie_title.empty?
      Rails.logger.info "Fetching details for #{ movie_title}"
      begin
        movie = @rotten_tomatoes_factory.find(movie_title)
      rescue Exception
        movie = nil
      end

      return nil if movie.nil? || movie.empty?
      Movie.new(movie.title, movie.ratings.critics_score, movie.ratings.audience_score,
                movie.critics_consensus, movie.year )
    end

    def fetch_movies(city)
      find_by_location(city)
    end

    def fetch_cinemas(location, movie)
      google_movies = @google_movies_client_factory.create_client(location)
      google_movies.movies_theaters.delete_if { |t| !t.movies.map{ |m| m.name }.include?(movie) }
    end

    private

    def get_movies_details(movies_titles)
      Rails.logger.info "Get movies details for #{ movies_titles.length } movies:"
      movies_titles.map { |movie_title| fetch_movie_details(movie_title) }.compact
    end

    def extract_movies_titles(google_movies)
      google_movies.movies_theaters.collect { |t| t.movies }.flatten.collect { |m| m.name }.uniq
    end

    def sort_movies_by_rating(movies)
      movies.sort {|a, b| b.critics_score <=> a.critics_score}
    end

  end

end