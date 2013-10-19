require 'spec_helper'

describe "speakers/new" do
  before(:each) do
    assign(:speaker, stub_model(Speaker,
      :first_name => "MyString",
      :last_name => "MyString",
      :url => "MyString",
      :slides => "MyString",
      :past_talks => "MyText",
      :location => "MyString"
    ).as_new_record)
  end

  it "renders new speaker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", speakers_path, "post" do
      assert_select "input#speaker_first_name[name=?]", "speaker[first_name]"
      assert_select "input#speaker_last_name[name=?]", "speaker[last_name]"
      assert_select "input#speaker_url[name=?]", "speaker[url]"
      assert_select "input#speaker_slides[name=?]", "speaker[slides]"
      assert_select "textarea#speaker_past_talks[name=?]", "speaker[past_talks]"
      assert_select "input#speaker_location[name=?]", "speaker[location]"
    end
  end
end
