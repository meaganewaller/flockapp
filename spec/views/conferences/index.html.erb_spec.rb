require 'spec_helper'

describe "conferences/index" do
  before(:each) do
    assign(:conferences, [
      stub_model(Conference,
        :name => "Name",
        :location => "Location",
        :category => "Category",
        :safety_policty => "Safety Policty",
        :childcare => false
      ),
      stub_model(Conference,
        :name => "Name",
        :location => "Location",
        :category => "Category",
        :safety_policty => "Safety Policty",
        :childcare => false
      )
    ])
  end

  it "renders a list of conferences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Safety Policty".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
