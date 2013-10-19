require 'spec_helper'

describe "speakers/index" do
  before(:each) do
    assign(:speakers, [
      stub_model(Speaker,
        :first_name => "First Name",
        :last_name => "Last Name",
        :url => "Url",
        :slides => "Slides",
        :past_talks => "MyText",
        :location => "Location"
      ),
      stub_model(Speaker,
        :first_name => "First Name",
        :last_name => "Last Name",
        :url => "Url",
        :slides => "Slides",
        :past_talks => "MyText",
        :location => "Location"
      )
    ])
  end

  it "renders a list of speakers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h2", :text => "First Name Last Name".to_s, :count => 2
  end
end
