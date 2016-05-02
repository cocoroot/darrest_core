require 'rails_helper'

RSpec.describe "creator_tags/new", type: :view do
  before(:each) do
    assign(:creator_tag, CreatorTag.new(
      :creator => nil,
      :tag => nil
    ))
  end

  it "renders new creator_tag form" do
    render

    assert_select "form[action=?][method=?]", creator_tags_path, "post" do

      assert_select "input#creator_tag_creator_id[name=?]", "creator_tag[creator_id]"

      assert_select "input#creator_tag_tag_id[name=?]", "creator_tag[tag_id]"
    end
  end
end
