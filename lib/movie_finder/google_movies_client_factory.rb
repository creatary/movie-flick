module MovieFinder
  class GoogleMoviesClientFactory

    def create_client(location)
      return GoogleMovies::Client.new(location)
    end
  end

end