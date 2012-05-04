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

end

class MoviesForLocationRequest

  def maches_request?(arguments)
    arguments.empty?
  end

  def process(arguments, from_user)
    coordinates = Creatary::API.getcoord(from_user)["body"]
    location = coordinates.join(" ")

    MovieFinder::MovieFinder.new.find_by_location(location)
  end

end

class MoviesForCityRequest

  def maches_request?(arguments)
    !arguments.empty? && !(arguments[0].start_with? "cinema:") && !(arguments[0].start_with? "movie:")
  end

  def process (arguments, from_user)
    city = arguments.join(" ")
    MovieFinder::MovieFinder.new.find_by_location(city)
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
    location = coordinates.join(" ")

    MovieFinder::MovieFinder.new.fetch_cinemas(location,movie)
  end

end

class MoviesInfoRequest

  def maches_request?(arguments)
    !arguments.empty? && (arguments[0].start_with? "movie:")
  end

  def process(arguments, from_user)
    arguments.shift
    movie = arguments.join(" ")

    MovieFinder::MovieFinder.new.fetch_movie_details(movie)
  end

end