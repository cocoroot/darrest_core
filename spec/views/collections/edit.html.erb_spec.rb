require 'rails_helper'

RSpec.describe "collections/edit", type: :view do
  before(:each) do
    @collection = assign(:collection, Collection.create!(
      :sid => "MyText",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders the edit collection form" do
    render

    assert_select "form[action=?][method=?]", collection_path(@collection), "post" do

      assert_select "textarea#collection_sid[name=?]", "collection[sid]"

      assert_select "input#collection_user_id[name=?]", "collection[user_id]"

      assert_select "textarea#collection_title[name=?]", "collection[title]"
    end
  end
end
