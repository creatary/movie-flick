require 'spec_helper'
include FormatHelper

describe "FormatHelper" do

  describe "movies_to_string" do

    it "should return movies titles with ratings" do
      movies = [MovieFinder::Movie.new("Movie_1", "88"), MovieFinder::Movie.new("Movie_2", "70")]
      result = movies_to_string(movies)
      result.should include("Movie_1 [AS: 88, CS: ]")
      result.should include("Movie_2 [AS: 70, CS: ]")
    end


    it "should return error information" do
      movies_to_string([]).should eq("No movies found")
    end

  end

  describe "cinemas_to_string" do

    it "should return cinemas information" do
      movies = [GoogleMovies::Movie.new("Holiday", "1")]
      cinemas = []
      cinemas << GoogleMovies::MovieTheater.new("Cinema_1", "address", "1", movies)
      cinemas << GoogleMovies::MovieTheater.new("Cinema_2", "address", "1", movies)
      result = cinemas_to_string(cinemas)
      result.should include("Cinema_1 address")
      result.should include("Cinema_2 address")
    end

    it "should return cinemas error information" do
      cinemas_to_string([]).should eq("No cinemas found")
    end

  end

end