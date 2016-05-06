require 'rails_helper'

RSpec.describe "manage/creation_tags/edit", type: :view do
  before(:each) do
    @manage_creation_tag = assign(:manage_creation_tag, Manage::CreationTag.create!(
      :creation => nil,
      :tag => nil
    ))
  end

  it "renders the edit manage_creation_tag form" do
    render

    assert_select "form[action=?][method=?]", manage_creation_tag_path(@manage_creation_tag), "post" do

      assert_select "input#manage_creation_tag_creation_id[name=?]", "manage_creation_tag[creation_id]"

      assert_select "input#manage_creation_tag_tag_id[name=?]", "manage_creation_tag[tag_id]"
    end
  end
end
