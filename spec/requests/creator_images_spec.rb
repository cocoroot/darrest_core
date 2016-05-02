require 'rails_helper'

RSpec.describe "CreatorImages", type: :request do
  describe "GET /creator_images" do
    it "works! (now write some real specs)" do
      get creator_images_path
      expect(response).to have_http_status(200)
    end
  end
end
