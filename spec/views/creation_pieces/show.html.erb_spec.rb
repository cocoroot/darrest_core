require 'rails_helper'

RSpec.describe "creation_pieces/show", type: :view do
  before(:each) do
    @creation_piece = assign(:creation_piece, CreationPiece.create!(
      :creation => nil,
      :name => "Name",
      :description => "Description",
      :file => "File",
      :file_name_for_user => "File Name For User",
      :image => "Image",
      :image_name_for_user{256} => "Image Name For User{256}"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/File/)
    expect(rendered).to match(/File Name For User/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Image Name For User{256}/)
  end
end
