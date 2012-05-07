class MovieRequest

  def process_request(body, from_user)
    request_processors = [MoviesForLocationRequest.new, MoviesForCityRequest.new, CinemasForMoviesRequest.new, MoviesInfoRequest.new]

    arguments = body.split(" ")
    arguments.shift

    request_processors.each do |request_processor|

       if request_processor.maches_request? arguments
         return request_processor.process(arguments, from_user)
       end

    end
  end

  def movies_to_string(movies)
    response = ""
    movies.each do |movie|
      movie_info = movie.display_movie_scores
      if response.length + movie_info.length <160
        response.concat(movie_info)
      end
    end
    response
  end

  def cinemas_to_string(cinemas)
    response = ""
    cinemas.each do |cinema|
      cinema_info = "#{cinema.name} #{cinema.addres}"
      if response.length + cinema_info.length <160
        response.concat(cinema_info)
      end
    end
    response
  end

end

class MoviesForLocationRequest

  def maches_request?(arguments)
    arguments.empty?
  end

  def process(arguments, from_user)
    coordinates = Creatary::API.getcoord(from_user)["body"]
    location = "#{coordinates["latitude"]} #{coordinates["longitude"]}"

    MovieRequest.movies_to_string(MovieFinder::MovieFinder.new.fetch_movies(location))
  end

end

class MoviesForCityRequest

  def maches_request?(arguments)
    !arguments.empty? && !(arguments[0].start_with? "cinema:") && !(arguments[0].start_with? "movie:")
  end

  def process (arguments, from_user)
    city = arguments.join(" ")
    MovieRequest.movies_to_string(MovieFinder::MovieFinder.new.fetch_movies(city))
  end

end


class CinemasForMoviesRequest

  def maches_request?(arguments)
    !arguments.empty? && (arguments[0].start_with? "cinema:")
  end

  def process(arguments, from_user)
    arguments.shift
    movie = arguments.join(" ")
    coordinates = Creatary::API.getcoord(from_user)["body"]
    location = "#{coordinates["latitude"]} #{coordinates["longitude"]}"
    MovieRequest.cinemas_to_string(MovieFinder::MovieFinder.new.fetch_cinemas(location, movie))
  end

end

class MoviesInfoRequest

  def maches_request?(arguments)
    !arguments.empty? && (arguments[0].start_with? "movie:")
  end

  def process(arguments, from_user)
    arguments.shift
    movie = arguments.join(" ")

    display_movie_info(MovieFinder::MovieFinder.new.fetch_movie_details(movie))
  end

  def display_movie_info(movie)
    return "Movie was not found" if movie.empty?
    "#{movie.title}(#{movie.year}) #{movie.critics_consensus}, CS:#{movie.critics_score}, AS: #{movie.audience_score} "
  end

end