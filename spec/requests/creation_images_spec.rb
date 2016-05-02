require 'rails_helper'

RSpec.describe "CreationImages", type: :request do
  describe "GET /creation_images" do
    it "works! (now write some real specs)" do
      get creation_images_path
      expect(response).to have_http_status(200)
    end
  end
end
