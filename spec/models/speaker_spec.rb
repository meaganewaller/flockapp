require 'spec_helper'

describe Speaker do
  it "creates the full name from first and last name" do
    speaker = Speaker.create(first_name: "Jane", last_name: "Doe", :url => "http://example.com", :slides => "http://example.com", :past_talks => "some talk", :location => "USA")
    speaker.full_name.should == "Jane Doe"
  end
end
