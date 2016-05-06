require 'rails_helper'

RSpec.describe "manage/creator_tags/edit", type: :view do
  before(:each) do
    @manage_creator_tag = assign(:manage_creator_tag, Manage::CreatorTag.create!(
      :creator => nil,
      :tag => nil
    ))
  end

  it "renders the edit manage_creator_tag form" do
    render

    assert_select "form[action=?][method=?]", manage_creator_tag_path(@manage_creator_tag), "post" do

      assert_select "input#manage_creator_tag_creator_id[name=?]", "manage_creator_tag[creator_id]"

      assert_select "input#manage_creator_tag_tag_id[name=?]", "manage_creator_tag[tag_id]"
    end
  end
end
