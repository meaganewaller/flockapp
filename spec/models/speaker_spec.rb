require 'spec_helper'

describe Speaker do
  it "creates the full name from first and last name" do
    speaker = Speaker.new(first_name: "Jane", last_name: "Doe", :url => "http://example.com", :slides => "http://example.com", :past_talks => "some talk", :location => "USA")
    speaker.full_name.should == "Jane Doe"
  end

  it "requires a first name" do
    speaker = Speaker.new(first_name: nil)
    speaker.should have(1).error_on(:first_name)
  end

  it "requires a last name" do
    speaker = Speaker.new(last_name: nil)
    speaker.should have(1).error_on(:last_name)
  end

  it "requires a url" do
    speaker = Speaker.new(url: nil)
    speaker.should have(1).error_on(:url)
  end

  it "requires a valid url" do
    speaker = Speaker.new(url: "hello")
    speaker.should have(1).error_on(:url)
  end

  it "allows a valid url" do
    speaker = Speaker.new(url: "http://example.com")
    speaker.should have(0).errors_on(:url)
  end

  it "doesn't require slide link" do
    speaker = Speaker.new(slides: nil)
    speaker.should have(0).errors_on(:slides)
  end

  it "requires valid url format if speaker enters slide information" do
    speaker = Speaker.new(slides: "hello")
    speaker.should have(1).error_on(:slides)
  end

  it "doesn't require past talks" do
    speaker = Speaker.new(past_talks: nil)
    speaker.should have(0).errors_on(:past_talks)
  end

  it "doesn't require a location" do
    speaker = Speaker.new(location: nil)
    speaker.should have(0).errors_on(:location)
  end

end
