require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'coming_soon'
      response.should be_success
    end
  end

end
