require 'rottentomatoes'
include RottenTomatoes

module MovieFinder

  class MovieFinder

    def find_by_location(location)
      googleMovies = GoogleMovies::Client.new(location)
      movies = sort_movies_by_rating(get_movies_details(extract_movies_titles(googleMovies)))
      movies
    end

    def fetch_movies(city)
      parse_response(find_by_location(city))
    end

    def fetch_cinemas(location, movie)
      response = ""
      google_movies = GoogleMovies::Client.new(location)
      google_movies.movies_theaters.each do |theater|
        theater.movies.each do |theater_movie|
          if theater_movie == movie
            theater_info = "#{theater.name} #{theater.addres}"
            if response.length + theater_info.length <160
              response.concat(theater_info)
            end
          end
        end
      end
      response
    end

    def fetch_movie_details(movie_title)
      RottenTomatoes::Rotten.api_key = "wvw7psh9gt5kn4vf8h9f2bum"
      movie = RottenTomatoes::RottenMovie.find(:title => movie_title, :limit => 1, :expand_results => false)
      "#{movie.title}(#{movie.year}) #{movie.critics_consensus}, CS:#{movie.ratings.critics_score}, AS: #{movie.ratings.audience_score} "
    end

    def parse_response(movies)
      response = ""
      movies.each do |movie|
        movie_info = "#{movie.title} [AS: #{movie.ratings.critics_score}"+(!movie.ratings.audience_score.nil? ? ", CS: #{movie.ratings.audience_score}] " : "] ")
        if response.length + movie_info.length <160
          response.concat(movie_info)
        end
      end
      response
    end

    #TODO handle exceptions
    def get_movie_details(movie_title)
      RottenTomatoes::Rotten.api_key = "wvw7psh9gt5kn4vf8h9f2bum"
      RottenTomatoes::RottenMovie.find(:title => movie_title, :limit => 1, :expand_results => false)
    end

    private

    def extract_movies_titles(googleMovies)
      titles = Array.new
      if googleMovies.movies_theaters.size > 0
        googleMovies.movies_theaters.each do |theater|
          theater.movies.each do |theater_movie|
            exists = false
            titles.each do |title|
              if theater_movie.name.casecmp(title) == 0
                exists = true
                break
              end
            end
            if !exists
              titles << theater_movie.name
            end
          end
        end
      end
      titles
    end

    def get_movies_details(movies_titles)
      movies = Array.new
      movies_titles.each do |name|
        movie = get_movie_details(name)
        if !movie.empty?
          movies << movie
        end
      end
      movies
    end

    def sort_movies_by_rating(movies)
      movies.sort! {|a,b| b.ratings.critics_score <=> a.ratings.critics_score}
      movies
    end

  end

end