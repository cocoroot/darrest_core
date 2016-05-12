require 'rails_helper'

RSpec.describe "core/tags/edit", type: :view do
  before(:each) do
    @core_tag = assign(:core_tag, Core::Tag.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit core_tag form" do
    render

    assert_select "form[action=?][method=?]", core_tag_path(@core_tag), "post" do

      assert_select "input#core_tag_name[name=?]", "core_tag[name]"
    end
  end
end
