require 'rails_helper'

RSpec.describe "tag_classes/edit", type: :view do
  before(:each) do
    @tag_class = assign(:tag_class, TagClass.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit tag_class form" do
    render

    assert_select "form[action=?][method=?]", tag_class_path(@tag_class), "post" do

      assert_select "input#tag_class_name[name=?]", "tag_class[name]"
    end
  end
end
