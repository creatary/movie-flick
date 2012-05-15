require 'google_movies'
#require 'movie_finder/movie_finder'
#require 'movie_finder/movie'
require 'spec_helper'
include MovieFinder

describe  MovieFinder do
  describe MovieFinder do

      describe "find_by_location" do

        before do
          @finder = MovieFinder::MovieFinder.new
          rotten_tomatoes_factory = MovieFinder::RottenTomatoesFactory.new
          google_movies_client_factory = MovieFinder::GoogleMoviesClientFactory.new

          response = []
          movies = [GoogleMovies::Movie.new("Holiday", "1"),
                    GoogleMovies::Movie.new("Iron Sky", "2"),
                    GoogleMovies::Movie.new("Titanic", "3") ]
          response << GoogleMovies::MovieTheater.new("IMAX", "info", "1", movies)
          google_movies_client_factory.stub(:create_client).with("Warsaw")
            .and_return({:movies_theaters => response})
          client = double(google_movies_client_factory.stub(:create_client))
          google_movies_client_factory.stub(:movies_theaters).and_return(client)


          movie_holiday ={:id => "1", :title => "Holiday", :year => "2012",
                          :ratings => {:critics_rating => "88", :critics_score => "88", :audience_score => "88"}}
          rotten_tomatoes_factory.stub(:find).with(:title => "Holiday", :limit => 1, :expand_results => false)
          .and_return(RottenTomatoes::RottenMovie.new(movie_holiday, false))

          iron_holiday ={:id => "2", :title => "Iron Sky", :year => "2012",
                         :ratings => {:critics_rating => "50", :critics_score => "50", :audience_score => "50"}}
          rotten_tomatoes_factory.stub(:find).with(:title => "Iron Sky", :limit => 1, :expand_results => false)
          .and_return(RottenTomatoes::RottenMovie.new(iron_holiday, false))

          titanic_holiday ={:id => "3", :title => "Titanic", :year => "2012",
                            :ratings => {:critics_rating => "90", :critics_score => "90", :audience_score => "90"}}
          rotten_tomatoes_factory.stub(:find).with(:title => "Titanic", :limit => 1, :expand_results => false)
          .and_return(RottenTomatoes::RottenMovie.new(titanic_holiday, false))

          @finder.rotten_tomatoes_factory = rotten_tomatoes_factory
          @finder.google_movies_client_factory = google_movies_client_factory
        end

        it "should return sorted movies list for given location " do
          mov = @finder.find_by_location("Warsaw")
          mov.should include Movie.new("Iron Sky", "50", "50", "2012" )
        end

        it "should not fetch movie details" do
          finder = MovieFinder::MovieFinder.new
          finder.fetch_movie_details("").should == nil
        end

        it "should fetch cinemas" do
          @google_movies = double("google_movies")
          @location = "Warsaw"
          @movie = "Untouchables"
          GoogleMovies::Client.new(@location).stub(:movies_theaters).and_return(nil)
          finder = MovieFinder::MovieFinder.new
          finder.fetch_cinemas(@location, @movie).should eq(nil)
        end



      end
   end
end
