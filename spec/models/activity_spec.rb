require 'spec_helper'

describe Activity do
  let(:no_booze) { Activity.create(name: "Game Night", alcohol: false) }
  let(:booze)    { Activity.create(name: "Bar Night",  alcohol: true) }

  it "alcohol_free should return only activities without alcohol" do
    Activity.alcohol_free.should     include(no_booze)
    Activity.alcohol_free.should_not include(booze)
  end
end

