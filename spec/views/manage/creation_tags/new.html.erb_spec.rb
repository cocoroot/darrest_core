require 'rails_helper'

RSpec.describe "manage/creation_tags/new", type: :view do
  before(:each) do
    assign(:manage_creation_tag, Manage::CreationTag.new(
      :creation => nil,
      :tag => nil
    ))
  end

  it "renders new manage_creation_tag form" do
    render

    assert_select "form[action=?][method=?]", manage_creation_tags_path, "post" do

      assert_select "input#manage_creation_tag_creation_id[name=?]", "manage_creation_tag[creation_id]"

      assert_select "input#manage_creation_tag_tag_id[name=?]", "manage_creation_tag[tag_id]"
    end
  end
end
