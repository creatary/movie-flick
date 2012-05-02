require 'spec_helper'

describe CityController do

  describe "GET 'get'" do
    it "returns http success" do
      get 'get'
      response.should be_success
    end
  end

end
