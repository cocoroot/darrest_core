require 'rails_helper'

RSpec.describe "manage/collections/new", type: :view do
  before(:each) do
    assign(:manage_collection, Manage::Collection.new(
      :sid => "MyText",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders new manage_collection form" do
    render

    assert_select "form[action=?][method=?]", manage_collections_path, "post" do

      assert_select "textarea#manage_collection_sid[name=?]", "manage_collection[sid]"

      assert_select "input#manage_collection_user_id[name=?]", "manage_collection[user_id]"

      assert_select "textarea#manage_collection_title[name=?]", "manage_collection[title]"
    end
  end
end
