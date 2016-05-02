require 'rails_helper'

RSpec.describe "creators/edit", type: :view do
  before(:each) do
    @creator = assign(:creator, Creator.create!(
      :sid => "MyString",
      :user => nil,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit creator form" do
    render

    assert_select "form[action=?][method=?]", creator_path(@creator), "post" do

      assert_select "input#creator_sid[name=?]", "creator[sid]"

      assert_select "input#creator_user_id[name=?]", "creator[user_id]"

      assert_select "input#creator_name[name=?]", "creator[name]"

      assert_select "textarea#creator_description[name=?]", "creator[description]"
    end
  end
end
