require 'spec_helper'

describe "conferences/edit" do
  before(:each) do
    @conference = assign(:conference, stub_model(Conference,
      :name => "MyString",
      :location => "MyString",
      :category => "MyString",
      :safety_policy => "MyString",
      :childcare => false
    ))
  end

  it "renders the edit conference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conference_path(@conference), "post" do
      assert_select "input#conference_name[name=?]", "conference[name]"
      assert_select "input#conference_location[name=?]", "conference[location]"
      assert_select "input#conference_category[name=?]", "conference[category]"
      assert_select "input#conference_safety_policy[name=?]", "conference[safety_policy]"
      assert_select "input#conference_childcare[name=?]", "conference[childcare]"
    end
  end
end
