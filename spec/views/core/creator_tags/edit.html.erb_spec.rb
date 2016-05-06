require 'rails_helper'

RSpec.describe "core/creator_tags/edit", type: :view do
  before(:each) do
    @core_creator_tag = assign(:core_creator_tag, Core::CreatorTag.create!(
      :creator => nil,
      :tag => nil
    ))
  end

  it "renders the edit core_creator_tag form" do
    render

    assert_select "form[action=?][method=?]", core_creator_tag_path(@core_creator_tag), "post" do

      assert_select "input#core_creator_tag_creator_id[name=?]", "core_creator_tag[creator_id]"

      assert_select "input#core_creator_tag_tag_id[name=?]", "core_creator_tag[tag_id]"
    end
  end
end
