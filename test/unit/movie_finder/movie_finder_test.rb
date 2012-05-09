#namespace :test do

  #require 'spec_helper'
  #include MovieFinder

  #describe MovieFinder do

    #describe "#find_by_location" do
    #  if "returns movies list for given location "
        #FakeWeb.register_uri(:get, "http://www.google.com/movies?near=warsaw&hl=en&date=0&time=0&view=list",
        #                     :body => fixture_file("fixtures/warsaw.xml"))

        #given
        #response = []
        #
        #movies = [GoogleMovies::Movie.new("Holiday", "1"),
        #          GoogleMovies::Movie.new("Iron Sky", "2"),
        #          GoogleMovies::Movie.new("Titanic", "3") ]
        #response << GoogleMovies::MovieTheater.new("IMAX", "info", "1", movies)
        #
        #google_movies_gem = GoogleMovies::Client.new("Warsaw")
        #google_movies_gem.stub(:movies_theaters).and_return(response)
        #
        ## when
        #movie_finder = stub(movie_finder)

        #then

      #end
    #end

  #end



#end
