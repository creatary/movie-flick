module MovieFinder

  class MovieFinder

    def find(city)
      googleMovies = GoogleMovies::Client.new(city)
      movies = Array.new

      if googleMovies.movies_theaters.size > 0
        googleMovies.movies_theaters.each do |theater|
          theater.movies.each do |movie|
            exists = false
            movies.each do |m|
              if movie.name.casecmp(m.name) == 0
                exists = true
              end
            end
            if !exists
              movies << movie
            end
          end
        end
      end

      movies.sort! {|a,b| a.name.downcase <=> b.name.downcase}
      movies
    end


  end

end