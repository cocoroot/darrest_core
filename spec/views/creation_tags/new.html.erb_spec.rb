require 'rails_helper'

RSpec.describe "creation_tags/new", type: :view do
  before(:each) do
    assign(:creation_tag, CreationTag.new(
      :creation => nil,
      :tag => nil
    ))
  end

  it "renders new creation_tag form" do
    render

    assert_select "form[action=?][method=?]", creation_tags_path, "post" do

      assert_select "input#creation_tag_creation_id[name=?]", "creation_tag[creation_id]"

      assert_select "input#creation_tag_tag_id[name=?]", "creation_tag[tag_id]"
    end
  end
end
