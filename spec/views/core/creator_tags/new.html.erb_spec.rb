require 'rails_helper'

RSpec.describe "core/creator_tags/new", type: :view do
  before(:each) do
    assign(:core_creator_tag, Core::CreatorTag.new(
      :creator => nil,
      :tag => nil
    ))
  end

  it "renders new core_creator_tag form" do
    render

    assert_select "form[action=?][method=?]", core_creator_tags_path, "post" do

      assert_select "input#core_creator_tag_creator_id[name=?]", "core_creator_tag[creator_id]"

      assert_select "input#core_creator_tag_tag_id[name=?]", "core_creator_tag[tag_id]"
    end
  end
end
