require 'rails_helper'

RSpec.describe "collections/new", type: :view do
  before(:each) do
    assign(:collection, Collection.new(
      :sid => "MyText",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders new collection form" do
    render

    assert_select "form[action=?][method=?]", collections_path, "post" do

      assert_select "textarea#collection_sid[name=?]", "collection[sid]"

      assert_select "input#collection_user_id[name=?]", "collection[user_id]"

      assert_select "textarea#collection_title[name=?]", "collection[title]"
    end
  end
end
