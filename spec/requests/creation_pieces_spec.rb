require 'rails_helper'

RSpec.describe "CreationPieces", type: :request do
  describe "GET /creation_pieces" do
    it "works! (now write some real specs)" do
      get creation_pieces_path
      expect(response).to have_http_status(200)
    end
  end
end
