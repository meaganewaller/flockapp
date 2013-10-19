require 'spec_helper'

describe "conferences/index" do
  before(:each) do
    assign(:conferences, [
      stub_model(Conference,
        :name => "Name",
        :location => "Location",
        :category => "Category",
        :safety_policy => "Safety Policy",
        :childcare => false
      ),
      stub_model(Conference,
        :name => "Name",
        :location => "Location",
        :category => "Category",
        :safety_policy => "Safety Policy",
        :childcare => false
      )
    ])
  end
end
