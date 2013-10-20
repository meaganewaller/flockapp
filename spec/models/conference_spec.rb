require 'spec_helper'

describe Conference do
  context "search" do
    before(:each) do
      @conf_1 = Conference.create(name: "First Conference", category: "cat1", childcare: false, latitude: 27.844996, longitude: -82.794463, start_date: "2012-01-01", end_date: "2012-01-20")
      @conf_2 = Conference.create(name: "Second Conference", category: "cat2", childcare: true, location: "1 Infinite Loop", latitude: 37.331741, longitude: -122.0303329, start_date: "2013-09-01", end_date: "2013-09-21", safety_policy: "http://safe.com")
      @conf_3 = Conference.create(name: "Third Conference", category: "cat3", childcare: false, latitude: 27.844996, longitude: -82.794463, start_date: "2012-01-01", end_date: "2012-01-20", safety_policy: "http://google.com")
    end

    it "can search for conferences by name" do
      Conference.search(name: "First").should == [@conf_1]
    end

    it "can search for conferences by category" do
      Conference.search(name: "", category: "cat1").should == [@conf_1]
    end

    it "can search for conferences by childcare" do
      Conference.search(name: "", childcare: "on").should == [@conf_2]
    end

    it "can search for conferences by childcare" do
      Conference.search(name: "", safety_policy: "on").should == [@conf_2, @conf_3]
    end

    it "can search for conferences by location" do
      Conference.stub(:near).and_return([@conf_2])
      Conference.search(name: "", location: "1 Infinite loop").should == [@conf_2]
    end

    it "can search for conferences by date" do
      Conference.search(name: "", location: "", date: "2012-01-05").should == [@conf_1, @conf_3]
    end

    it "can search for conferences by multiple fields" do
      Conference.search(name: "", location: "", date: "2012-01-05", safety_policy: "on").should == [@conf_3]
    end

    it "returns all conferences when search is empty" do
      Conference.search(name: "", location: "", childcare: "").should == [@conf_1, @conf_2, @conf_3]
    end
  end
end

