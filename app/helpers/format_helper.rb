module FormatHelper
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