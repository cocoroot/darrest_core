require 'rails_helper'

RSpec.describe "core/creation_images/index", type: :view do
  before(:each) do
    assign(:core_creation_images, [
      Core::CreationImage.create!(
        :creation => nil,
        :image => "Image"
      ),
      Core::CreationImage.create!(
        :creation => nil,
        :image => "Image"
      )
    ])
  end

  it "renders a list of core/creation_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
