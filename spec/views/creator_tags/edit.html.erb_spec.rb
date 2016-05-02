require 'rails_helper'

RSpec.describe "creator_tags/edit", type: :view do
  before(:each) do
    @creator_tag = assign(:creator_tag, CreatorTag.create!(
      :creator => nil,
      :tag => nil
    ))
  end

  it "renders the edit creator_tag form" do
    render

    assert_select "form[action=?][method=?]", creator_tag_path(@creator_tag), "post" do

      assert_select "input#creator_tag_creator_id[name=?]", "creator_tag[creator_id]"

      assert_select "input#creator_tag_tag_id[name=?]", "creator_tag[tag_id]"
    end
  end
end
