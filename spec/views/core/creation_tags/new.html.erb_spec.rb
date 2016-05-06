require 'rails_helper'

RSpec.describe "core/creation_tags/new", type: :view do
  before(:each) do
    assign(:core_creation_tag, Core::CreationTag.new(
      :creation => nil,
      :tag => nil
    ))
  end

  it "renders new core_creation_tag form" do
    render

    assert_select "form[action=?][method=?]", core_creation_tags_path, "post" do

      assert_select "input#core_creation_tag_creation_id[name=?]", "core_creation_tag[creation_id]"

      assert_select "input#core_creation_tag_tag_id[name=?]", "core_creation_tag[tag_id]"
    end
  end
end
