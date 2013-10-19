require 'spec_helper'

describe "speakers/show" do
  before(:each) do
    @speaker = assign(:speaker, stub_model(Speaker,
      :first_name => "First Name",
      :last_name => "Last Name",
      :url => "Url",
      :slides => "Slides",
      :past_talks => "MyText",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Url/)
    rendered.should match(/Slides/)
    rendered.should match(/MyText/)
    rendered.should match(/Location/)
  end
end
