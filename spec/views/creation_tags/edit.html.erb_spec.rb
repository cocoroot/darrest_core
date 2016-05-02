require 'rails_helper'

RSpec.describe "creation_tags/edit", type: :view do
  before(:each) do
    @creation_tag = assign(:creation_tag, CreationTag.create!(
      :creation => nil,
      :tag => nil
    ))
  end

  it "renders the edit creation_tag form" do
    render

    assert_select "form[action=?][method=?]", creation_tag_path(@creation_tag), "post" do

      assert_select "input#creation_tag_creation_id[name=?]", "creation_tag[creation_id]"

      assert_select "input#creation_tag_tag_id[name=?]", "creation_tag[tag_id]"
    end
  end
end
