require 'rails_helper'

RSpec.describe "core/collections/edit", type: :view do
  before(:each) do
    @core_collection = assign(:core_collection, Core::Collection.create!(
      :sid => "MyText",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders the edit core_collection form" do
    render

    assert_select "form[action=?][method=?]", core_collection_path(@core_collection), "post" do

      assert_select "textarea#core_collection_sid[name=?]", "core_collection[sid]"

      assert_select "input#core_collection_user_id[name=?]", "core_collection[user_id]"

      assert_select "textarea#core_collection_title[name=?]", "core_collection[title]"
    end
  end
end
