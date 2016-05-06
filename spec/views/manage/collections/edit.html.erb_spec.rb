require 'rails_helper'

RSpec.describe "manage/collections/edit", type: :view do
  before(:each) do
    @manage_collection = assign(:manage_collection, Manage::Collection.create!(
      :sid => "MyText",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders the edit manage_collection form" do
    render

    assert_select "form[action=?][method=?]", manage_collection_path(@manage_collection), "post" do

      assert_select "textarea#manage_collection_sid[name=?]", "manage_collection[sid]"

      assert_select "input#manage_collection_user_id[name=?]", "manage_collection[user_id]"

      assert_select "textarea#manage_collection_title[name=?]", "manage_collection[title]"
    end
  end
end
