require 'rails_helper'

RSpec.describe "core/collections/new", type: :view do
  before(:each) do
    assign(:core_collection, Core::Collection.new(
      :sid => "MyText",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders new core_collection form" do
    render

    assert_select "form[action=?][method=?]", core_collections_path, "post" do

      assert_select "textarea#core_collection_sid[name=?]", "core_collection[sid]"

      assert_select "input#core_collection_user_id[name=?]", "core_collection[user_id]"

      assert_select "textarea#core_collection_title[name=?]", "core_collection[title]"
    end
  end
end
