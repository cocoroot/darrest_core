require 'rails_helper'

RSpec.describe "collections/new", type: :view do
  before(:each) do
    assign(:collection, Collection.new(
      :sid => "MyString",
      :site_user => nil,
      :title => "MyString"
    ))
  end

  it "renders new collection form" do
    render

    assert_select "form[action=?][method=?]", collections_path, "post" do

      assert_select "input#collection_sid[name=?]", "collection[sid]"

      assert_select "input#collection_site_user_id[name=?]", "collection[site_user_id]"

      assert_select "input#collection_title[name=?]", "collection[title]"
    end
  end
end
